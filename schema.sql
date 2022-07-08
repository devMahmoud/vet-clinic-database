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