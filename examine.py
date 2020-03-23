import sys
import os
import os.path 
import matplotlib
matplotlib.use('Agg')
from matplotlib import pyplot as plt               
import string 
import math
import collections
import numpy as np
from os import listdir
from os.path import isfile
from os.path import join
from pathlib import Path
from collections import Counter 
 
 
#This will get my current direcotry 
directory = os.getcwd()  
 
#create path to subdirectory 
paths = sys.argv[1:]
 
#This will create my path to files 
for sub_dir in paths:
    for files in os.listdir(sub_dir):
        # xfile will hold my path to the file, joining directory, subdirectory and the file 
        xfile = os.path.join(directory, sub_dir,files)
        
        #checks if the xfile is the file that's being searched 
        if (os.path.isfile(xfile)):
            #this will open and reed the file under filehandle
            with open (xfile) as filehandle:
                
                modify_words =[lines.strip('\n') for lines in open(xfile)]
                words = []
 
                #the first for loop takes all the lines from modify_words as the arguments 
                #the second for loop takes all charachters from the lines and appends them into words 
                for lines in modify_words:
                    for chars in lines.split():
                        words.append(chars)
                # this eliminates my random symbols and numbers from my list 
                words = [word.translate(None, string.punctuation) for word in words]
                words = [word for word in words if not (word.isdigit())]
                #all_accounts
                all_accounts = collections.Counter(words)
		grapth_size = len(all_accounts)
		if len(grapth_size) > 600:
			graph_size = 600
		fig, ax = plt.subplots(figsize = (20, grapth_size))
                #historgram information
                plt.barh(range(len(all_accounts)),all_accounts.values(), align ='center')
                plt.ylabel('Words')
            	plt.xlabel('Frequency')
                plt.title("Histogram")
                plt.yticks(range(len(all_accounts)),all_accounts.keys())
		plt.savefig(xfile[0: -4] + "_hist.png")
		plt.clf()
    


                    
                   


    
        




