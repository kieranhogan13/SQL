Create TAble Airport_merged(
  airport_id int not null primary key,
  airport_name varchar(100) not null,
  country_code varchar(10) not null,
  altitude int
);

DROP PROCEDURE mergeTables;

CREATE OR REPLACE PROCEDURE mergeTables
IS

airport_id int;
airport_name varchar(100);
airport_country varchar(100);
airport_altitude int;
active varchar(1);
a_id int;
a_name varchar(100);
a_country_code varchar(5);
a_altitude int;

CURSOR cursor1 IS
  SELECT airport_id, airport_name, country_code, airport_altitude
  FROM airport1 INNER JOIN country_code ON airport1.airport_country = country_code.country_name
  AND airport1.active = 'Y';
CURSOR cursor2 IS
  SELECT a_id, a_name, a_country_code, a_altitude
  FROM airport2;
  
BEGIN
  OPEN cursor1;
  OPEN cursor2;
  dbms_output.put_line('Hello World!');
  CLOSE cursor1;
  CLOSE cursor2;
END;