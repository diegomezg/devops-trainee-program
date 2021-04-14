#Create a python script that could be executed in the terminal, the script will accept a path
# as first parameter printing a list of files on that directory.
from os import listdir
from os.path import isfile, join
mypath=input('Enter path to list:')
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
for i in onlyfiles:
    print(i)