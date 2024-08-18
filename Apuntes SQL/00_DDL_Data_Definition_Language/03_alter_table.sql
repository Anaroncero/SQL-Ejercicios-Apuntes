-- MODIFICAR RESTRICIONES EN LA TABLA ----------------------------------------
ALTER TABLE followers 
ADD CONSTRAINT check_follower_id
CHECK (follower_id <> following_id);