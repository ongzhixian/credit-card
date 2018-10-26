USE [Dev]
GO

/****** Object:  StoredProcedure [dbo].[ValidateCard]    Script Date: 2018-10-26 05:04:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ong Zhi Xian
-- Create date: 2018-10-25
-- Description:	Validate credit card
-- Sample execution:
-- EXECUTE ValidateCard @pNumber, @pExpiryDate, @result OUT, @cardType;
-- @result		= 1 = Valid, 0 = Invalid, NULL = Does not exist
-- @cardType	= 0 = Visa, 1 = Master, 2 = Amex, 3 = JCB or NULL = Unknown
-- =============================================
CREATE PROCEDURE [dbo].[ValidateCard] 
	-- Add the parameters for the stored procedure here
	@pNumber		BIGINT	= NULL, 
	@pExpiryDate	DATE	= NULL,
	@result			BIT		= NULL OUTPUT, 
	@cardType		TINYINT = NULL OUTPUT

AS
BEGIN
	SET NOCOUNT ON;

	----------------------------------------
	-- Declare and initialize local variables
	----------------------------------------
	DECLARE
		@number		BIGINT	= @pNumber,
		@expiryDate	DATE	= @pExpiryDate;

	
	-- TODO: The validation logic to start here

	----------------------------------------
	-- Parameter checking
	----------------------------------------


	----------------------------------------
	-- Set OUTPUT variables
	----------------------------------------
	SELECT @result = NULL, @cardType = NULL;

END
GO

