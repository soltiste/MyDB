CREATE DATABASE Formula_1;

USE Formula_1;

CREATE TABLE Teams(
	id int NOT NULL IDENTITY(1, 1),
	name_team varchar(30),
	leader varchar(30),
	constructors_cup_result_2022 int,
	PRIMARY KEY (id),

);

CREATE TABLE Pilots(
	id int NOT NULL IDENTITY(1, 1),
	name_pilot varchar(30),
	team_id int,
	age int,
	seasons int,
	personal_offset_result_2022 int,
	PRIMARY KEY (id),
	FOREIGN KEY (team_id) REFERENCES Teams(id),

);

CREATE TABLE Cars(
	model_number varchar(50) NOT NULL,
	team_id int,
	coloring varchar(50),
	chief_designer varchar(30),
	motor_manufacturer varchar(30),
	PRIMARY KEY (model_number),
	FOREIGN KEY (team_id) REFERENCES Teams(id),

);

CREATE TABLE Salaries(
	name_person varchar(30),
	team_id int,
	job_title varchar(30),
	wage_in_millions int,
	PRIMARY KEY (name_person),
	FOREIGN KEY (team_id) REFERENCES Teams(id),
);

CREATE TABLE Races_in_2022 (
	id_race int NOT NULL IDENTITY(1, 1),
	race_date date,
	name_track varchar(50),
	winning_team_id int,
	PRIMARY KEY (id_race),
	FOREIGN KEY (winning_team_id) REFERENCES Teams(id),
);

INSERT INTO Teams (name_team, leader, constructors_cup_result_2022)
VALUES
('Red Bull', 'Cristian Horner', 759),
('Ferrari', 'Toto Wolff', 554),
('Mercedes', 'Mattia Binotto', 515),
('Alpine', 'Otmar Safnauer', 173),
('McLaren', 'Andreas Seidi', 159),
('Alfa Romeo', 'Frederic Vasseur', 55),
('Aston Martin', 'Mike Krak', 55),
('Haas', 'Gunther Steiner', 37),
('AlphaTauri', 'Dietrich Mateschitz', 35),
('Williams', 'Jost Capito', 8);
SELECT * FROM Teams;

INSERT INTO Races_in_2022 (race_date, name_track, winning_team_id)
VALUES
('2022-03-20', 'Sahir', 2),
('2022-03-27', 'Gidda', 1),
('2022-04-10', 'Melburn', 2),
('2022-04-24', 'Imola', 1),
('2022-05-08', 'Miami', 1),
('2022-05-22', 'Barselona', 1),
('2022-06-12', 'Baku', 1),
('2022-06-19', 'Monreal', 1),
('2022-07-03', 'Silverstone', 2),
('2022-07-10', 'Shpilberg', 2),
('2022-07-24', 'Pol-ricar', 1),
('2022-07-31', 'Hungaroring', 2);
SELECT * FROM Races_in_2022;

INSERT INTO Pilots (name_pilot, team_id, age, seasons, personal_offset_result_2022)
VALUES
('Lewis Hamilton', 3, 37, 15, 240),
('Max Verstappen', 1, 25, 7, 454),
('Charles Leclerc', 2, 25, 4, 308),
('Lando Norris', 5, 23, 3, 122),
('Fernando Alonso', 4, 41, 18, 81),
('Pierre Gasly', 9, 26, 5, 23),
('Lance Stroll', 7, 24, 5, 18),
('Nicholas Latifi', 10, 27, 2, 2),
('Valtteri Bottas', 6, 33, 9, 49),
('Mick Schumacher', 8, 23, 1, 12);
SELECT * FROM Pilots;

INSERT INTO Cars(model_number, team_id, coloring, chief_designer, motor_manufacturer)
VALUES
('MERS-22', 3, 'grey and blue', 'Mike Elliot', 'Mercedes'),
('RB18', 1, 'black and orange', 'Rob Marshall', 'Red Bull Powertrains'),
('FERRARI-22', 2, 'red and black', 'Enrico Cardile', 'Ferrari'),
('MCL36', 5, 'black, blue, orange', 'James Key', 'Mercedes'),
('ALPINE-22', 4, 'blue and pink', 'Pat Fry', 'Renault'),
('AlphaTauri AT03', 9, 'white and black', 'Jody Egginton', 'Red Bull Powertrains'),
('ASTONMARTIN-22', 7, 'green and yellow', 'Andy Green', 'Mercedes'),
('WILLIAMS-22', 10, 'blue and red', ' Francois Demaison', 'Mercedes'),
('C42', 6, 'red and white', 'Jean Monchaux', 'Ferrari'),
('VF-22', 8, 'white, black, red', 'Simone Resta', 'Ferrari');
SELECT * FROM Cars;

INSERT INTO Salaries(name_person, team_id, job_title, wage_in_millions)
VALUES
('Lewis Hamilton', 3, 'pilot', 24),
('Max Verstappen', 1, 'pilot', 45),
('Charles Leclerc', 2, 'pilot', 30),
('Lando Norris', 5, 'pilot', 12),
('Fernando Alonso', 4, 'pilot', 8),
('Pierre Gasly', 9, 'pilot', 2),
('Lance Stroll', 7, 'pilot', 1),
('Nicholas Latifi', 10, 'pilot', 1),
('Valtteri Bottas', 6, 'pilot', 4),
('Mick Schumacher', 8, 'pilot', 1),
('Cristian Horner', 1, 'leader', 75),
('Toto Wolff', 3,'leader', 55),
('Mattia Binotto', 2,'leader', 51),
('Otmar Safnauer', 5,'leader', 17),
('Andreas Seidi', 4, 'leader', 15),
('Frederic Vasseur', 9,'leader', 5),
('Mike Krak', 7, 'leader', 5),
('Gunther Steiner',10, 'leader', 3),
('Dietrich Mateschitz', 6,'leader', 3),
('Jost Capito', 8, 'leader', 1),
('Mike Elliot', 3, 'chief_designer', 7),
('Rob Marshall', 1, 'chief_designer', 10),
('Enrico Cardile', 2, 'chief_designer', 9),
('James Key', 5, 'chief_designer', 5),
('Pat Fry', 4, 'chief_designer', 6),
('Jody Egginton', 9, 'chief_designer', 1),
('Andy Green', 7, 'chief_designer', 3),
('Francois Demaison', 10, 'chief_designer', 1),
('Jean Monchaux', 6, 'chief_designer',5),
('Simone Resta', 8, 'chief_designer', 2);
SELECT * FROM Salaries;

SELECT Pilots.name_pilot, Teams.name_team, Pilots.personal_offset_result_2022
FROM Pilots
JOIN Teams ON (Pilots.team_id = Teams.id);

SELECT Pilots.name_pilot, Cars.coloring
FROM Pilots
JOIN Cars ON (Pilots.team_id = Cars.team_id);

SELECT Salaries.name_person, Teams.name_team, Salaries.job_title, Salaries.wage_in_millions
FROM Teams
JOIN Salaries ON (Teams.id = Salaries.team_id);

SELECT s.name_person, t.name_team, s.job_title, s.wage_in_millions
FROM Teams AS t
JOIN Salaries AS s ON (t.id = s.team_id)
WHERE (t.name_team = 'Red Bull') OR (t.name_team = 'Ferrari') OR (t.name_team = 'Mercedes');

SELECT t.name_team AS team, t.leader, p.name_pilot AS pilot, c.chief_designer
FROM Teams AS t
JOIN Pilots AS p ON (t.id = p.team_id)
JOIN Cars AS c ON (t.id = c.team_id);

SELECT p.name_pilot, t.name_team, s.wage_in_millions
FROM Pilots AS p
JOIN Teams AS t ON (t.id = p.team_id)
JOIN Salaries AS s ON (p.name_pilot = s.name_person)
WHERE (t.name_team LIKE 'A%') AND (s.wage_in_millions < 10);

SELECT p.name_pilot, t.name_team, s.wage_in_millions
FROM Pilots AS p
JOIN Teams AS t ON (t.id = p.team_id)
JOIN Salaries AS s ON (p.name_pilot = s.name_person)
WHERE (s.wage_in_millions > 10)
ORDER BY s.wage_in_millions DESC;

SELECT job_title, AVG(1.0 * wage_in_millions) AS average_wage, MAX(wage_in_millions) AS max_wage, 
	   MIN(wage_in_millions) AS min_wage
FROM Salaries
GROUP BY job_title
ORDER BY max_wage DESC;

SELECT n.name_team, AVG(1.0 * wage_in_millions) AS average_wage
FROM (
SELECT t.name_team, s.wage_in_millions
FROM Teams AS t
JOIN Salaries AS s ON (t.id = s.team_id)
) AS n
GROUP BY n.name_team;

SELECT t.name_team, t.constructors_cup_result_2022, n.average_wage
FROM (
SELECT s.team_id, AVG(1.0 * s.wage_in_millions) AS average_wage
FROM Salaries AS s
GROUP BY s.team_id
) AS n
JOIN Teams AS t ON (t.id = n.team_id)
ORDER BY t.constructors_cup_result_2022 DESC;



