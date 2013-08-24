#
#    Copyright (c) 2013 Ashwith Jerome Rego
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

#!/bin/python
from time import time
from sort import *
from search import *


# Read the file containing a number list or word list.
print "Enter Filename",
fileName = raw_input()
l = []
try:
    fileHandle = open(fileName, 'r')
    startTime = time()
    for line in fileHandle:
        line = line.strip('\n')
        if line.isdigit():
            l += [int(line)]
        else:
            l += [line.lower()]

    stopTime = time()
    print "List loaded in " + str(stopTime - startTime) + " seconds."
    print
    fileHandle.close()
except IOError:
    print "File not found"
    quit()


# Choose sorting algorithm and sort the list.
choice = -1
while choice != 0:
    print "Choose sorting algorithm"
    print "1. Bubble Sort (You may regret it)"
    print "2. Merge Sort"
    print 
    print "0. Quit"
    choice = raw_input()
    if choice.isdigit():
        choice = int(choice)
    else:
        choice = -1
    if choice == 1:
        print "Don't tell me I didn't warn you"
        startTime = time()
        l = sortBubble(l)
        stopTime = time()
        print "Bubble sort has taken " + str(stopTime - startTime) + " seconds."
        print
        break
    elif choice == 2:
        startTime = time()
        l = sortMerge(l)
        stopTime = time()
        print "Merge sort has taken " + str(stopTime - startTime) + " seconds."
        print
        break
    elif choice == 0:
        print "Quitting..."
        quit()
    else:
        print "Incorrect choice. Try again..."
    print


# Ask for the item to be looked for.
print "What do you want to look for?",
key = raw_input().lower()
if key.isdigit():
    key = int(key)
print

# Choose the searching algorithm, search for the item
# and print results.
choice = -1
while choice != 0:
    print "Choose searching algorithm"
    print "1. Linear Search (Good luck!)"
    print "2. Binary Search"
    print 
    print "0. Quit"
    choice = raw_input()
    if choice.isdigit():
        choice = int(choice)
    else:
        choice = -1

    if choice == 1:
        print "Time to get some coffee..."
        startTime = time()
        idx = searchLinear(l, key)
        stopTime = time()
        print "Searching complete using Linear Search in " + str(stopTime - startTime) + " seconds."
        if idx == -1:
            print "No element called " + str(key) + " found in list."
        else:
            print "Key found at entry " + str(idx + 1) + " of list."
        print
        break
    elif choice == 2:
        startTime = time()
        idx = searchBinary(l, key)
        stopTime = time()
        print "Searching complete using Binary Search in " + str(stopTime - startTime) + " seconds."
        if idx == -1:
            print "No element called " + str(key) + " found in list."
        else:
            print "Key found at entry " + str(idx + 1) + " of list."
        print
        break
    elif choice == 0:
        print "Quitting..."
        quit()
    else:
        print "Incorrect choice. Try again..."
    print

