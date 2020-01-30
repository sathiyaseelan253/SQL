select * from tblEmployee
select * from tblGender

truncate table tblEmployee

insert into tblEmployee
values('Sathyaseelan','Sathyaseelan@gmail.com',40000,1,21);
insert into tblEmployee
values('Gokul','Gokuk@gmail.com',20000,1,22);
insert into tblEmployee
values('arun','arun@gmail.com',30000,1,45);
insert into tblEmployee
values('Santhosh','santhoish@gmail.com',33000,1,2);
insert into tblEmployee
values('Nila','nikla@gmail.com',22000,1,21);

update tblEmployee
set GenderId=2
where Name='Nila'

alter table tblEmployee
add constraint DC_tblEmployee_GenderId 
default 3 for GenderId

insert into tblEmployee(Name,EmailId,Salary,Age)
values('Anaiya','anaiya@gmail.com',28000,27)