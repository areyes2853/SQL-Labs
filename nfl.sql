--making a view
CREATE VIEW players_teams AS
SELECT
    p.id AS player_id,
    p.name AS player_name,
    p.position,
    p.salary,
    t.id AS team_id,
    t.name AS team_name,
    t.stadium,
    t.division,
    t.conference,
    t.head_coach,
    t.active
FROM players AS p
JOIN teams AS t ON p.team_id = t.id;

-- 1. List the names of all NFL teams'
SELECT name FROM teams;
---------------------
 Buffalo Bills
 Miami Dolphins
 New England Patriots
 New York Jets
 Baltimore Ravens
 Cincinnati Bengals
 Cleveland Browns
 Pittsburgh Steelers
 Houston Texans
 Indianapolis Colts
 Jacksonville Jaguars
 Tennessee Titans
 Denver Broncos
 Kansas City Chiefs
 Oakland Raiders
 San Diego Chargers
 Dallas Cowboys
 New York Giants
 Philadelphia Eagles
 Washington Redskins
 Chicago Bears
 Detroit Lions
 Green Bay Packers
 Minnesota Vikings
:

 

-- 2. List the stadium name and head coach of all NFC teams
  nfl=# SELECT DISTINCT stadium, head_coach
FROM players_teams
WHERE conference = 'NFC';
            stadium            |  head_coach   
-------------------------------+---------------
 Bank of America Stadium       | Ron Rivera
 Ford Field                    | Jim Caldwell
 CenturyLink Field             | Pete Carroll
 Levis Stadium                 | Jim Harbaugh
 Edward Jones Dome             | Jeff Fisher
 Georgia Dome                  | Mike Smith
 MetLife Stadium               | Tom Coughlin
 University of Phoenix Stadium | Bruce Arians
 FedExField                    | Jay Gruden
 AT&T Stadium                  | Jason Garrett
 Soldier Field                 | Marc Trestman
 Lincoln Financial Field       | Chip Kelly
 Raymond James Stadium         | Lovie Smith
 Mercedes-Benz Superdome       | Sean Payton
 TCF Bank Stadium              | Mike Zimmer
 Lambeau Field                 | Mike McCarthy
(16 rows)

-- 3. List the head coaches of the AFC South
nfl=# SELECT DISTINCT head_coach
FROM players_teams
WHERE conference = 'AFC';
   head_coach   
----------------
 Chuck Pagano
 Gus Bradley
 Doug Marrone
 Ken Whisenhunt
 John Fox
 Rex Ryan
 Mike McCoy
 John Harbaugh
 Tony Sparano
 Andy Reid
 Marvin Lewis
 Mike Tomlin
 Mike Pettine
 Bill OBrien
 Joe Philbin
 Bill Belichick
(16 rows)
  

-- 4. The total number of players in the NFL
nfl=# SELECT COUNT(player_id) FROM players_teams;
 count 
-------
  1532

  

-- 5. The team names and head coaches of the NFC North and AFC East
nfl=# SELECT DISTINCT team_name, head_coach
FROM players_teams
WHERE (division = 'North' AND conference = 'NFC') OR (division = 'East' AND conference = 'AFC');
      team_name       |   head_coach   
----------------------+----------------
 Miami Dolphins       | Joe Philbin
 Detroit Lions        | Jim Caldwell
 Minnesota Vikings    | Mike Zimmer
 New York Jets        | Rex Ryan
 Buffalo Bills        | Doug Marrone
 New England Patriots | Bill Belichick
 Green Bay Packers    | Mike McCarthy
 Chicago Bears        | Marc Trestman
(8 rows)


-- 6. The 50 players with the highest salaries
nfl=# SELECT *
FROM players
ORDER BY salary DESC
LIMIT 50;
  
   id  |          name           | position |  salary  | team_id 
------+-------------------------+----------+----------+---------
 2121 | Peyton Manning          | QB       | 18000000 |      13
 2787 | Drew Brees              | QB       | 15760000 |      27
 1966 | Dwight Freeney          | DE       | 14035000 |      10
 2122 | Elvis Dumervil          | DE       | 14000000 |      13
 2402 | Michael Vick            | QB       | 12500000 |      19
 2922 | Sam Bradford            | QB       | 12000000 |      30
 2641 | Jared Allen             | DE       | 11619850 |      24
 2687 | Matt Ryan               | QB       | 11500000 |      25
 2553 | Matthew Stafford        | QB       | 11500000 |      22
 2179 | Tamba Hali              | DE       | 11250000 |      14
 1592 | Jake Long               | T        | 11200000 |       2
 2403 | Nnamdi Asomugha         | CB       | 11000000 |      19
 2454 | Trent Williams          | T        | 11000000 |      20
 2830 | Vincent Jackson         | WR       | 11000000 |      28
 2554 | Cliff Avril             | DE       | 10600000 |      22
 2880 | Calais Campbell         | DE       | 10600000 |      29
 1821 | Joe Thomas              | T        | 10500000 |       7
 2688 | Brent Grimes            | CB       | 10431000 |      25
 1967 | Peyton Manning (buyout) | QB       | 10400000 |      10
 2923 | Chris Long              | DE       | 10310000 |      30
 2263 | Philip Rivers           | QB       | 10200000 |      16
 2924 | Jason Smith             | T        | 10000000 |      30
 1695 | David Harris            | LB       |  9900000 |       4
 1636 | Wes Welker              | WR       |  9515000 |       3
:

-- 7. The average salary of all NFL players
nfl=# SELECT *
FROM players
ORDER BY salary DESC
LIMIT 50;
nfl=# SELECT AVG(salary)
from players;
         avg          
----------------------
 1579692.539817232376
(1 row)
 --had to look this up the number was too ugly
 nfl=# SELECT TO_CHAR(AVG(salary), 'FM$999,999,990.00') AS average_salary
FROM players;
 average_salary 
----------------
 $1,579,692.54
(1 row)

-- 8. The names and positions of players with a salary above 10_000_000
nfl=# SELECT name, position
FROM players
WHERE salary > 10000000;
  
  WHERE salary > 10000000;
          name           | position 
-------------------------+----------
 Jake Long               | T
 Joe Thomas              | T
 Dwight Freeney          | DE
 Peyton Manning (buyout) | QB
 Peyton Manning          | QB
 Elvis Dumervil          | DE
 Tamba Hali              | DE
 Philip Rivers           | QB
 Michael Vick            | QB
 Nnamdi Asomugha         | CB
 Trent Williams          | T
 Matthew Stafford        | QB
 Cliff Avril             | DE
 Jared Allen             | DE
 Matt Ryan               | QB
 Brent Grimes            | CB
 Drew Brees              | QB
 Vincent Jackson         | WR
 Calais Campbell         | DE
 Sam Bradford            | QB
 Chris Long              | DE
(21 rows)

-- 9. The player with the highest salary in the NFL
nfl=# SELECT *
FROM players
ORDER BY salary DESC
LIMIT 1;
  id  |      name      | position |  salary  | team_id 
------+----------------+----------+----------+---------
 2121 | Peyton Manning | QB       | 18000000 |      13
(1 row)
 
-- 10. The name and position of the first 100 players with the lowest salaries
SELECT name, position
FROM players
ORDER BY salary ASC
LIMIT 100;          name          | position 
------------------------+----------
 Phillip Dillard        | 
 Eric Kettani           | RB
 Austin Sylvester       | RB
 Greg Orton             | WR
 Jerrod Johnson         | QB
 McLeod Bethel-Thompson | QB
 Jonathan Crompton      | QB
 Travon Bellamy         | CB
 Caleb King             | RB
 Mike Mohamed           | LB
 Kyle Nelson            | LS
 John Malecki           | G
 Nathan Bussey          | LB
 Robert James           | LB
 Markell Carter         | DE
 Aaron Lavarias         | DT
 Mark Dell              | WR
 Ronald Johnson         | WR
 Doug Worthington       | DT
 Derrick Jones          | WR
 Sealver Siliga         | DT
 Chase Beeler           | C
 Kenny Wiggins          | T
 Konrad Reuland         | TE
:

-- 11. The average salary for a DE in the nfl
nfl=# SELECT name, position
FROM players
ORDER BY salary ASC
LIMIT 100;
nfl=# SELECT TO_CHAR(AVG(salary), 'FM$999,999,990.00') AS average_salary
FROM players
WHERE position = 'DE';
 average_salary 
----------------
 $2,161,326.38
(1 row)
  

-- 12. The names of all the players on the Buffalo Bills
SELECT DISTINCT player_name
FROM players_teams
WHERE team_name = 'Buffalo Bills'
"David Nelson"
"Tyler Thigpen"
"Mike Caussin"
"Justin Rogers"
"Kirk Morrison"
"Kraig Urbik"
"George Wilson"
"Leodis McKelvin"
"Brad Smith"
"Chris White"
"Johnny White"
"Ruvell Martin"
"Chris Kelsay"
"Rian Lindell"
"Steve Johnson"
"Dwan Edwards"
"Lee Smith"
"Lee Evans (Buyout)"
"Andy Levitre"
"Donald Jones"
"Lionel Dotson"
"Mario Williams"
"Terrence McGee"
"Kelvin Sheppard"
"Alex Carrington"
"Kyle Moore"
"Brian Moorman"
"Scott Chandler"
"Garrison Sanborn"
"Marcell Dareus"
"Kellen Heard"
"Naaman Roosevelt"
"Drayton Florence"
"Kyle Williams"
"Michael Jasper"
"C.J. Spiller"
"Corey McIntyre"
"Jairus Byrd"
"Fred Jackson"
"Nick Barnett"
"Chad Rinehart"
"Kamar Aiken"
"Fendi Onobun"
"Cordaro Howard"
"Colin Brown"
"Sam Young"
"Jarron Gilbert"
"Chris Hairston"
"DaNorris Searcy"
"Arthur Moats"
"Eric Wood"
"Aaron Williams"
"Spencer Johnson"
"Ryan Fitzpatrick"
"Shawne Merriman"
"Erik Pears"
"Marcus Easley"
"Torell Troup"
"Dan Batten"

-- 13. The total salary of all players on the New York Giants
  SELECT SUM(salary)
FROM players
WHERE team_id = 18;

74179466

-- 14. The player with the lowest salary on the Green Bay Packers
nfl=# SELECT player_name
FROM players_teams
WHERE team_name = 'Green Bay Packers'
ORDER BY salary ASC;
nfl=# SELECT player_name
FROM players_teams
WHERE team_name = 'Green Bay Packers'
ORDER BY salary ASC
LIMIT 10;
   player_name    
------------------
 Shaky Smithson
 Ray Dominguez
 Alexander Green
 Davon House
 Lawrence Guy
 M.D. Jennings
 D.J. Smith
 Brandon Saine
 D.J. Williams
 Jamari Lattimore
(10 rows)
 
