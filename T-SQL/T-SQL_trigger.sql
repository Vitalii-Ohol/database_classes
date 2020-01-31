--check if inserted chip already exists in database
--if yes don't allow this operation
create trigger t_denyDublicate on s15827_microcontroller
for insert
as
if exists (select 1 from inserted where name in (select name from s15827_integrated_circuit))
begin
	delete from s15827_microcontroller
	where name in (select name from inserted
					where name in (select name
								   from s15827_integrated_circuit));
end;

drop trigger t_denyDublicate;


select * from S15827_MICROCONTROLLER;
select * from S15827_ISA;
select * from S15827_SHIFT_REGISTER;

insert into S15827_MICROCONTROLLER(name, FAMILY_NAME, AWIRE)
values('CD4094BE', 'ATmega', 1);

select * from S15827_MICROCONTROLLER where name = 'CD4094BE';