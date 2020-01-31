--function insert new record to a main table(integrated_circuit) and category table(logic gate)
--additionally checks if all needed data from another tables are present
--if not shows message about wrong data
create procedure insertLogicGate @v_name varchar(30),
								 @v_logic_type varchar(4),
								 @v_gpio tinyint,
								 @v_logic_family varchar(4),
								 @v_size varchar(20),
								 @v_package_format varchar(4)
as
begin
	if not exists (select 1 from S15827_PACKAGE_TYPE where short_name = @v_package_format)
		begin
			print 'Unknown package format'
			return;
		end;

	if not exists (select 1 from S15827_LOGIC_TYPE where type_name = @v_logic_type)
		begin
			print 'Unknown logic type'
			return;
		end;
	if not exists (select 1 from S15827_LOGIC_FAMILY where id = @v_logic_family)
		begin
			print 'Unknown logic family'
			return;
		end;
	insert into s15827_integrated_circuit(name, size, package_format)
	values(@v_name, @v_size, @v_package_format);
	insert into s15827_logic_gate(name, logic_type, gpio, logic_family)
	values(@v_name, @v_logic_type, @v_gpio, @v_logic_family);
end;

select * from s15827_package_type;
select * from s15827_logic_type;
select * from s15827_logic_family;


exec insertLogicGate 'test', 'AND', 8, 'TTL', 'test', 'DIP' --good
exec insertLogicGate 'test2', 'ND', 8, 'TTL', 'test', 'DIP' --wrong logic type
exec insertLogicGate 'test3', 'AND', 8, 'TTL', 'test', 'DP' --wrong package type

select * from s15827_integrated_circuit where name like 'test%'
select * from s15827_logic_gate where name like 'test%'


drop procedure insertLogicGate;

delete from s15827_logic_gate where name like 'test%'
delete from s15827_integrated_circuit where name like 'test%'
