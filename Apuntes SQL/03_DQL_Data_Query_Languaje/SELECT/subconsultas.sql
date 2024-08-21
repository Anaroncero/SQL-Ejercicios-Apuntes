SELECT publication_id, text, user_id
FROM publication 
WHERE user_id IN(
	SELECT following_id
	from followers 
	group by following_id
	HAVING COUNT(*)  > 2
);