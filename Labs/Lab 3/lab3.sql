drop table MATCHES;
drop table Team_Log;
drop table TEAMS;

Create Table TEAMS(
  Team_ID integer,
  Team_Name varchar(50),
  Team_Country varchar(50),
  CONSTRAINT team_pk PRIMARY KEY (Team_ID),
  CONSTRAINT country_check CHECK (Team_Country='Spain' OR Team_Country='England')
);

Create Table MATCHES(
  Match_ID integer,
  Team_A_ID integer,
  Team_B_ID integer,
  Goal_A integer,
  Goal_B integer,
  Competition varchar2(50),
  CONSTRAINT match_pk PRIMARY KEY (Match_ID),
  CONSTRAINT competition_check CHECK (Competition='Champions League' OR Competition='Europa Leauge'
  OR Competition='Premier League' OR Competition='La Liga'),
  CONSTRAINT goal_a_check CHECK (Goal_A>=0),
  CONSTRAINT goal_b_check CHECK (Goal_B>=0)
);

Create Table Team_Log(
  Team_ID integer,
  Team_Name varchar(50),
  Team_Country varchar(50),
  system_date date
);

ALTER TABLE MATCHES
ADD FOREIGN KEY (Team_A_ID)
REFERENCES TEAMS(Team_ID);

ALTER TABLE MATCHES
ADD FOREIGN KEY (Team_B_ID)
REFERENCES TEAMS(Team_ID);

drop trigger Team_Log;
CREATE OR REPLACE TRIGGER Team_Log
BEFORE INSERT ON Teams
FOR EACH ROW
DECLARE
BEGIN
  INSERT INTO team_log
   ( team_id,
     team_name,
     team_country,
     system_date)
   VALUES
   ( :new.team_id,
     :new.team_name,
     :new.team_country,
     SYSDATE);
END;

drop trigger CHECKCOUNTRY;
CREATE OR REPLACE TRIGGER CHECKCOUNTRY
BEFORE INSERT OR UPDATE ON Matches
FOR EACH ROW
DECLARE
  team_a_country VARCHAR(50);
  team_b_country VARCHAR(50);
BEGIN
  SELECT team_country INTO team_a_country FROM Teams WHERE Team_ID = :new.Team_a_ID;
  SELECT team_country INTO team_b_country FROM Teams WHERE Team_ID = :new.Team_a_ID;
  
  IF upper(:new.competition) = 'PREMIER LEAGUE' AND (upper(team_a_country) != 'ENGLAND' OR upper(team_b_country) != 'ENGLAND')
  THEN raise_application_error(-20000, 'Countries not in this league');
  ELSIF upper(:new.competition) = 'LA LIGA' AND (upper(team_a_country) != 'SPAIN' OR upper(team_b_country) != 'SPAIN')
  THEN raise_application_error(-20000, 'Countries not in this league');
  END IF;
END;

drop trigger CHECKTEAM;
CREATE OR REPLACE TRIGGER CHECKTEAM
BEFORE INSERT OR UPDATE ON Matches
FOR EACH ROW
DECLARE
	matchcount integer;
BEGIN
  SELECT COUNT(*) INTO matchcount FROM matches WHERE Team_A_ID = :new.Team_a_ID;
  IF matchcount > 3
    THEN raise_application_error(-20000, 'Team has too many home matches');
    DBMS_OUTPUT.PUT_LINE('Team has: ' || matchcount);
  END IF;
END;

SET SERVEROUTPUT ON;

insert into TEAMS values(1,'Arsenal','England');
insert into TEAMS values(2,'Manchester United','England');
insert into TEAMS values(3,'Chelsea','England');
insert into TEAMS values(4,'Manchester City','England');
insert into TEAMS values(5,'Barcelona','Spain');
insert into TEAMS values(6,'Real Madrid','Spain');
insert into TEAMS values(7,'Getafe','Spain');
insert into TEAMS values(8,'Sevilla','Spain');

insert into MATCHES values (1, 1, 2, 1, 0, 'Premier League');
insert into MATCHES values (2, 5, 6, 0, 2, 'La Liga');
insert into MATCHES values (3, 5, 7, 1, 1, 'La Liga');
insert into MATCHES values (4, 5, 8, 2, 0, 'La Liga');
insert into MATCHES values (5, 5, 6, 0, 0, 'La Liga');
insert into MATCHES values (6, 5, 6, 0, 0, 'La Liga');
insert into MATCHES values (7, 3, 4, 1, 1, 'Premier League');