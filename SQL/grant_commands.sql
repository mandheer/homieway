alter SESSION set "_ORACLE_SCRIPT"=true;
create user mandheer identified by Nirankari1
/

GRANT CONNECT TO mandheer;
GRANT RESOURCE, DBA TO mandheer;
GRANT CREATE SESSION TO mandheer;
GRANT ANY PRIVILEGE TO mandheer; 
GRANT UNLIMITED TABLESPACE TO mandheer;
GRANT CREATE TABLE TO mandheer;
GRANT create view to mandheer;
grant create any trigger to mandheer;
grant create any procedure to mandheer;
grant create sequence to mandheer;
grant create synonym to mandheer;
GRANT SELECT, INSERT, UPDATE, DELETE ON mandheer.suppliers TO mandheer;


SELECT * FROM dba_users
/

CREATE TABLE mandheer.products
        ( product_id number(10) not null,
          product_name varchar2(50) not null,
          category varchar2(50),
          CONSTRAINT products_pk PRIMARY KEY (product_id)
         )

select * from mandheer;

create schema AUTHORIZATION mandheer
create table temp( id number(2));

select * from Mandheer.products;

