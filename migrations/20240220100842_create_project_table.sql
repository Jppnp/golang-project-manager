-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';
-- +goose StatementEnd

CREATE TABLE pm_schema.project(
    id BIGSERIAL primary key,
    project_title varchar(255) not null,
    project_des varchar(255)
);

CREATE TABLE pm_schema.subtask(
    id BIGSERIAL primary key,
    title varchar(255) not null,
    descript varchar(255),
    assignee BIGINT,
    project_id BIGINT
);

ALTER TABLE pm_schema.subtask
    ADD FOREIGN KEY (assignee) REFERENCES pm_schema.users(id);

ALTER TABLE pm_schema.subtask
    ADD FOREIGN KEY (project_id) REFERENCES pm_schema.project(id);