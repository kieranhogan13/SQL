/* Golf DB 1 and DB 2*/
drop table results1;
drop table results2;
drop table players1;
drop table players2;
drop table team1;
drop table team2;
drop table tournament1;
drop table tournament2;


Create Table Team1(
Team_id integer primary key,
Team_name varchar(100)
);

Create Table Team2(
Team_id integer primary key,
Team_name varchar(100)
);

Create Table Players1(
p_id integer primary key,
p_name varchar(50),
p_sname varchar(50),
team_id integer,
constraint fk_team_1 foreign key (team_id) references team1
);

Create Table Players2(
p_id integer primary key,
p_name varchar(50),
p_sname varchar(50),
team_id integer,
constraint fk_team_2 foreign key (team_id) references team2
);

Create Table Tournament1(
T_id integer primary key,
t_descriprion varchar(100),
t_date integer,
Total_price float
);

Create Table Tournament2(
T_id integer primary key,
t_descriprion varchar(100),
t_date date,
Total_price float
);

Create Table Results1(
t_id integer,
p_id integer,
rank integer,
price float,
CONSTRAINT  FK_player1 FOREIGN KEY (p_id) REFERENCES players1,
CONSTRAINT  FK_tournament1 FOREIGN KEY (t_id) REFERENCES tournament1,
CONSTRAINT PK_Results1 PRIMARY KEY (t_id,p_id)
);

Create Table Results2(
t_id integer,
p_id integer,
rank integer,
price float,
CONSTRAINT  FK_player2 FOREIGN KEY (p_id) REFERENCES players2,
CONSTRAINT  FK_tournament2 FOREIGN KEY (t_id) REFERENCES tournament2,
CONSTRAINT PK_Results2 PRIMARY KEY (t_id,p_id)
);

/* END ER DIAGRAM */

/* data */
INSERT INTO TEAM1 (TEAM_ID, TEAM_NAME) VALUES ('1', 'USA');
INSERT INTO TEAM1 (TEAM_ID, TEAM_NAME) VALUES ('2', 'AUSTRALIA');
INSERT INTO TEAM1 (TEAM_ID, TEAM_NAME) VALUES ('3', 'UK');
INSERT INTO TEAM1 (TEAM_ID, TEAM_NAME) VALUES ('4', 'IRELAND');

INSERT INTO TEAM2 (TEAM_ID, TEAM_NAME) VALUES ('1', 'UK');
INSERT INTO TEAM2 (TEAM_ID, TEAM_NAME) VALUES ('2', 'IRELAND');
INSERT INTO TEAM2 (TEAM_ID, TEAM_NAME) VALUES ('3', 'USA');
INSERT INTO TEAM2 (TEAM_ID, TEAM_NAME) VALUES ('4', 'ITALY');



INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES ('1', 'Tiger', 'Woods', '1');
INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES ('2', 'Mary', 'Smith', '2');
INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES ('3', 'Mark', 'Deegan', '2');
INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES ('4', 'James', 'Bryan', '3');
INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES ('5', 'John', 'McDonald', '1');
INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES ('6', 'Mario', 'Baggio', '1');

INSERT INTO PLAYERS2 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES ('2', 'Tiger', 'Woods', '3');
INSERT INTO PLAYERS2 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES ('1', 'John', 'McDonald', '3');
INSERT INTO PLAYERS2 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES ('3', 'Jim', 'Burke', '3');
INSERT INTO PLAYERS2 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES ('4', 'Paul', 'Bin', '3');
INSERT INTO PLAYERS2 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES ('5', 'Peter', 'Flynn', '3');
INSERT INTO PLAYERS2 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES ('6', 'Martha', 'Ross', '4');

INSERT INTO TOURNAMENT1 (T_ID, T_DESCRIPRION, TOTAL_PRICE) VALUES ('1', 'US open', '1700000');
INSERT INTO TOURNAMENT1 (T_ID, T_DESCRIPRION, TOTAL_PRICE) VALUES ('2', 'British Open', '7000000');
INSERT INTO TOURNAMENT1 (T_ID, T_DESCRIPRION, TOTAL_PRICE) VALUES ('3', 'Italian Open', '2000000');
INSERT INTO TOURNAMENT1 (T_ID, T_DESCRIPRION, TOTAL_PRICE) VALUES ('4', 'Irish Open', '300000');

INSERT INTO TOURNAMENT2 (T_ID, T_DESCRIPRION, TOTAL_PRICE) VALUES ('1', 'Dutch open', '1700000');
INSERT INTO TOURNAMENT2 (T_ID, T_DESCRIPRION, TOTAL_PRICE) VALUES ('2', 'French Open', '7000000');
INSERT INTO TOURNAMENT2 (T_ID, T_DESCRIPRION, TOTAL_PRICE) VALUES ('3', 'Spanish Open', '2000000');
INSERT INTO TOURNAMENT2 (T_ID, T_DESCRIPRION, TOTAL_PRICE) VALUES ('4', 'Chiinese Open', '300000');


INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES ('1', '1', '1', '10000');
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES ('1', '2', '2', '20000');
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES ('2', '2', '4', '1000');
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES ('3', '2', '3', '10000');
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES ('3', '1', '2', '1100');
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES ('4', '6', '3', '6000');
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES ('4', '2', '2', '9000');
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES ('4', '1', '1', '10000');
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES ('3', '5', '2', '9500');
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES ('4', '5', '4', '10000');
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES ('2', '5', '7', '100');

INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES ('1', '1', '1', '1000');
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES ('1', '2', '3', '2000');
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES ('2', '2', '1', '6000');
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES ('3', '2', '3', '17000');
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES ('3', '1', '12', '1100');
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES ('4', '6', '10', '8000');
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES ('4', '2', '2', '12000');
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES ('4', '1', '3', '10000');
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES ('3', '5', '1', '9000');
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES ('4', '5', '5', '1000');
INSERT INTO RESULTS2 (T_ID, P_ID, RANK, PRICE) VALUES ('2', '5', '3', '1000');

/* 1 - BUILD DIMENSIONAL MODEL */
