/****** Object:  Table [dbo].[Client]    Script Date: 24.03.2016 19:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Order]    Script Date: 24.03.2016 19:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Comment] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 24.03.2016 19:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Product]    Script Date: 24.03.2016 19:09:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Price] [money] NOT NULL CONSTRAINT [DF_Product_Price]  DEFAULT ((0)),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
SET IDENTITY_INSERT [dbo].[Client] ON 

GO
INSERT [dbo].[Client] ([ClientID], [Title]) VALUES (1, N'Ромашка')
GO
INSERT [dbo].[Client] ([ClientID], [Title]) VALUES (2, N'Вишенка')
GO
INSERT [dbo].[Client] ([ClientID], [Title]) VALUES (3, N'Клубничка')
GO
INSERT [dbo].[Client] ([ClientID], [Title]) VALUES (4, N'Розочка')
GO
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

GO
INSERT [dbo].[Order] ([OrderID], [ClientID], [Date], [Comment]) VALUES (1, 1, CAST(N'2016-01-12' AS Date), N'')
GO
INSERT [dbo].[Order] ([OrderID], [ClientID], [Date], [Comment]) VALUES (2, 1, CAST(N'2016-01-13' AS Date), N'')
GO
INSERT [dbo].[Order] ([OrderID], [ClientID], [Date], [Comment]) VALUES (3, 2, CAST(N'2016-01-14' AS Date), N'')
GO
INSERT [dbo].[Order] ([OrderID], [ClientID], [Date], [Comment]) VALUES (4, 3, CAST(N'2016-01-14' AS Date), N'')
GO
INSERT [dbo].[Order] ([OrderID], [ClientID], [Date], [Comment]) VALUES (5, 1, CAST(N'2016-01-14' AS Date), N'')
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Amount]) VALUES (1, 2, 4)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Amount]) VALUES (1, 3, 1)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Amount]) VALUES (3, 4, 1)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Amount]) VALUES (4, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Amount]) VALUES (4, 3, 2)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Amount]) VALUES (4, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

GO
INSERT [dbo].[Product] ([ProductID], [Title], [Price]) VALUES (1, N'Чай Ромашковый', 2.0000)
GO
INSERT [dbo].[Product] ([ProductID], [Title], [Price]) VALUES (2, N'Лимон', 1.0000)
GO
INSERT [dbo].[Product] ([ProductID], [Title], [Price]) VALUES (3, N'Сок Апельсиновый', 3.0000)
GO
INSERT [dbo].[Product] ([ProductID], [Title], [Price]) VALUES (4, N'Яблоки', 1.0000)
GO
INSERT [dbo].[Product] ([ProductID], [Title], [Price]) VALUES (5, N'Арбуз', 2.0000)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
