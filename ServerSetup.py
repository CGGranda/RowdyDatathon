import csv
import numpy
import psycopg2
import pandas as pd

conn = psycopg2.connect("dbname=postgres user=postgres password=manaphy122")

#COPY nchs("Year", "Location", "Sex", "Race", "Weight")
#FROM 'D:\Datathon\Clean_Natality.csv'
#DELIMITER ','
#CSV HEADER;

#COPY seer("Year","State_abb","State_fips","County","Registry","Race","Origin","Sex","Age","Population")
#FROM 'D:\Datathon\seerdata.csv'
#DELIMITER ','
#CSV HEADER;

#COPY seer("STATEFP10","COUNTYFP10","COUNTYNS10","NAME10","NAMELSAD10","ssp22020","ssp22025","ssp22030","race","state","county")
#FROM 'D:\Datathon\Copy of hauer_county_NH_pop_SSPs.xlsx - county_other_race.csv'
#DELIMITER ','
#CSV HEADER;

#COPY seer("STATEFP10","COUNTYFP10","COUNTYNS10","NAME10","NAMELSAD10","ssp22020","ssp22025","ssp22030","race","state","county")
#FROM 'D:\Datathon\Copy of hauer_county_NH_pop_SSPs.xlsx - county_white(1).csv'
#DELIMITER ','
#CSV HEADER;

#COPY seer("STATEFP10","COUNTYFP10","COUNTYNS10","NAME10","NAMELSAD10","ssp22020","ssp22025","ssp22030","race","state","county")
#FROM 'D:\Datathon\Copy of hauer_county_NH_pop_SSPs.xlsx - county_black(1).csv'
#DELIMITER ','
#CSV HEADER;

#COPY seer("STATEFP10","COUNTYFP10","COUNTYNS10","NAME10","NAMELSAD10","ssp22020","ssp22025","ssp22030","race","state","county")
#FROM 'D:\Datathon\Copy of hauer_county_NH_pop_SSPs.xlsx - county_hispanic.csv'
#DELIMITER ','
#CSV HEADER;
