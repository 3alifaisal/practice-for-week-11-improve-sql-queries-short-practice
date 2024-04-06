----------
-- Step 0 - Create a Query 
----------
-- Query: Select all cats that have a toy with an id of 5

    -- Your code here

SELECT cats.* FROM cats JOIN cat_toys ON cats.id = cat_toys.cat_id
                WHERE toy_id = 5;
-- Paste your results below (as a comment):
-- 4002|Rachele|Maroon|Foldex Cat
-- 31|Rodger|Lavender|Oregon Rex
-- 77|Jamal|Orange|Sam Sawet
-- Run Time: real 0.005 user 0.002230 sys 0.001050
SELECT * FROM cats WHERE id IN (SELECT cat_id FROM cat_toys WHERE toy_id = 5);


----------
-- Step 1 - Analyze the Query
----------
-- Query:
--     QUERY PLAN
-- |--SEARCH toys USING INTEGER PRIMARY KEY (rowid=?) // searching through foreign key
-- |--SCAN cat_toys // scanning for this toy 
-- `--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)  // searching through foreign key
-- Run Time: real 0.001 user 0.000162 sys 0.000165 // after caching improvement
    -- Your code here




    first attempt failed
    --  CREATE INDEX idx_toys_name ON toys(name);
    second attempt worked
         CREATE UNIQUE  INDEX idx_covering_index ON cat_toys(toy_id,cat_id);

Run Time: real 0.001 user 0.000151 sys 0.000190
final result


    -- Is the new index being applied in this query?
yesssss


---------------------------------
-- Notes From Further Exploration
---------------------------------
WHAT I LEARNT, sqlllite wouldnt use a badly constructed index
unless the index is actually faster it will opt to scan,
its important to use the actual column we are using in the query
and we can "Force" sql to use it if its the first one passed in the index