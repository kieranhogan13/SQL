drop table persons;

create table persons(
person_id integer,
person_name varchar(20),
person_surname varchar(20),
person_age integer not null,
person_wealth integer,
person_weight float,
CONSTRAINT person_id_pk PRIMARY KEY (person_id)
);

drop table jobs_person;

create table jobs_person(
jobs_id integer,
person_id integer,
start_date date NOT NULL,
end_date date NOT NULL);

drop table jobs;

create table jobs(
jobs_id integer,
job_description varchar(200),
salary integer
); 

/* 1. populate table persons */
declare v_p_id number;
 v_p_name varchar2(20);
 v_p_surname varchar2(20);
 v_p_age integer;
 p_wealth float;
 p_weight float;
BEGIN
 FOR i IN 1..10000 LOOP
 select DBMS_RANDOM.STRING('a', 20) into v_p_name from dual;
 select DBMS_RANDOM.STRING('a', 20) into v_p_surname from dual;
 SELECT TRUNC(DBMS_RANDOM.VALUE(18, 100)) into v_p_age FROM DUAL;
 SELECT TRUNC(DBMS_RANDOM.VALUE(0,10000000)) into p_wealth FROM
DUAL;
 SELECT trunc(DBMS_RANDOM.VALUE(40, 120),2) into p_weight FROM
DUAL;
 insert into persons
values(i,v_p_name,v_p_surname,v_p_age,p_wealth,p_weight);
 END LOOP;
end;

/* 2. populate table jobs */
declare j_id number;
 j_description varchar2(100);
 j_salary float;
BEGIN
 FOR i IN 1..10000 LOOP
 select DBMS_RANDOM.STRING('a', 100) into j_description from dual;
 SELECT TRUNC(DBMS_RANDOM.VALUE(0,100000)) into j_salary FROM
DUAL;
 insert into jobs values(i,j_description,j_salary);
 END LOOP;
end;
 
/* 3. populate table jobs-persons */
declare j_id number;
 p_id integer;
 start_date date;
 end_date date;
 st integer;
 en integer;
BEGIN
 FOR i IN 1..10000 LOOP
 FOR j in 1..15 LOOP
 SELECT TRUNC(DBMS_RANDOM.VALUE(0,1000000)) into p_id FROM DUAL;
 SELECT TRUNC(DBMS_RANDOM.VALUE(0, 1000)) into st FROM DUAL;
 SELECT TRUNC(DBMS_RANDOM.VALUE(0, 2000)) into en FROM DUAL;
 SELECT TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2452641,2452641+st)),'J')
into start_date FROM DUAL;
 SELECT
TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2452641+st,2452641+st+en)),'J') into
end_date FROM DUAL;
 insert into jobs_person values(i,p_id,start_date,end_date);
 END LOOP;
 END LOOP;
end; 

SELECT * from persons;

select * from persons where person_id>1000 and person_id<3000;

ALTER TABLE PERSONS ADD PRIMARY KEY (person_id);

select * from persons where person_id+5>1000 and person_id<3000;

select * from persons where person_id+5>1000 and person_id*2<3000;

select person_age, count(person_id) from persons group by person_age;

create index p_age on persons(person_age);

select jobs.jobs_id,jobs.job_description, jobs.salary, jobs_person.person_id 
from jobs inner join jobs_person 
on jobs.jobs_id = jobs_person.jobs_id
where jobs_person.jobs_id=34;

select p.person_name, j.salary, j.job_description 
from persons p inner join jobs_person jp on p.person_id = jp.person_id
inner join jobs j on jp.jobs_id=j.jobs_id
where jp.start_date> '01-JAN-2003' and jp.end_date < '31-DEC-03';

drop table temp1;
create table temp1 as select p.person_id, p.person_name, j.salary, j.job_description 
from persons p inner join jobs_person jp on p.person_id = jp.person_id
inner join jobs j on jp.jobs_id=j.jobs_id;

select person_name, salary, job_description
from temp1 inner join jobs_person jp on temp1.person_id = jp.person_id
where jp.start_date> '01-JAN-2003' and jp.end_date < '31-DEC-03';

select p.person_name, j.salary, j.job_description 
from persons p inner join jobs_person jp on p.person_id = jp.person_id
inner join jobs j on jp.jobs_id=j.jobs_id
where jp.start_date> '01-JAN-2003' and jp.end_date < '31-DEC-03';



drop index p_age;
drop index jp_end_date;
drop index jp_start_date;
create index p_age on persons(person_age);
create index jp_start_date on jobs_person(start_date);
create index jp_end_date on jobs_person(end_date);

--
drop table temp1;

create table temp1 as select  p.person_name, j.salary, j.job_description 
from persons p inner join jobs_person jp on p.person_id = jp.person_id
inner join jobs j on jp.jobs_id=j.jobs_id 
where jp.start_date> '01-JAN-2003' and jp.end_date < '31-DEC-03';

select * from temp1;