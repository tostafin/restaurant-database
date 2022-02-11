
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[RestaurantEmployeeID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ReceivedDate] [datetime] NOT NULL,
	[ReservationID] [int] NULL,
	[TableID] [int] NULL,
	[Takeaway] [bit] NOT NULL,
	[Payment] [varchar](50) NULL,
	[Completed] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO

ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Takeaway]  DEFAULT ((0)) FOR [Takeaway]
GO

ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Payment]  DEFAULT ('Cash') FOR [Payment]
GO

ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_ServedDate]  DEFAULT ((0)) FOR [Completed]
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Clients] ([CustomerID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([RestaurantEmployeeID])
REFERENCES [dbo].[RestaurantEmployees] ([RestaurantEmployeeID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Reservations] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[PrivateReservations] ([ReservationID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Reservations]
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Tables] FOREIGN KEY([TableID])
REFERENCES [dbo].[Tables] ([TableID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Tables]
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CK_Orders_2] CHECK  (([ReceivedDate]>[OrderDate]))
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CK_Orders_2]
GO