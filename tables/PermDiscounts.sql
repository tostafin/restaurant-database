CREATE TABLE [dbo].[PermDiscounts](
    [DiscountID] [int] NOT NULL,
    [MinimalOrdersAmount] [int] NOT NULL,
    [MinimalOrdersValue] [int] NOT NULL,
 CONSTRAINT [PK_PermDiscounts_1] PRIMARY KEY CLUSTERED 
(
    [DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[PermDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_PermDiscounts_Discounts] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discounts] ([DiscountID])
GO
ALTER TABLE [dbo].[PermDiscounts] CHECK CONSTRAINT [FK_PermDiscounts_Discounts]
GO
ALTER TABLE [dbo].[PermDiscounts]  WITH CHECK ADD  CONSTRAINT [CK_PermDiscounts] CHECK  (([MinimalOrdersAmount]>(0) AND [MinimalOrdersValue]>(0)))
GO
ALTER TABLE [dbo].[PermDiscounts] CHECK CONSTRAINT [CK_PermDiscounts]

