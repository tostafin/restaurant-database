CREATE TABLE [dbo].[OrderDetails](
    [OrderID] [int] NOT NULL,
    [MenuID] [int] NOT NULL,
    [Quantity] [int] NOT NULL,
    [UnitPrice] [int] NOT NULL,
    [ProductID] [int] NOT NULL,
    [ProductID] [int] NOT NULL,
    [Discount] [float] NOT NULL,
 CONSTRAINT [PK_Order Details] PRIMARY KEY CLUSTERED 
(
    [OrderID] ASC,
    [MenuID] ASC,
    [ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Order Details_CustomMenu] FOREIGN KEY([MenuID], [ProductID])
REFERENCES [dbo].[CustomMenu] ([MenuID], [ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Order Details_CustomMenu]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Order Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Order Details_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Order Details_SpecialMenu1] FOREIGN KEY([MenuID], [ProductID])
REFERENCES [dbo].[SpecialMenu] ([MenuID], [ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Order Details_SpecialMenu1]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [CK_Order Details] CHECK  (([UnitPrice]>(0) AND [Quantity]>(0)))
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [CK_Order Details]