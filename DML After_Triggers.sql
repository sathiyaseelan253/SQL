/*Creting DML trigger for After or for trigger for insert*/
create Trigger tr_tblEmployee_ForInsert
on tblEmployee
for insert
as
begin
declare @id int
select @id=Id from inserted
 insert into tblAudit 
 values('New employee with Id  = ' + Cast(@id as nvarchar(5)) + ' is added at ' + cast(Getdate() as nvarchar(20)))
end

insert into tblEmployee
values('Sathiyaseelan','Male',45000,1);

insert into tblEmployee
values('Gokul','Male',35000,2);

insert into tblEmployee
values('Anu','Female',30000,3);

select * from tblEmployee
select * from tblAudit

/*Creting DML trigger for After or for trigger for delete*/

create Trigger tr_tblEmployee_ForDelete
on tblEmployee
for delete
as
begin
declare @id int
select @id=Id from deleted
 insert into tblAudit 
 values('Existing employee with Id  = ' + Cast(@id as nvarchar(5)) + ' is deleted at ' + cast(Getdate() as nvarchar(20)))
end

delete from tblEmployee where Id=22

delete from tblEmployee where Id=15
select * from tblEmployee
select * from tblAudit