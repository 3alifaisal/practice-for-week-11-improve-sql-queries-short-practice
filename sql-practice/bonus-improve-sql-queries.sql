----------
-- Step 0 - Create a Query 
----------
-- Query: Find a count of `toys` records that have a price greater than
    -- 55 and belong to a cat that has the color "Olive".

    -- Your code here
    -- SELECT COUNT(*) FROM toys WHERE toys.id IN 
    --     (SELECT toy_id FROM cat_toys WHERE cat_toys.cat_id IN
    --     (SELECT cats.id FROM cats WHERE cats.color LIKE ("Olive")))
    --     AND toys.price >55;


  
  

        SELECT COUNT(*) FROM toys 
            JOIN cat_toys ON toys.id = cat_toys.toy_id
            JOIN cats ON cats.id = cat_toys.cat_id 
            WHERE price > 55 AND cats.color = "Olive";

-- Paste your results below (as a comment):
-- QUERY PLAN
-- |--SCAN cat_toys
-- |--SEARCH toys USING INTEGER PRIMARY KEY (rowid=?)
-- `--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)
-- Run Time: real 0.000 user 0.000062 sys 0.000093



----------
-- Step 1 - Analyze the Query
----------
-- Query:

    -- I DIDN'T USE TIMING BECAUSE JOIIN IS REALLY FAST ANW 

-- Paste your results below (as a comment):
-- |--SEARCH cats USING COVERING INDEX idx_cats_color (color=?)
-- |--SEARCH cat_toys USING COVERING INDEX idx_covering_cat_id_toy_id (cat_id=?)
-- `--SEARCH toys USING INTEGER PRIMARY KEY (rowid=?)
-- Run Time: real 0.001 user 0.000177 sys 0.000115

-- -- What do your results mean?

    -- Was this a SEARCH or SCAN?
CREATE INDEX idx_cats_color ON cats(color);
CREATE UNIQUE  INDEX idx_covering_cat_id_toy_id ON cat_toys(cat_id,toy_id);
    -- What does that mean?




----------
-- Step 2 - Time the Query to get a baseline
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here

-- Paste your results below (as a comment):




----------
-- Step 3 - Add an index and analyze how the query is executing
----------

-- Create index:

    -- Your code here

-- Analyze Query:
    -- Your code here

-- Paste your results below (as a comment):


-- Analyze Results:

    -- Is the new index being applied in this query?




----------
-- Step 4 - Re-time the query using the new index
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here

-- Paste your results below (as a comment):


-- Analyze Results:
    -- Are you still getting the correct query results?


    -- Did the execution time improve (decrease)?


    -- Do you see any other opportunities for making this query more efficient?



---------------------------------
-- Notes From Further Exploration
---------------------------------
so what i realised is that there is a certain sqllite works than I
need to learn more about with time, first of all its really important 
ti u