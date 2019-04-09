-- creating a procedure
CREATE OR REPLACE PROCEDURE welcome_msg (p_name IN VARCHAR2) 
IS
BEGIN
    dbms_output.put_line ('Welcome'|| p_name);

END;
/
EXEC welcome_msg ('Guru99');
drop procedure welcome_msg;

---- creating a procedure
CREATE OR REPLACE PROCEDURE remove_emp (employee_id NUMBER) AS
   tot_emps NUMBER;
   BEGIN
      DELETE FROM emp
      WHERE emp.empno = remove_emp.employee_id;
   tot_emps := tot_emps - 1;
   END;
/
DROP PROCEDURE remove_emp;

----------- crating functions
-- only no DML functions can be called from select block,
-- rest functions can only be called from procedures
CREATE OR REPLACE FUNCTION welcome_msg_func ( p_name IN VARCHAR2) RETURN VARCHAR2
IS
BEGIN
RETURN ('Welcome '|| p_name);
END;
/

SELECT welcome_msg_func('Mandheer') "welcome" FROM DUAL;
drop function welcome_msg_func;