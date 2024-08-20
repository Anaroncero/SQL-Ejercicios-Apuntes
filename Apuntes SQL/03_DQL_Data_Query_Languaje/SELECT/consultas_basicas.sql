SELECT follower_id, following_id FROM followers;
SELECT follower_id FROM followers WHERE following_id = 1;
SELECT COUNT(follower_id) AS followers FROM followers WHERE following_id = 1;

SELECT following_id, COUNT(follower_id) AS followers
FROM followers
GROUP BY following_id 
ORDER BY followers DESC
LIMIT 3;




SELECT publication_id, text, user_id
FROM publication 
WHERE user_id IN(
	SELECT following_id
	from followers 
	group by following_id
	HAVING COUNT(*)  > 2
);

SELECT publication_id, COUNT(*) AS LIKE_COUNT
FROM publication_likes
GROUP BY publication_id;


