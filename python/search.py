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
