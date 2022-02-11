CREATE TABLE [dbo].[RestaurantEmployees](
    [RestaurantEmployeeID] [int] NOT NULL,
    [Firstname] [nvarchar](50) NOT NULL,
    [Lastname] [nvarchar](50) NOT NULL,
    [BirthDate] [date] NOT NULL,
    [Address] [nvarchar](max) NOT NULL,
     CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 

ALTER TABLE [dbo].[RestaurantEmployees]  WITH CHECK ADD  CONSTRAINT [CK_RestaurantEmployees] CHECK  (([BirthDate]<getdate()))
GO
ALTER TABLE [dbo].[RestaurantEmployees] CHECK CONSTRAINT [CK_RestaurantEmployees]