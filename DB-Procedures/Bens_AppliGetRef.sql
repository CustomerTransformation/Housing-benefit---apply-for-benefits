USE [ProdBenefits]
GO
/****** Object:  StoredProcedure [dbo].[Bens_AppliGetRef]    Script Date: 11/22/2019 15:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 07/02/2017
-- Description:	Get the Claim Reference from the NINO entered on the application
-- =============================================
ALTER PROCEDURE [dbo].[Bens_AppliGetRef]
	@NINO_Form varchar(50)
AS
BEGIN	
	SET NOCOUNT ON;
    
    
	
	DECLARE @No_entries integer;
    
    IF @NINO_Form != ''
    BEGIN
		SET @No_entries = (SELECT COUNT(*) FROM NINO_Reference_Match WHERE NINO = @NINO_Form);
		
		IF @No_entries = 1
		BEGIN
			SELECT top 1 Reference AS "ClaimRef",			
				Name AS "Full_Name",
				Status1,
				Status2
			FROM NINO_Reference_Match WHERE NINO = @NINO_Form
		END
	END
END

