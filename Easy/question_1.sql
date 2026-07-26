/*
==================================================================================================
NOTE: 
    Solution for the question is at the end of the file. Feel 
    free to copy the DDL and Insert Queries.
==================================================================================================
Q: Management wants to analyze only employees with official job titles. Find the title(s) 
   of the worker(s) with the highest salary among workers who have a corresponding record in 
   the  title  table. If multiple employees have the same highest salary, include all their job titles.

*/

/* ===== WORKER TABLE ===== */

CREATE TABLE Worker(
	worker_id    INT PRIMARY KEY,
	first_name   NVARCHAR(500),
	last_name    NVARCHAR(500),
	salary       INT,
	joining_date DATE,
	department   NVARCHAR(50)
);

INSERT INTO Worker (
    worker_id,
    first_name,
    last_name,
    salary,
    joining_date,
    department
)
VALUES
(1,  'Monika',  'Arora',   100000, '2014-02-20', 'HR'),
(2,  'Niharika','Verma',    80000, '2014-06-11', 'Admin'),
(3,  'Vishal',  'Singhal', 300000, '2014-02-20', 'HR'),
(4,  'Amitah',  'Singh',   500000, '2014-02-20', 'Admin'),
(5,  'Vivek',   'Bhati',   500000, '2014-06-11', 'Admin'),
(6,  'Vipul',   'Diwan',    200000, '2014-06-11', 'Account'),
(7,  'Satish',  'Kumar',     75000, '2014-01-20', 'Account'),
(8,  'Geetika', 'Chauhan',   90000, '2014-04-11', 'Admin'),
(9,  'Agepi',   'Argon',     90000, '2015-04-10', 'Admin'),
(10, 'Moe',     'Acharya',   65000, '2015-04-11', 'HR'),
(11, 'Nayah',   'Laghari',   75000, '2014-03-20', 'Account'),
(12, 'Jai',     'Patel',     85000, '2014-03-21', 'HR'),
(13, 'Jura',    'Jomun',    980000, '2013-05-20',	'HR');
-------------------------------------------------------------------------------------------
/* ===== TITLE TABLE ===== */
CREATE TABLE title(
	worker_ref_id  INT,
	worker_title   NVARCHAR(50),
	affected_from  DATE
);

INSERT INTO Title (
    worker_ref_id,
    worker_title,
    affected_from
)
VALUES
(1, 'Manager', '2016-02-20'),
(2, 'Executive', '2016-06-11'),
(8, 'Executive', '2016-06-11'),
(5, 'Manager', '2016-06-11'),
(4, 'Asst. Manager', '2016-06-11'),
(7, 'Executive', '2016-06-11'),
(6, 'Lead', '2016-06-11'),
(3, 'Lead', '2016-06-11');

-----------------------------------------------------------------------------------------
SELECT * FROM WORKER
SELECT * FROM TITLE

-- ===== Answer =====
SELECT 
	t.worker_title AS "best_paid_title"
FROM worker w
INNER JOIN title t
ON w.worker_id = t.worker_ref_id
WHERE w.salary = (SELECT 
	                  MAX(salary)
                  FROM worker w
                  INNER JOIN title t
                  ON w.worker_id = t.worker_ref_id)



