#!/bin/python
def searchLinear(l, e):
    """
    Searches for e in l using Linear Search.

    Keyword arguments:
    l -- A list of items.
    e -- The item that needs to be searched
    """
    for i in range(0,len(l)):
        if l[i] == e:
            return i
    return -1


def searchBinary(l, e):
    """
    Searches for e in l using Binary Search.

    Keyword arguments:
    l -- A list of items.
    e -- The item that needs to be searched
    """
    high = len(l) - 1
    low = 0
    while low<=high:
        mid = low + (high - low)/2
        if l[mid] < e:
            low = mid + 1
        elif l[mid] > e:
            high = mid - 1
        else:
            return mid
    return -1
