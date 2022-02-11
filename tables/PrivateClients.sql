CREATE TABLE [dbo].[PrivateClients](
    [PrivateID] [int] NOT NULL,
    [Firstname] [nvarchar](50) NOT NULL,
    [Lastname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Private Clients] PRIMARY KEY CLUSTERED 
(
    [PrivateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[PrivateClients]  WITH CHECK ADD  CONSTRAINT [FK_Private Clients_Clients] FOREIGN KEY([PrivateID])
REFERENCES [dbo].[Clients] ([PrivateID])
GO
ALTER TABLE [dbo].[PrivateClients] CHECK CONSTRAINT [FK_Private Clients_Clients]
GO

