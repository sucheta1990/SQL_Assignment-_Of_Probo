create database Proba;
use Proba;
CREATE TABLE Team(
USER_ID VARCHAR(20),
POLL_ID VARCHAR(50),
POLL_OPTION_ID VARCHAR(50),
AMOUNT  DECIMAL(7,2) ,
CREATED_DT DATE);

-- INSERT THE VALUES INTO THE TABLE
INSERT INTO team VALUES
( 'id1','p1','A',200,'2021-12-01'),
( 'id2','p1','C',250,'2021-12-01'),
( 'id3','p1','A',200,'2021-12-01'),
( 'id4','p1','B',500,'2021-12-01'),
( 'id5','p1','C',50,'2021-12-01'),
( 'id6','p1','D',500,'2021-12-01'),
( 'id7','p1','C',200,'2021-12-01'),
( 'id8','p1','A',100,'2021-12-01');
-- SELECT * FROM TEAM;
WITH 
NONWINNER_TOTAL AS ( SELECT SUM(AMOUNT) NONWINNER_INVESTED FROM TEAM WHERE POLL_OPTION_ID <>'C'),
WINNER_TOTAL AS (SELECT SUM(AMOUNT) WINNER_INVESTED FROM TEAM WHERE POLL_OPTION_ID='C')
SELECT USER_ID"USER_ID",AMOUNT+((AMOUNT/(SELECT WINNER_INVESTED FROM WINNER_TOTAL))*(SELECT NONWINNER_INVESTED FROM NONWINNER_TOTAL)) "RETURNS" FROM TEAM WHERE POLL_OPTION_ID ='C'

