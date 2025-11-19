USE [SalesDB]
GO

/****** Object:  Table [Sales].[Orders]    Script Date: 19/11/2025 08:20:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Sales].[Orders](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[CustomerID] [int] NULL,
	[SalesPersonID] [int] NULL,
	[OrderDate] [date] NULL,
	[ShipDate] [date] NULL,
	[OrderStatus] [varchar](50) NULL,
	[ShipAddress] [varchar](255) NULL,
	[BillAddress] [varchar](255) NULL,
	[Quantity] [int] NULL,
	[Sales] [int] NULL,
	[CreationTime] [datetime2](7) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


