CREATE SCHEMA IF NOT EXISTS test_schema; -- create a schema

CREATE TABLE IF NOT EXISTS 
    test_schema.test_table ( -- name of schema want to create into + name of table

     
        column_1 SERIAL, -- serial gives a sequence of number for each row
        column_2 INTEGER,
        column_3 INTEGER NOT NULL
    );

-- not breaking any constraints in this sample
INSERT INTO test_schema.test_table (column_2, column_3) -- Insert value into column 2 and 3
VALUES (2, 3);