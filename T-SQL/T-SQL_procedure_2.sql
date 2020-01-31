--function show from what category(or categories) chip is
--if chip is not in a database, shows needed message
create procedure findByName @v_name varchar(30)
as
begin
	if not exists (select 1 from s15827_integrated_circuit where name = @v_name)
		begin
			print 'Chip not found'
			return;
		end;
	select category
	from
		(select name, 'Logic Gate' as category from s15827_logic_gate
		union
		select name, 'Flash Memory' as category from s15827_flash_memory
		union
		select name, 'Microcontroller' as category from s15827_microcontroller
		union	 
		select name, 'Mupliplexer/Demultiplexer' as category from s15827_mux_demux
		union
		select name, 'Shift Register' as category from s15827_shift_register) as tab
	where name = @v_name
end;

drop procedure findByName;

select * from s15827_shift_register;

exec findByName '74HC4094D'; --OK
exec findByName '74HC409D'; --mistype
