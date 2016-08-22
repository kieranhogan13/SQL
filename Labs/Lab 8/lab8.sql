DROP TABLE Agenda CASCADE CONSTRAINTS PURGE;

DROP TABLE Visit CASCADE CONSTRAINTS PURGE;

DROP TABLE Sale CASCADE CONSTRAINTS PURGE;

DROP TABLE Rent CASCADE CONSTRAINTS PURGE;

DROP TABLE Estate CASCADE CONSTRAINTS PURGE;

DROP TABLE Owner CASCADE CONSTRAINTS PURGE;

DROP TABLE Customer CASCADE CONSTRAINTS PURGE;

DROP TABLE Agent CASCADE CONSTRAINTS PURGE;

CREATE TABLE Agent
(
	IDAgent              INTEGER NOT NULL ,
	Name                 VARCHAR2(30) NULL ,
	Surname              VARCHAR2(30) NULL ,
	Office               VARCHAR2(20) NULL ,
	Address              VARCHAR2(50) NULL ,
	City                 VARCHAR2(30) NULL ,
	Phone                INTEGER NULL ,
CONSTRAINT  XPKAgent PRIMARY KEY (IDAgent)
);

CREATE TABLE Customer
(
	IDCust               INTEGER NOT NULL ,
	Name                 VARCHAR2(20) NULL ,
	Surname              VARCHAR2(20) NULL ,
	Budget               INTEGER NULL ,
	Address              VARCHAR2(50) NULL ,
	City                 VARCHAR2(20) NULL ,
	Phone                INTEGER NULL ,
CONSTRAINT  XPKCustomer PRIMARY KEY (IDCust)
);

CREATE TABLE Owner
(
	Name                 VARCHAR2(20) NULL ,
	IDOwner              INTEGER NOT NULL ,
	Surname              VARCHAR2(20) NULL ,
	Address              VARCHAR2(50) NULL ,
	City                 VARCHAR2(20) NULL ,
	Phone                INTEGER NULL ,
CONSTRAINT  XPKOwner PRIMARY KEY (IDOwner)
);

CREATE TABLE Estate
(
	IDEstate             INTEGER NOT NULL ,
	Category             VARCHAR2(20) NULL ,
	Area                 VARCHAR2(20) NULL ,
	City                 VARCHAR2(20) NULL ,
	Province             VARCHAR2(20) NULL ,
	Rooms                INTEGER NULL ,
	Bedrooms             INTEGER NULL ,
	Garage               VARCHAR2(3) NULL ,
	Meters               INTEGER NULL ,
	IDOwner              INTEGER NULL ,
CONSTRAINT  XPKEstate PRIMARY KEY (IDEstate),
CONSTRAINT R_71 FOREIGN KEY (IDOwner) REFERENCES Owner (IDOwner)
);

CREATE TABLE Rent
(
	RentDate             DATE NULL ,
	RentPrice            NUMBER(6,2) NULL ,
	RentStatus           VARCHAR2(20) NULL ,
	RentTime             DATE NULL ,
	IDAgent              INTEGER NOT NULL ,
	IDCust               INTEGER NOT NULL ,
	IDEstate             INTEGER NOT NULL ,
CONSTRAINT  XPKRent PRIMARY KEY (IDAgent,IDCust,IDEstate),
CONSTRAINT R_56 FOREIGN KEY (IDAgent) REFERENCES Agent (IDAgent),
CONSTRAINT R_59 FOREIGN KEY (IDCust) REFERENCES Customer (IDCust),
CONSTRAINT R_11 FOREIGN KEY (IDEstate) REFERENCES Estate (IDEstate)
);

CREATE TABLE Sale
(
	SaleDate             DATE NULL ,
	AgreedSalePrice      NUMBER(6,2) NULL ,
	SaleStatus           VARCHAR2(20) NULL ,
	IDCust               INTEGER NOT NULL ,
	IDAgent              INTEGER NOT NULL ,
	IDEstate             INTEGER NOT NULL ,
CONSTRAINT  XPKSale PRIMARY KEY (IDAgent,IDCust,IDEstate),
CONSTRAINT R_55 FOREIGN KEY (IDCust) REFERENCES Customer (IDCust),
CONSTRAINT R_57 FOREIGN KEY (IDAgent) REFERENCES Agent (IDAgent),
CONSTRAINT R_14 FOREIGN KEY (IDEstate) REFERENCES Estate (IDEstate)
);

CREATE TABLE Visit
(
	VisitDate            DATE NULL ,
	VisitDuration        INTEGER NULL ,
	IDCust               INTEGER NOT NULL ,
	IDAgent              INTEGER NOT NULL ,
	IDEstate             INTEGER NOT NULL ,
CONSTRAINT  XPKVisit PRIMARY KEY (IDCust,IDAgent,IDEstate),
CONSTRAINT R_58 FOREIGN KEY (IDCust) REFERENCES Customer (IDCust),
CONSTRAINT R_62 FOREIGN KEY (IDAgent) REFERENCES Agent (IDAgent),
CONSTRAINT R_13 FOREIGN KEY (IDEstate) REFERENCES Estate (IDEstate)
);

CREATE TABLE Agenda
(
	ClientName           VARCHAR2(30) NULL ,
	AgendaDate           DATE NOT NULL ,
	AgendaHour           INTEGER NOT NULL ,
	IDAgent              INTEGER NOT NULL ,
	IDEstate             INTEGER NOT NULL ,
CONSTRAINT  XPKAgenda PRIMARY KEY (AgendaDate,AgendaHour,IDAgent,IDEstate),
CONSTRAINT R_69 FOREIGN KEY (IDAgent) REFERENCES Agent (IDAgent),
CONSTRAINT R_70 FOREIGN KEY (IDEstate) REFERENCES Estate (IDEstate)
);

insert into Agent values(1,'Bob', 'Jones', 'Matrix', 'Baggot St', 'Dublin 4', 0123456);
insert into Agent values(2,'Mary', 'Doyle', 'Big Office', 'Droimna', 'Dublin 8', 0136456);
insert into Agent values(3,'John', 'Wayne', 'CHQ', 'Quays', 'Dublin 2', 0167456);

insert into Customer values(1,'Austin', 'Jones', 5000, 'Baggot St', 'Dublin 4', 0123456);
insert into Customer values(2,'Sarah', 'Doyle', 8000, 'Droimna', 'Dublin 8', 0136456);
insert into Customer values(3,'Ciara', 'Wayne', 4000, 'Quays', 'Dublin 2', 0167456);

insert into Owner values(1,'Deborah', 'Hogan', 'Baggot St', 'Dublin 4', 011101);
insert into Owner values(2,'Max', 'Kavanagh', 'Droimna', 'Dublin 8', 0187878);
insert into Owner values(3,'Niall', 'Jones', 'Quays', 'Dublin 2', 0123236);

insert into Estate values(1,'detached', 'Baggot St', 'Dublin 4', 'Leinster', 8, 3, 'yes', 100, 1);
insert into Estate values(2,'semi-detached', 'Droimna', 'Dublin 8', 'Leinster', 5, 1, 'no', 150, 2);
insert into Estate values(3,'appartment', 'Quays', 'Dublin 2', 'Leinster', 4, 1, 'yes', 70, 3);

insert into Rent values('02-FEB-07', '5000', 'rented', '2 months', 1, 1, 1);
insert into Rent values('08-MAR-08', '6000', 'rented', '1 month', 2, 2, 2);
insert into Rent values('15-MAY-07', '4000', 'rented', '1 year', 3, 3, 3);

insert into Sale values('10-FEB-07', '15000', 'sold', 1, 1, 1);
insert into Sale values('10-FEB-07', '45000', 'agreed', 2, 2, 2);
insert into Sale values('10-FEB-07', '25000', 'not sold', 3, 3, 3);

insert into Visit values('10-FEB-06', '3', 1, 1, 1);
insert into Visit values('22-MAY-06', '6', 2, 2, 2);
insert into Visit values('18-OCT-06', '8', 3, 3, 3);

insert into Agenda values('Barry Dunne', '10-FEB-08', 3, 1, 1);
insert into Agenda values('John Doyle', '15-MAR-08', 6, 2, 2);
insert into Agenda values('Sharon Jones', '28-OCT-08', 1, 3, 3);



DROP TABLE ViewingTable CASCADE CONSTRAINTS PURGE;

DROP TABLE SalesTable CASCADE CONSTRAINTS PURGE;

DROP TABLE DimCustomer CASCADE CONSTRAINTS PURGE;

DROP TABLE Time CASCADE CONSTRAINTS PURGE;

DROP TABLE Owner CASCADE CONSTRAINTS PURGE;

DROP TABLE Estate CASCADE CONSTRAINTS PURGE;

DROP TABLE DimAgent CASCADE CONSTRAINTS PURGE;


-------------------------------------------------------------------------


DROP TABLE ViewingTable CASCADE CONSTRAINTS PURGE;

DROP TABLE SalesTable CASCADE CONSTRAINTS PURGE;

DROP TABLE Customer CASCADE CONSTRAINTS PURGE;

DROP TABLE Time CASCADE CONSTRAINTS PURGE;

DROP TABLE Owner CASCADE CONSTRAINTS PURGE;

DROP TABLE Estate CASCADE CONSTRAINTS PURGE;

DROP TABLE Agent CASCADE CONSTRAINTS PURGE;

CREATE TABLE Agent
(
	Name                 VARCHAR2(30) NULL ,
	Surname              VARCHAR2(30) NULL ,
	Office               VARCHAR2(20) NULL ,
	Address              VARCHAR2(50) NULL ,
	City                 VARCHAR2(30) NULL ,
	Phone                INTEGER NULL ,
	AgentID              INTEGER NOT NULL ,
CONSTRAINT  XPKAgent PRIMARY KEY (AgentID)
);

CREATE TABLE Estate
(
	Category             VARCHAR2(20) NULL ,
	Area                 VARCHAR2(20) NULL ,
	City                 VARCHAR2(20) NULL ,
	Province             VARCHAR2(20) NULL ,
	Rooms                INTEGER NULL ,
	Bedrooms             INTEGER NULL ,
	Garage               VARCHAR2(3) NULL ,
	Meters               INTEGER NULL ,
	EstateID             INTEGER NOT NULL ,
CONSTRAINT  XPKEstate PRIMARY KEY (EstateID)
);

CREATE TABLE Owner
(
	Name                 VARCHAR2(20) NULL ,
	Surname              VARCHAR2(20) NULL ,
	Address              VARCHAR2(50) NULL ,
	City                 VARCHAR2(20) NULL ,
	Phone                INTEGER NULL ,
	OwnerID              INTEGER NOT NULL ,
CONSTRAINT  XPKOwner PRIMARY KEY (OwnerID)
);

CREATE TABLE Time
(
	Day                  INTEGER NULL ,
	Month                INTEGER NULL ,
	Year                 INTEGER NULL ,
	TimeID               INTEGER NOT NULL ,
CONSTRAINT  XPKTime PRIMARY KEY (TimeID)
);

CREATE TABLE Customer
(
	Name                 VARCHAR2(20) NULL ,
	Surname              VARCHAR2(20) NULL ,
	Address              VARCHAR2(50) NULL ,
	City                 VARCHAR2(20) NULL ,
	Phone                INTEGER NULL ,
	Budget               INTEGER NULL ,
	CustomerID           INTEGER NOT NULL ,
CONSTRAINT  XPKCustomer PRIMARY KEY (CustomerID)
);

CREATE TABLE SalesTable
(
	AgreedSalePrice      NUMBER(8,2) NULL ,
	SaleStatus           VARCHAR2(20) NULL ,
	OfferPrice           NUMBER(8,2) NULL ,
	TimeID               INTEGER NOT NULL ,
	OwnerID              INTEGER NOT NULL ,
	AgentID              INTEGER NOT NULL ,
	EstateID             INTEGER NOT NULL ,
	CustomerID           INTEGER NOT NULL ,
CONSTRAINT  XPKSalesTable PRIMARY KEY (TimeID,OwnerID,AgentID,EstateID,CustomerID),
CONSTRAINT R_57 FOREIGN KEY (AgentID) REFERENCES Agent (AgentID),
CONSTRAINT R_14 FOREIGN KEY (EstateID) REFERENCES Estate (EstateID),
CONSTRAINT R_15 FOREIGN KEY (OwnerID) REFERENCES Owner (OwnerID),
CONSTRAINT R_16 FOREIGN KEY (TimeID) REFERENCES Time (TimeID),
CONSTRAINT R_20 FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

CREATE TABLE ViewingTable
(
	VisitDuration        INTEGER NULL ,
	CustomerID           INTEGER NOT NULL ,
	TimeID               INTEGER NOT NULL ,
	AgentID              INTEGER NOT NULL ,
	EstateID             INTEGER NOT NULL ,
CONSTRAINT  XPKViewingTable PRIMARY KEY (CustomerID,TimeID,AgentID,EstateID),
CONSTRAINT R_58 FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
CONSTRAINT R_22 FOREIGN KEY (TimeID) REFERENCES Time (TimeID),
CONSTRAINT R_23 FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
CONSTRAINT R_24 FOREIGN KEY (AgentID) REFERENCES Agent (AgentID),
CONSTRAINT R_25 FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
CONSTRAINT R_26 FOREIGN KEY (EstateID) REFERENCES Estate (EstateID)
);


insert into Agent values('Bob', 'Jones', 'Matrix', 'Baggot St', 'Dublin 4', 0123456, 1);
insert into Agent values('Mary', 'Doyle', 'Big Office', 'Droimna', 'Dublin 8', 0136456, 2);
insert into Agent values('John', 'Wayne', 'CHQ', 'Quays', 'Dublin 2', 0167456, 3);

insert into Estate values('detached', 'Baggot St', 'Dublin 4', 'Leinster', 8, 3, 'yes', 100, 1);
insert into Estate values('flat', 'Droimna', 'Dublin 8', 'Leinster', 5, 1, 'no', 150, 2);
insert into Estate values('basement', 'Quays', 'Dublin 2', 'Leinster', 4, 1, 'yes', 70, 3);

insert into Owner values('Deborah', 'Hogan', 'Baggot St', 'Dublin 4', 011101, 1);
insert into Owner values('Max', 'Kavanagh', 'Droimna', 'Dublin 8', 0187878, 2);
insert into Owner values('Niall', 'Jones', 'Quays', 'Dublin 2', 0123236, 3);

insert into Time values(15,8,15,1);
insert into Time values(28,5,14,2);
insert into Time values(06,1,15,3);

insert into Customer values('Austin', 'Jones', 'Baggot St', 'Dublin 4', 0123456, 50000, 1);
insert into Customer values('Sarah', 'Doyle', 'Droimna', 'Dublin 8', 0136456, 80000, 2);
insert into Customer values('Ciara', 'Wayne', 'Quays', 'Dublin 2', 0167456, 45000, 3);	

insert into SalesTable values(40000, 'sold', 41000, 1, 1, 1, 1, 1);
insert into SalesTable values(100000, 'sold', 105000, 2, 2, 2, 2, 2);
insert into SalesTable values(80000, 'sold', 79000, 3, 3, 3, 3, 3);

insert into ViewingTable values(10, 1, 1, 1, 1);
insert into ViewingTable values(10, 2, 2, 2, 2);
insert into ViewingTable values(10, 3, 3, 3, 3);



-- I How many customers have visited properties of at least 3 different categories?

DROP VIEW CustomerCategories;

CREATE VIEW CustomerCategories AS
SELECT V.CustomerID
FROM ViewingTable V, Estate E
WHERE V.EstateID = E.EstateID
GROUP BY V.CustomerID
HAVING COUNT(DISTINCT E.Category) >=3;

SELECT COUNT(*)
FROM CustomerCategories;


--Who has paid the highest price among the customers that have viewed properties of at least 3 different categories?

SELECT C.CustomerID
FROM CustomerCategories C, SalesTable S
WHERE C.CustomerID = S.CustomerID AND S.AgreedSalePrice IN
(SELECT MAX(S.AgreedSalePrice)
FROM CustomerCategories C1, SalesTable S1
WHERE C1.CustomerID = S1.CustomerID);


--Average duration of visits per property category

SELECT E.Category, AVG(V.VisitDuration)
FROM ViewingTable V, Estate E
WHERE V.EstateID = E.EstateID
GROUP BY E.Category;


--Who has bought a flat for the highest price w.r.t. each month?

SELECT S.CustomerID, T.Month, T.Year, S.AgreedSalePrice
FROM SalesTable S, Estate E, Time T
WHERE S.EstateID = E.EstateID AND S.TimeID = T.TimeID AND E.Category = 'flat' AND (T.Month,
T.Year, S.AgreedSalePrice) IN (
SELECT T1.Month, T1.Year, MAX(S1.AgreedSalePrice)
FROM SalesTable S1, Estate E1, Time T1
WHERE S1.EstateID = E1.EstateID AND S1.TimeID = T1.TimeID AND E1.Category = 'flat'
GROUP BY T1.Month, T1.Year);


--What kind of property sold for the highest price w.r.t each city and month?

SELECT E.Category, E.City, T.Month, T.Year,
S.AgreedSalePrice
FROM SalesTable S, Time T, Estate E
WHERE S.TimeID = T.TimeID AND E.EstateID =
S.EstateID AND (S.AgreedSalePrice, E.City, T.month,
T.year) IN (
SELECT MAX(S1.AgreedSalePrice), E1.City, T1.Month, T1.Year
FROM SalesTable S1, Time T1, Estate E1
WHERE S1.TimeID = T1.TimeID AND E1.EstateID = S1.EstateID
GROUP BY T1.Month, T1.Year, E1.City);
