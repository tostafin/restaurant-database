CREATE TABLE [dbo].[Reservations](
    [ReservationID] [int] NOT NULL,
    [ReservationDate] [date] NOT NULL,
 CONSTRAINT [PK_Reservations_1] PRIMARY KEY CLUSTERED
(
    [ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [CK_Reservations] CHECK  (([ReservationDate]<=getdate()))
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [CK_Reservations]
