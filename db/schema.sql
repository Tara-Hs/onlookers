CREATE DATABASE onlookers_app;

-- connect to the db! thanks emil!

DROP TABLE log_entries;

CREATE TABLE reports (
    id SERIAL PRIMARY KEY,
    report_name TEXT,
    date TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT,
    password TEXT
);

CREATE TABLE log_entries (
    id SERIAL PRIMARY KEY,
    report_id INT,
    content TEXT,
    timestamp  TIMESTAMPTZ,
    longitude TEXT NOT NULL,
    latitude TEXT NOT NULL,
    CONSTRAINT fk_report FOREIGN KEY (report_id) REFERENCES reports(id) ON DELETE CASCADE
);

INSERT INTO reports (report_name, date) VALUES ('dummy report name', '29/03/2021');

INSERT INTO log_entries (report_id, content, timestamp, longitude, latitude) VALUES ('01', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2003-04-12 04:05:06 AEST', '-27.444035119267646', '153.02748981956103');









-- CREATE TABLE media ( 
--     id SERIAL PRIMARY KEY,
--     report_id INT,
--     timestamp  TIMESTAMPTZ,
--     CONSTRAINT fk_report FOREIGN KEY (report_id) REFERENCES reports(id)
-- );