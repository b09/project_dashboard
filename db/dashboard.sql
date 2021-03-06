DROP TABLE projectteams;
DROP TABLE members;
DROP TABLE projects;


CREATE TABLE members
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  salary INT4,
  github VARCHAR(255)
);

CREATE TABLE projects
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  budget INT4,
  type VARCHAR(255),
  start_date DATE,
  description TEXT
);

CREATE TABLE projectteams
(
  id SERIAL8 PRIMARY KEY,
  project_id INT8 REFERENCES projects(id),
  member_id INT8 REFERENCES members(id),
  UNIQUE (project_id, member_id)
);
