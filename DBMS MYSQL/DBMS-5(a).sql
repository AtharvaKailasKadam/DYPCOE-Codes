DECLARE

        area1 NUMBER(6,2);
        area2 NUMBER(6,2);
        area3 NUMBER(6,2);
        area4 NUMBER(6,2);
        area5 NUMBER(6,2);

        radius1 NUMBER(1):=5;
        radius2 NUMBER(1):=6;
        radius3 NUMBER(1):=7;
        radius4 NUMBER(1):=8;
        radius5 NUMBER(1):=9;

        pi CONSTANT NUMBER(3,2):=3.14;

BEGIN

        area1:=pi * radius1 * radius1;
        area2:=pi * radius2 * radius2;
        area3:=pi * radius3 * radius3;
        area4:=pi * radius4 * radius4;
        area5:=pi * radius5 * radius5;

        dbms_output.Put_line('Area of 1st Circle is :='|| area1);
        dbms_output.Put_line('Area of 2nd Circle is :='|| area2);
        dbms_output.Put_line('Area of 3rd Circle is :='|| area3);
        dbms_output.Put_line('Area of 4th Circle is :='|| area4);
        dbms_output.Put_line('Area of 5th Circle is :='|| area5);


END;