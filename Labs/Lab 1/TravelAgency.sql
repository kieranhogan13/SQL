
DROP TABLE Purchase CASCADE CONSTRAINTS PURGE;

DROP TABLE Customer CASCADE CONSTRAINTS PURGE;

DROP TABLE Flight_Package CASCADE CONSTRAINTS PURGE;

DROP TABLE Flight CASCADE CONSTRAINTS PURGE;

DROP TABLE Hotel_Package CASCADE CONSTRAINTS PURGE;

DROP TABLE Hotel CASCADE CONSTRAINTS PURGE;

DROP TABLE Holiday CASCADE CONSTRAINTS PURGE;

CREATE TABLE Holiday
(
	package_id           INTEGER NOT NULL ,
	holiday_price        NUMBER(5,2) NOT NULL ,
	start_date_hol       CHAR(18) NULL ,
	end_date_hol         CHAR(18) NULL ,
CONSTRAINT  XPKHoliday PRIMARY KEY (package_id)
);

CREATE TABLE Hotel
(
	hotel_id             INTEGER NOT NULL ,
	hotel_name           VARCHAR2(20) NOT NULL ,
	hotel_location       VARCHAR2(20) NULL ,
	star_rating          INTEGER NULL ,
	per_night_price      NUMBER(4,2) NULL ,
CONSTRAINT  XPKHotel PRIMARY KEY (hotel_id)
CONSTRAINT  star_rating_check CHECK (star_rating>0 AND star_rating<6)

);

CREATE TABLE Hotel_Package
(
	package_id           INTEGER NOT NULL ,
	hotel_id             INTEGER NOT NULL ,
	nights_stay          INTEGER NULL ,
	total_price          NUMBER(5,2) NULL ,
CONSTRAINT  XPKHotel_Package PRIMARY KEY (package_id,hotel_id),
CONSTRAINT R_6 FOREIGN KEY (package_id) REFERENCES Holiday (package_id),
CONSTRAINT R_14 FOREIGN KEY (hotel_id) REFERENCES Hotel (hotel_id),
CONSTRAINT  total_price_check CHECK (total_price>0 AND total_price<100,000)
);

CREATE TABLE Flight
(
	flight_id            INTEGER NOT NULL ,
	airline_name         VARCHAR2(20) NULL ,
	departure_from       VARCHAR2(20) NULL ,
	flight_destination   VARCHAR2(20) NULL ,
	departure_time       DATE NULL ,
	arrival_time         DATE NULL ,
	flight_price         NUMBER(5,2) NULL ,
CONSTRAINT  XPKFlight PRIMARY KEY (flight_id)
);

CREATE TABLE Flight_Package
(
	package_id           INTEGER NOT NULL ,
	flight_id            INTEGER NOT NULL ,
CONSTRAINT  XPKFlight_Package PRIMARY KEY (package_id,flight_id),
CONSTRAINT R_8 FOREIGN KEY (package_id) REFERENCES Holiday (package_id),
CONSTRAINT R_13 FOREIGN KEY (flight_id) REFERENCES Flight (flight_id)
);

CREATE TABLE Customer
(
	customer_id          INTEGER NOT NULL ,
	firstname            VARCHAR2(20) NULL ,
	surname              VARCHAR2(20) NULL ,
	address              VARCHAR2(20) NULL ,
	subscription_type    VARCHAR2(20) NULL ,
CONSTRAINT  XPKCustomer PRIMARY KEY (customer_id),
CONSTRAINT  customer_check CHECK (subscription_type='Y' OR subscription_type='N')
);

CREATE TABLE Purchase
(
	customer_id          INTEGER NOT NULL ,
	package_id           INTEGER NOT NULL ,
	purchase_date        DATE NULL ,
CONSTRAINT  XPKPurchase PRIMARY KEY (customer_id,package_id),
CONSTRAINT R_4 FOREIGN KEY (customer_id) REFERENCES Customer (customer_id),
CONSTRAINT R_16 FOREIGN KEY (package_id) REFERENCES Holiday (package_id)
);

SELECT hotel_id 
FROM Hotel
WHERE star_rating = '3'
INNER JOIN Customer
ON Customer.firstname="Bob" AND Customer.lastname="Doyle"


