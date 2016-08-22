drop table Apps_NOT_Normalized;
Create Table Apps_NOT_Normalized(
  App_No integer,
  StudentID integer,
  StudentName varchar(50),
  Street varchar(100),
  State varchar(30),
  ZipCode varchar(7),
  App_Year integer,
  ReferenceName varchar(100),
  RefInstitution  varchar(100),
  ReferenceStatement varchar(500),
  PriorSchoolId integer,
  PriorSchoolAddr varchar(100),
  GPA number(2)
);

insert into Apps_NOT_Normalized values(1,1,'Mark','Grafton Street','New York','NY234',2003,'Dr. Jones','Trinity College','Good guy',1,'Castleknock',65);
insert into Apps_NOT_Normalized values(1,1,'Mark','Grafton Street','New York','NY234',2004,'Dr. Jones','Trinity College','Good guy',1,'Castleknock',65);
insert into Apps_NOT_Normalized values(2,1,'Mark','White Street','Florida','Flo435',2007,'Dr. Jones','Trinity College','Good guy',1,'Castleknock',65);
insert into Apps_NOT_Normalized values(2,1,'Mark','White Street','Florida','Flo435',2007,'Dr. Jones','Trinity College','Good guy',2,'Loreto College',87);
insert into Apps_NOT_Normalized values(3,1,'Mark','White Street','Florida','Flo435',2012,'Dr. Jones','U Limerick','Very Good guy',1,'Castleknock',65);
insert into Apps_NOT_Normalized values(3,1,'Mark','White Street','Florida','Flo435',2012,'Dr. Jones','U Limerick','Very Good guy',2,'Loreto College',87);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2010,'Dr. Byrne','DIT','Perfect',1,'Castleknock',90);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2010,'Dr. Byrne','DIT','Perfect',3,'St. Patrick',76);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2011,'Dr. Byrne','DIT','Perfect',1,'Castleknock',90);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2011,'Dr. Byrne','DIT','Perfect',3,'St. Patrick',76);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2012,'Dr. Byrne','UCD','Average',1,'Castleknock',90);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2012,'Dr. Byrne','UCD','Average',3,'St. Patrick',76);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2012,'Dr. Byrne','UCD','Average',4,'DBS',66);
insert into Apps_NOT_Normalized values(2,2,'Sarah','Green Road','California','Cal123',2012,'Dr. Byrne','UCD','Average',5,'Harvard',45);
insert into Apps_NOT_Normalized values(1,3,'Paul','Red Crescent','Carolina','Ca455',2012,'Dr. Jones','Trinity College','Poor',1,'Castleknock',45);
insert into Apps_NOT_Normalized values(1,3,'Paul','Red Crescent','Carolina','Ca455',2012,'Dr. Jones','Trinity College','Poor',3,'St. Patrick',67);
insert into Apps_NOT_Normalized values(1,3,'Paul','Red Crescent','Carolina','Ca455',2012,'Dr. Jones','Trinity College','Poor',4,'DBS',23);
insert into Apps_NOT_Normalized values(1,3,'Paul','Red Crescent','Carolina','Ca455',2012,'Dr. Jones','Trinity College','Poor',5,'Harvard',67);
insert into Apps_NOT_Normalized values(3,3,'Paul','Yellow Park','Mexico','Mex1',2008,'Prof. Cahill','UCC','Excellent',1,'Castleknock',45);
insert into Apps_NOT_Normalized values(3,3,'Paul','Yellow Park','Mexico','Mex1',2008,'Prof. Cahill','UCC','Excellent',3,'St. Patrick',67);
insert into Apps_NOT_Normalized values(3,3,'Paul','Yellow Park','Mexico','Mex1',2008,'Prof. Cahill','UCC','Excellent',4,'DBS',23);
insert into Apps_NOT_Normalized values(3,3,'Paul','Yellow Park','Mexico','Mex1',2008,'Prof. Cahill','UCC','Excellent',5,'Harvard',67);
insert into Apps_NOT_Normalized values(1,4,'Jack','Dartry Road','Ohio','Oh34',2009,'Prof. Lillis','DIT','Fair',3,'St. Patrick',29);
insert into Apps_NOT_Normalized values(1,4,'Jack','Dartry Road','Ohio','Oh34',2009,'Prof. Lillis','DIT','Fair',4,'DBS',88);
insert into Apps_NOT_Normalized values(1,4,'Jack','Dartry Road','Ohio','Oh34',2009,'Prof. Lillis','DIT','Fair',5,'Harvard',66);
insert into Apps_NOT_Normalized values(2,5,'Mary','Malahide Road','Ireland','IRE',2009,'Prof. Lillis','DIT','Good girl',3,'St. Patrick',44);
insert into Apps_NOT_Normalized values(2,5,'Mary','Malahide Road','Ireland','IRE',2009,'Prof. Lillis','DIT','Good girl',4,'DBS',55);
insert into Apps_NOT_Normalized values(2,5,'Mary','Malahide Road','Ireland','IRE',2009,'Prof. Lillis','DIT','Good girl',5,'Harvard',66);
insert into Apps_NOT_Normalized values(2,5,'Mary','Malahide Road','Ireland','IRE',2009,'Prof. Lillis','DIT','Good girl',1,'Castleknock',74);
insert into Apps_NOT_Normalized values(1,5,'Mary','Black Bay','Kansas','Kan45',2005,'Dr. Byrne','DIT','Perfect',3,'St. Patrick',44);
insert into Apps_NOT_Normalized values(1,5,'Mary','Black Bay','Kansas','Kan45',2005,'Dr. Byrne','DIT','Perfect',4,'DBS',55);
insert into Apps_NOT_Normalized values(1,5,'Mary','Black Bay','Kansas','Kan45',2005,'Dr. Byrne','DIT','Perfect',5,'Harvard',66);
insert into Apps_NOT_Normalized values(3,6,'Susan','River Road','Kansas','Kan45',2011,'Prof. Cahill','UCC','Messy',1,'Castleknock',88);
insert into Apps_NOT_Normalized values(3,6,'Susan','River Road','Kansas','Kan45',2011,'Prof. Cahill','UCC','Messy',3,'St. Patrick',77);
insert into Apps_NOT_Normalized values(3,6,'Susan','River Road','Kansas','Kan45',2011,'Prof. Cahill','UCC','Messy',4,'DBS',56);
insert into Apps_NOT_Normalized values(3,6,'Susan','River Road','Kansas','Kan45',2011,'Prof. Cahill','UCC','Messy',2,'Loreto College',45);

select * from Apps_NOT_Normalized;

drop table Apps_NOT_Normalized;

--

drop table Applications;
drop table Student;
drop table Address;
drop table Refer;
drop table PriorSchool;

Create Table Applications(
  App_No integer,
  StudentID integer,
  App_Year integer,
  ReferenceName varchar(100),
  RefInstitution  varchar(100),
  PriorSchoolId integer
);

Create Table Student(
  StudentID integer,
  StudentName varchar(50),
  AddressID integer
);

Create Table Address(
  AddressID integer,
  Street varchar(100),
  State_ varchar(30),
  ZipCode varchar(7)
);

Create Table Refer(
  ReferenceName varchar(100),
  RefInstitution varchar(100),
  ReferenceStatement varchar(500)
);

Create Table PriorSchool(
  PriorSchoolId integer,
  PriorSchoolAddr varchar(100),
  GPA number(2)
);

INSERT INTO Applications VALUES (1, 1, '2003', 'Dr. Jones', 'Trinity College', 1);
INSERT INTO Student VALUES (1, 'Mark', '1');
INSERT INTO Address VALUES (1, 'Grafton Street', 'New York', 'NY234');
INSERT INTO Refer VALUES ('Dr. Jones', 'Trinity College','Good guy');
INSERT INTO PriorSchool VALUES (1,'Castleknock',65);

INSERT INTO Applications VALUES (1, 1, '2004', 'Dr. Jones', 'Trinity College', 1);
INSERT INTO Student VALUES (1, 'Mark', '1');

INSERT INTO Applications VALUES (2, 1, '2007', 'Dr. Jones', 'Trinity College', 1);
INSERT INTO Student VALUES (2, 'Mark', '2');
INSERT INTO Address VALUES (2, 'White Street','Florida','Flo435');

INSERT INTO Applications VALUES (2, 1, '2007', 'Dr. Jones', 'Trinity College', 2);
INSERT INTO PriorSchool VALUES (2,'Loreto College',87);

INSERT INTO Applications VALUES (3, 1, '2012', 'Dr. Jones', 'Trinity College', 2);
INSERT INTO Student VALUES (1, 'Mark', '2');
INSERT INTO Refer VALUES ('Dr. Jones', 'U Limerick','Good guy');

INSERT INTO Applications VALUES (3, 1, '2012', 'Dr. Jones', 'Trinity College', 2);
INSERT INTO Student VALUES (1, 'Mark', '2');

--

INSERT INTO Applications VALUES (2, 2, '2010', 'Dr. Byrne', 'Trinity College', 1);
INSERT INTO Student VALUES (2, 'Sarah', '3');
INSERT INTO Address VALUES (3, 'Green Road','California','Cal123');
INSERT INTO Refer VALUES ('Dr. Jones', 'DIT','Perfect');
INSERT INTO PriorSchool VALUES (1,'Castleknock',90);

INSERT INTO Applications VALUES (2, 2, '2010', 'Dr. Byrne', 'Trinity College', 3);
INSERT INTO Student VALUES (2, 'Sarah', '3');
INSERT INTO PriorSchool VALUES (3,'St. Patrick',76);

INSERT INTO Applications VALUES (2, 2, '2011', 'Dr. Byrne', 'Trinity College', 1);
INSERT INTO Student VALUES (2, 'Sarah', '3');

INSERT INTO Applications VALUES (2, 2, '2011', 'Dr. Byrne', 'Trinity College', 3);
INSERT INTO Student VALUES (2, 'Sarah', '3');

INSERT INTO Applications VALUES (2, 2, '2012', 'Dr. Byrne', 'Trinity College', 1);
INSERT INTO Student VALUES (2, 'Sarah', '3');
INSERT INTO Refer VALUES ('Dr. Jones', 'UCD','Average');
INSERT INTO PriorSchool VALUES (1,'Castleknock',90);

INSERT INTO Applications VALUES (2, 2, '2012', 'Dr. Byrne', 'Trinity College', 3);
INSERT INTO Student VALUES (2, 'Sarah', '3');
INSERT INTO Refer VALUES ('Dr. Jones', 'UCD','Average');
INSERT INTO PriorSchool VALUES (3,'St. Patrick',76);

INSERT INTO Applications VALUES (2, 2, '2012', 'Dr. Byrne', 'Trinity College', 4);
INSERT INTO Student VALUES (2, 'Sarah', '3');
INSERT INTO Refer VALUES ('Dr. Jones', 'UCD','Average');
INSERT INTO PriorSchool VALUES (4,'DBS',66);

INSERT INTO Applications VALUES (2, 2, '2012', 'Dr. Byrne', 'Trinity College', 5);
INSERT INTO Student VALUES (2, 'Sarah', '3');
INSERT INTO Refer VALUES ('Dr. Jones', 'UCD','Average');
INSERT INTO PriorSchool VALUES (5,'Harvard',45);

--

INSERT INTO Applications VALUES (1, 3, '2012', 'Dr. Jones', 'Trinity College', 1);
INSERT INTO Student VALUES (3, 'Paul', '4');
INSERT INTO Address VALUES (4, 'Red Crescent','Carolina','Ca455');
INSERT INTO Refer VALUES ('Dr. Jones','Trinity College','Poor');
INSERT INTO PriorSchool VALUES (1,'Castleknock',45);

INSERT INTO Applications VALUES (1, 3, '2012', 'Dr. Jones', 'Trinity College', 3);
INSERT INTO Student VALUES (3, 'Paul', '4');
INSERT INTO Refer VALUES ('Dr. Jones','Trinity College','Poor');
INSERT INTO PriorSchool VALUES (3,'St. Patrick',67);

INSERT INTO Applications VALUES (1, 3, '2012', 'Dr. Jones', 'Trinity College', 4);
INSERT INTO Student VALUES (3, 'Paul', '4');
INSERT INTO Refer VALUES ('Dr. Jones','Trinity College','Poor');
INSERT INTO PriorSchool VALUES (4,'DBS',23);

INSERT INTO Applications VALUES (1, 3, '2012', 'Dr. Jones', 'Trinity College', 5);
INSERT INTO Student VALUES (3, 'Paul', '4');
INSERT INTO Refer VALUES ('Dr. Jones','Trinity College','Poor');
INSERT INTO PriorSchool VALUES (5,'Harvard',67);

INSERT INTO Applications VALUES (3, 3, '2008', 'Prof. Cahill','UCC', 1);
INSERT INTO Student VALUES (3, 'Paul', '4');
INSERT INTO Address VALUES (5, 'Yellow Park','Mexico','Mex1');
INSERT INTO Refer VALUES ('Prof. Cahill','UCC','Excellent');
INSERT INTO PriorSchool VALUES (1,'Castleknock',45);

INSERT INTO Applications VALUES (3, 3, '2008', 'Prof. Cahill','UCC', 3);
INSERT INTO Student VALUES (3, 'Paul', '4');
INSERT INTO Refer VALUES ('Prof. Cahill','UCC','Excellent');
INSERT INTO PriorSchool VALUES (3,'St. Patrick',67);

INSERT INTO Applications VALUES (3, 3, '2008', 'Prof. Cahill','UCC', 4);
INSERT INTO Student VALUES (3, 'Paul', '4');
INSERT INTO Refer VALUES ('Prof. Cahill','UCC','Excellent');
INSERT INTO PriorSchool VALUES (4,'DBS',23);

INSERT INTO Applications VALUES (3, 3, '2008', 'Prof. Cahill','UCC', 5);
INSERT INTO Student VALUES (3, 'Paul', '4');
INSERT INTO Refer VALUES ('Prof. Cahill','UCC','Excellent');
INSERT INTO PriorSchool VALUES (5,'Harvard',67);

--

INSERT INTO Applications VALUES (1, 4, '2009', 'Prof. Lillis','DIT', 3);
INSERT INTO Student VALUES (4, 'Jack', '6');
INSERT INTO Address VALUES (6, 'Dartry Road','Ohio','Oh34');
INSERT INTO Refer VALUES ('Prof. Lillis','DIT','Fair');
INSERT INTO PriorSchool VALUES (3,'St. Patrick',29);

INSERT INTO Applications VALUES (1, 4, '2009', 'Prof. Lillis','DIT', 3);
INSERT INTO Student VALUES (4, 'Jack', '6');
INSERT INTO Refer VALUES ('Prof. Lillis','DIT','Fair');
INSERT INTO PriorSchool VALUES (4,'DBS',88);

INSERT INTO Applications VALUES (1, 4, '2009', 'Prof. Lillis','DIT', 3);
INSERT INTO Student VALUES (4, 'Jack', '6');
INSERT INTO Refer VALUES ('Prof. Lillis','DIT','Fair');
INSERT INTO PriorSchool VALUES (5,'Harvard',66);

--

INSERT INTO Applications VALUES (2, 5, '2009', 'Prof. Lillis','DIT', 3);
INSERT INTO Student VALUES (5, 'Mary', '7');
INSERT INTO Address VALUES (7, 'Malahide Road','Ireland','IRE');
INSERT INTO Refer VALUES ('Prof. Lillis','DIT','Fair');
INSERT INTO PriorSchool VALUES (3,'St. Patrick',44);

INSERT INTO Applications VALUES (2, 5, '2009', 'Prof. Lillis','DIT', 3);
INSERT INTO Student VALUES (5, 'Mary', '7');
INSERT INTO Refer VALUES ('Prof. Lillis','DIT','Fair');
INSERT INTO PriorSchool VALUES (4,'DBS',55);

INSERT INTO Applications VALUES (2, 5, '2009', 'Prof. Lillis','DIT', 3);
INSERT INTO Student VALUES (5, 'Mary', '7');
INSERT INTO Refer VALUES ('Prof. Lillis','DIT','Fair');
INSERT INTO PriorSchool VALUES (5,'Harvard',66);

INSERT INTO Applications VALUES (2, 5, '2009', 'Prof. Lillis','DIT', 3);
INSERT INTO Student VALUES (5, 'Mary', '7');
INSERT INTO Refer VALUES ('Prof. Lillis','DIT','Fair');
INSERT INTO PriorSchool VALUES (1,'Castleknock',74);

INSERT INTO Applications VALUES (1, 5, '2005', 'Prof. Lillis','DIT', 3);
INSERT INTO Student VALUES (5, 'Mary', '8');
INSERT INTO Address VALUES (8, 'Black Bay','Kansas','Kan45');
INSERT INTO Refer VALUES ('Dr. Byrne','DIT','Perfect');
INSERT INTO PriorSchool VALUES (3,'St. Patrick',44);

INSERT INTO Applications VALUES (1, 5, '2005', 'Prof. Lillis','DIT', 3);
INSERT INTO Student VALUES (5, 'Mary', '8');
INSERT INTO Refer VALUES ('Dr. Byrne','DIT','Perfect');
INSERT INTO PriorSchool VALUES (4,'DBS',55);

INSERT INTO Applications VALUES (1, 5, '2005', 'Prof. Lillis','DIT', 3);
INSERT INTO Student VALUES (5, 'Mary', '8');
INSERT INTO Refer VALUES ('Dr. Byrne','DIT','Perfect');
INSERT INTO PriorSchool VALUES (5,'Harvard',66);

-- 

INSERT INTO Applications VALUES (3, 6, '2011', 'Prof. Cahill','UCC', 3);
INSERT INTO Student VALUES (5, 'Susan', '9');
INSERT INTO Address VALUES (9, 'River Road','Kansas','Kan45');
INSERT INTO Refer VALUES ('Prof. Cahill','UCC','Messy');
INSERT INTO PriorSchool VALUES (1,'Castleknock',88);

INSERT INTO Applications VALUES (3, 6, '2011', 'Prof. Cahill','UCC', 3);
INSERT INTO Student VALUES (5, 'Susan', '9');
INSERT INTO Refer VALUES ('Prof. Cahill','UCC','Messy');
INSERT INTO PriorSchool VALUES (3,'St. Patrick',77);

INSERT INTO Applications VALUES (3, 6, '2011', 'Prof. Cahill','UCC', 3);
INSERT INTO Student VALUES (5, 'Susan', '9');
INSERT INTO Refer VALUES ('Prof. Cahill','UCC','Messy');
INSERT INTO PriorSchool VALUES (4,'DBS',56);

INSERT INTO Applications VALUES (3, 6, '2011', 'Prof. Cahill','UCC', 3);
INSERT INTO Student VALUES (5, 'Susan', '9');
INSERT INTO Refer VALUES ('Prof. Cahill','UCC','Messy');
INSERT INTO PriorSchool VALUES (2,'Loreto College',45);