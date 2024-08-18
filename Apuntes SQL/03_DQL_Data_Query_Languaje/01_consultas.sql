SELECT follower_id, following_id FROM followers;
SELECT follower_id FROM followers WHERE following_id = 1;
SELECT COUNT(follower_id) AS followers FROM followers WHERE following_id = 1;

SELECT following_id, COUNT(follower_id) AS followers
FROM followers
GROUP BY following_id 
ORDER BY followers DESC
LIMIT 3;


SELECT users.user_id, users.user_name followign_id, COUNT(follower_id) AS followers
FROM followers
INNER JOIN users
ON users.user_id = followers.following_id
GROUP BY following_id
ORDER BY followers DESC
LIMIT 3;