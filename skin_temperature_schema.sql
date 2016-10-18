--CREATE ROLE skin_user
--  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
--
--CREATE ROLE skintest LOGIN PASSWORD 'acttest'
--  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
--GRANT skin_user TO subtest;

-- CREATE SCHEMA skin_temperature
--       AUTHORIZATION dbtest;
-- COMMENT ON SCHEMA skintemperature_recording
-- SET SCHEMA skintemperature_recording

CREATE TABLE skintemperature_recording (
	record_id INTEGER NOT NULL,
	subject_id VARCHAR,
	PRIMARY KEY (record_id, subject_id),
	sensor_site VARCHAR,
	sampling_interval REAL, -- in seconds
	start_time TIMESTAMP WITHOUT TIME ZONE,
	temperature REAL[]
);
