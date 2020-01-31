set SERVEROUTPUT ON
--procedure to make a discount for all products in specific shop
create or replace procedure makeDiscount
    (v_procent number DEFAULT 10, v_sklep varchar2)
is
v_sklepId number;
begin
    select id
    into v_sklepId
    from s15827_sklep
    where name = v_sklep;
    if v_procent>0 and v_procent < 50 then
        update s15827_rel_ic_sklep
        set cena = cena * (1-v_procent/100)
        where sklep = v_sklepId;
        dbms_output.put_line('Succesfully calculated ' || v_procent || ' percent discount');
    else
         dbms_output.put_line('Discount procent is out of allowed range');
    end if;
end;

select * from s15827_sklep;
declare
begin
    makeDiscount(15, 'Texas Instruments');
end;

select * from s15827_rel_ic_sklep where sklep = 2;