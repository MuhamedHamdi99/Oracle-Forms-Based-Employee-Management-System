--
-- Create Schema Script
--   Database Version            : 11.2.0.2.0
--   Database Compatible Level   : 11.2.0.2.0
--   Script Compatible Level     : 11.2.0.2.0
--   Toad Version                : 16.2.98.1741
--   DB Connect String           : XE
--   Schema                      : HR
--   Script Created by           : HR
--   Script Created at           : 28/08/2024 12:11:11 م
--   Notes                       : 
--

-- Object Counts: 
--   Roles: 2           System Privileges: 9    Roles: 0             
--   Users: 1           System Privileges: 10   Roles: 2                Grants: 25          Tablespace Quotas: 1 
--   Tablespaces: 2     Datafiles: 1        Tempfiles: 1 
-- 
--   Functions: 6       Lines of Code: 64 
--   Indexes: 22        Columns: 24         
--   Procedures: 3      Lines of Code: 41 
--   Sequences: 6 
--   Tables: 10         Columns: 59         Constraints: 39     
--   Triggers: 4 
--   Views: 1           Columns: 16         


-- "Set define off" turns off substitution variables.
Set define off; 

--
-- TEMP  (Tablespace) 
--
CREATE TEMPORARY TABLESPACE TEMP
TEMPFILE 
  'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\TEMP.DBF' SIZE 20M AUTOEXTEND ON NEXT 640K MAXSIZE UNLIMITED
TABLESPACE GROUP ''
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1M
FLASHBACK ON;


--
-- USERS  (Tablespace) 
--
CREATE TABLESPACE USERS
DATAFILE 
  'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\USERS.DBF' SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE 11G
LOGGING
ONLINE
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;


--
-- "DEFAULT"  (Profile) 
--
CREATE PROFILE "DEFAULT" LIMIT
  SESSIONS_PER_USER UNLIMITED
  CPU_PER_SESSION UNLIMITED
  CPU_PER_CALL UNLIMITED
  CONNECT_TIME UNLIMITED
  IDLE_TIME UNLIMITED
  LOGICAL_READS_PER_SESSION UNLIMITED
  LOGICAL_READS_PER_CALL UNLIMITED
  COMPOSITE_LIMIT UNLIMITED
  PRIVATE_SGA UNLIMITED
  FAILED_LOGIN_ATTEMPTS 10
  PASSWORD_LIFE_TIME 180
  PASSWORD_REUSE_TIME UNLIMITED
  PASSWORD_REUSE_MAX UNLIMITED
  PASSWORD_LOCK_TIME 1
  PASSWORD_GRACE_TIME 7
  PASSWORD_VERIFY_FUNCTION NULL;


--
-- CONNECT  (Role) 
--
CREATE ROLE CONNECT NOT IDENTIFIED;

-- System privileges granted to CONNECT
GRANT CREATE SESSION TO CONNECT;


--
-- RESOURCE  (Role) 
--
CREATE ROLE RESOURCE NOT IDENTIFIED;

-- System privileges granted to RESOURCE
GRANT CREATE CLUSTER TO RESOURCE;
GRANT CREATE INDEXTYPE TO RESOURCE;
GRANT CREATE OPERATOR TO RESOURCE;
GRANT CREATE PROCEDURE TO RESOURCE;
GRANT CREATE SEQUENCE TO RESOURCE;
GRANT CREATE TABLE TO RESOURCE;
GRANT CREATE TRIGGER TO RESOURCE;
GRANT CREATE TYPE TO RESOURCE;


--
-- HR  (User) 
--
CREATE USER HR
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;

-- 2 Roles for HR 
--
-- CONNECT  (Role) 
--
GRANT CONNECT TO HR;
--
-- RESOURCE  (Role) 
--
GRANT RESOURCE TO HR;
ALTER USER HR DEFAULT ROLE ALL;

-- 10 System Privileges for HR 
GRANT ALTER SESSION TO HR;
GRANT CREATE DATABASE LINK TO HR;
GRANT CREATE PROCEDURE TO HR;
GRANT CREATE SEQUENCE TO HR;
GRANT CREATE SESSION TO HR;
GRANT CREATE SYNONYM TO HR;
GRANT CREATE TABLE TO HR;
GRANT CREATE TRIGGER TO HR;
GRANT CREATE VIEW TO HR;
GRANT UNLIMITED TABLESPACE TO HR;

-- 1 Tablespace Quota for HR 
ALTER USER HR QUOTA UNLIMITED ON USERS;

-- 25 Object Privileges for HR 
GRANT SELECT ON SYS.ALL_AUDIT_POLICIES TO HR;
GRANT SELECT ON SYS.ALL_AUDIT_POLICY_COLUMNS TO HR;
GRANT SELECT ON SYS.DBA_APPLICATION_ROLES TO HR;
GRANT SELECT ON SYS.DBA_COL_PRIVS TO HR;
GRANT SELECT ON SYS.DBA_DATA_FILES TO HR;
GRANT SELECT ON SYS.DBA_OBJ_AUDIT_OPTS TO HR;
GRANT SELECT ON SYS.DBA_OBJECTS TO HR;
GRANT SELECT ON SYS.DBA_PRIV_AUDIT_OPTS TO HR;
GRANT SELECT ON SYS.DBA_PROFILES TO HR;
GRANT SELECT ON SYS.DBA_PROXIES TO HR;
GRANT SELECT ON SYS.DBA_ROLE_PRIVS TO HR;
GRANT SELECT ON SYS.DBA_ROLES TO HR;
GRANT SELECT ON SYS.DBA_RSRC_CONSUMER_GROUP_PRIVS TO HR;
GRANT SELECT ON SYS.DBA_SEGMENTS TO HR;
GRANT SELECT ON SYS.DBA_STMT_AUDIT_OPTS TO HR;
GRANT SELECT ON SYS.DBA_SYS_PRIVS TO HR;
GRANT SELECT ON SYS.DBA_TABLESPACE_GROUPS TO HR;
GRANT SELECT ON SYS.DBA_TABLESPACES TO HR;
GRANT SELECT ON SYS.DBA_TAB_PRIVS TO HR;
GRANT SELECT ON SYS.DBA_TEMP_FILES TO HR;
GRANT SELECT ON SYS.DBA_TS_QUOTAS TO HR;
GRANT SELECT ON SYS.DBA_USERS TO HR;
GRANT SELECT ON SYS.KU$_FILE_VIEW TO HR;
GRANT SELECT ON SYS.V_$TABLESPACE TO HR;
GRANT SELECT ON SYS.V_$TEMPFILE TO HR;


--
-- VARCHAR2_TABLE  (Type) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE TYPE HR.varchar2_table AS TABLE OF VARCHAR2(4000);
/


--
-- DEPARTMENTS_SEQ  (Sequence) 
--
CREATE SEQUENCE HR.DEPARTMENTS_SEQ
  START WITH 450
  INCREMENT BY 10
  MAXVALUE 9990
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


--
-- EMPLOYEES_SEQ  (Sequence) 
--
CREATE SEQUENCE HR.EMPLOYEES_SEQ
  START WITH 268
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


--
-- FORM_SEQ  (Sequence) 
--
CREATE SEQUENCE HR.FORM_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


--
-- LOCATIONS_SEQ  (Sequence) 
--
CREATE SEQUENCE HR.LOCATIONS_SEQ
  START WITH 4100
  INCREMENT BY 100
  MAXVALUE 9900
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


--
-- PRIVILEDGEE_SEQ  (Sequence) 
--
CREATE SEQUENCE HR.PRIVILEDGEE_SEQ
  START WITH 51
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


--
-- USERS_SEQ  (Sequence) 
--
CREATE SEQUENCE HR.USERS_SEQ
  START WITH 13
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


--
-- FORMS  (Table) 
--
--   Row Count: 5
CREATE TABLE HR.FORMS
(
  FORM_ID    NUMBER,
  FORM_NAME  VARCHAR2(4000 BYTE)
)
TABLESPACE USERS
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


ALTER TABLE HR.FORMS ADD (
  PRIMARY KEY
  (FORM_ID)
  USING INDEX
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                BUFFER_POOL      DEFAULT
               )
  ENABLE VALIDATE);



--
-- JOB_HISTORY  (Table) 
--
--   Row Count: 12
CREATE TABLE HR.JOB_HISTORY
(
  EMPLOYEE_ID    NUMBER(6) CONSTRAINT JHIST_EMPLOYEE_NN NOT NULL,
  START_DATE     DATE CONSTRAINT JHIST_START_DATE_NN NOT NULL,
  END_DATE       DATE CONSTRAINT JHIST_END_DATE_NN NOT NULL,
  JOB_ID         VARCHAR2(10 BYTE) CONSTRAINT JHIST_JOB_NN NOT NULL,
  DEPARTMENT_ID  NUMBER(4)
)
TABLESPACE USERS
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

COMMENT ON TABLE HR.JOB_HISTORY IS 'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';

COMMENT ON COLUMN HR.JOB_HISTORY.EMPLOYEE_ID IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table';

COMMENT ON COLUMN HR.JOB_HISTORY.START_DATE IS 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)';

COMMENT ON COLUMN HR.JOB_HISTORY.END_DATE IS 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)';

COMMENT ON COLUMN HR.JOB_HISTORY.JOB_ID IS 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.';

COMMENT ON COLUMN HR.JOB_HISTORY.DEPARTMENT_ID IS 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table';


--
-- JHIST_EMP_ID_ST_DATE_PK  (Index) 
--
--  Dependencies: 
--   JOB_HISTORY (Table)
--
CREATE UNIQUE INDEX HR.JHIST_EMP_ID_ST_DATE_PK ON HR.JOB_HISTORY
(EMPLOYEE_ID, START_DATE)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE HR.JOB_HISTORY ADD (
  CONSTRAINT JHIST_DATE_INTERVAL
  CHECK (end_date > start_date)
  ENABLE VALIDATE);

ALTER TABLE HR.JOB_HISTORY ADD (
  CONSTRAINT JHIST_EMP_ID_ST_DATE_PK
  PRIMARY KEY
  (EMPLOYEE_ID, START_DATE)
  USING INDEX HR.JHIST_EMP_ID_ST_DATE_PK
  ENABLE VALIDATE);



--
-- JOBS  (Table) 
--
--   Row Count: 19
CREATE TABLE HR.JOBS
(
  JOB_ID      VARCHAR2(10 BYTE),
  JOB_TITLE   VARCHAR2(35 BYTE) CONSTRAINT JOB_TITLE_NN NOT NULL,
  MIN_SALARY  NUMBER(6),
  MAX_SALARY  NUMBER(6)
)
TABLESPACE USERS
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

COMMENT ON TABLE HR.JOBS IS 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';

COMMENT ON COLUMN HR.JOBS.JOB_ID IS 'Primary key of jobs table.';

COMMENT ON COLUMN HR.JOBS.JOB_TITLE IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';

COMMENT ON COLUMN HR.JOBS.MIN_SALARY IS 'Minimum salary for a job title.';

COMMENT ON COLUMN HR.JOBS.MAX_SALARY IS 'Maximum salary for a job title';


--
-- JOB_ID_PK  (Index) 
--
--  Dependencies: 
--   JOBS (Table)
--
CREATE UNIQUE INDEX HR.JOB_ID_PK ON HR.JOBS
(JOB_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE HR.JOBS ADD (
  CONSTRAINT JOB_ID_PK
  PRIMARY KEY
  (JOB_ID)
  USING INDEX HR.JOB_ID_PK
  ENABLE VALIDATE);



--
-- REGIONS  (Table) 
--
--   Row Count: 4
CREATE TABLE HR.REGIONS
(
  REGION_ID    NUMBER CONSTRAINT REGIONS_ID_NN  NOT NULL,
  REGION_NAME  VARCHAR2(25 BYTE)
)
TABLESPACE USERS
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

COMMENT ON TABLE HR.REGIONS IS 'Regions table that contains region numbers and names. Contains 4 rows; references with the Countries table.';

COMMENT ON COLUMN HR.REGIONS.REGION_ID IS 'Primary key of regions table.';

COMMENT ON COLUMN HR.REGIONS.REGION_NAME IS 'Names of regions. Locations are in the countries of these regions.';


--
-- REG_ID_PK  (Index) 
--
--  Dependencies: 
--   REGIONS (Table)
--
CREATE UNIQUE INDEX HR.REG_ID_PK ON HR.REGIONS
(REGION_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE HR.REGIONS ADD (
  CONSTRAINT REG_ID_PK
  PRIMARY KEY
  (REGION_ID)
  USING INDEX HR.REG_ID_PK
  ENABLE VALIDATE);



--
-- USERS_  (Table) 
--
--   Row Count: 5
CREATE TABLE HR.USERS_
(
  USER_ID      NUMBER,
  EMAIL        VARCHAR2(4000 BYTE)              NOT NULL,
  PASSWORDD    VARCHAR2(4000 BYTE)              NOT NULL,
  NUMBERLOGIN  NUMBER,
  IS_LOCKED    CHAR(1 BYTE)                     DEFAULT 'N'
)
TABLESPACE USERS
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


--
-- USERS_PK  (Index) 
--
--  Dependencies: 
--   USERS_ (Table)
--
CREATE UNIQUE INDEX HR.USERS_PK ON HR.USERS_
(USER_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE HR.USERS_ ADD (
  CONSTRAINT USERS_PK
  PRIMARY KEY
  (USER_ID)
  USING INDEX HR.USERS_PK
  ENABLE VALIDATE);



--
-- JHIST_DEPARTMENT_IX  (Index) 
--
--  Dependencies: 
--   JOB_HISTORY (Table)
--
CREATE INDEX HR.JHIST_DEPARTMENT_IX ON HR.JOB_HISTORY
(DEPARTMENT_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- JHIST_EMPLOYEE_IX  (Index) 
--
--  Dependencies: 
--   JOB_HISTORY (Table)
--
CREATE INDEX HR.JHIST_EMPLOYEE_IX ON HR.JOB_HISTORY
(EMPLOYEE_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- JHIST_JOB_IX  (Index) 
--
--  Dependencies: 
--   JOB_HISTORY (Table)
--
CREATE INDEX HR.JHIST_JOB_IX ON HR.JOB_HISTORY
(JOB_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- ADD_JOB_HISTORY  (Procedure) 
--
--  Dependencies: 
--   JOB_HISTORY (Table)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE PROCEDURE HR.add_job_history
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;
/


--
-- SECURE_DML  (Procedure) 
--
--  Dependencies: 
--   DBMS_STANDARD (Package)
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE PROCEDURE HR.secure_dml
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;
/


--
-- STORE_USER_PASSWORD  (Procedure) 
--
--  Dependencies: 
--   USERS_ (Table)
--   DBMS_CRYPTO (Synonym)
--   UTL_RAW (Synonym)
--   STANDARD (Package)
--
CREATE OR REPLACE PROCEDURE HR.store_user_password(
    p_email IN VARCHAR2,
    p_password IN VARCHAR2
) IS
    l_encrypted_password RAW(2000);
    l_key RAW(16) := UTL_RAW.CAST_TO_RAW('your_key_here'); -- 16-byte key for AES
BEGIN
    -- Encrypt the password using AES encryption
    l_encrypted_password := DBMS_CRYPTO.ENCRYPT(
                            src => UTL_RAW.CAST_TO_RAW(p_password),
                            typ => DBMS_CRYPTO.AES_CBC_PKCS5,
                            key => l_key);

    -- Store encrypted password in the database
    INSERT INTO users_ (email, passwordd) 
    VALUES (p_email, RAWTOHEX(l_encrypted_password));

    COMMIT;
END;
/


--
-- BETAND_DECRYPT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION HR.betand_decrypt(p_input IN VARCHAR2, p_key IN VARCHAR2) RETURN VARCHAR2 IS
    -- Implement the BETAND decryption algorithm here
    l_decrypted_value VARCHAR2(4000);
BEGIN
    -- Example implementation (replace with actual BETAND algorithm)
    l_decrypted_value := p_input; -- Placeholder for actual decryption logic
    RETURN l_decrypted_value;
END;
/


--
-- CUSTOM_ENCRYPT  (Function) 
--
CREATE OR REPLACE FUNCTION HR.custom_encrypt(p_text IN VARCHAR2, p_key IN VARCHAR2) RETURN VARCHAR2 IS
    l_result VARCHAR2(4000) := '';
    l_key_len INTEGER := LENGTH(p_key);
    l_text_len INTEGER := LENGTH(p_text);
BEGIN
    FOR i IN 1..l_text_len LOOP
        -- XOR operation to obfuscate characters
        l_result := l_result || CHR(
            ASCII(SUBSTR(p_text, i, 1)) XOR 
            ASCII(SUBSTR(p_key, MOD(i-1, l_key_len) + 1, 1))
        );
    END LOOP;
    RETURN l_result;
END;
/


--
-- DECRYPT_PASSWORD  (Function) 
--
--  Dependencies: 
--   UTL_RAW (Synonym)
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION HR.decrypt_password(p_hashed_password IN RAW) RETURN VARCHAR2 IS
  v_original_password VARCHAR2(4000);
BEGIN
  v_original_password := UTL_RAW.CAST_TO_VARCHAR2(p_hashed_password);
  RETURN v_original_password;
END;
/


--
-- ENCRYPT_PASSWORD  (Function) 
--
--  Dependencies: 
--   DBMS_CRYPTO (Synonym)
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION HR.encrypt_password(p_password IN VARCHAR2) RETURN RAW IS
  v_encrypted_password RAW(2000);
BEGIN
  v_encrypted_password := DBMS_CRYPTO.encrypt(
    src => UTL_I18N.STRING_TO_RAW(p_password, 'AL32UTF8'),
    typ => DBMS_CRYPTO.AES_CBC,
    key => UTL_I18N.STRING_TO_RAW('your-encryption-key', 'AL32UTF8')
  );
  RETURN v_encrypted_password;
END;
/


--
-- SIMPLE_HASH_PASSWORD  (Function) 
--
--  Dependencies: 
--   UTL_RAW (Synonym)
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION HR.simple_hash_password(p_password IN VARCHAR2) RETURN RAW IS
  v_hashed_password RAW(128); -- Adjust size as needed
BEGIN
  v_hashed_password := UTL_RAW.CAST_TO_RAW(p_password); -- Simple example, not secure
  RETURN v_hashed_password;
END;
/


--
-- SPLIT_STRING  (Function) 
--
--  Dependencies: 
--   VARCHAR2_TABLE (Type)
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION HR.split_string(p_list VARCHAR2, p_del VARCHAR2 := ',')
   RETURN varchar2_table
   PIPELINED
IS
   l_idx  PLS_INTEGER;
   l_list VARCHAR2(4000) := p_list;
   l_value VARCHAR2(4000);
BEGIN
   LOOP
      l_idx := INSTR(l_list, p_del);
      IF l_idx > 0 THEN
         PIPE ROW(SUBSTR(l_list, 1, l_idx - 1));
         l_list := SUBSTR(l_list, l_idx + LENGTH(p_del));
      ELSE
         PIPE ROW(l_list);
         EXIT;
      END IF;
   END LOOP;
   RETURN;
END split_string;
/


--
-- USERS_TRG  (Trigger) 
--
--  Dependencies: 
--   USERS_ (Table)
--   USERS_SEQ (Sequence)
--   DUAL (Synonym)
--   STANDARD (Package)
--
CREATE OR REPLACE TRIGGER HR.USERS_TRG
BEFORE INSERT ON HR.USERS_
FOR EACH ROW
WHEN (NEW.user_id IS NULL)
BEGIN
  SELECT USERS_SEQ.NEXTVAL
  INTO :NEW.user_id
  FROM dual;
END;
/


--
-- COUNTRIES  (Table) 
--
--  Dependencies: 
--   REGIONS (Table)
--
--   Row Count: 25
CREATE TABLE HR.COUNTRIES
(
  COUNTRY_ID    CHAR(2 BYTE) CONSTRAINT COUNTRY_ID_NN NOT NULL,
  COUNTRY_NAME  VARCHAR2(40 BYTE),
  REGION_ID     NUMBER, 
  CONSTRAINT COUNTRY_C_ID_PK
  PRIMARY KEY
  (COUNTRY_ID)
  ENABLE VALIDATE
)
ORGANIZATION INDEX
PCTTHRESHOLD 50
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

COMMENT ON TABLE HR.COUNTRIES IS 'country table. Contains 25 rows. References with locations table.';

COMMENT ON COLUMN HR.COUNTRIES.COUNTRY_ID IS 'Primary key of countries table.';

COMMENT ON COLUMN HR.COUNTRIES.COUNTRY_NAME IS 'Country name';

COMMENT ON COLUMN HR.COUNTRIES.REGION_ID IS 'Region ID for the country. Foreign key to region_id column in the departments table.';


-- Index COUNTRY_C_ID_PK is created automatically by Oracle with index organized table COUNTRIES.

--
-- LOCATIONS  (Table) 
--
--  Dependencies: 
--   COUNTRIES (Table)
--
--   Row Count: 31
CREATE TABLE HR.LOCATIONS
(
  LOCATION_ID      NUMBER(4),
  STREET_ADDRESS   VARCHAR2(40 BYTE),
  POSTAL_CODE      VARCHAR2(12 BYTE),
  CITY             VARCHAR2(30 BYTE) CONSTRAINT LOC_CITY_NN NOT NULL,
  STATE_PROVINCE   VARCHAR2(25 BYTE),
  COUNTRY_ID       CHAR(2 BYTE),
  ACTIVE_LOCATION  VARCHAR2(4000 BYTE),
  CREATED_DATE     DATE,
  CREATED_USER     VARCHAR2(4000 BYTE),
  MODEFIED_DATE    DATE
)
TABLESPACE USERS
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

COMMENT ON TABLE HR.LOCATIONS IS 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';

COMMENT ON COLUMN HR.LOCATIONS.LOCATION_ID IS 'Primary key of locations table';

COMMENT ON COLUMN HR.LOCATIONS.STREET_ADDRESS IS 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';

COMMENT ON COLUMN HR.LOCATIONS.POSTAL_CODE IS 'Postal code of the location of an office, warehouse, or production site
of a company. ';

COMMENT ON COLUMN HR.LOCATIONS.CITY IS 'A not null column that shows city where an office, warehouse, or
production site of a company is located. ';

COMMENT ON COLUMN HR.LOCATIONS.STATE_PROVINCE IS 'State or Province where an office, warehouse, or production site of a
company is located.';

COMMENT ON COLUMN HR.LOCATIONS.COUNTRY_ID IS 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';


--
-- LOC_ID_PK  (Index) 
--
--  Dependencies: 
--   LOCATIONS (Table)
--
CREATE UNIQUE INDEX HR.LOC_ID_PK ON HR.LOCATIONS
(LOCATION_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE HR.LOCATIONS ADD (
  CONSTRAINT LOC_ID_PK
  PRIMARY KEY
  (LOCATION_ID)
  USING INDEX HR.LOC_ID_PK
  ENABLE VALIDATE);



--
-- PRIVILEDGEE  (Table) 
--
--  Dependencies: 
--   FORMS (Table)
--   USERS_ (Table)
--
--   Row Count: 25
CREATE TABLE HR.PRIVILEDGEE
(
  PRIVILEGEE_ID  NUMBER,
  USER_ID        NUMBER,
  FORM_ID        NUMBER,
  INSERT_QUERY   NUMBER,
  UPDATE_QUERY   NUMBER,
  DELETE_QUERY   NUMBER,
  QUERYY         NUMBER
)
TABLESPACE USERS
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );


ALTER TABLE HR.PRIVILEDGEE ADD (
  PRIMARY KEY
  (PRIVILEGEE_ID)
  USING INDEX
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                BUFFER_POOL      DEFAULT
               )
  ENABLE VALIDATE);



--
-- LOC_CITY_IX  (Index) 
--
--  Dependencies: 
--   LOCATIONS (Table)
--
CREATE INDEX HR.LOC_CITY_IX ON HR.LOCATIONS
(CITY)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- LOC_COUNTRY_IX  (Index) 
--
--  Dependencies: 
--   LOCATIONS (Table)
--
CREATE INDEX HR.LOC_COUNTRY_IX ON HR.LOCATIONS
(COUNTRY_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- LOC_STATE_PROVINCE_IX  (Index) 
--
--  Dependencies: 
--   LOCATIONS (Table)
--
CREATE INDEX HR.LOC_STATE_PROVINCE_IX ON HR.LOCATIONS
(STATE_PROVINCE)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

--
-- TRG_ADD_PRIVILEGES  (Trigger) 
--
--  Dependencies: 
--   FORMS (Table)
--   PRIVILEDGEE (Table)
--   USERS_ (Table)
--   STANDARD (Package)
--
CREATE OR REPLACE TRIGGER HR.trg_add_privileges
AFTER INSERT ON HR.FORMS
FOR EACH ROW
BEGIN
  -- Insert a privilege for each user with the new form
  INSERT INTO PRIVILEDGEE (user_id, form_id)
  SELECT user_id, :NEW.form_id
  FROM users_;
END;
/


/* This object may not be sorted properly in the script due to cirular references. */
--
-- DEPARTMENTS  (Table) 
--
--  Dependencies: 
--   LOCATIONS (Table)
--   EMPLOYEES (Table)
--
--   Row Count: 32
CREATE TABLE HR.DEPARTMENTS
(
  DEPARTMENT_ID    NUMBER(4),
  DEPARTMENT_NAME  VARCHAR2(30 BYTE) CONSTRAINT DEPT_NAME_NN NOT NULL,
  MANAGER_ID       NUMBER(6),
  LOCATION_ID      NUMBER(4),
  CREATED_DATE     DATE,
  MODEFIED_DATE    DATE,
  CREATED_BY       VARCHAR2(4000 BYTE)
)
TABLESPACE USERS
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

COMMENT ON TABLE HR.DEPARTMENTS IS 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.';

COMMENT ON COLUMN HR.DEPARTMENTS.DEPARTMENT_ID IS 'Primary key column of departments table.';

COMMENT ON COLUMN HR.DEPARTMENTS.DEPARTMENT_NAME IS 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ';

COMMENT ON COLUMN HR.DEPARTMENTS.MANAGER_ID IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';

COMMENT ON COLUMN HR.DEPARTMENTS.LOCATION_ID IS 'Location id where a department is located. Foreign key to location_id column of locations table.';


/* This object may not be sorted properly in the script due to cirular references. */
--
-- DEPT_ID_PK  (Index) 
--
--  Dependencies: 
--   DEPARTMENTS (Table)
--
CREATE UNIQUE INDEX HR.DEPT_ID_PK ON HR.DEPARTMENTS
(DEPARTMENT_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE HR.DEPARTMENTS ADD (
  CONSTRAINT DEPT_ID_PK
  PRIMARY KEY
  (DEPARTMENT_ID)
  USING INDEX HR.DEPT_ID_PK
  ENABLE VALIDATE);



/* This object may not be sorted properly in the script due to cirular references. */
--
-- EMPLOYEES  (Table) 
--
--  Dependencies: 
--   DEPARTMENTS (Table)
--   JOBS (Table)
--
--   Row Count: 112
CREATE TABLE HR.EMPLOYEES
(
  EMPLOYEE_ID     NUMBER(6),
  FIRST_NAME      VARCHAR2(20 BYTE),
  LAST_NAME       VARCHAR2(25 BYTE) CONSTRAINT EMP_LAST_NAME_NN NOT NULL,
  EMAIL           VARCHAR2(25 BYTE) CONSTRAINT EMP_EMAIL_NN NOT NULL,
  PHONE_NUMBER    VARCHAR2(20 BYTE),
  HIRE_DATE       DATE,
  JOB_ID          VARCHAR2(10 BYTE),
  SALARY          NUMBER(8,2),
  COMMISSION_PCT  NUMBER(2,2),
  MANAGER_ID      NUMBER(6),
  DEPARTMENT_ID   NUMBER(4),
  CREATE_DATE     DATE,
  MODEFIED_DATE   DATE,
  CREATED_BY      VARCHAR2(4000 BYTE)
)
TABLESPACE USERS
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

COMMENT ON TABLE HR.EMPLOYEES IS 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';

COMMENT ON COLUMN HR.EMPLOYEES.EMPLOYEE_ID IS 'Primary key of employees table.';

COMMENT ON COLUMN HR.EMPLOYEES.FIRST_NAME IS 'First name of the employee. A not null column.';

COMMENT ON COLUMN HR.EMPLOYEES.LAST_NAME IS 'Last name of the employee. A not null column.';

COMMENT ON COLUMN HR.EMPLOYEES.EMAIL IS 'Email id of the employee';

COMMENT ON COLUMN HR.EMPLOYEES.PHONE_NUMBER IS 'Phone number of the employee; includes country code and area code';

COMMENT ON COLUMN HR.EMPLOYEES.HIRE_DATE IS 'Date when the employee started on this job. A not null column.';

COMMENT ON COLUMN HR.EMPLOYEES.JOB_ID IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.';

COMMENT ON COLUMN HR.EMPLOYEES.SALARY IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)';

COMMENT ON COLUMN HR.EMPLOYEES.COMMISSION_PCT IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage';

COMMENT ON COLUMN HR.EMPLOYEES.MANAGER_ID IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';

COMMENT ON COLUMN HR.EMPLOYEES.DEPARTMENT_ID IS 'Department id where employee works; foreign key to department_id
column of the departments table';


/* This object may not be sorted properly in the script due to cirular references. */
--
-- EMP_EMAIL_UK  (Index) 
--
--  Dependencies: 
--   EMPLOYEES (Table)
--
CREATE UNIQUE INDEX HR.EMP_EMAIL_UK ON HR.EMPLOYEES
(EMAIL)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );
/* This object may not be sorted properly in the script due to cirular references. */
--
-- EMP_EMP_ID_PK  (Index) 
--
--  Dependencies: 
--   EMPLOYEES (Table)
--
CREATE UNIQUE INDEX HR.EMP_EMP_ID_PK ON HR.EMPLOYEES
(EMPLOYEE_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

ALTER TABLE HR.EMPLOYEES ADD (
  CONSTRAINT EMP_JOB_NN
  CHECK ("JOB_ID" IS NOT NULL)
  DISABLE NOVALIDATE);

ALTER TABLE HR.EMPLOYEES ADD (
  CONSTRAINT EMP_SALARY_MIN
  CHECK (salary > 0)
  ENABLE VALIDATE);

ALTER TABLE HR.EMPLOYEES ADD (
  CONSTRAINT EMP_EMP_ID_PK
  PRIMARY KEY
  (EMPLOYEE_ID)
  USING INDEX HR.EMP_EMP_ID_PK
  ENABLE VALIDATE);

ALTER TABLE HR.EMPLOYEES ADD (
  CONSTRAINT EMP_EMAIL_UK
  UNIQUE (EMAIL)
  USING INDEX HR.EMP_EMAIL_UK
  ENABLE VALIDATE);



/* This object may not be sorted properly in the script due to cirular references. */
--
-- DEPT_LOCATION_IX  (Index) 
--
--  Dependencies: 
--   DEPARTMENTS (Table)
--
CREATE INDEX HR.DEPT_LOCATION_IX ON HR.DEPARTMENTS
(LOCATION_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

/* This object may not be sorted properly in the script due to cirular references. */
--
-- EMP_DEPARTMENT_IX  (Index) 
--
--  Dependencies: 
--   EMPLOYEES (Table)
--
CREATE INDEX HR.EMP_DEPARTMENT_IX ON HR.EMPLOYEES
(DEPARTMENT_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

/* This object may not be sorted properly in the script due to cirular references. */
--
-- EMP_JOB_IX  (Index) 
--
--  Dependencies: 
--   EMPLOYEES (Table)
--
CREATE INDEX HR.EMP_JOB_IX ON HR.EMPLOYEES
(JOB_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

/* This object may not be sorted properly in the script due to cirular references. */
--
-- EMP_MANAGER_IX  (Index) 
--
--  Dependencies: 
--   EMPLOYEES (Table)
--
CREATE INDEX HR.EMP_MANAGER_IX ON HR.EMPLOYEES
(MANAGER_ID)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

/* This object may not be sorted properly in the script due to cirular references. */
--
-- EMP_NAME_IX  (Index) 
--
--  Dependencies: 
--   EMPLOYEES (Table)
--
CREATE INDEX HR.EMP_NAME_IX ON HR.EMPLOYEES
(LAST_NAME, FIRST_NAME)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           );

/* This object may not be sorted properly in the script due to cirular references. */
--
-- EMP_DETAILS_VIEW  (View) 
--
--  Dependencies: 
--   COUNTRIES (Table)
--   DEPARTMENTS (Table)
--   EMPLOYEES (Table)
--   JOBS (Table)
--   LOCATIONS (Table)
--   REGIONS (Table)
--
CREATE OR REPLACE FORCE VIEW HR.EMP_DETAILS_VIEW
(EMPLOYEE_ID, JOB_ID, MANAGER_ID, DEPARTMENT_ID, LOCATION_ID, 
 COUNTRY_ID, FIRST_NAME, LAST_NAME, SALARY, COMMISSION_PCT, 
 DEPARTMENT_NAME, JOB_TITLE, CITY, STATE_PROVINCE, COUNTRY_NAME, 
 REGION_NAME)
AS 
SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e
  INNER JOIN departments d ON e.department_id = d.department_id
  INNER JOIN jobs j ON j.job_id = e.job_id
  INNER JOIN locations l ON d.location_id = l.location_id
  INNER JOIN countries c ON l.country_id = c.country_id
  INNER JOIN regions r ON c.region_id = r.region_id
WITH READ ONLY;


/* This object may not be sorted properly in the script due to cirular references. */
--
-- SECURE_EMPLOYEES  (Trigger) 
--
--  Dependencies: 
--   EMPLOYEES (Table)
--   SECURE_DML (Procedure)
--
CREATE OR REPLACE TRIGGER HR.secure_employees
  BEFORE INSERT OR UPDATE OR DELETE ON HR.EMPLOYEES
DISABLE
BEGIN
  secure_dml;
END secure_employees;
/


/* This object may not be sorted properly in the script due to cirular references. */
--
-- UPDATE_JOB_HISTORY  (Trigger) 
--
--  Dependencies: 
--   EMPLOYEES (Table)
--   ADD_JOB_HISTORY (Procedure)
--   STANDARD (Package)
--
CREATE OR REPLACE TRIGGER HR.update_job_history
  AFTER UPDATE OF job_id, department_id ON HR.EMPLOYEES
  FOR EACH ROW
DISABLE
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END;
/


-- 
-- JOB_HISTORY  (Table Foreign Keys)
-- 
-- Dependencies: 
--    DEPARTMENTS (Table)
--    EMPLOYEES (Table)
--    JOBS (Table)
ALTER TABLE HR.JOB_HISTORY ADD (
  CONSTRAINT JHIST_DEPT_FK 
  FOREIGN KEY (DEPARTMENT_ID) 
  REFERENCES HR.DEPARTMENTS (DEPARTMENT_ID)
  ENABLE VALIDATE);

ALTER TABLE HR.JOB_HISTORY ADD (
  CONSTRAINT JHIST_EMP_FK 
  FOREIGN KEY (EMPLOYEE_ID) 
  REFERENCES HR.EMPLOYEES (EMPLOYEE_ID)
  ENABLE VALIDATE);

ALTER TABLE HR.JOB_HISTORY ADD (
  CONSTRAINT JHIST_JOB_FK 
  FOREIGN KEY (JOB_ID) 
  REFERENCES HR.JOBS (JOB_ID)
  ENABLE VALIDATE);


-- 
-- COUNTRIES  (Table Foreign Keys)
-- 
-- Dependencies: 
--    REGIONS (Table)
ALTER TABLE HR.COUNTRIES ADD (
  CONSTRAINT COUNTR_REG_FK 
  FOREIGN KEY (REGION_ID) 
  REFERENCES HR.REGIONS (REGION_ID)
  ENABLE VALIDATE);


-- 
-- LOCATIONS  (Table Foreign Keys)
-- 
-- Dependencies: 
--    COUNTRIES (Table)
ALTER TABLE HR.LOCATIONS ADD (
  CONSTRAINT LOC_C_ID_FK 
  FOREIGN KEY (COUNTRY_ID) 
  REFERENCES HR.COUNTRIES (COUNTRY_ID)
  ENABLE VALIDATE);


-- 
-- PRIVILEDGEE  (Table Foreign Keys)
-- 
-- Dependencies: 
--    FORMS (Table)
--    USERS_ (Table)
ALTER TABLE HR.PRIVILEDGEE ADD (
  CONSTRAINT FK_FORM_ID 
  FOREIGN KEY (FORM_ID) 
  REFERENCES HR.FORMS (FORM_ID)
  ENABLE VALIDATE);

ALTER TABLE HR.PRIVILEDGEE ADD (
  CONSTRAINT FK_USER_ID 
  FOREIGN KEY (USER_ID) 
  REFERENCES HR.USERS_ (USER_ID)
  ENABLE VALIDATE);


-- 
-- DEPARTMENTS  (Table Foreign Keys)
-- 
-- Dependencies: 
--    LOCATIONS (Table)
--    EMPLOYEES (Table)
ALTER TABLE HR.DEPARTMENTS ADD (
  CONSTRAINT DEPT_LOC_FK 
  FOREIGN KEY (LOCATION_ID) 
  REFERENCES HR.LOCATIONS (LOCATION_ID)
  ENABLE VALIDATE);

ALTER TABLE HR.DEPARTMENTS ADD (
  CONSTRAINT DEPT_MGR_FK 
  FOREIGN KEY (MANAGER_ID) 
  REFERENCES HR.EMPLOYEES (EMPLOYEE_ID)
  ENABLE VALIDATE);


-- 
-- EMPLOYEES  (Table Foreign Keys)
-- 
-- Dependencies: 
--    DEPARTMENTS (Table)
--    JOBS (Table)
--    EMPLOYEES (Table)
ALTER TABLE HR.EMPLOYEES ADD (
  CONSTRAINT EMP_DEPT_FK 
  FOREIGN KEY (DEPARTMENT_ID) 
  REFERENCES HR.DEPARTMENTS (DEPARTMENT_ID)
  ENABLE VALIDATE);

ALTER TABLE HR.EMPLOYEES ADD (
  CONSTRAINT EMP_JOB_FK 
  FOREIGN KEY (JOB_ID) 
  REFERENCES HR.JOBS (JOB_ID)
  ENABLE VALIDATE);

ALTER TABLE HR.EMPLOYEES ADD (
  CONSTRAINT EMP_MANAGER_FK 
  FOREIGN KEY (MANAGER_ID) 
  REFERENCES HR.EMPLOYEES (EMPLOYEE_ID)
  ENABLE VALIDATE);


--
-- Note: 
-- The following objects may not be sorted properly in the script due to circular references
--
--  DEPARTMENTS  (Table) 
--  EMPLOYEES  (Table) 
--  DEPT_ID_PK  (Index) 
--  DEPT_LOCATION_IX  (Index) 
--  EMP_DEPARTMENT_IX  (Index) 
--  EMP_EMAIL_UK  (Index) 
--  EMP_EMP_ID_PK  (Index) 
--  EMP_JOB_IX  (Index) 
--  EMP_MANAGER_IX  (Index) 
--  EMP_NAME_IX  (Index) 
--  EMP_DETAILS_VIEW  (View) 
--  SECURE_EMPLOYEES  (Trigger) 
--  UPDATE_JOB_HISTORY  (Trigger)


