-- MODIFICAR RESTRICIONES EN LA TABLA ----------------------------------------
ALTER TABLE followers 
ADD CONSTRAINT check_follower_id
CHECK (follower_id <> following_id); -- Asegura que no coincida el id following y el follower

ALTER TABLE users
ADD column country VARCHAR(100);