apex -> sql workshop -> sql commands -> language->pl/sql

# simple block
Working :
BEGIN
   HTP.P('Hello World');
END;

# function
CREATE OR REPLACE FUNCTION hello_world
RETURN VARCHAR2
IS
BEGIN
   RETURN 'Hello World';
END;
/

# calling function
1) select hello_world() from dual;

2) 
declare 
    message  varchar;
begin
    message:= hello_world();
    DBMS_OUTPUT.PUT_LINE('message : ' || message);
end;
/
# DBMS_OUTPUT.PUT_LINE is used for debugging or console output.
# HTP.P is used to send output to a web page.