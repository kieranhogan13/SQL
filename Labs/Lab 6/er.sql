
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
CONSTRAINT IDOwnerFKEstate FOREIGN KEY (IDOwner) REFERENCES Owner (IDOwner)
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
CONSTRAINT IDAgentFKRent FOREIGN KEY (IDAgent) REFERENCES Agent (IDAgent),
CONSTRAINT IDCustFKRent FOREIGN KEY (IDCust) REFERENCES Customer (IDCust),
CONSTRAINT IDEstateFKRent FOREIGN KEY (IDEstate) REFERENCES Estate (IDEstate)
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
CONSTRAINT IDCustFKSale FOREIGN KEY (IDCust) REFERENCES Customer (IDCust),
CONSTRAINT IDAgentFKSale FOREIGN KEY (IDAgent) REFERENCES Agent (IDAgent),
CONSTRAINT IDEstateFKSale FOREIGN KEY (IDEstate) REFERENCES Estate (IDEstate)
);

CREATE TABLE Visit
(
	VisitDate            DATE NULL ,
	VisitDuration        INTEGER NULL ,
	IDCust               INTEGER NOT NULL ,
	IDAgent              INTEGER NOT NULL ,
	IDEstate             INTEGER NOT NULL ,
CONSTRAINT  XPKVisit PRIMARY KEY (IDCust,IDAgent,IDEstate),
CONSTRAINT IDCustFKVisit FOREIGN KEY (IDCust) REFERENCES Customer (IDCust),
CONSTRAINT IDAgentFKVisit FOREIGN KEY (IDAgent) REFERENCES Agent (IDAgent),
CONSTRAINT IDEstateFKVisit FOREIGN KEY (IDEstate) REFERENCES Estate (IDEstate)
);

CREATE TABLE Agenda
(
	ClientName           VARCHAR2(30) NULL ,
	AgendaDate           DATE NOT NULL ,
	AgendaHour           INTEGER NOT NULL ,
	IDAgent              INTEGER NOT NULL ,
	IDEstate             INTEGER NOT NULL ,
CONSTRAINT  XPKAgenda PRIMARY KEY (AgendaDate,AgendaHour,IDAgent,IDEstate),
CONSTRAINT IDAgentFKAgenda FOREIGN KEY (IDAgent) REFERENCES Agent (IDAgent),
CONSTRAINT IDEstateFKAgenda FOREIGN KEY (IDEstate) REFERENCES Estate (IDEstate)
);
