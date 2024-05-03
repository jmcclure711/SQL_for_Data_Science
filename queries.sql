/* 
Question 1:
Can you find out the total milk production for 2023? Your manager wants this information for the yearly report.
*/
SELECT
  SUM(Value) as Total_Production -- value is the amount brought in from that product
FROM milk_production
WHERE 
  Year = 2023;

-- Answer: $91,812,000,000

-----------------------------------------------------------------------------------------------------------------------------------------------
/*
Question 2
Which states had cheese production greater than 100 million in April 2023? The Cheese Department wants to focus their marketing efforts there. 
*/
SELECT
  c.State_ANSI,
  c.Year,
  c.Period,
  s.State,
  c.Value
FROM cheese_production c
JOIN state_lookup ON c.State_ANSI = s.State_ANSI
WHERE
  c.Year = 2023
  AND c.Period = 'APR'
ORDER BY Value DESC;

-- Answer: There are two states hat produced over $100 million in April 2023 - Wisconsin and California.

------------------------------------------------------------------------------------------------------------------------------------------------
  /*
Question 3
Your manager wants to know how coffee production has changed over the years. What is the total value of coffee production for 2011?
*/
SELECT *
FROM coffee_production
WHERE Year = 2011;

-- Answer: Total value of coffee production in 2011 was $7,600,000.

------------------------------------------------------------------------------------------------------------------------------------------------
/*
Question 4
There's a meeting with the Honey Council next week. Find the average honey production for 2022 so we're prepared.
*/
SELECT
  AVG(Value)
FROM honey_production
WHERE Year = 2022;

-- Answer: 2022's average honey production was $3,133,275.

-------------------------------------------------------------------------------------------------------------------------------------------------
/*
Question 5
The State Relations team wants a list of all states names with their corresponding ANSI codes. Can you generate that list?
*/
SELECT
  State,
  State_ANSI
FROM state_lookup
WHERE State = 'FLORIDA';
  
-- What is Florida's ANSI code?
  
SELECT
  State,
  State_ANSI
FROM state_lookup
WHERE State = 'FLORIDA';

-- Answer: Florida's ANSI code is 12.

-------------------------------------------------------------------------------------------------------------------------------------------------
/*
Question 6
For a cross-commodity report, can you list all states with their cheese production values, even if they didn't produce any cheese in April of 2023?
*/
SELECT
  s.State,
  c.Value
FROM cheese_production c
JOIN state_lookup s ON c.State_ANSI = s.State_ANSI
WHERE 
  Year = 2023
  AND Period = 'APR'
ORDER BY Value DESC;

-- What is the total for NEW JERSEY?

SELECT
  s.State,
  c.Value
FROM cheese_production c
JOIN state_lookup s ON c.State_ANSI = s.State_ANSI
WHERE 
  Year = 2023
  AND Period = 'APR'
  AND State = 'NEW JERSEY'
ORDER BY Value DESC;

-- Answer: New Jersey's cheese production value in April of 2023 was $4,889,000.

-----------------------------------------------------------------------------------------------------------------------------------------------
/*
Question 7
Can you find the total yogurt production for states in the year 2022 which also have cheese production data from 2023? This will help the Dairy Division in their planning.
*/
SELECT
  s.State,
  SUM(y.Value) AS total_production
FROM 
    yogurt_production y
JOIN 
    state_lookup s ON y.State_ANSI = s.State_ANSI
WHERE 
  y.Year = 2022
  AND y.State_ANSI in (
    SELECT DISTINCT c.State_ANSI
    FROM cheese_production c
    WHERE c.Year = 2023
  )
GROUP BY s.State;

/* There are two states that fit this criteria (New York and California). 
Yogurt production during 2022:
- New York: $377,839,000
- Califonia: $793,256,000
- Total: $1,171,095,000
*/

----------------------------------------------------------------------------------------------------------------------------------------------
/*
Question 8
List all states from state_lookup that are missing from milk_production in 2023.
*/
SELECT
  s.State
FROM 
  state_lookup s
LEFT JOIN 
  milk_production m ON s.State_ANSI = m.State_ANSI AND m.Year = 2023
WHERE 
  m.State_ANSI IS NULL;

/* 
How many states are there?
- There are 26 states that are not part of milk_production in 2023.
*/

----------------------------------------------------------------------------------------------------------------------------------------------
/*
Question 9
List all states with their cheese production values, including states that didn't produce any cheese in April 2023.
*/
SELECT 
	s.State,
	c.Value
FROM cheese_production c 
JOIN 
	state_lookup s ON c.State_ANSI = s.State_ANSI 
WHERE 
	c.Year = 2023
	AND c.Period = 'APR'
ORDER BY State

/*Did Delaware produce any cheese in April 2023?
Answer: No, Delaware was not part of cheese production in 2023.
*/

---------------------------------------------------------------------------------------------------------------------------------------------
/*
Question 10
Find the average coffee production for all years where the honey production exceeded 1 million.
*/
SELECT 
	AVG(c.Value) 
FROM coffee_production c
WHERE 
	c.Year IN (
		SELECT Year
		FROM honey_production h
		WHERE h.Value > 1000000
	);














