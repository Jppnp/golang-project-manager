-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';
-- +goose StatementEnd

CREATE SCHEMA IF NOT EXISTS pm_schema;

CREATE TABLE pm_schema.position (
    id SERIAL primary key,
    name varchar(255)
);

CREATE TABLE pm_schema.users (
    id BIGSERIAL primary key,
    name varchar(255),
    username varchar(255) not null,
    password varchar(255) not null,
    position INT
);

ALTER TABLE pm_schema.users
    ADD FOREIGN KEY (position) REFERENCES pm_schema.position(id);
