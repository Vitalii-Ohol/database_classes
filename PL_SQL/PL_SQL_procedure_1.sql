set SERVEROUTPUT ON;
--print general information about microcontroller in human readable format
create or replace procedure showInfoM
        (v_name varchar2)
is
    v_fn varchar2(30);
    v_proc varchar2(30);
    v_memory varchar2(30);
    v_size varchar2(30);
    v_gpio number;
    v_timer number;
    v_uart number;
    v_i2c number;
    v_spi number;
    v_awire number;
begin
  dbms_output.put_line('Microcontroller: ' || v_name);
  select company
  into v_fn
  from s15827_ISA
  where ISA_NAME = (select family_name
                    from s15827_microcontroller
                    where name = v_name);
  select processor_core, flash_memory, gpio
  into v_proc, v_memory, v_gpio
  from s15827_microcontroller
  where name = v_name;
  dbms_output.put_line('Made by: ' || v_fn);
  dbms_output.put_line('Processor: ' || v_proc);
  dbms_output.put_line('Memory: ' || v_memory);
  select timer, uart, i2c, spi, awire
  into v_timer, v_uart, v_i2c, v_spi, v_awire
  from s15827_microcontroller
  where name = v_name;
  if v_timer > 0 then
    dbms_output.put_line('Has built-in timer');
  end if;
  if v_uart > 0 then
    dbms_output.put_line('Has UART communication');
  end if;
  if v_i2c > 0 then
    dbms_output.put_line('Has I2C bridge');
  end if;
  if v_spi > 0 then
    dbms_output.put_line('Has SPI bridge');
  end if;
  if v_awire > 0 then
    dbms_output.put_line('Has built-in aWire technology');
  end if;
  
  dbms_output.put_line('Number of IO: ' || v_gpio);
end;


set SERVEROUTPUT ON
declare
begin
    SHOWINFOM('ATTINY85-20PU');
end;


select * from s15827_ISA;
select * from S15827_MICROCONTROLLER;

