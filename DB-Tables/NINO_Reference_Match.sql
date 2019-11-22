USE [ProdBenefits]
GO

/****** Object:  Table [dbo].[NINO_Reference_Match]    Script Date: 11/22/2019 15:13:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[NINO_Reference_Match](
	[NINO] [varchar](50) NULL,
	[Name] [varchar](150) NULL,
	[Reference] [varchar](50) NULL,
	[Status1] [varchar](50) NULL,
	[Status2] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


