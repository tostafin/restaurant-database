create view MostCommonCompanyCustomers as
select top 10 CE.EmployeeID, sum(OD.Quantity) as quantity
from CompaniesEmployees CE
join Companies C1 on CE.CompanyID = C1.CompanyID
join Clients C2 on C1.CustomerID = C2.CustomerID
join Orders O on C2.CustomerID = O.CustomerID
join OrderDetails OD on O.OrderID = OD.OrderID
group by CE.EmployeeID
order by sum(OD.Quantity) desc
