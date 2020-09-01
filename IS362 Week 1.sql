 /* Redjol Olli
	IS362 Week 1 
    Assignment: SQL and Tableau
    */
 



-- Question 1: 
    
-- Airlines with listed speed is 23

SELECT 
	COUNT(*)FROM planes where speed > 0;

-- Minimum listed speed is 90

SELECT 
	MIN(speed)FROM planes;

-- Maximum listed Speed is 432.

SELECT 
	MAX(speed) FROM planes;


-- Question 2:

-- Total dist flown by all planes in January 2013 is 27,188,805	

	SELECT
    SUM(distance) AS 'Total Distance'
    FROM flights
		WHERE (year = 2013 AND month = 1);

-- Total dist flown by all planes in January 2013 where the tailnum is missing is 81,763											

	SELECT
    SUM(distance) AS 'Total NULL Distance'
    FROM flights
		WHERE (year = 2013
		AND month = 1
		AND tailnum IS NULL);

-- Question 3: Inner join
--  How do your results compare?
-- INNER JOIN shows all the results with the rows they have in common and it does not include NULL values in the results. 
-- The LEFT OUTER JOIN however includes NULL values in the results. Also it includes all the rows it has in common with the other table.
    
    SELECT planes.manufacturer,SUM(distance) AS 'Total Dist'
	FROM flights
	INNER JOIN planes
		ON flights.tailnum = planes.tailnum
		WHERE (
			flights.year = 2013 
			AND flights.month = 7 
			AND flights.day = 5)
		GROUP BY manufacturer;
        

    SELECT planes.manufacturer,SUM(distance) AS 'Total Dist'
	FROM flights
	LEFT OUTER JOIN planes
		ON flights.tailnum = planes.tailnum
		WHERE (
			flights.year = 2013 
            AND flights.month = 7 
            AND flights.day = 5)
		GROUP BY manufacturer;


-- Question 4: Write and answer at least one question of your own
-- choosing that joins information from at least three of
-- the tables in the flights database. 
    
-- Which airline that is designed to accommodate a maximum of 55 air passengers flew the most from JFK?
-- Answer: Endeavor Air Inc. 4793 times

	SELECT COUNT(flights.origin), airlines.name
	FROM flights INNER JOIN airlines
	ON flights.carrier = airlines.carrier
	INNER JOIN planes
		ON flights.tailnum = planes.tailnum
		WHERE flights.origin = 'JFK'
		AND planes.seats = '55'
	GROUP BY airlines.name;