





create table tblDepartment
(DeptId int primary key identity,
DeptName nvarchar(50)
);
update tblEmployee 
set DeptId=4
where EmployeeId=14;

select * from tblEmployee
select * from tblDepartment



Insert into tblEmployee values ('Naveen','Naveen@gmail.com',23000,1,20)
Insert into tblEmployee values ('Madhu','Madhu@gmail.com',32000,2,22)
Insert into tblEmployee values ('Lira','Lira@gmail.com',38000,1,23)
Insert into tblEmployee values ('Priya','Priya@gmail.com',60000,2,30)
Insert into tblEmployee values ('Balakumar','Balakumar@gmail.com',78000,1,38)

Insert into tblDepartment values ('IT')
Insert into tblDepartment values ('Payroll')
Insert into tblDepartment values ('HR')
Insert into tblDepartment values ('Admin')

select * from tblDepartment

create view vwViewByDeptName
as
select EmployeeId,Name,EmailId,Salary,Age,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DeptId=tblDepartment.DeptId




select * from vwViewByDeptName

/*return only IT employee*/
create view vwViewOnlyITEmployee
as
select EmployeeId,Name,EmailId,Salary,Age,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DeptId=tblDepartment.DeptId
where tblDepartment.DeptName='IT'

select * from vwViewOnlyITEmployee

/*return only HR employee*/
create view vwViewOnlyHREmployee
as
select EmployeeId,Name,EmailId,Salary,Age,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DeptId=tblDepartment.DeptId
where tblDepartment.DeptName='HR'

select * from vwViewOnlyHREmployee

/*return only Admin employee*/
create view vwViewOnlyAdminEmployee
as
select EmployeeId,Name,EmailId,Salary,Age,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DeptId=tblDepartment.DeptId
where tblDepartment.DeptName='Admin'

select * from vwViewOnlyAdminEmployee

/*return only Admin employee*/
create view vwViewOnlyPayRollEmployee
as
select EmployeeId,Name,EmailId,Salary,Age,DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DeptId=tblDepartment.DeptId
where tblDepartment.DeptName='Payroll'


select * from vwViewOnlyPayRollEmployee


/*Update view*/
select * from vwViewByDeptName
update vwViewByDeptName
set Age=30,EmailId='Sathiya@gmail.com'
where EmployeeId=1


update vwViewByDeptName
set DeptName='IT'
where EmployeeId=6

update vwViewByDeptName
set Salary=35000
where EmployeeId=10

update vwViewByDeptName
set Age=45,Name='Anaiya Kumar'
where EmployeeId=7

/*Insert data to views*/

insert into vwViewByDeptName(Name,EmailId,Salary,Age,DeptName)
values('Sundar','Sundar@gmail.com',34000,45,'Payroll')

/*Delete data from view*/

delete vwViewByDeptName where Name='Raja'
 










































