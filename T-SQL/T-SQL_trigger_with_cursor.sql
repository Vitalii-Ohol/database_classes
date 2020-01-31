--if inserted price for a pack(5, 10, 20 pcs) of chips
--trigger make "price/amount" operation
--because we want store price for one piece
--display what and where was changed
create trigger t_priceForOne on s15827_rel_ic_sklep
for insert
as
if exists (select 1 from inserted where number>1)
begin
	declare @v_name varchar(30),
			@v_sklep char(11),
			@v_number tinyint,
			@v_cena smallmoney,
			@v_tmp smallmoney;
    declare c_ins cursor for (select circuit_name, sklep, number, cena
							  from inserted
							  where number>1)
	open c_ins;
	fetch next from c_ins into @v_name, @v_sklep, @v_number, @v_cena;
	while @@fetch_status = 0
	begin
		select @v_tmp = @v_cena/@v_number;
		update s15827_rel_ic_sklep
		set number = 1, cena = @v_tmp
		where circuit_name = @v_name and sklep = @v_sklep;
		print 'Changed from '+cast(@v_cena as varchar)+'/'+cast(@v_number as varchar)+'pcs to '+cast(@v_tmp as varchar)+'/1pcs for '+@v_name;
		fetch next from c_ins into @v_name, @v_sklep, @v_number, @v_cena;
	end;	
	close c_ins;
	deallocate c_ins;
end;

drop trigger t_priceForOne;

select * from s15827_rel_ic_sklep;


insert into s15827_rel_ic_sklep(circuit_name, sklep, number, cena)
values('74HC4094D', 1, 20, 40);

select * from s15827_rel_ic_sklep where circuit_name = '74HC4094D';


delete from s15827_rel_ic_sklep where circuit_name = '74HC4094D' and sklep = 1;