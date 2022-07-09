/* Populate database with sample data. */

INSERT INTO animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,weight_kg
)
VALUES (
    001,
    'Agumon',
    'Feb-03-2020',
    0,
    true,
    10.23
);

INSERT INTO animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,weight_kg
)
VALUES (
    002,
    'Gabumon',
    'Nov-15-2018',
    2,
    true,
    8
);

INSERT INTO animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,weight_kg
)
VALUES (
    003,
    'Pikachu',
    'Jan-07-2021',
    1,
    false,
    15.04
);

INSERT INTO animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,weight_kg
)
VALUES (
    004,
    'Devimon',
    'May-12-2017',
    5,
    true,
    11
);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
)
VALUES (
    'Charmander',
    'Feb-08-2020',
    0,
    false,
    -11
);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
)
VALUES (
    'Plantmon',
    'Nov-15-2021',
    2,
    true,
    -5.7
);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
)
VALUES (
    'Squirtle',
    'Apr-02-1993',
    3,
    false,
    -12.13
);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
)
VALUES (
    'Angemon',
    'Jun-12-2005',
    1,
    true,
    -45
);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
)
VALUES (
    'Boarmon',
    'Jun-07-2005',
    7,
    true,
    20.4
);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
)
VALUES (
    'Blossom',
    'Oct-13-1998',
    3,
    true,
    17
);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
)
VALUES (
    'Ditto',
    'May-14-2022',
    4,
    true,
    22
);

INSERT INTO owners (
    full_name,
    age
)
VALUES (
    'Sam Smith',
    34
),
(
    'Jennifer Orwell',
    19
),
(
    'Bob',
    45
),
(
    'Melody Pond',
    77
),
(
    'Dean Winchester',
    14
),
(
    'Jodie Whittaker',
    38
);

INSERT INTO species (
    name
)
VALUES (
    'Pokemon'
),
(
    'Digimon'
);

UPDATE animals
 SET species_id=(SELECT id FROM species WHERE name='Digimon')
  WHERE name LIKE '%mon'
;

UPDATE animals
 SET species_id=(SELECT id FROM species WHERE name='Pokemon')
  WHERE species_id IS NULL
;

UPDATE animals
 SET owner_id=(SELECT id FROM owners WHERE full_name ='Sam Smith')
  WHERE name = 'Agumon'
;

UPDATE animals
 SET owner_id=(SELECT id FROM owners WHERE full_name ='Jennifer Orwell')
  WHERE name IN ('Gabumon', 'Pikachu')
;

UPDATE animals
 SET owner_id=(SELECT id FROM owners WHERE full_name ='Bob')
  WHERE name IN ('Devimon', 'Plantmon')
;

UPDATE animals
 SET owner_id=(SELECT id FROM owners WHERE full_name ='Melody Pond')
  WHERE name IN ('Charmander', 'Squirtle', 'Blossom')
;

UPDATE animals
 SET owner_id=(SELECT id FROM owners WHERE full_name ='Dean Winchester')
  WHERE name IN ('Angemon', 'Boarmon')
;

INSERT INTO vets (
    name,
    age,
    date_of_graduation
)
VALUES (
    'William Tatcher',
    45,
    'Apr-23-2000'
),
(
    'Maisy Smith',
    26,
    'Jan-17-2019'
),
(
    'Stephanie Mendez',
    64,
    'May-04-1981'
),
(
    'Jack Harkness',
    38,
    'Jun-08-2008'
);

INSERT INTO specializations (
    species_id,
    vet_id
)
VALUES (
    (SELECT id FROM species WHERE species.name = 'Pokemon'),
    (SELECT id FROM vets WHERE vets.name = 'William Tatcher')
),
(
    (SELECT id FROM species WHERE species.name = 'Digimon'),
    (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez')
),
(
    (SELECT id FROM species WHERE species.name = 'Pokemon'),
    (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez')
),
(
    (SELECT id FROM species WHERE species.name = 'Digimon'),
    (SELECT id FROM vets WHERE vets.name = 'Jack Harkness')
);

INSERT INTO visits (
    animal_id,
    vet_id,
    date_of_visit
)
VALUES (
    (SELECT id FROM animals WHERE animals.name = 'Agumon'),
    (SELECT id FROM vets WHERE vets.name = 'William Tatcher'),
    'May-24-2020'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Agumon'),
    (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'),
    'Jul-22-2020'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Gabumon'),
    (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'),
    'Feb-02-2021'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Pikachu'),
    (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
    'Jan-05-2020'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Pikachu'),
    (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
    'Mar-08-2020'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Pikachu'),
    (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
    'May-14-2020'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Devimon'),
    (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'),
    'May-04-2021'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Charmander'),
    (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'),
    'Feb-24-2021'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Plantmon'),
    (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
    'Dec-21-2019'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Plantmon'),
    (SELECT id FROM vets WHERE vets.name = 'William Tatcher'),
    'Aug-10-2020'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Plantmon'),
    (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
    'Apr-07-2021'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Squirtle'),
    (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'),
    'Sep-29-2019'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Angemon'),
    (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'),
    'Oct-03-2020'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Angemon'),
    (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'),
    'Nov-04-2020'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Boarmon'),
    (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
    'Jan-24-2019'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Boarmon'),
    (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
    'May-15-2019'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Boarmon'),
    (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
    'Feb-27-2020'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Boarmon'),
    (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'),
    'Aug-03-2020'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Blossom'),
    (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'),
    'May-24-2020'
),
(
    (SELECT id FROM animals WHERE animals.name = 'Blossom'),
    (SELECT id FROM vets WHERE vets.name = 'William Tatcher'),
    'Jan-11-2021'
);