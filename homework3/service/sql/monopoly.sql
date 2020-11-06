--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author Andrew Baker
-- @version Fall, 2020
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	position varchar(50)
	);

CREATE TABLE GameProperty (
	gameID integer REFERENCES Game(ID),
	property varchar(50),
	playerID integer REFERENCES Player(ID),
	developmentType varchar(50),
	developmentTotal integer
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON GameProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');
INSERT INTO Game VALUES (4, '2020-10-16 4:07:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');
INSERT INTO Player VALUES (4, 'ajb247@students.calvin.edu', 'Andrew');

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 25, 'Park Place');
INSERT INTO PlayerGame VALUES (1, 2, 0.00, 25, 'Park Place');
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 25, 'Park Place');
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, 25, 'Park Place');
INSERT INTO PlayerGame VALUES (2, 2, 0.00, 25, 'Park Place');
INSERT INTO PlayerGame VALUES (2, 3, 500.00, 25, 'Park Place');
INSERT INTO PlayerGame VALUES (3, 2, 0.00, 25, 'Park Place');
INSERT INTO PlayerGame VALUES (3, 3, 5500.00, 25, 'Park Place');
INSERT INTO PlayerGame VALUES (3, 4, 5500.00, 25, 'Park Place');

INSERT INTO GameProperty VALUES (1, 'Atlantic Avenue', 4, 'Hotel', 1);