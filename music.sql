-- Drop the database if it exists
DROP DATABASE IF EXISTS music;

-- Create a new database
CREATE DATABASE music;

-- Connect to the new database
\c music;

-- Create table for Artists
CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Insert data into the Artists table
INSERT INTO artists (name) VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Carey'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

-- Create table for Producers
CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Insert data into the Producers table
INSERT INTO producers (name) VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

-- Create the main table for Songs
CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist_ids INTEGER REFERENCES artists(id) NOT NULL,
  album TEXT NOT NULL,
  producer_ids INTEGER REFERENCES producers(id) NOT NULL
);

-- Insert data into the Songs table
INSERT INTO songs (title, duration_in_seconds, release_date, artist_ids, album, producer_ids)
VALUES
  ('MMMBop', 238, '1997-04-15', 1, 'Middle of Nowhere', 1),
  ('Bohemian Rhapsody', 355, '1975-10-31', 2, 'A Night at the Opera', 3);

