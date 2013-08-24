#!/bin/python
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
