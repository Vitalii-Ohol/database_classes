set SERVEROUTPUT ON;

--trigger that prevent from using too low and too high values
create or replace trigger specialBounds
before insert or update
on s15827_microcontroller
for each row
declare
begin
    if inserting then
        if :new.gpio < 4 then
            :new.gpio := 4;
        elsif :new.gpio > 100 then
            :new.gpio := 100;
        end if;
    end if;
    if updating then
        if :new.gpio < 4 then
            :new.gpio := :old.gpio;
        end if;
    end if;
end;


select * from s15827_microcontroller;
update s15827_microcontroller
set gpio = 3
where name = 'ATTINY13A-PU';
