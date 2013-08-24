#!/bin/python
#
# Base Case: We know that the computation 
# stops at n = 0 and that 0! is 1.
#
# Recursive step: We know that
# n! = n * (n - 1) * (n - 2)...3 * 2 * 1
#    = n * (n - 1)!
def factorial(n):
    """
    Returns the factorial of n 
    """
    if n == 0:
        return 1
    return n * factorial(n - 1)
