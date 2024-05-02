/* 
Question 1:
Can you find out the total milk production for 2023? Your manager wants this information for the yearly report.
*/
SELECT
  SUM(Value) as Total_Production -- value is the amount brought in from that product
FROM milk_production
WHERE 
  Year = 2023

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
ORDER BY Value DESC

-- Answer: There are two states hat produced over $100 million in April 2023 - Wisconsin and California.

------------------------------------------------------------------------------------------------------------------------------------------------
  /*
Question 3
Your manager wants to know how coffee production has changed over the years. What is the total value of coffee production for 2011?
*/
SELECT *
FROM coffee_production
WHERE Year = 2011

-- Answer: Total value of coffee production in 2011 was $7,600,000.

------------------------------------------------------------------------------------------------------------------------------------------------
/*
Question 4
There's a meeting with the Honey Council next week. Find the average honey production for 2022 so we're prepared.
*/
SELECT
  AVG(Value)
FROM honey_production
WHERE Year = 2022

-- Answer: 2022's average honey production was $3,133,275.

-------------------------------------------------------------------------------------------------------------------------------------------------























