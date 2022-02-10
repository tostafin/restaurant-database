CREATE TABLE [dbo].[PrivateReservations](
    [ReservationID] [int] NOT NULL,
    [PrivateID] [int] NOT NULL,
    [OrderID] [int] NOT NULL,
    [PaymentBefore] [bit] NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED
(
    [ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[PrivateReservations]  WITH CHECK ADD  CONSTRAINT [FK_PrivateReservations_Private Clients] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[PrivateClients] ([CustomerID])
GO
ALTER TABLE [dbo].[PrivateReservations] CHECK CONSTRAINT [FK_PrivateReservations_Private Clients]
GO
ALTER TABLE [dbo].[PrivateReservations]  WITH CHECK ADD  CONSTRAINT [FK_PrivateReservations_Reservations] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ReservationID])
GO
ALTER TABLE [dbo].[PrivateReservations] CHECK CONSTRAINT [FK_PrivateReservations_Reservations]
GO
