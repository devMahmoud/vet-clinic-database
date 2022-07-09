/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
    name text,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals ADD species varchar(50);

ALTER TABLE animals
  DROP COLUMN species
;

CREATE TABLE owners (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    full_name varchar(255),
    age integer,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    PRIMARY KEY (id)
);

ALTER TABLE animals
  ADD COLUMN species_id integer,
  ADD COLUMN owner_id integer,
  ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id),
  ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners(id)
;

CREATE TABLE vets (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    age integer,
    date_of_graduation date,
    PRIMARY KEY (id)
);

CREATE TABLE specializations (
    species_id integer NOT NULL,
    vet_id integer NOT NULL,
    CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id),
    CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id)
);

CREATE TABLE visits (
    animal_id integer NOT NULL,
    vet_id integer NOT NULL,
    date_of_visit date,
    CONSTRAINT fk_animals FOREIGN KEY (animal_id) REFERENCES animals(id),
    CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id)
);