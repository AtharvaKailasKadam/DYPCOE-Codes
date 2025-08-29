DELIMITER $$

CREATE  PROCEDURE area_of_circless()
BEGIN
    DECLARE radius1 DECIMAL(5,2) DEFAULT 5;
    DECLARE radius2 DECIMAL(5,2) DEFAULT 9;
    DECLARE pi DECIMAL(5,2) DEFAULT 3.14;
    DECLARE area DECIMAL(10,2);


    SET radius1 = 5;
    SET radius2 = 9;

    WHILE radius1 <= radius2 DO
        SET area = pi * radius1 * radius1;
        INSERT INTO circlearea VALUES (radius1, area);
        SET radius1 = radius1 + 1;
    END WHILE;
END$$

DELIMITER ;

CALL area_of_circless();
SELECT * FROM circlearea;
DELETE FROM circlearea;