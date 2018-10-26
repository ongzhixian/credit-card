USE [Dev]
GO

/****** Object:  StoredProcedure [dbo].[GetCardId]    Script Date: 10/26/2018 11:25:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ong Zhi Xian
-- Create date: 2018-10-26
-- Description:	Card existence
-- Sample execution:
-- EXECUTE GetCardId @pNumber=3434567890123456
-- =============================================
CREATE PROCEDURE [dbo].[GetCardId]
	-- Add the parameters for the stored procedure here
	@pNumber BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	----------------------------------------
	-- Declare and initialize local variables
	----------------------------------------
	DECLARE
		@number		BIGINT	= @pNumber;

	SELECT	Id 
	FROM	Card 
	WHERE	Number = @number;
END
GO

