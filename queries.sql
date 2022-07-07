/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';

SELECT name from animals WHERE date_of_birth BETWEEN 'Jan-01-2016' AND 'Dec-31-2019';

SELECT name from animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

SELECT * from animals WHERE neutered = true;

SELECT * from animals WHERE name NOT IN ('Gabumon');

SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT COUNT(*) FROM animals;

SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT name, escape_attempts FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

SELECT name, neutered FROM animals WHERE neutered = true;

SELECT name, neutered FROM animals WHERE neutered = false;

SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN 'Jan-01-1990' AND 'Dec-31-2000' GROUP BY species;