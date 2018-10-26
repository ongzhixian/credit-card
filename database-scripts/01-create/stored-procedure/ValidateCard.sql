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
-- ValidateCard 
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


    -- Insert statements for procedure here
	--SELECT @pNumber, @pExpiryDate
	SELECT @result = 1, @cardType = 2

END
GO

