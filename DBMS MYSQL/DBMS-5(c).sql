DECLARE

        area1 NUMBER(6,2);
        area2 NUMBER(6,2);

        radius1 NUMBER(1):=1;
        radius2 NUMBER(1):=9;
        pi CONSTANT NUMBER(3,2):=3.14;

BEGIN
    WHILE radius1 <= radius2
    LOOP
        area1:=pi * radius1 * radius1;
        dbms_output.Put_line('Area of Circle 1st is :='|| area1);
        radius1:=radius1+1;
    END LOOP;
    area2:= pi*radius2 * radius2;
    dbms_output.Put_line('Area of 2nd Circle is :=' || area2);
END;