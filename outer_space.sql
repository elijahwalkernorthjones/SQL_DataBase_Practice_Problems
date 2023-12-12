-- from the terminal run:
-- psql < outer_space.sql
-- Drop the existing database if it exists
DROP DATABASE IF EXISTS outer_space;

-- Create a new database
CREATE DATABASE outer_space;

-- Connect to the new database
\c outer_space;

-- Create table for Galaxies
CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Insert data into the Galaxies table
INSERT INTO galaxies (name) VALUES
  ('Milky Way');

-- Create table for Stars
CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies(id)
);

-- Insert data into the Stars table
INSERT INTO stars (name, galaxy_id) VALUES
  ('The Sun', 1),
  ('Proxima Centauri', 1),
  ('Gliese 876', 1);

-- Create table for Moons
CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Insert data into the Moons table
INSERT INTO moons (name) VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');

-- Create table for Planets
CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  star_id INTEGER REFERENCES stars(id),
  moons_ids INTEGER[] REFERENCES moons(id),
  UNIQUE (name, star_id)
);

-- Insert data into the Planets table
INSERT INTO planets
  (name, orbital_period_in_years, star_id, moons_ids)
VALUES
  ('Earth', 1.00, 1, '{1}'),
  ('Mars', 1.88, 1, '{2, 3}'),
  ('Venus', 0.62, 1, '{}'),
  ('Neptune', 164.8, 1, '{4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}'),
  ('Proxima Centauri b', 0.03, 2, '{}'),
  ('Gliese 876 b', 0.23, 3, '{}');
