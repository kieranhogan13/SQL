/*Student No: C12561353
Name: Kieran Hogan
Case Study: Edmunds Electrics
File: DB SQL*/

/*This file contains all the clearing, creation, and population sql. It creates the database
with primary keys, populates, and then adds foreign keys at the end. It commits appropriately
after changes are made*/

/*Clearing down the database*/

DROP TABLE repair_on_site; /*Deletes the table for repair_on_site*/
DROP TABLE repair_off_site; /*Deletes the table for repair_off_site*/
DROP TABLE fault; /*Deletes the table for Fault*/
DROP TABLE customer; /*Deletes the table for Customer*/
DROP TABLE sale; /*Deletes the table for Sale*/
DROP TABLE appliance; /*Deletes the table for Appliance*/
DROP TABLE new_stock; /*Deletes the table for New_stock*/
DROP TABLE manufacturer; /*Deletes the table for Manufacturer*/
DROP TABLE service_center; /*Deletes the table for Service_center*/

/*Creating the tables for the database (minus the foreign keys, see second file)*/

CREATE TABLE appliance
  (/*Creates the table for Appliance*/
     serial_number   VARCHAR2(18) NOT NULL,
     /*This defines serial_number to length 18 and type to char, value set to not null as its a primary key*/
     brand_name      VARCHAR2(20) NULL,
     /*This defines brand_name to length 20, type to varchar2, and value to null*/
     manufacturer_id VARCHAR2(20) NULL,
     /*This defines manufacturer_id to length 20, type to varchar2, and value to null*/
     gurantee_length INTEGER NULL,
     /*This defines gurantee_length type to integer, and value to null*/
     price           INTEGER NULL,
     /*This defines Price type to type integer, and value to null*/
     delivery_id     VARCHAR2(20) NULL,
     /*This defines delivery_id to length 20, type to varchar2, and value to null*/
     CONSTRAINT xpkappliance PRIMARY KEY (serial_number)
  /*Specifys that primary key is serial_number*/
  );

CREATE TABLE customer
  (/*Creates the table for Customer*/
     customer_id      VARCHAR2(20) NOT NULL,
     /*This defines customer_id to length 20 and type to varchar2, value set to not null as its a primary key*/
     customer_name    VARCHAR2(20) NULL,
     /*This defines customer_name to length 20, type to varchar2, and value to null*/
     customer_address VARCHAR2(40) NULL,
     /*This defines customer_address to length 40, type to varchar2, and value to null*/
     customer_number  INTEGER NULL,
     /*This defines customer_number type to integer, and value to null*/
     sale_id          VARCHAR2(20) NULL,
     /*This defines sale_id to length 20, type to varchar2, and value to null*/
     CONSTRAINT xpkcustomer PRIMARY KEY (customer_id)
  /*Specifys that primary key is customer_id*/
  );

CREATE TABLE fault
  (/*Creates the table for Fault*/
     fault_id                   VARCHAR2(20) NOT NULL,
     /*This defines fault_id to length 20 and type to varchar2, value set to not null as its a primary key*/
     customer_fault_description VARCHAR2(50) NULL,
     /*This defines customer_fault_description to length 50, type to varchar2, and value to null*/
     staff_fault_description    VARCHAR2(50) NULL,
     /*This defines staff_fault_description to length 50, type to varchar2, and value to null*/
     serial_number              VARCHAR2(18) NULL,
     /*This defines appliance_id to length 20, type to varchar2, and value to null*/
     purchase_date              DATE NULL,
     /*This defines purchase_date type to date, and value to null*/
     submitted_repair_date      DATE NULL,
     /*This defines submitted_repair_date type to date, and value to null*/
     sale_id                    VARCHAR2(20) NULL,
     /*This defines sale_id to length 20, type to varchar2, and value to null*/
     manufacturer_id            VARCHAR2(20) NULL,
     /*This defines manufacturer_id to length 20, type to varchar2, and value to null*/
     customer_id                VARCHAR2(20) NULL,
     /*This defines customer_id to length 20, type to varchar2, and value to null*/
     CONSTRAINT xpkfault PRIMARY KEY (fault_id)
  /*Specifys that primary key is fault_id*/
  );

CREATE TABLE repair_on_site
  (/*Creates the table for repair_on_site*/
     repair_id       VARCHAR2(20) NOT NULL,
     /*This defines repair_id to length 20 and type to varchar2, value set to not null as its a primary key*/
     fault_id        VARCHAR2(20) NULL,
     /*This defines fault_id to length 20, type to varchar2, and value to null*/
     repair_date     DATE NULL,
     /*This defines repair_date type to date, and value to null*/
     repair_duration INTEGER NULL,
     /*This defines repair_duration type to integer, and value to null*/
     part_replaced   VARCHAR2(20) NULL,
     /*This defines part_replaced to length 20, type to varchar2, and value to null*/
     CONSTRAINT xpkrepair_on_site PRIMARY KEY (repair_id)
  /*Specifys that primary key is repair_id*/
  );

CREATE TABLE manufacturer
  (/*Creates the table for Manufacturer*/
     manufacturer_id   VARCHAR2(20) NOT NULL,
     /*This defines manufacturer_id to length 20 and type to varchar2, value set to not null as its a primary key*/
     manufacturer_name VARCHAR2(20) NULL,
     /*This defines manufacturer_name to length 20, type to varchar2, and value to null*/
     service_center_id VARCHAR2(20) NULL,
     /*This defines service_center_id to length 20, type to varchar2, and value to null*/
     CONSTRAINT xpkmanufacturer PRIMARY KEY (manufacturer_id)
  /*Specifys that primary key is manufacturer_id*/
  );

CREATE TABLE new_stock
  (/*Creates the table for New_stock*/
     delivery_id     VARCHAR2(20) NOT NULL,
     /*This defines delivery_id to length 20 and type to varchar2, value set to not null as its a primary key*/
     manufacturer_id VARCHAR2(20) NULL,
     /*This defines manufacturer_id to length 20, type to varchar2, and value to null*/
     serial_number   VARCHAR2(20) NULL,
     /*This defines serial_number to length 20, type to varchar2, and value to null*/
     CONSTRAINT xpknew_stock PRIMARY KEY (delivery_id)
  /*Specifys that primary key is delivery_id*/
  );

CREATE TABLE sale
  (/*Creates the table for Sale*/
     sale_id       VARCHAR2(20) NOT NULL,
     /*This defines sale_id to length 20 and type to varchar2, value set to not null as its a primary key*/
     serial_number VARCHAR2(18) NULL,
     /*This defines serial_number to length 18, type to char, and value to null*/
     customer_id   VARCHAR2(20) NULL,
     /*This defines customer_id to length 20, type to varchar2, and value to null*/
     purchase_date DATE NULL,
     /*This defines purchase_date type to date, and value to null*/
     CONSTRAINT xpksale PRIMARY KEY (sale_id)
  /*Specifys that primary key is sale_id*/
  );

CREATE TABLE service_center
  (/*Creates the table for Service_center*/
     service_center_id      VARCHAR2(20) NOT NULL,
     /*This defines service_center_id to length 20 and type to varchar2, value set to not null as its a primary key*/
     service_center_name    VARCHAR2(20) NULL,
     /*This defines service_center_name to length 20, type to varchar2, and value to null*/
     service_center_address VARCHAR2(40) NULL,
     /*This defines service_center_address to length 40, type to varchar2, and value to null*/
     CONSTRAINT xpkservice_center PRIMARY KEY (service_center_id)
  /*Specifys that primary key is service_center_id*/
  );

CREATE TABLE repair_off_site
  (/*Creates the table for repair_off_site*/
     repair_id         VARCHAR2(20) NOT NULL,
     /*This defines repair_id to length 20 and type to varchar2, value set to not null as its a primary key*/
     fault_id          VARCHAR2(20) NULL,
     /*This defines fault_id to length 20, type to varchar2, and value to null*/
     date_returned     DATE NULL,
     /*This defines date_returned type to date, and value to null*/
     part_replaced     VARCHAR2(20) NULL,
     /*This defines part_replaced to length 20, type to varchar2, and value to null*/
     service_center_id VARCHAR2(20) NULL,
     /*This defines service_center_id to length 20, type to varchar2, and value to null*/
     CONSTRAINT xpkrepair_off_site PRIMARY KEY (repair_id)
  /*Specifys that primary key is repair_id*/
  );
  
  COMMIT; /*Commits the table creation to the database*/

/*Populating the newly created tables*/
/*These insert statements are inputting data into the appliance table*/
/*Each of these adheres to the limitations/requirements set in the creation sql*/
INSERT INTO appliance
VALUES     ('a10001', 	/*serial_number*/
            'argo',		/*brand_name*/
            'm101',		/*manufacture_id*/
            1,			/*gurantee_length*/
            50,			/*price*/
            'a625');	/*delivery_id*/

INSERT INTO appliance
VALUES     ('a10002',
            'bosh',
            'm102',
            1,
            55,
            'c435');

INSERT INTO appliance
VALUES     ('a10003',
            'electric',
            'm103',
            3,
            90,
            'e379');

INSERT INTO appliance
VALUES     ('a10004',
            'aon',
            'm104',
            2,
            100,
            'f992');

INSERT INTO appliance
VALUES     ('a10005',
            'cook',
            'm105',
            2,
            250,
            'g002');

INSERT INTO appliance
VALUES     ('a10006',
            'heat',
            'm106',
            1,
            60,
            'x573');

INSERT INTO appliance
VALUES     ('a10007',
            'machines',
            'm107',
            3,
            200,
            'a772');

INSERT INTO appliance
VALUES     ('a10008',
            'electromachines',
            'm108',
            1,
            250,
            'b154');

INSERT INTO appliance
VALUES     ('a10009',
            'electro',
            'm109',
            1,
            150,
            'n345');

/*These insert statements are inputting data into the customer table*/
/*Each of these adheres to the limitations/requirements set in the creation sql*/
INSERT INTO customer
VALUES     ('01', 				/*customer_id*/
            'Darren Carey',		/*customer_name*/
            'Geesala',			/*customer_address*/
            '0868641356',		/*customer_number*/
            's001');			/*sale_id*/

INSERT INTO customer
VALUES     ('02',
            'John Ryan',
            'Roscrea',
            '083765978',
            's002');

INSERT INTO customer
VALUES     ('03',
            'Marcus Daly',
            'Navan',
            '0856741234',
            's003');

INSERT INTO customer
VALUES     ('04',
            'Kieran Hogan',
            'Belfast',
            '0856741234',
            's004');

INSERT INTO customer
VALUES     ('05',
            'Joseph Murphy',
            'Dublin',
            '089546901',
            's005');

INSERT INTO customer
VALUES     ('06',
            'Quat Bektayev',
            'Belmullet',
            '0875642351',
            's006');

INSERT INTO customer
VALUES     ('07',
            'Bob Hanley',
            'Ennis',
            '0876543522',
            's007');

INSERT INTO customer
VALUES     ('08',
            'kevin Ruddy',
            'Cork',
            '0975624647',
            's008');

INSERT INTO customer
VALUES     ('09',
            'Joe Barrett',
            'Letterkenny',
            '0833467521',
            's009');

INSERT INTO customer
VALUES     ('10',
            'Ashley Naylor',
            'Ballina',
            '0864563547',
            's010');

/*These insert statements are inputting data into the repair_off_site table*/
/*Each of these adheres to the limitations/requirements set in the creation sql*/
INSERT INTO repair_off_site
VALUES     ('r12004',			/*repair_id*/
            'f111',				/*fault_id*/
            '11-FEB-13',		/*date_returned*/
            'oven door',		/*part_replaced*/
            '100003');			/*service_center_id*/

INSERT INTO repair_off_site
VALUES     ('r12005',
            'f222',
            '21-FEB-13',
            'oven clock',
            '100002');

INSERT INTO repair_off_site
VALUES     ('r12006',
            'f333',
            '12-JUN-13',
            'fridge timer',
            '100001');

INSERT INTO repair_off_site
VALUES     ('r12007',
            'f444',
            '01-SEP-13',
            'wash clock',
            '100002');

/*These insert statements are inputting data into the repair_on_site table*/
/*Each of these adheres to the limitations/requirements set in the creation sql*/
INSERT INTO repair_on_site
VALUES     ('r11056',			/*repair_id*/
            'f111',				/*fault_id*/
            '13-JAN-13',		/*repair_date*/
            2,					/*repair_duration*/
            'microwave door');	/*part_replaced*/

INSERT INTO repair_on_site
VALUES     ('r11057',
            'f222',
            '17-MAR-13',
            2,
            'microwave clock');

INSERT INTO repair_on_site
VALUES     ('r11058',
            'f333',
            '23-JUL-13',
            2,
            'kettle heater');

INSERT INTO repair_on_site
VALUES     ('r11059',
            'f333',
            '13-NOV-13',
            2,
            'toaster clock');

/*These insert statements are inputting data into the sale table*/
/*Each of these adheres to the limitations/requirements set in the creation sql*/
INSERT INTO sale
VALUES     ('s001',			/*sale_id*/
            'a10003',		/*serial_number*/
            '01',			/*customer_id*/
            '03-JAN-13');	/*purchase_date*/

INSERT INTO sale
VALUES     ('s002',
            'a10007',
            '02',
            '12-JAN-13');

INSERT INTO sale
VALUES     ('s003',
            'a10004',
            '03',
            '23-JAN-13');

INSERT INTO sale
VALUES     ('s004',
            'a10009',
            '04',
            '28-MAR-13');

INSERT INTO sale
VALUES     ('s005',
            'a10006',
            '05',
            '04-JUL-13');

INSERT INTO sale
VALUES     ('s006',
            'a10005',
            '06',
            '06-SEP-13');

INSERT INTO sale
VALUES     ('s007',
            'a10004',
            '07',
            '11-NOV-13');

INSERT INTO sale
VALUES     ('s008',
            'a10002',
            '08',
            '13-DEC-13');

INSERT INTO sale
VALUES     ('s009',
            'a10003',
            '09',
            '17-DEC-13');

INSERT INTO sale
VALUES     ('s010',
            'a10006',
            '10',
            '21-DEC-13');

/*These insert statements are inputting data into the fault table*/
/*Each of these adheres to the limitations/requirements set in the creation sql*/
INSERT INTO fault
VALUES     ('f111',								/*fault_id*/
            'oven door not shutting properly',	/*customer_fault_description*/
            'broken oven door',					/*staff_fault_description*/
            'a10001',							/*serial_number*/
            '03-JAN-13',						/*purchase_date*/
            '10-JAN-13',						/*submitted_repair_date*/
            's001',								/*sale_id*/
            'm101',								/*manufacturer_id*/
            '01');								/*customer_id*/

INSERT INTO fault
VALUES     ('f222',
            'oven clock not working properly',
            'broken oven clock',
            'a10006',
            '12-JAN-13',
            '19-JAN-13',
            's003',
            'm102',
            '02');

INSERT INTO fault
VALUES     ('f333',
            'micowave door not shutting properly',
            'broken microwave door',
            'a10003',
            '23-JAN-13',
            '22-FEB-13',
            's003',
            'm103',
            '03');

INSERT INTO fault
VALUES     ('f444',
            'microwave clock not shutting properly',
            'broken microwave timer',
            'a10002',
            '28-MAR-13',
            '29-MAR-13',
            's004',
            'm104',
            '04');

INSERT INTO fault
VALUES     ('f555',
            'kettle not heating water',
            'broken kettle heater',
            'a10004',
            '04-JUL-13',
            '10-JUL-13',
            's005',
            'm105',
            '05');

INSERT INTO fault
VALUES     ('f666',
            'toaster not functioning properly',
            'broken toaster timer',
            'a10005',
            '06-SEP-13',
            '17-SEP-13',
            's006',
            'm106',
            '06');

/*These insert statements are inputting data into the service_center table*/
/*Each of these adheres to the limitations/requirements set in the creation sql*/
INSERT INTO service_center
VALUES     ('100003',			/*service_center_id*/
            'JR repairs',		/*service_center_name*/
            'China');			/*service_center_address*/

INSERT INTO service_center
VALUES     ('100002',
            'the fixit centre',
            'Wicklow');

INSERT INTO service_center
VALUES     ('100001',
            'careys fix centre',
            'Dublin');

/*These insert statements are inputting data into the new_stock table*/
/*Each of these adheres to the limitations/requirements set in the creation sql*/
INSERT INTO new_stock
VALUES     ('a625',				/*delivery_id*/
            'm102',				/*manufacturer_id*/
            'a10001');			/*serial_number*/

INSERT INTO new_stock
VALUES     ('c435',
            'm105',
            'a10002');

INSERT INTO new_stock
VALUES     ('e379',
            'm107',
            'a10003');

INSERT INTO new_stock
VALUES     ('f992',
            'm101',
            'a10004');

INSERT INTO new_stock
VALUES     ('g002',
            'm106',
            'a10005');

INSERT INTO new_stock
VALUES     ('x573',
            'm104',
            'a10006');

INSERT INTO new_stock
VALUES     ('a772',
            'm103',
            'a10007');

INSERT INTO new_stock
VALUES     ('b154',
            'm101',
            'a10008');

INSERT INTO new_stock
VALUES     ('n345',
            'm104',
            'a10009');

INSERT INTO new_stock
VALUES     ('u773',
            'm106',
            'a10001');

/*These insert statements are inputting data into the manufacturer table*/
/*Each of these adheres to the limitations/requirements set in the creation sql*/
INSERT INTO manufacturer
VALUES     ('m101',					/*manufacturer_id*/
            'Longfort electric',	/*manufacturer_name*/
            '100001');				/*service_center_id*/

INSERT INTO manufacturer
VALUES     ('m102',
            'westing electrical',
            '100002');

INSERT INTO manufacturer
VALUES     ('m103',
            'Dublin electric ',
            '100003');

INSERT INTO manufacturer
VALUES     ('m104',
            'Ohara electric ',
            '100003');

INSERT INTO manufacturer
VALUES     ('m105',
            'Occoner electric',
            '100001');

INSERT INTO manufacturer
VALUES     ('m106',
            'Dell electric ',
            '100003');

INSERT INTO manufacturer
VALUES     ('m107',
            'Apple electric ',
            '100003');

INSERT INTO manufacturer
VALUES     ('m108',
            'Sony electric ',
            '100002');

INSERT INTO manufacturer
VALUES     ('m109',
            'IBM electric ',
            '100001');

			
COMMIT;	/*Commits the table population to the database*/	


/*Foreign Key Alteration/Additions*/
/*Creates the foreign key link of manufacturer_id in the Appliance table, to manufacturer_id in the Manufacturer table*/
ALTER TABLE appliance
  ADD (CONSTRAINT xif1appliance FOREIGN KEY (manufacturer_id) REFERENCES
  manufacturer (manufacturer_id));

/*Creates the foreign key link of delivery_id in the Appliance table, to delivery_id in the New_stock table*/
ALTER TABLE appliance
  ADD (CONSTRAINT xif2appliance FOREIGN KEY (delivery_id) REFERENCES new_stock (
  delivery_id));

/*Creates the foreign key link of sale_id in the Customer table, to sale_id in the Sale table*/
ALTER TABLE customer
  ADD (CONSTRAINT xif1customer FOREIGN KEY (sale_id) REFERENCES sale (sale_id));

/*Creates the foreign key link of sale_id in the Fault table, to sale_id in the Sale table*/
ALTER TABLE fault
  ADD (CONSTRAINT xif1fault FOREIGN KEY (sale_id) REFERENCES sale (sale_id));

/*Creates the foreign key link of manufacturer_id in the Fault table, to manufacturer_id in the Manufacturer table*/
ALTER TABLE fault
  ADD (CONSTRAINT xif2fault FOREIGN KEY (manufacturer_id) REFERENCES
  manufacturer (manufacturer_id));

/*Creates the foreign key link of customer_id in the Fault table, to customer_id in the Customer table*/
ALTER TABLE fault
  ADD (CONSTRAINT xif3fault FOREIGN KEY (customer_id) REFERENCES customer (
  customer_id));

/*Creates the foreign key link of fault_id in the repair_on_site table, to fault_id in the Fault table*/
ALTER TABLE repair_on_site
  ADD (CONSTRAINT xif1repair_on_site FOREIGN KEY (fault_id) REFERENCES fault (
  fault_id));

/*Creates the foreign key link of service_center_id in the Manufacturer table, to service_center_id in the Service_center table*/
ALTER TABLE manufacturer
  ADD (CONSTRAINT xif1manufacturer FOREIGN KEY (service_center_id) REFERENCES
  service_center (service_center_id));

/*Creates the foreign key link of manufacturer_id in the New_stock table, to manufacturer_id in the Manufacturer table*/
ALTER TABLE new_stock
  ADD (CONSTRAINT xif1new_stock FOREIGN KEY (manufacturer_id) REFERENCES
  manufacturer (manufacturer_id));

/*Creates the foreign key link of serial_number in the Sale table, to serial_number in the Appliance table*/
ALTER TABLE sale
  ADD (CONSTRAINT xif1sale FOREIGN KEY (serial_number) REFERENCES appliance (
  serial_number));

/*Creates the foreign key link of fault_id in the repair_off_site table, to fault_id in the Fault table*/
ALTER TABLE repair_off_site
  ADD (CONSTRAINT xif1repair_off_site FOREIGN KEY (fault_id) REFERENCES fault (
  fault_id));

/*Creates the foreign key link of service_center_id in the repair_off_site table, to service_center_id in the Service_center table*/
ALTER TABLE repair_off_site
  ADD (CONSTRAINT xif2repair_off_site FOREIGN KEY (service_center_id) REFERENCES
  service_center (service_center_id));
  
  
COMMIT; /*Commits the alter table changes to the database*/

/*Simple queries to show all the tables populated after creation*/
SELECT *
FROM   appliance;

SELECT *
FROM   customer;

SELECT *
FROM   fault;

SELECT *
FROM   manufacturer;

SELECT *
FROM   new_stock;

SELECT *
FROM   repair_on_site;

SELECT *
FROM   repair_off_site;

SELECT *
FROM   sale;

SELECT *
FROM   service_center; 