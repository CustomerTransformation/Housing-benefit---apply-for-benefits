USE [ProdCodeTables]
GO

/****** Object:  Table [dbo].[Pension_Qualifying]    Script Date: 11/22/2019 15:07:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pension_Qualifying](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[From_Date] [date] NULL,
	[To_Date] [date] NULL,
	[Qual_Date] [date] NULL
) ON [PRIMARY]

GO


