--Started by Professor Vanderlinden--
--Modified by Andrew Baker--
--Date: 10.23.20--

-- Get the number of Game records.
SELECT *
  FROM Game
  ;

-- Get the player records.
SELECT * 
  FROM Player
  ;

-- Get all the users with Calvin email addresses.
SELECT *
    FROM Player
    WHERE emailAddress LIKE '%calvin%'
 ;

-- Get the highest score ever recorded.
  SELECT score
    FROM PlayerGame
    ORDER BY score DESC
    LIMIT 1
    ;

-- Get the cross-product of all the tables.
SELECT *
  FROM Player, PlayerGame, Game
  ;

--Code added by Andrew Baker--

--Retrieve a list of all the games, ordered by date with the most recent game coming first.--
SELECT * 
    FROM Game
    ORDER BY time DESC
    ;

--Retrieve all the games that occurred in the past week.
SELECT *
    FROM Game
    WHERE (time >= DATE_TRUNC('week', CURRENT_TIMESTAMP - interval '1 week'))
    ;

--Retrieve a list of players who have (non-NULL) names.
SELECT *
    FROM Player
    WHERE name IS NOT null
    ;

--Retrieve a list of IDs for players who have some game score larger than 2000.
SELECT playerID
    FROM PlayerGame
    WHERE score > 2000
    ;

--Retrieve a list of players who have GMail accounts.
SELECT *
    FROM Player
    WHERE emailAddress LIKE  '%@gmail.edu%'
    ;


--Retrieve all “The King”’s game scores in decreasing order.
SELECT score
    FROM PlayerGame, Player

    WHERE name = 'The King' AND player.ID = playerID  

    ORDER BY score DESC
    ;

--Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
SELECT name
    FROM Game, PlayerGame, Player
    WHERE game.ID = gameID 
        AND player.ID = playerID
        AND time = '2006-06-28 13:20:00 +0000'
    ORDER BY score DESC LIMIT 1
    ;

--So what does that P1.ID < P2.ID clause do in the last example query?
    -- The P1.ID < P2.ID clause is used to avoid referencing the same table at the same time. 

--The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself?
    --It could be useful to join a table to itself when a person or element in the table fulfills two roles. Such as a family tree database that has a member who is both a father and a son. 
