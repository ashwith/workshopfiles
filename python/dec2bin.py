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

# This problem has two base cases.
# 1. The obvious one is n == 1. This means we've reached
#    the end of our decimal to binary conversion and
#    need to just return "1"
# 2. The not so obvious one is n == 0. This occurs only 
#    when we call dec2bin(0)
# The recursive step is quite obvious now. In each step
# we need to just calculate the remainder of n/2
# and hope that the recursion gives use the rest of the
# binary number. Therefore we write 
#              dec2bin(n/2) + str(n%2)

def dec2bin(n):
    """
    Returns a string containing the binary representation of n.

    Keyword arguments:
    n -- a whole number.
    """
    if n == 0:
        return "0"
    if n == 1:
        return "1"
    else:
        return dec2bin(n/2) + str(n%2)
