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

SELECT name, full_name FROM owners
 JOIN animals ON owners.id = animals.owner_id
 WHERE full_name = 'Melody Pond'
;

SELECT animals.name, species.name AS animal_type FROM animals
 JOIN species ON species_id = species.id
 WHERE species.name = 'Pokemon'
;

SELECT full_name, name AS animal_name FROM owners
 LEFT JOIN animals ON owners.id = animals.owner_id
;

SELECT COUNT(animals.name), species.name FROM animals
 JOIN species ON species_id=species.id GROUP BY species.name
;

SELECT animals.name AS animal_name, full_name AS owner, species.name AS type FROM animals
 JOIN owners ON owner_id=owners.id
  JOIN species ON species_id=species.id
   WHERE full_name='Jennifer Orwell' AND species.name='Digimon'
;

SELECT animals.name AS animal_name, escape_attempts, full_name AS owner FROM animals
 JOIN owners ON owner_id=owners.id
   WHERE full_name='Dean Winchester' AND escape_attempts = 0
;

SELECT owners.full_name as owner, count(animals.id) FROM animals
 JOIN owners ON (animals.owner_id = owners.id) GROUP BY owners.full_name ORDER BY count(animals.id) DESC LIMIT 1
;
