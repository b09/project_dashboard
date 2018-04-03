DROP TABLE teamprojects;
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
  start_date DATE
);

CREATE TABLE teamprojects
(
  id SERIAL8 PRIMARY KEY,
  project_id INT8 REFERENCES projects(id),
  member_id INT8 REFERENCES members(id)
);
