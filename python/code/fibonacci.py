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

# There are two base cases for this function.
# We know this because the series is defined
# with the first two values being 0 and 1.
#
# The recursive step is quite obvious from 
# definition of the fibonacci series.
# We add the previous two elements.
# This function is not efficient and we'll
# fix it in a later example.
def fibonacci(n):
    """
    Returns the nth term of the Fibonacci Series.
    """
    if n == 1:
        return 0
    if n == 2:
        return 1
    return fibonacci(n - 1) + fibonacci(n - 2)
