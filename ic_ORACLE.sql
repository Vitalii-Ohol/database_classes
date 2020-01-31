--  ____        _        ____                 
-- |  _ \  __ _| |_ __ _| __ )  __ _ ___  ___ 
-- | | | |/ _` | __/ _` |  _ \ / _` / __|/ _ \
-- | |_| | (_| | || (_| | |_) | (_| \__ \  __/
-- |____/ \__,_|\__\__,_|____/ \__,_|___/\___|




--============================================================================================================
--============================================================================================================
--  _____     _     _           
-- |_   _|_ _| |__ | | ___  ___ 
--   | |/ _` | '_ \| |/ _ \/ __|
--   | | (_| | |_) | |  __/\__ \
--   |_|\__,_|_.__/|_|\___||___/
--============================================================================================================
--============================================================================================================
-- Create new table PACKAGE_TYPE.
-- PACKAGE_TYPE : Table of package type
-- 	SHORT_NAME : short name identifies package type
-- 	FULL_NAME : full_name is of package type
-- 	DESCRIPTION : description is of package type  
create table S15827_PACKAGE_TYPE (
	SHORT_NAME VARCHAR2(4) not null,
	FULL_NAME VARCHAR2(30) null,
	DESCRIPTION VARCHAR2(200) null, constraint PACKAGE_TYPE_PK primary key (SHORT_NAME) ); 

-- Create new table REL_IC_SKLEP.
-- REL_IC_SKLEP : Table of Rel_IC_sklep
-- 	CIRCUIT_NAME : circuit_name identifies Rel_IC_sklep
-- 	SKLEP : sklep partly identifies Rel_IC_sklep
-- 	"NUMBER" : number is of Rel_IC_sklep  
-- 	CENA : cena is of Rel_IC_sklep  
create table S15827_REL_IC_SKLEP (
	CIRCUIT_NAME VARCHAR2(30) not null,
	SKLEP CHAR(11) not null,
	"NUMBER" NUMBER(2, 0) null,
	CENA NUMBER(5,3) null, constraint REL_IC_SKLEP_PK primary key (CIRCUIT_NAME, SKLEP) ); 

-- Create new table ISA.
-- ISA : Table of ISA
-- 	COMPANY : Company is of ISA
-- 	ISA_NAME : ISA_name identifies ISA
-- 	BIT_REGISTER : bit_register is of ISA  
create table S15827_ISA (
	COMPANY VARCHAR2(30) null,
	ISA_NAME VARCHAR2(30) not null,
	BIT_REGISTER NUMBER(3,0) null, constraint ISA_PK primary key (ISA_NAME) ); 

-- Create new table SKLEP.
-- SKLEP : Table of sklep
-- 	ID : ID identifies sklep
-- 	NAME : Name is of sklep
-- 	SITE : site is of sklep
-- 	LOCATION : location is of sklep
-- 	CURRENCY : currency is of sklep  
create table S15827_SKLEP (
	ID CHAR(11) not null,
	NAME VARCHAR2(30) null,
	SITE VARCHAR2(150) null,
	LOCATION VARCHAR2(30) null,
	CURRENCY VARCHAR2(4) null, constraint SKLEP_PK primary key (ID) ); 

-- Create new table IN_OUT.
-- IN_OUT : Table of IN_OUT
-- 	IO_NAME : IO_name identifies IN_OUT
-- 	DESCRIPTION : description is of IN_OUT  
create table S15827_IN_OUT (
	IO_NAME VARCHAR2(8) not null,
	DESCRIPTION VARCHAR2(200) null, constraint IN_OUT_PK primary key (IO_NAME) ); 

-- Create new table REGISTER_TYPE.
-- REGISTER_TYPE : Table of register_type
-- 	TYPE_NAME : type_name identifies register_type
-- 	DESCRIPTION : description is of register_type  
create table S15827_REGISTER_TYPE (
	TYPE_NAME VARCHAR2(4) not null,
	DESCRIPTION VARCHAR2(200) null, constraint REGISTER_TYPE_PK primary key (TYPE_NAME) ); 

-- Create new table INTEGRATED_CIRCUIT.
-- INTEGRATED_CIRCUIT : Table of integrated_circuit
-- 	NAME : name identifies integrated_circuit
-- 	"SIZE" : size is of integrated_circuit
-- 	DATASHEET : Datasheet is of integrated_circuit
-- 	PACKAGE_FORMAT : package_format is of integrated_circuit  
create table S15827_INTEGRATED_CIRCUIT (
	"NAME" VARCHAR2(30) not null,
	"SIZE" VARCHAR2(20) null,
	DATASHEET VARCHAR2(150) null,
	PACKAGE_FORMAT VARCHAR2(4) null, constraint INTEGRATED_CIRCUIT_PK primary key (NAME) ); 

-- Create new table FLASH_MEMORY.
-- FLASH_MEMORY : Table of flash_memory
-- 	NAME : name identifies flash_memory
-- 	BITS_PER_WORD : bits_per_word is of flash_memory
--	GPIO : GPIO is of flash_memory
--	MEMORY_SIZE : MEMORY_SIZE is of flash_memory
create table S15827_FLASH_MEMORY (
	NAME VARCHAR2(30) not null,
	MEMORY_SIZE VARCHAR2(30) null,
	GPIO NUMBER(3, 0) null,
	BITS_PER_WORD NUMBER(3,0) null, constraint FLASH_MEMORY_PK primary key (NAME) ); 

-- Create new table LOGIC_FAMILY.
-- LOGIC_FAMILY : Table of logic_family
-- 	ID : ID identifies logic_family
-- 	NAME : name is of logic_family
-- 	DESCRIPTION : description is of logic_family
-- 	TOGGLE_SPEED : toggle_speed is of logic_family
-- 	SUPPLY_VOLTAGE : supply_voltage is of logic_family  
create table S15827_LOGIC_FAMILY (
	ID VARCHAR2(4) not null,
	NAME VARCHAR2(40) null,
	DESCRIPTION VARCHAR2(200) null,
	TOGGLE_SPEED VARCHAR2(30) null,
	SUPPLY_VOLTAGE VARCHAR2(30) null, constraint LOGIC_FAMILY_PK primary key (ID) ); 

-- Create new table LOGIC_TYPE.
-- LOGIC_TYPE : Table of logic_type
-- 	TYPE_NAME : type_name identifies logic_type
-- 	DISTINCTIVE_SHAPE : distinctive_shape is of logic_type
-- 	TRUTH_TABLE : truth_table is of logic_type  
create table S15827_LOGIC_TYPE (
	TYPE_NAME VARCHAR2(4) not null,
	DISTINCTIVE_SHAPE VARCHAR2(150) null,
	TRUTH_TABLE VARCHAR2(50) null, constraint LOGIC_TYPE_PK primary key (TYPE_NAME) ); 

-- Create new table SHIFT_REGISTER.
-- SHIFT_REGISTER : Table of shift_register
-- 	NAME : name identifies shift_register
-- 	BIT_REGISTER : bit_register is of shift_register
-- 	GPIO : GPIO is of shift_register
-- 	IO : IO is of shift_register
-- 	TYPE : type is of shift_register  
create table S15827_SHIFT_REGISTER (
	NAME VARCHAR2(30) not null,
	BIT_REGISTER NUMBER(3,0) null,
	GPIO NUMBER(3,0) null,
	IO VARCHAR2(8) null,
	TYPE VARCHAR2(4) null, constraint SHIFT_REGISTER_PK primary key (NAME) ); 

-- Create new table SWITCH_TYPE.
-- SWITCH_TYPE : Table of switch_type
-- 	TYPE_NAME : type_name identifies switch_type
-- 	DESCRIPTION : description is of switch_type  
create table S15827_SWITCH_TYPE (
	TYPE_NAME VARCHAR2(4) not null,
	DESCRIPTION VARCHAR2(200) null, constraint SWITCH_TYPE_PK primary key (TYPE_NAME) ); 

-- Create new table MUX_DEMUX.
-- MUX_DEMUX : Table of mux_demux
-- 	NAME : name identifies mux_demux
-- 	GPIO : GPIO is of mux_demux
-- 	SWITCH_TYPE : switch_type is of mux_demux  
create table S15827_MUX_DEMUX (
	NAME VARCHAR2(30) not null,
	GPIO NUMBER(3,0) null,
	SWITCH_TYPE VARCHAR2(4) null, constraint MUX_DEMUX_PK primary key (NAME) ); 

-- Create new table MICROCONTROLLER.
-- MICROCONTROLLER : Table of microcontroller
-- 	NAME : name identifies microcontroller
-- 	FAMILY_NAME : family_name is of microcontroller
-- 	PROCESSOR_CORE : processor_core is of microcontroller
-- 	FLASH_MEMORY : flash_memory is of microcontroller
-- 	GPIO : GPIO is of microcontroller
-- 	TIMER : timer is of microcontroller
-- 	PWM_GENERATOR : PWM_generator is of microcontroller
-- 	WATCHDOG : watchdog is of microcontroller
-- 	INTERRUPTS : interrupts is of microcontroller
-- 	UART : UART is of microcontroller
-- 	I2C : I2C is of microcontroller
-- 	SPI : SPI is of microcontroller
-- 	AWIRE : aWIre is of microcontroller  
create table S15827_MICROCONTROLLER (
	NAME VARCHAR2(30) not null,
	FAMILY_NAME VARCHAR2(30) null,
	PROCESSOR_CORE VARCHAR2(30) null,
	FLASH_MEMORY VARCHAR2(30) null,
	GPIO NUMBER(3,0) null,
	TIMER NUMBER(1,0) null,
	PWM_GENERATOR NUMBER(1,0) null,
	WATCHDOG NUMBER(1,0) null,
	INTERRUPTS NUMBER(2,0) null,
	UART NUMBER(1,0) null,
	I2C NUMBER(1,0) null,
	SPI NUMBER(1,0) null,
	AWIRE NUMBER(1,0) null, constraint MICROCONTROLLER_PK primary key (NAME) ); 

-- Create new table LOGIC_GATE.
-- LOGIC_GATE : Table of logic_gate
-- 	NAME : name identifies logic_gate
-- 	LOGIC_TYPE : logic_type is of logic_gate
-- 	LOGIC_FAMILY : logic_family is of logic_gate  
create table S15827_LOGIC_GATE (
	NAME VARCHAR2(30) not null,
	LOGIC_TYPE VARCHAR2(4) null,
	GPIO NUMBER(3,0) null,
	LOGIC_FAMILY VARCHAR2(4) null, constraint LOGIC_GATE_PK primary key (NAME) ); 
--============================================================================================================
--============================================================================================================
--  ____      _       _   _                 
-- |  _ \ ___| | __ _| |_(_) ___  _ __  ___ 
-- | |_) / _ \ |/ _` | __| |/ _ \| '_ \/ __|
-- |  _ <  __/ | (_| | |_| | (_) | | | \__ \
-- |_| \_\___|_|\__,_|\__|_|\___/|_| |_|___/
--============================================================================================================
--============================================================================================================
-- Add foreign key constraints to table REL_IC_SKLEP.
alter table S15827_REL_IC_SKLEP
	add constraint IC_SKLEP_FK1 foreign key (
		CIRCUIT_NAME)
	 references S15827_INTEGRATED_CIRCUIT (
		NAME); 

alter table S15827_REL_IC_SKLEP
	add constraint IC_SKLEP_FK2 foreign key (
		SKLEP)
	 references S15827_SKLEP (
		ID); 

-- Add foreign key constraints to table FLASH_MEMORY.
alter table S15827_FLASH_MEMORY
	add constraint IC_FLASH_FK1 foreign key (
		NAME)
	 references S15827_INTEGRATED_CIRCUIT (
		NAME); 

-- Add foreign key constraints to table SHIFT_REGISTER.
alter table S15827_SHIFT_REGISTER
	add constraint IC_SHIFT_FK1 foreign key (
		NAME)
	 references S15827_INTEGRATED_CIRCUIT (
		NAME); 

alter table S15827_SHIFT_REGISTER
	add constraint SHIFT_IO_FK1 foreign key (
		IO)
	 references S15827_IN_OUT (
		IO_NAME); 

alter table S15827_SHIFT_REGISTER
	add constraint SHIFT_TYPE_FK1 foreign key (
		TYPE)
	 references S15827_REGISTER_TYPE (
		TYPE_NAME); 

-- Add foreign key constraints to table MUX_DEMUX.
alter table S15827_MUX_DEMUX
	add constraint IC_MUX_DEMUX_FK1 foreign key (
		NAME)
	 references S15827_INTEGRATED_CIRCUIT (
		NAME); 

alter table S15827_MUX_DEMUX
	add constraint MUX_SWITCH_FK1 foreign key (
		SWITCH_TYPE)
	 references S15827_SWITCH_TYPE (
		TYPE_NAME); 

-- Add foreign key constraints to table MICROCONTROLLER.
alter table S15827_MICROCONTROLLER
	add constraint IC_MIC_FK1 foreign key (
		NAME)
	 references S15827_INTEGRATED_CIRCUIT (
		NAME); 

alter table S15827_MICROCONTROLLER
	add constraint ISA_MIC_FK1 foreign key (
		FAMILY_NAME)
	 references S15827_ISA (
		ISA_NAME); 

--alter table S15827_MICROCONTROLLER
--	add constraint FLASH_MIC_FK1 foreign key (
--		FLASH_MEMORY)
--	 references S15827_FLASH_MEMORY (
--		NAME); 

-- Add foreign key constraints to table LOGIC_GATE.
alter table S15827_LOGIC_GATE
	add constraint IC_LOGIC_FK1 foreign key (
		NAME)
	 references S15827_INTEGRATED_CIRCUIT (
		NAME); 

alter table S15827_LOGIC_GATE
	add constraint LOGIC_TYPE_FK1 foreign key (
		LOGIC_TYPE)
	 references S15827_LOGIC_TYPE (
		TYPE_NAME); 

alter table S15827_LOGIC_GATE
	add constraint LOGIC_FAMILY_FK1 foreign key (
		LOGIC_FAMILY)
	 references S15827_LOGIC_FAMILY (
		ID); 

-- Add foreign key constraints to table INTEGRATED_CIRCUIT.
alter table S15827_INTEGRATED_CIRCUIT
	add constraint PACKAGE_TYPE_IC_FK1 foreign key (
		PACKAGE_FORMAT)
	 references S15827_PACKAGE_TYPE (
		SHORT_NAME); 
--============================================================================================================
--============================================================================================================


