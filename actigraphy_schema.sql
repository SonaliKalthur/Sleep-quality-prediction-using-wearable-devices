--CREATE ROLE act_user
--  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
--
--CREATE ROLE acttest LOGIN PASSWORD 'acttest'
--  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
--GRANT act_user TO acttest;

-- CREATE SCHEMA actiware
--       AUTHORIZATION dbtest;
-- COMMENT ON SCHEMA actiware
--  IS 'Example schema for Actiware actigraphy data';
-- SET SCHEMA actiware

CREATE TYPE activity_interval_type AS ENUM ('REST', 'ACTIVE','SLEEP', 'EXCLUDED', 'DAILY' );

CREATE TABLE actiwatch_recording (
	actigraph_id SERIAL PRIMARY KEY,
	subject_id VARCHAR,
	subject_age_years INTEGER,
	subject_gender VARCHAR,
	actiwatch_type VARCHAR,
	collection_start TIMESTAMP WITHOUT TIME ZONE,
	tz_offset INTEGER, -- in seconds
--	collection_end TIMESTAMP WITH TIME ZONE, -- redundant
	logging_mode VARCHAR,
	epoch_length_seconds INTEGER,
--	num_samples INTEGER, -- redundant
--	samples_per_day INTEGER, -- redundant
	actiwatch_id VARCHAR,
	when_battery_installed VARCHAR,
	actiwatch_fw_version VARCHAR,
	num_resets INTEGER,
	activity_calibration_factor INTEGER,
	white_calibration_factor INTEGER,
	red_calibration_factor INTEGER,
	green_calibration_factor INTEGER,
	blue_calibration_factor INTEGER,
	activity_data SMALLINT[],
	activity_status activity_interval_type[]
);


CREATE TABLE actiwatch_interval_stats (
	actigraph_id INTEGER NOT NULL REFERENCES actiwatch_recording,
	intervalType activity_interval_type NOT NULL,
	intervalNum INTEGER NOT NULL,
	PRIMARY KEY (actigraph_id, intervalType, intervalNum),
	startDate DATE,
	startTime TIME,
	endDate DATE,
	endTime TIME,
	duration REAL, -- (minutes)
	totalActivity REAL, -- (counts)
	avgActivity REAL, -- (counts/minute)	
	onsetLatency REAL, -- (minutes)
	efficiency REAL, -- (%)
	waso REAL, -- (minutes)
	avgWakeB REAL, -- (minutes)
	sleepTime REAL, -- (minutes)
	avgSleepB REAL, -- (minutes)
	fragmentation REAL, -- (%+%)
	exposureWhite DOUBLE PRECISION, -- (lux-minutes)
	avgWhite DOUBLE PRECISION, -- (lux)
	maxWhite DOUBLE PRECISION, -- (lux)
	taltWhite REAL, -- (minutes)
	invalidWhite REAL, -- (%)
	avgEpochActivity REAL,
	stdActivity REAL,
	maxActivity SMALLINT,
	invTimeActivity REAL,
	invTimeSleepWake REAL,
	percentActInv REAL,
	percentInvSleepWake REAL,
	snoozeTime REAL,
	wakeTime REAL,
	percentWake REAL,
	numWakeBouts SMALLINT,
	percentSleep REAL,
	numSleepBouts SMALLINT
);

---- This query can be used to obtain the values in the same order as in an example CSV file
--SELECT 
--	actigraph_id,
--	intervalType,
--	intervalNum,
--	startDate,
--	to_char(startDate, 'Dy'),
--	startTime,
--	endDate,
--	to_char(endDate, 'Dy'),
--	endTime,
--	duration,
--	totalActivity,
--	avgActivity,
--	avgEpochActivity,
--	stdActivity,
--	maxActivity,
--	invTimeActivity,
--	percentActInv,
--	invTimeSleepWake,
--	percentInvSleepWake,
--	onsetLatency,
--	snoozeTime,
--	efficiency,
--	waso,		
--	wakeTime,
--	percentWake,
--	numWakeBouts,
--	avgWakeB,
--	sleepTime,
--	percentSleep,
--	numSleepBouts,
--	avgSleepB,
--	fragmentation,
--	exposureWhite,
--	avgWhite,
--	maxWhite,
--	taltWhite,
--	invalidWhite
--FROM main.actiwatch_interval_stats 
--WHERE actigraph_id=?;