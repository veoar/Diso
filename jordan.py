#This is a python script which creates the traits file as a csv to be used in scoary. You need to rename the first column urself and also there is a hidden <U+FEFF> in the first 1:1. Need to remove using vim filename :set nobomb :wq
# This was made in cooperation with Alexandra Baousi

#Ty issac
#read file .xls

#create new file csv

#first coloumn all is results GCF
#second coloumn add crisprs (if >0, its 1, else 0)
#same thing for nb cas


#problem not counting first row when converting to np array

import pandas as pd
import numpy

#import file and convert to numpy array
file = "merged_Final.xls"
df = pd.read_excel(file)
#print(df)
data = df.to_numpy()
print(data[0])

#print(data)

#New data array
newData = []

#Temp variables
Name = ""
Crisp = 0
Cas = 0
#Main loop
for row in data:
    #if new results row found
    if row[0].startswith("Res"):
        if Crisp > 1:
            Crisp  = 1
        if Cas > 1:
            Cas = 1
        #append to new data araray
        newData.append([Name, Crisp, Cas])
        #reset temp variables
        Name = row[0]
        Crisp = 0
        Cas = 0
    #add values
    elif row[0].startswith("NZ"):
        Crisp += row[2]
        Cas += row[5]
#calculate last results cluster
newData.append([Name, Crisp, Cas])



#for i in newData:
    #print(i)
print(len(newData))

#export as csv
#traits.csv
newFile = "traits.csv"
#numpy.savetxt(newFile, newData, delimiter=",")
pd.DataFrame(newData).to_csv(newFile)
