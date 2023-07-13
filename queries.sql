/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth between '2016-01-01' and '2019-01-01';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight >= 10.4 AND weight <= 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals
ROLLBACK;

SELECT * FROM animals;

BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
SELECT * FROM animals;

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
SELECT * FROM animals;

COMMIT;

BEGIN;

DELETE FROM animals;
SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

BEGIN;

DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT sp1;

UPDATE animals
SET weight = weight * -1;

ROLLBACK TO sp1;

UPDATE animals
SET weight = weight * -1
WHERE weight < 0;

COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight) FROM animals;

SELECT AVG(escape_attempts) as Avg_Escape_Attempts,
neutered
FROM animals
GROUP BY neutered;

SELECT species,
MIN(weight) as Min_Weight,
MAX(weight) as Max_Weight
FROM animals
GROUP BY species;

SELECT species,
AVG(escape_attempts) as Avg_Escape_Attempts
FROM animals
WHERE
date_of_birth >= '1990-01-01' AND
date_of_birth <= '2000-12-31'
GROUP BY species;

SELECT full_name, name AS animals
FROM animals JOIN owners
ON animals.owner_id = owners.id
WHERE owners.id = 4;

SELECT species.name AS species,
animals.name 
FROM animals JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT
  full_name AS owner,
  animals.name AS animal
FROM owners LEFT JOIN animals
ON owners.id = animals.owner_id;

SELECT
  species.name AS species,
  COUNT (species_id)
FROM animals JOIN species
ON animals.species_id = species.id
GROUP BY species;

SELECT
species.name AS species,
animals.name AS animal_name,
owners.full_name as owner_name
FROM owners
JOIN animals
ON owner_id = owners.id
JOIN species
ON species_id = species.id
WHERE species.name = 'Digimon'
AND full_name = 'Jennifer Orwell';

SELECT
animals.name AS animal_name,
owners.full_name AS owner_name,
escape_attempts
FROM animals
JOIN owners
ON owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
AND escape_attempts = 0;

SELECT full_name AS owner_name,
COUNT(owner_id) AS animals
FROM owners JOIN animals
ON owner_id = owners.id
GROUP BY full_name
ORDER BY COUNT(owner_id) DESC
LIMIT 1;