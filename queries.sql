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

SELECT owners.full_name as owner, COUNT(animals.id) FROM animals
 JOIN owners ON (animals.owner_id = owners.id) GROUP BY owners.full_name ORDER BY COUNT(animals.id) DESC LIMIT 1
;

SELECT animals.name AS animal_name, vets.name AS vet_name, date_of_visit  FROM animals
 JOIN visits ON animals.id = animal_id
  JOIN vets ON vet_id = vets.id
   WHERE vets.name='William Tatcher'
    ORDER BY date_of_visit DESC LIMIT 1;

SELECT vets.name AS vet_name, COUNT(DISTINCT animals.name) FROM animals
 JOIN visits ON animals.id = animal_id
  JOIN vets ON vet_id = vets.id
   WHERE vets.name='Stephanie Mendez'
    GROUP BY vets.name;

SELECT vets.name AS vet_name, species.name AS type FROM vets
 LEFT JOIN specializations ON vet_id = vets.id
  LEFT JOIN species ON species.id=species_id;

SELECT animals.name AS animal_name, vets.name AS vet_name, date_of_visit FROM animals
 JOIN visits ON animals.id = animal_id
  JOIN vets ON vet_id = vets.id
   WHERE vets.name='Stephanie Mendez' AND date_of_visit BETWEEN 'Apr-01-2020' AND 'Oct-30-2020';

SELECT animals.name AS animal_name, COUNT(animals.name) FROM animals
 JOIN visits ON animals.id = animal_id
  GROUP BY animals.name
   ORDER BY COUNT DESC LIMIT 1;

SELECT animals.name AS animal_name, vets.name AS vet_name, date_of_visit FROM animals
 JOIN visits ON animals.id = animal_id
  JOIN vets ON vet_id = vets.id
   WHERE vets.name='Maisy Smith'
    ORDER BY date_of_visit ASC LIMIT 1;

SELECT animals.name AS animal_name, vets.name AS vet_name, date_of_visit FROM animals
 JOIN visits ON animals.id = animal_id
  JOIN vets ON vet_id = vets.id
   ORDER BY date_of_visit DESC LIMIT 1;

SELECT COUNT(*) as visits_with_not_specialized_vet FROM visits
 JOIN vets ON (vets.id = visits.vet_id)
  JOIN animals ON (animals.id = visits.animal_id)
   WHERE animals.species_id NOT IN (
    SELECT COALESCE(specializations.species_id,0)
     FROM vets
      LEFT JOIN specializations ON (specializations.vet_id = vets.id)
       WHERE vets.id = visits.vet_id
);

SELECT species.name AS type, COUNT(species.name) FROM visits
 JOIN animals ON animals.id = visits.animal_id
  JOIN vets ON visits.vet_id = vets.id
   JOIN species ON species.id = species_id
    WHERE vets.name='Maisy Smith'
     GROUP BY species.name;