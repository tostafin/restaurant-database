CREATE TABLE [dbo].[Discounts](
    [DiscountID] [int] NOT NULL,
    [Rate] [float] NOT NULL,
    [addDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
    [DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [CK_Discounts] CHECK  (([addDate]<=getdate()))
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [CK_Discounts]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [CK_Discounts_1] CHECK  (([Rate]>=(0) AND [Rate]<=(1)))
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [CK_Discounts_1]

