DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS reviewers;

CREATE TABLE videos (
vid_id real PRIMARY KEY,
title TEXT NOT NULL,
length FLOAT,
url VARCHAR(350) NOT NULL);
INSERT INTO videos(vid_id, title, length, url)
VALUES 
(1, "Despacito", 4.41, "https://www.youtube.com/watch?v=kJQP7kiw5Fk"),
(2, "Mi Gente", 3.05, "https://www.youtube.com/watch?v=wnJ6LuUFpMo"),
(3, "Chantaje", 3.20, "https://www.youtube.com/watch?v=6Mgqbai3fKo");

CREATE TABLE reviewers (
reviewer_id real PRIMARY KEY,
vid_id int NOT NULL REFERENCES videos,
reviewer VARCHAR(255) NOT NULL,
rating real,
comment text);

INSERT INTO reviewers (reviewer_id, vid_id, reviewer, rating, comment)
VALUES (1, 1, "Michael", 5, "Who just came to check the views?"),
(2, 1, "Steve", 3, "I prefer the original version without JB"),
(3, 2, "Jackson", 4, "Latino Gang, Let go!"),
(4, 3, "Morgan", 3, "I've heard this song so many times."),
(5, 3, "David", 5, "How many Non Spanish people love this song?"),
(6, 3, "Rachel",5, "Who will listen this song in 2030?");

SELECT * From videos 
JOIN reviewers ON videos.vid_id = reviewers.vid_id