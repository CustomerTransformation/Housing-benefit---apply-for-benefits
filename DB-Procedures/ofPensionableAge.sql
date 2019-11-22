USE [ProdCodeTables]
GO
/****** Object:  StoredProcedure [dbo].[ofPensionableAge]    Script Date: 11/22/2019 15:06:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Daniel Gregory
-- Create date: 04/01/2017
-- Description:	Check if person is of Pensionable age on date specified
-- =============================================
ALTER PROCEDURE [dbo].[ofPensionableAge]
			@DoB as date,
			@forDate as date 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @Pens varchar(3);
	Declare @Pen_Age date;

	IF @Dob IS NULL
	BEGIN
		Set @Pens = 'No';
		select @Pens as Pensionable;
		RETURN;
	END
	
	IF @Dob < '1950-04-06'
	BEGIN
		IF DATEDIFF(YYYY,@DoB,@forDate) > 59
		BEGIN
			Set @Pens = 'Yes';
		END
		ELSE
		BEGIN
			Set @Pens = 'No';
		END
		select @Pens as Pensionable;
		RETURN;
	END
	
	
	IF @Dob > '1954-10-05'
	BEGIN
		IF DATEDIFF(YYYY,@DoB,@forDate) > 65
		BEGIN
			Set @Pens = 'Yes';
		END
		ELSE
		BEGIN
			Set @Pens = 'No';
		END
		select @Pens as Pensionable;
		RETURN;
	END
	
	set @Pen_Age = (select Qual_Date from dbo.Pension_Qualifying where From_Date <= @DoB and To_Date >= @DoB);
	
	IF @forDate >= @Pen_Age 
	BEGIN
		Set @Pens = 'Yes';
	END
	ELSE
	BEGIN
		Set @Pens = 'No';
	END
	select @Pens as Pensionable;
	
	
END

