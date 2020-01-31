set serveroutput on;

create or replace trigger tooMany
after insert
on s15827_logic_type
declare
    v_count number;
begin
    select count(1)
    into v_count
    from s15827_logic_type;
    if v_count > 15 then
        dbms_output.put_line('Something wrong: it can`t be more than 15 logic types');
    end if;
end;


select count(1) from s15827_logic_type;
