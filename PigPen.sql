-- Database: postgres

-- DROP DATABASE IF EXISTS postgres;

CREATE DATABASE postgres
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE postgres
    IS 'default administrative connection database';
    
-- SCHEMA: public

-- DROP SCHEMA IF EXISTS public ;

CREATE SCHEMA IF NOT EXISTS public
    AUTHORIZATION postgres;

COMMENT ON SCHEMA public
    IS 'standard public schema';

GRANT ALL ON SCHEMA public TO PUBLIC;

GRANT ALL ON SCHEMA public TO postgres;

-- Table: public.nchs

-- DROP TABLE IF EXISTS public.nchs;

CREATE TABLE IF NOT EXISTS public.nchs
(
    "Year" smallint,
    "Sex" smallint,
    "Race" smallint,
    "Weight" smallint,
    "Location" character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.nchs
    OWNER to postgres;

-- Table: public.sedac_black

-- DROP TABLE IF EXISTS public.sedac_black;

CREATE TABLE IF NOT EXISTS public.sedac_black
(
    "STATEFP10" smallint,
    "COUNTYFP10" smallint,
    "COUNTYNS10" bigint,
    "NAME10" character varying(50) COLLATE pg_catalog."default",
    "NAMELSAD10" character varying(50) COLLATE pg_catalog."default",
    ssp22020 double precision,
    ssp22025 double precision,
    ssp22030 double precision,
    race smallint,
    state smallint,
    county smallint
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.sedac_black
    OWNER to postgres;

-- Table: public.sedac_hispanic

-- DROP TABLE IF EXISTS public.sedac_hispanic;

CREATE TABLE IF NOT EXISTS public.sedac_hispanic
(
    "STATEFP10" smallint,
    "COUNTYFP10" smallint,
    "COUNTYNS10" bigint,
    "NAME10" character varying(50) COLLATE pg_catalog."default",
    "NAMELSAD10" character varying(50) COLLATE pg_catalog."default",
    ssp22020 double precision,
    ssp22025 double precision,
    ssp22030 double precision,
    race smallint,
    state smallint,
    county smallint
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.sedac_hispanic
    OWNER to postgres;

-- Table: public.sedac_other_race

-- DROP TABLE IF EXISTS public.sedac_other_race;

CREATE TABLE IF NOT EXISTS public.sedac_other_race
(
    "STATEFP10" smallint,
    "COUNTYFP10" smallint,
    "COUNTYNS10" bigint,
    "NAME10" character varying(50) COLLATE pg_catalog."default",
    "NAMELSAD10" character varying(50) COLLATE pg_catalog."default",
    ssp22020 double precision,
    ssp22025 double precision,
    ssp22030 double precision,
    race smallint,
    state smallint,
    county smallint
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.sedac_other_race
    OWNER to postgres;

-- Table: public.sedac_white

-- DROP TABLE IF EXISTS public.sedac_white;

CREATE TABLE IF NOT EXISTS public.sedac_white
(
    "STATEFP10" smallint,
    "COUNTYFP10" smallint,
    "COUNTYNS10" bigint,
    "NAME10" character varying(50) COLLATE pg_catalog."default",
    "NAMELSAD10" character varying(50) COLLATE pg_catalog."default",
    ssp22020 double precision,
    ssp22025 double precision,
    ssp22030 double precision,
    race smallint,
    state smallint,
    county smallint
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.sedac_white
    OWNER to postgres;

-- Table: public.seer

-- DROP TABLE IF EXISTS public.seer;

CREATE TABLE IF NOT EXISTS public.seer
(
    "Year" smallint NOT NULL,
    "Sex" smallint NOT NULL,
    "Age" smallint NOT NULL,
    "Race" smallint NOT NULL,
    "Population" bigint,
    "Origin" smallint,
    "State_abb" character varying COLLATE pg_catalog."default",
    "State_fips" smallint,
    "County" smallint,
    "Registry" smallint
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.seer
    OWNER to postgres;

COPY nchs("Year", "Location", "Sex", "Race", "Weight")
FROM 'D:\Datathon\Clean_Natality.csv'
DELIMITER ','
CSV HEADER;

COPY seer("Year","State_abb","State_fips","County","Registry","Race","Origin","Sex","Age","Population")
FROM 'D:\Datathon\seerdata.csv'
DELIMITER ','
CSV HEADER;

COPY seer("STATEFP10","COUNTYFP10","COUNTYNS10","NAME10","NAMELSAD10","ssp22020","ssp22025","ssp22030","race","state","county")
FROM 'D:\Datathon\Copy of hauer_county_NH_pop_SSPs.xlsx - county_other_race.csv'
DELIMITER ','
CSV HEADER;

COPY seer("STATEFP10","COUNTYFP10","COUNTYNS10","NAME10","NAMELSAD10","ssp22020","ssp22025","ssp22030","race","state","county")
FROM 'D:\Datathon\Copy of hauer_county_NH_pop_SSPs.xlsx - county_white(1).csv'
DELIMITER ','
CSV HEADER;

COPY seer("STATEFP10","COUNTYFP10","COUNTYNS10","NAME10","NAMELSAD10","ssp22020","ssp22025","ssp22030","race","state","county")
FROM 'D:\Datathon\Copy of hauer_county_NH_pop_SSPs.xlsx - county_black(1).csv'
DELIMITER ','
CSV HEADER;

COPY seer("STATEFP10","COUNTYFP10","COUNTYNS10","NAME10","NAMELSAD10","ssp22020","ssp22025","ssp22030","race","state","county")
FROM 'D:\Datathon\Copy of hauer_county_NH_pop_SSPs.xlsx - county_hispanic.csv'
DELIMITER ','
CSV HEADER;
