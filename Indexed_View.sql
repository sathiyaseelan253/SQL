create table tblProductDetails
(ProductId int primary key,
Name varchar(50),
PricePerPiece int
)

create table tblSales
(ProductId int,
SoldQuantity int
)

Insert into tblProductDetails Values(1, 'Books', 20)
Insert into tblProductDetails Values(2, 'Pens', 14)
Insert into tblProductDetails Values(3, 'Pencils', 11)
Insert into tblProductDetails Values(4, 'Clips', 10)

Insert into tblSales values(1, 10)
Insert into tblSales values(3, 23)
Insert into tblSales values(4, 21)
Insert into tblSales values(2, 12)
Insert into tblSales values(1, 13)
Insert into tblSales values(3, 12)
Insert into tblSales values(4, 13)
Insert into tblSales values(1, 11)
Insert into tblSales values(2, 12)
Insert into tblSales values(1, 14)

select * from tblProductDetails
select * from tblSales

create view vWTotalSales
with schemabinding
as
select Name,
sum(isnull((tblProductDetails.PricePerPiece*tblSales.SoldQuantity),0)) as TotalSales,
COUNT_BIG(*) as TotalTransaction
from dbo.tblProductDetails
join dbo.tblSales
on dbo.tblProductDetails.ProductId=dbo.tblSales.ProductId
group by Name


create unique clustered index UCI_vWTotalSales
on vWTotalSales(Name)

select * from vWTotalSales

