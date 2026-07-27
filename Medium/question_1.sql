/*
==================================================================================================
NOTE: 
    Solution for the question is at the end of the file. Feel 
    free to copy the DDL and Insert Queries.
==================================================================================================
Q: Calculate each user's average session time, where a session is defined as the time difference 
   between a page_load and a page_exit. Assume each user has only one session per day. If there are 
   multiple page_load or page_exit events on the same day, use only the latest page_load and the 
   earliest page_exit. Only consider sessions where the page_load occurs before the page_exit on 
   the same day. Output the user_id and their average session time.

*/

/* ===== facebook_web_log ===== */

CREATE TABLE facebook_web_log (
    user_id INT,
    timestamp DATETIME,
    action VARCHAR(20)
);

INSERT INTO facebook_web_log (user_id, [timestamp], action)
VALUES
(0, '2019-04-25 13:30:15', 'page_load'),
(0, '2019-04-25 13:30:18', 'page_load'),
(0, '2019-04-25 13:30:40', 'scroll_down'),
(0, '2019-04-25 13:30:45', 'scroll_up'),
(0, '2019-04-25 13:31:10', 'scroll_down'),
(0, '2019-04-25 13:31:25', 'scroll_down'),
(0, '2019-04-25 13:31:40', 'page_exit'),

(1, '2019-04-25 13:40:00', 'page_load'),
(1, '2019-04-25 13:40:10', 'scroll_down'),
(1, '2019-04-25 13:40:15', 'scroll_down'),
(1, '2019-04-25 13:40:20', 'scroll_down'),
(1, '2019-04-25 13:40:25', 'scroll_down'),
(1, '2019-04-25 13:40:30', 'scroll_down'),
(1, '2019-04-25 13:40:35', 'page_exit'),

(2, '2019-04-25 13:41:21', 'page_load'),
(2, '2019-04-25 13:41:30', 'scroll_down'),
(2, '2019-04-25 13:41:35', 'scroll_down'),
(2, '2019-04-25 13:41:40', 'scroll_up'),

(1, '2019-04-26 11:15:00', 'page_load'),
(1, '2019-04-26 11:15:10', 'scroll_down'),
(1, '2019-04-26 11:15:20', 'scroll_down'),
(1, '2019-04-26 11:15:25', 'scroll_up'),
(1, '2019-04-26 11:15:35', 'page_exit'),

(0, '2019-04-28 14:30:15', 'page_load'),
(0, '2019-04-28 14:30:10', 'page_load'),
(0, '2019-04-28 13:30:40', 'scroll_down'),
(0, '2019-04-28 15:31:40', 'page_exit'),

(0, '2019-04-25 13:30:00', 'page_load'),
(0, '2019-04-25 13:30:20', 'page_load'),
(0, '2019-04-25 13:30:40', 'page_exit');
-------------------------------------------------------------------------------------------------
SELECT * FROM facebook_web_log

/* ===== ANSWER ===== */

WITH sessions AS
(
    SELECT
        user_id,
        CAST([timestamp] AS DATE) AS session_date,

        MAX(CASE 
                WHEN action = 'page_load'
                THEN [timestamp]
            END) AS latest_page_load,

        MIN(CASE
                WHEN action = 'page_exit'
                THEN [timestamp]
            END) AS earliest_page_exit
    FROM facebook_web_log
    GROUP BY 
        user_id,
        CAST([timestamp] AS DATE)
)

SELECT
    user_id,
    AVG(
        CAST(
            DATEDIFF(
                SECOND,
                latest_page_load,
                earliest_page_exit
            ) AS DECIMAL(10, 2)
        )
    ) AS avg_session_time
FROM sessions
WHERE 
    latest_page_load IS NOT NULL
    AND
    earliest_page_exit IS NOT NULL
    AND
    latest_page_load < earliest_page_exit
GROUP BY 
    user_id


