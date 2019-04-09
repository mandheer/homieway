
Procedure WELCOME_MSG compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
4/25      PLS-00103: Encountered the symbol "‘" when expecting one of the following:     ( ) - + case mod new not null <an identifier>    <a double-quoted delimited-identifier> <a bind variable>    table continue avg count current exists max min prior sql    stddev sum variance execute multiset the both leading    trailing forall merge year month day hour minute second    timezone_hour timezone_minute timezone_region timezone_abbr    time timestamp interval date    <a string literal with character set specificatio
Errors: check compiler log

Procedure WELCOME_MSG compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
7/1       PLS-00103: Encountered the symbol "EXEC" 
7/28      PLS-00103: Encountered the symbol "end-of-file" when expecting one of the following:     begin function pragma procedure subtype type <an identifier>    <a double-quoted delimited-identifier> current cursor delete    exists prior 
Errors: check compiler log

Procedure WELCOME_MSG compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
7/1       PLS-00103: Encountered the symbol "EXEC" 
7/28      PLS-00103: Encountered the symbol "end-of-file" when expecting one of the following:     begin function pragma procedure subtype type <an identifier>    <a double-quoted delimited-identifier> current cursor delete    exists prior 
Errors: check compiler log

Procedure WELCOME_MSG compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
6/1       PLS-00103: Encountered the symbol "END" when expecting one of the following:     pragma when 
Errors: check compiler log

Procedure REMOVE_EMP compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
4/7       PL/SQL: SQL Statement ignored
4/19      PL/SQL: ORA-00942: table or view does not exist
Errors: check compiler log

Procedure WELCOME_MSG compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
6/1       PLS-00103: Encountered the symbol "END" when expecting one of the following:     pragma when 
Errors: check compiler log

Error starting at line : 10 in command -
CREATE PROCEDURE remove_emp (employee_id NUMBER) AS
   tot_emps NUMBER;
   BEGIN
      DELETE FROM emp
      WHERE emp.empid = remove_emp.employee_id;
   tot_emps := tot_emps - 1;
   END;
Error report -
ORA-00955: name is already used by an existing object
00955. 00000 -  "name is already used by an existing object"
*Cause:    
*Action:

Procedure WELCOME_MSG compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
6/1       PLS-00103: Encountered the symbol "END" when expecting one of the following:     pragma when 
Errors: check compiler log

Procedure REMOVE_EMP compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
4/7       PL/SQL: SQL Statement ignored
5/13      PL/SQL: ORA-00904: "EMP"."EMPID": invalid identifier
5/17      PLS-00302: component 'EMPID' must be declared
Errors: check compiler log

Procedure REMOVE_EMP compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
7/6       PLS-00103: Encountered the symbol "end-of-file" when expecting one of the following:     ; <an identifier> <a double-quoted delimited-identifier>    current delete exists prior <a single-quoted SQL string> The symbol ";" was substituted for "end-of-file" to continue. 
Errors: check compiler log

Procedure REMOVE_EMP compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
4/7       PL/SQL: SQL Statement ignored
5/13      PL/SQL: ORA-00904: "EMP"."EMPID": invalid identifier
5/17      PLS-00302: component 'EMPID' must be declared
Errors: check compiler log

Procedure REMOVE_EMP compiled


Procedure REMOVE_EMP dropped.


Procedure REMOVE_EMP compiled


Function WELCOME_MSGJUNE compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
4/11      PLS-00103: Encountered the symbol "‘" when expecting one of the following:     ( - + case mod new not null <an identifier>    <a double-quoted delimited-identifier> <a bind variable>    continue avg count current exists max min prior sql stddev    sum variance execute forall merge time timestamp interval    date <a string literal with character set specification>    <a number> <a single-quoted SQL string> pipe    <an alternatively-quoted string literal with character set specification>    <an alternative
Errors: check compiler log

Function WELCOME_MSGJUNE compiled

LINE/COL  ERROR
--------- -------------------------------------------------------------
0/0       PL/SQL: Compilation unit analysis terminated
1/55      PLS-00201: identifier 'VAR.CHAR2' must be declared
Errors: check compiler log

Function WELCOME_MSGJUNE compiled


Error starting at line : 27 in command -
DECLARE
lv_msg VARCHAR2(250);
BEGIN
lv_msg := welcome_msg_func ('Guru99');
dbms_output.put_line(lv_msg);
END;
SELECT welcome_msg_func('Guru99') FROM DUAL;
Error report -
ORA-06550: line 4, column 11:
PLS-00201: identifier 'WELCOME_MSG_FUNC' must be declared
ORA-06550: line 4, column 1:
PL/SQL: Statement ignored
ORA-06550: line 7, column 8:
PL/SQL: ORA-00904: "WELCOME_MSG_FUNC": invalid identifier
ORA-06550: line 7, column 1:
PL/SQL: SQL Statement ignored
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:

Function WELCOME_MSG_FUNC compiled


PL/SQL procedure successfully completed.


Error starting at line : 27 in command -
DECLARE
lv_msg VARCHAR2(250);
BEGIN
lv_msg := welcome_msg_func ('Guru99');
dbms_
Error report -
ORA-06550: line 5, column 5:
PLS-00103: Encountered the symbol "end-of-file" when expecting one of the following:

   := . ( @ % ;
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:

PL/SQL procedure successfully completed.

