using log4net;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ValidationService.Models;

namespace ValidationService.Controllers
{
    public class CardValidatorController : ApiController
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(CardValidatorController));

        ValidationServiceContext ctx = new ValidationServiceContext();

        public IEnumerable<string> Get([FromUri]CardValidationParameters cardParameters)
        {
            string cartTypeValue = GetCardType(cardParameters.Number);
            string resultValue = GetCardValidity(cartTypeValue, cardParameters.ExpiryDate);

            var result = ctx.Database.SqlQuery<Guid>("EXECUTE GetCardId @pNumber;",
                new SqlParameter("@pNumber", cardParameters.Number));

            Guid resultVal = result.FirstOrDefault();
            if (resultVal == Guid.Empty)
            {
                resultValue = "Does not exists";
            }

            return new string[] { resultValue, cartTypeValue };
        }

        private string GetCardValidity(string cartTypeValue, DateTime expiryDate)
        {
            if ((cartTypeValue == "JCB") || (cartTypeValue == "Amex"))
                return "Valid";

            if ((cartTypeValue == "Visa") && (DateTime.IsLeapYear(expiryDate.Year)))
                return "Valid";

            if ((cartTypeValue == "Master") && (IsPrimeNumber(expiryDate.Year)))
                return "Valid";


            return "Invalid";
        }

        private bool IsPrimeNumber(int year)
        {
            int i;
            for (i = 2; i <= year - 1; i++)
            {
                if (year % i == 0)
                {
                    return false;
                }
            }
            if (i == year)
            {
                return true;
            }
            return false;
        }

        private string GetCardType(long number)
        {
            if ((number >= 4000000000000000) && (number < 5000000000000000))
                return "Visa";
            if ((number >= 5000000000000000) && (number < 6000000000000000))
                return "Master";
            if ((number >= 3528000000000000) && (number < 3590000000000000))
                return "JCB";
            if (((number >= 340000000000000) && (number < 350000000000000)) ||
                ((number >= 370000000000000) && (number < 380000000000000)))
                return "Amex";
            return "Unknown";
        }
    }

    public class CardValidationParameters
    {
        public long Number { get; set; }
        public DateTime ExpiryDate { get; set; }
    }
}
