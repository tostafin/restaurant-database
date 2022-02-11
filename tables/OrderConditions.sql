CREATE TABLE [dbo].[OrderConditions](
	[MinimalOrderAmount] [int] NOT NULL,
	[MinimalOrderCost] [int] NOT NULL,
	[ConditionID] [int] NOT NULL,
 CONSTRAINT [PK_ReservationConditions] PRIMARY KEY CLUSTERED 
(
	[ConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[OrderConditions]  WITH CHECK ADD  CONSTRAINT [CK_ReservationConditions] CHECK  (([MinimalOrderAmount]>(0)))
GO
ALTER TABLE [dbo].[OrderConditions] CHECK CONSTRAINT [CK_ReservationConditions]
GO
ALTER TABLE [dbo].[OrderConditions]  WITH CHECK ADD  CONSTRAINT [CK_ReservationConditions_1] CHECK  (([MinimalOrderCost]>(0)))
GO
ALTER TABLE [dbo].[OrderConditions] CHECK CONSTRAINT [CK_ReservationConditions_1]
GO