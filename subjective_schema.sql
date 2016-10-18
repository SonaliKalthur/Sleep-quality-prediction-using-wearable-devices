--CREATE ROLE sub_user
--  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
--
--CREATE ROLE subtest LOGIN PASSWORD 'acttest'
--  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
--GRANT sub_user TO subtest;

-- CREATE SCHEMA subjective_data
--       AUTHORIZATION dbtest;
-- COMMENT ON SCHEMA subjective_data
-- SET SCHEMA subjective_
CREATE TABLE subjective_data (
	record_id INTEGER,
	No_id INTEGER,
	Participant_Record_id INTEGER,
	Participant VARCHAR,
	PRIMARY KEY (No_id, Participant),
	Pre_post INTEGER,
	Week INTEGER,
	Day_number INTEGER,
	Morning_1 INTEGER,
	Morning_2 INTEGER,
	In_lab INTEGER,
	S1_Todays_date DATE,
	S2_Time character varying,
	S3_Bed_time character varying,
	S4_Attempt_to_fall_asleep_min character varying,
	S5_How_long_to_fall_asleep_min character varying,
	S6_Wake_up_time character varying,
	S7_Sleep_duration_hours_min character varying,
	S8_Time_in_bed_before_getting_up_minutes character varying,
	S9_How_many_times_awake character varying,
	WASO_minutes character varying,
	S_10_Did_anything_disturb_your_sleep character varying,
	S_10_Noise character varying,
	S_10_Work_duties character varying,
	S_10_Thoughts_on_mind character varying,
	S_10_Toilet character varying,
	S_10_Light character varying,
	S_10_Aches_pain_physical_discomfort character varying,
	S_10_Air_temperature character varying,
	S_10_Eletronic_media character varying,
	S_10_Other character varying,
	S_11_Rate_quality_of_sleep INTEGER,
	S_12_How_sleepy_you_have_felt_5_min character varying,
	S_13_Did_you_have_any_caffeine character varying,
	S_13_Coffee_cups numeric,
	S_13_Tea_cups numeric,
	S_13_Caffeinated_soft_drinks numeric,
	S_13_Caffeine_pills_100mg numeric,
	S_14_Did_you_have_any_alcohol character varying,
	S_14_Beer numeric,
	S_14_Wine_150mL numeric,
	S_14_Spirits_30mL numeric,
	S_15_Did_exercise character varying,
	S_15_ow_many_times_exercised numeric,
	S_15_When_exercised numeric,
	S_15_For_how_long_exercised_minutes numeric,
	S_15_How_strenuous character varying,
	S_16_Did_you_nap_yesterday character varying,
	S_16_Nap_how_many_times numeric,
	S_16_Nap_start character varying,
	S_16_Nap_end character varying,
	S_17_Did_you_take_sleep_pills character varying,
	S_17_Type_of_medication character varying,
	S_18_How_many_times_removed_actiwatch character varying,
	S_18_Actiwatch_removed_at character varying,
	S_18_Actiwatch_put_back_on_at character varying
);
