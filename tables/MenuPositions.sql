
CREATE TABLE [dbo].[MenuPositions](
	[ProductID] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[UnitsOrdered] [int] NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[Special] [bit] NOT NULL,
 CONSTRAINT [PK_MenuPositions] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[MenuPositions]  WITH CHECK ADD  CONSTRAINT [FK_MenuPositions_Menu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menu] ([MenuID])
GO
ALTER TABLE [dbo].[MenuPositions] CHECK CONSTRAINT [FK_MenuPositions_Menu]
GO
ALTER TABLE [dbo].[MenuPositions]  WITH CHECK ADD  CONSTRAINT [FK_MenuPositions_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[MenuPositions] CHECK CONSTRAINT [FK_MenuPositions_Products]
GO
ALTER TABLE [dbo].[MenuPositions]  WITH CHECK ADD  CONSTRAINT [CK_MenuPositions] CHECK  (([UnitsInStock]>(0)))
GO
ALTER TABLE [dbo].[MenuPositions] CHECK CONSTRAINT [CK_MenuPositions]
GO
ALTER TABLE [dbo].[MenuPositions]  WITH CHECK ADD  CONSTRAINT [CK_MenuPositions_1] CHECK  (([UnitsOrdered]>(0)))
GO
ALTER TABLE [dbo].[MenuPositions] CHECK CONSTRAINT [CK_MenuPositions_1]
GO
ALTER TABLE [dbo].[MenuPositions]  WITH CHECK ADD  CONSTRAINT [CK_MenuPositions_2] CHECK  (([UnitPrice]>(0)))
GO
ALTER TABLE [dbo].[MenuPositions] CHECK CONSTRAINT [CK_MenuPositions_2]
GO