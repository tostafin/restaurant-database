CREATE TABLE [dbo].[CompanyEmployees](
    [EmployeeID] [int] NOT NULL,
    [PrivateID] [int] NOT NULL,
    [CompanyID] [int] NOT NULL,
 CONSTRAINT [PK_Companies Employees] PRIMARY KEY CLUSTERED
(
    [EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Companies Employees] UNIQUE NONCLUSTERED
(
    [PrivateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[CompanyEmployees]  WITH CHECK ADD  CONSTRAINT [FK_Companies Emplooyes_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[CompanyEmployees] CHECK CONSTRAINT [FK_Companies Emplooyes_Companies]
GO
ALTER TABLE [dbo].[CompanyEmployees]  WITH CHECK ADD  CONSTRAINT [FK_Companies Emplooyes_Private Clients] FOREIGN KEY([PrivateID])
REFERENCES [dbo].[PrivateClients] ([CustomerID])
GO
ALTER TABLE [dbo].[CompanyEmployees] CHECK CONSTRAINT [FK_Companies Emplooyes_Private Clients]
GO
