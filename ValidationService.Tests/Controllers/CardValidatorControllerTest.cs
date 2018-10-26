using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ValidationService.Controllers;

namespace ValidationService.Tests.Controllers
{
    [TestClass]
    public class CardValidatorControllerTest
    {
        [TestMethod]
        public void TestNonsenseCard()
        {
            // Arrange
            CardValidatorController controller = new CardValidatorController();
            CardValidationParameters cardParameters = new CardValidationParameters
            {
                Number = 0,
                ExpiryDate = DateTime.Now
            };

            // Act
            IEnumerable<string> result = controller.Get(cardParameters);

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual(2, result.Count());
            Assert.AreEqual("Does not exists", result.ElementAt(0));
            Assert.AreEqual("Unknown", result.ElementAt(1));
        }

        [TestMethod]
        public void TestValidMasterCard()
        {
            // Arrange
            CardValidatorController controller = new CardValidatorController();
            CardValidationParameters cardParameters = new CardValidationParameters
            {
                Number = 5234567890123456,
                ExpiryDate = new DateTime(2029, 10, 26)
            };

            // Act
            IEnumerable<string> result = controller.Get(cardParameters);

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual(2, result.Count());
            Assert.AreEqual("Valid", result.ElementAt(0));
            Assert.AreEqual("Master", result.ElementAt(1));
        }

        [TestMethod]
        public void TestValidJCBCard()
        {
            // Arrange
            CardValidatorController controller = new CardValidatorController();
            CardValidationParameters cardParameters = new CardValidationParameters
            {
                Number = 3528567890123456,
                ExpiryDate = new DateTime(2029, 10, 26)
            };

            // Act
            IEnumerable<string> result = controller.Get(cardParameters);

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual(2, result.Count());
            Assert.AreEqual("Valid", result.ElementAt(0));
            Assert.AreEqual("JCB", result.ElementAt(1));
        }

        [TestMethod]
        public void TestValidAmexCard()
        {
            // Arrange
            CardValidatorController controller = new CardValidatorController();
            CardValidationParameters cardParameters = new CardValidationParameters
            {
                Number = 343456789012345,
                ExpiryDate = new DateTime(2029, 10, 26)
            };

            // Act
            IEnumerable<string> result = controller.Get(cardParameters);

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual(2, result.Count());
            Assert.AreEqual("Valid", result.ElementAt(0));
            Assert.AreEqual("Amex", result.ElementAt(1));
        }

        [TestMethod]
        public void TestValidVisaCard()
        {
            // Arrange
            CardValidatorController controller = new CardValidatorController();
            CardValidationParameters cardParameters = new CardValidationParameters
            {
                Number = 4234567890123456,
                ExpiryDate = new DateTime(2020, 10, 26)
            };

            // Act
            IEnumerable<string> result = controller.Get(cardParameters);

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual(2, result.Count());
            Assert.AreEqual("Valid", result.ElementAt(0));
            Assert.AreEqual("Visa", result.ElementAt(1));
        }


    }
}
