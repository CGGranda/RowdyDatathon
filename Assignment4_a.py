import csv
from fileinput import close
import numpy
import psycopg2
import pandas as pd

def fileReader(filename):
    row = 0
    open('Clean_Natality.csv', mode="w")
    close
    with pd.read_csv(filename, chunksize=1000) as reader:
        for chunk in reader:
            row+=1
            print(row)
            #Date, Location, Sex, Race, BirthWeight
            df_new = chunk.iloc[:, [0,6,8,12,35]]
            df_new.to_csv('Clean_Natality.csv', mode='a', index=False, header=False)
                


def main():
    fileReader("every-20-rows-natality.csv")
    
main()