/* ===== facebook_posts ===== */

CREATE TABLE facebook_posts (
	post_id INT PRIMARY KEY,
	poster INT,
	post_txt NVARCHAR(500),
	post_keywords NVARCHAR(500),
	post_date DATE
);

INSERT INTO facebook_posts
VALUES(0, 2, 'The Lakers game from last night was great.', '[basketball, lakers, nba]', '2019-01-01'),
      (1, 1, 'Lebron James is top class.', '[basketball,lebron_james,nba]', '2019-01-02'),
	  (2, 2, 'Asparagus tastes OK.', '[asparagus,food]', '2019-01-01'),
	  (3, 1, 'Spaghetti is an Italian food.', '[spaghetti,food]', '2019-01-02'),
	  (4, 3, 'User 3 is not sharing interests', '[#spam#]', '2019-01-01'),
	  (5, 3, 'User 3 posts SPAM content a lot', '[#spam#]', '2019-01-02');


-----------------------------------------------------------------------------------------------
/* ===== facebook_reactions ===== */

CREATE TABLE facebook_reactions(
	poster INT,
	friend INT,
	reaction NVARCHAR(500),
	date_day INT,
	post_id INT,
	CONSTRAINT FK_facebook_reactions_posts
        FOREIGN KEY (post_id)
        REFERENCES facebook_posts(post_id)
);

INSERT INTO facebook_reactions 
VALUES(2, 1, 'like', 1, 0),
      (2, 6, 'like', 1, 0),
	  (1, 2, 'like', 1, 1),
	  (1, 3, 'heart', 1, 1),
	  (1, 4, 'like', 1, 1),
	  (1, 5, 'heart', 1, 1),
	  (1, 6, 'like', 1, 1),
	  (2, 1, 'like', 2, 2),
	  (2, 6, 'like', 2, 2),
	  (1, 2, 'like', 2, 3),
	  (1, 3, 'like', 2, 3),
	  (1, 4, 'like', 2, 3),
	  (1, 5, 'like', 2, 3),
	  (1, 6, 'like', 2, 3),
	  (2, 1, 'laugh', 1, 0),
	  (2, 6, 'laugh', 1, 1),
	  (1, 2, 'laugh', 1, 0),
	  (1, 3, 'laugh', 1, 3),
	  (1, 4, 'laugh', 1, 4);
---------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM facebook_posts
SELECT * FROM facebook_reactions

-- Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

SELECT 
    fp.*
FROM facebook_posts fp
INNER JOIN facebook_reactions fr
ON fp.post_id = fr.post_id 
WHERE reaction = 'heart'
GROUP BY fp.post_id, fp.poster, fp.post_txt, fp.post_keywords, fp.post_date

