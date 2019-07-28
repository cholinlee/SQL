#Q1 
SELECT dest, distance 
FROM flights
GROUP BY distance DESC;

 # The flight from JFK to HNL is the furthest distance away.


#Q2  
SELECT engines,
MAX(seats)
FROM planes
Group BY engines;


#Q3
SELECT COUNT(*)
FROM flights;

# The total number of flights is 336,776.

#Q4
SELECT carrier, COUNT(*)
FROM flights
GROUP BY carrier;

-- 9E	18,460
-- AA	32,729
-- AS	714
-- B6	54,635
-- DL	48,110
-- EV	54,173
-- F9	685
-- FL	3,260
-- HA	342
-- MQ	26,397
-- OO	32
-- UA	58,665
-- US	20,536
-- VX	5,162
-- WN	12,275
-- YV	601

# Q5
SELECT carrier, COUNT(*)
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC;

# Q6
SELECT carrier, COUNT(*)
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

-- UA	58,665
-- B6	54,635
-- EV	54,173
-- DL	48,110
-- AA	32,729
-- MQ	26,397
-- US	20,536
-- 9E	18,460
-- WN	12,275
-- VX	5,162
-- FL	3,260
-- AS	714
-- F9	685
-- YV	601
-- HA	342
-- OO	32

# Q7

SELECT carrier, COUNT(*)
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

-- UA	41,135
-- B6	30,022
-- DL	28,096
-- AA	23,583
-- EV	6,248


# Q8: Show the total number of flights that had no delays on 01/01/2013
SELECT COUNT(*)
From flight
WHERE arr_delay <=0
And month = 01 and day =01 and year =2013

# 370 flights had no delays on 01/01/2013