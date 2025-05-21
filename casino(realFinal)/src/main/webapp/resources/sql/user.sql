CREATE TABLE users (
    id VARCHAR(100) NOT NULL ,
    name VARCHAR(100) NOT NULL,
    recommenderCode VARCHAR(100) NOT NULL,
    passwd VARCHAR(50) NOT NULL,
    balance INT DEFAULT 0,
    PRIMARY KEY (id)
);


	
desc users;

SELECT * FROM users;

UPDATE users
SET recommenderCode = "abcdef"
WHERE id = 'admin';

ALTER TABLE users
ADD COLUMN recommenderCode VARCHAR(100) ;