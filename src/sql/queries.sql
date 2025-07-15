-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1

-- 1.) What are the first 10 recorded observations?
SELECT * FROM observations
LIMIT 10;

-- 2.) Which region identifiers (region_id) appear in the data?
SELECT DISTINCT region_id 
FROM observations;

-- 3.) How many distinct species (species_id) have been observed?
SELECT COUNT (DISTINCT species_id) AS different_species_observed 
FROM  observations;

-- 4.) How many observations are there for the region with region_id = 2?
SELECT COUNT (region_id) AS num_of_observations_region_2 
FROM observations
WHERE region_id = 2;

-- 5.) How many observations were recorded on 1998-08-08?
SELECT * FROM observations
WHERE observation_date = '1998-08-08';

-- MISSION 2

-- 6.) Which region_id has the most observations?
SELECT region_id, COUNT (region_id) AS numb_of_observations
FROM observations
GROUP BY region_id
ORDER BY numb_of_observations DESC
LIMIT 1;

-- 7.) What are the 5 most frequent species_id?
SELECT species_id, COUNT (species_id) AS total_amount
FROM observations
GROUP BY species_id
ORDER BY total_amount DESC
LIMIT 5;

-- 8.) Which species (species_id) have fewer than 5 records?
SELECT species_id, COUNT (species_id) AS total_amount
FROM observations
GROUP BY species_id
HAVING total_amount < 5;

-- 9.) Which observers (observer) recorded the most observations?
SELECT observer, COUNT (observer) AS total_observations
FROM observations
GROUP BY observer
ORDER BY total_observations DESC;

-- MISSION 3

-- 10.) Show the region name (regions.name) for each observation.
SELECT DISTINCT region_id, name 
FROM observations
JOIN regions ON observations.region_id = regions.id;

-- 11.) Show the scientific name of each recorded species (species.scientific_name).
SELECT DISTINCT species_id, scientific_name 
FROM observations
JOIN species ON observations.species_id = species.id;

-- 12.) Which is the most observed species in each region?
SELECT name AS region , scientific_name, COUNT(scientific_name) AS total
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id
GROUP BY region
ORDER BY total DESC;

-- MISSION 4

-- 13.) Insert a new fictitious observation into the observations table.
INSERT INTO observations (species_id, region_id, observer, observation_date, latitude, longitude, count)
VALUES (5, 3, 'obsr467532', '2025-07-04', -15.934561, 150.394718, 225);

-- 14.) Correct the scientific name of a species with a typo.
UPDATE species
SET scientific_name = 'White-winged Triller'
WHERE scientific_name = 'White-winged Thriller';

-- 15.) Delete a test observation (use its id).
DELETE FROM observations
WHERE id = 6;