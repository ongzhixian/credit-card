USE [Dev]
GO

/****** Object:  Table [dbo].[Card]    Script Date: 2018-10-26 05:04:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Card](
	[Id] [uniqueidentifier] NOT NULL,
	[Number] [bigint] NOT NULL,
	[ExpiryDate] [date] NOT NULL,
	[CardType] [varchar](7) NOT NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Card] ADD  CONSTRAINT [DF_Card_Id]  DEFAULT (newid()) FOR [Id]
GO

ALTER TABLE [dbo].[Card] ADD  CONSTRAINT [DF_Card_CardType]  DEFAULT ('UNKNOWN') FOR [CardType]
GO

