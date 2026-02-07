#use Case -  List all the files in a directory and print their names and sizes. The directory path is asked from user at run time.

import os

Folders = input("Enter the directory path with space between them : ").split()
 
for folder in Folders:
    files = os.listdir()
    for f in files:
        print(f)
