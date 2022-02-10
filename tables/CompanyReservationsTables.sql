CREATE TABLE [dbo].[CompanyReservationTables](
    [ReservationID] [int] NOT NULL,
    [TableID] [int] NOT NULL,
    [EmptySeats] [tinyint] NOT NULL,
 CONSTRAINT [PK_CompanyReservationTables_1] PRIMARY KEY CLUSTERED
(
    [ReservationID] ASC,
    [TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[CompanyReservationTables]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReservationDetails_CompanyReservation] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[CompanyReservations] ([ReservationID])
GO
ALTER TABLE [dbo].[CompanyReservationTables] CHECK CONSTRAINT [FK_CompanyReservationDetails_CompanyReservation]
GO
ALTER TABLE [dbo].[CompanyReservationTables]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReservationTables_Tables] FOREIGN KEY([TableID])
REFERENCES [dbo].[Tables] ([TableID])
GO
ALTER TABLE [dbo].[CompanyReservationTables] CHECK CONSTRAINT [FK_CompanyReservationTables_Tables]
GO
ALTER TABLE [dbo].[CompanyReservationTables]  WITH CHECK ADD  CONSTRAINT [CK_CompanyReservationTables] CHECK  (([Seats]>(0)))
GO
ALTER TABLE [dbo].[CompanyReservationTables] CHECK CONSTRAINT [CK_CompanyReservationTables]
