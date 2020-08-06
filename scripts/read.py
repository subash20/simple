#!/usr/bin/env python

import os,time
import sys,csv

file=open(sys.argv[1],'r')

#for item in csv.reader(file):

for item in csv.reader(file,delimiter='\t'):
	#x= str(item[0])
#	print "value:",item[0] +"\t" + item[2]
        print "value:",item[2]
        time.sleep(5)
	
	#print str(item[0])
