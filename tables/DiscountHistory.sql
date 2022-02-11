CREATE TABLE [dbo].[DiscountHistory](
    [PrivateID] [int] NOT NULL,
    [DiscountID] [int] NOT NULL,
    [startDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DiscountHistory] PRIMARY KEY CLUSTERED 
(
    [PrivateID] ASC,
    [DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[DiscountHistory]  WITH CHECK ADD  CONSTRAINT [FK_DiscountHistory_Discounts] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discounts] ([DiscountID])
GO
ALTER TABLE [dbo].[DiscountHistory] CHECK CONSTRAINT [FK_DiscountHistory_Discounts]
GO
ALTER TABLE [dbo].[DiscountHistory]  WITH CHECK ADD  CONSTRAINT [FK_DiscountHistory_Private Clients] FOREIGN KEY([PrivateID])
REFERENCES [dbo].[PrivateClients] ([PrivateID])
GO
ALTER TABLE [dbo].[DiscountHistory] CHECK CONSTRAINT [FK_DiscountHistory_Private Clients]
GO
ALTER TABLE [dbo].[DiscountHistory]  WITH CHECK ADD  CONSTRAINT [CK_DiscountHistory] CHECK  (([startDate]<=getdate()))
GO
ALTER TABLE [dbo].[DiscountHistory] CHECK CONSTRAINT [CK_DiscountHistory]

