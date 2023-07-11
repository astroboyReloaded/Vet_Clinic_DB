/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED BY DEFAULT AS IDENTITY
    (START WITH 1 INCREMENT  BY 1),
    name       VARCHAR(24),
    date_of_birth      DATE,
    escape_attempts    INT,
    neutered   BOOLEAN,
    weight     DECIMAL,
    PRIMARY KEY (id)
);