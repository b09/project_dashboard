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
  budget INT4
);
