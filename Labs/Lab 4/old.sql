ALTER TABLE EXAMS
DROP CONSTRAINT exams_pk;
drop table EXAMS;

drop table MARKS;

ALTER TABLE MODULES
DROP CONSTRAINT modules_pk;
ALTER TABLE MODULES
DROP CONSTRAINT weight_check;
drop table MODULES;

ALTER TABLE STUDENTS
DROP CONSTRAINT student_pk;
drop table STUDENTS;


Create Table STUDENTS(
  Student_ID varchar2(8),
  Student_Name varchar2(20),
  Student_Surname varchar2(20),
  CONSTRAINT student_pk PRIMARY KEY (Student_ID)
);

Create Table MODULES(
  Module_Name varchar2(30),
  CA_Weight  number(5,2),
  EXAM_Weight number(5,2),
  CONSTRAINT modules_pk PRIMARY KEY (Module_Name),
  CONSTRAINT weight_check CHECK (CA_Weight + EXAM_Weight = 1.0)
);

Create Table EXAMS(
  EXAM_code integer,
  Module_Name varchar2(30),
  CONSTRAINT exams_pk PRIMARY KEY (EXAM_code),
  CONSTRAINT exams_module_fk FOREIGN KEY (Module_Name)
  REFERENCES Modules(Module_Name)
);


Create Table MARKS(
  Student_ID varchar(8),
  Module_Name varchar2(30),
  CA_Marks number(5,2),
  EXAM_Marks number(5,2),
  CONSTRAINT marks_students_fk FOREIGN KEY (Student_ID)
  REFERENCES Students(Student_ID),
  CONSTRAINT marks_module_fk FOREIGN KEY (Module_Name)
  REFERENCES Modules(Module_Name)
);

ALTER TABLE MODULES
DROP CONSTRAINT weight_check;

insert into STUDENTS values('D1231231','Mary','Smith');
insert into MODULES values('Programming',0.40,0.60);
insert into MODULES values('Databases',0.50,0.50);
insert into MODULES values('Web Apps',0.30,0.70);
insert into MODULES values('Algorithms',0.30,0.70);
insert into MODULES values('Maths',0.20,0.80);
insert into EXAMS values(1234,'Programming');
insert into EXAMS values(4567,'Databases');
insert into EXAMS values(5987,'Web Apps');
insert into EXAMS values(4506,'Algorithms');
insert into EXAMS values(2345,'Maths');
insert into MARKS values('D1231231','Programming',0.67,0.45);
insert into MARKS values('D1231231','Databases',0.55,0.88);
insert into MARKS values('D1231231','Web Apps',0.77,0.66);
insert into MARKS values('D1231231','Algorithms',0.47,0.46);
insert into MARKS values('D1231231','Maths',0.56,0.75);

--

DROP Trigger check_weight_sum;
CREATE OR REPLACE TRIGGER check_weight_sum
BEFORE INSERT ON Modules FOR EACH ROW
DECLARE
  CA_Weight number(5,2) := :new.CA_Weight;
  EXAM_Weight number(5,2) := :new.EXAM_Weight;
BEGIN
  IF (CA_Weight + EXAM_Weight != 1.0) THEN
    raise_application_error (-20001,'Sum of CA and Exam weight does not equal 1');
  END IF;
END;

--

Create Table BOARDS(
  Student_ID varchar(8),
  EXAM_code integer,
  Results number(5,2),
  Decision varchar2(3),
  CONSTRAINT boards_students_fk FOREIGN KEY (Student_ID)
  REFERENCES Students(Student_ID),
  CONSTRAINT boards_exam_code_fk FOREIGN KEY (EXAM_code)
  REFERENCES Exams(EXAM_code),
  CONSTRAINT check_decision CHECK (Decision ='RE' OR Decision = 'RCA' OR Decision = 'RAC' OR Decision = 'A' OR Decision = 'B' OR Decision = 'C' OR Decision = 'D')
);

