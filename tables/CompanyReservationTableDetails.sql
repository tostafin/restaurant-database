CREATE TABLE [dbo].[CompanyReservationTableDetails](
    [EmployeeID] [int] NOT NULL,
    [ReservationID] [int] NOT NULL,
    [TableID] [int] NOT NULL,
 CONSTRAINT [PK_CompanyReservationTableDetails_1] PRIMARY KEY CLUSTERED
(
    [EmployeeID] ASC,
    [ReservationID] ASC,
    [TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[CompanyReservationTableDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReservationTableDetails_CompanyReservationTables1] FOREIGN KEY([ReservationID], [TableID])
REFERENCES [dbo].[CompanyReservationTables] ([ReservationID], [TableID])
GO
ALTER TABLE [dbo].[CompanyReservationTableDetails] CHECK CONSTRAINT [FK_CompanyReservationTableDetails_CompanyReservationTables1]
GO
ALTER TABLE [dbo].[CompanyReservationTableDetails]  WITH CHECK ADD  CONSTRAINT [FK_ReservationTableDetails_Companies Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[CompanyEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[CompanyReservationTableDetails] CHECK CONSTRAINT [FK_ReservationTableDetails_Companies Employees]
GO
