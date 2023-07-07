-- from the terminal run:
-- psql < music.sql

-- DROP DATABASE IF EXISTS music;

-- CREATE DATABASE music;

-- \c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,

--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),

--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),

--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),

--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),

--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),

--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),

--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),

--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),

--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),


--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE albums
(
id SERIAL PRIMARY KEY,
title TEXT NOT NULL,
release_date DATE NOT NULL,
artist_id INTEGER REFERENCES artists (id)
);

CREATE TABLE producers
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE songs
(
id SERIAL PRIMARY KEY,
title TEXT NOT NULL,
duration_in_seconds INTEGER NOT NULL,
release_date DATE NOT NULL,
album_id INTEGER REFERENCES albums (id),
producer_id INTEGER REFERENCES producers (id)
);

INSERT INTO artists (name) VALUES ('Hanson'), ('Queen'), ('Mariah Carey'), ('Boyz II Men'), ('Lady Gaga'),
('Bradley Cooper'), ('Nickelback'), ('Jay Z'), ('Alicia Keys'), ('Katy Perry'), ('Juicy J'), ('Maroon 5'),
('Christina Aguilera'), ('Avril Lavigne'), ('Destiny''s Child');

INSERT INTO albums (title, release_date, artist_id) VALUES
('Middle of Nowhere', '1997-04-15', 1),
('A Night at the Opera', '1975-10-31', 2),
('Daydream', '1995-11-14', 3),
('A Star Is Born', '2018-09-27', 4),
('Silver Side Up', '2001-08-21', 7),
('The Blueprint 3', '2009-10-20', 9),
('Prism', '2013-12-17', 10),
('Hands All Over', '2011-06-21', 12),
('Let Go', '2002-05-14', 14),
('The Writing''s on the Wall', '1999-11-07', 15);

INSERT INTO producers (name) VALUES ('Dust Brothers'), ('Stephen Lironi'), ('Roy Thomas Baker'),
('Walter Afanasieff'), ('Benjamin Rice'), ('Rick Parashar'), ('Al Shux'), ('Max Martin'),
('Cirkut'), ('Shellback'), ('Benny Blanco'), ('The Matrix'), ('Darkchild');

INSERT INTO songs (title, duration_in_seconds, release_date, album_id, producer_id) VALUES
('MMMBop', 238, '1997-04-15', 1, 1),
('Bohemian Rhapsody', 355, '1975-10-31', 2, 3),
('One Sweet Day', 282, '1995-11-14', 3, 4),
('Shallow', 216, '2018-09-27', 4, 5),
('How You Remind Me', 223, '2001-08-21', 5, 6),
('New York State of Mind', 276, '2009-10-20', 6, 7),
('Dark Horse', 215, '2013-12-17', 7, 9),
('Moves Like Jagger', 201, '2011-06-21', 8, 11),
('Complicated', 244, '2002-05-14', 9, 12),
('Say My Name', 240, '1999-11-07', 10, 13);