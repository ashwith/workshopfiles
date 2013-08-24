#!/bin/python
# Remember that horner method works like this
# Suppose you have the polynomial:
#
# 5x^4 + 10x^3 + 7x^2 + 2x + 9.
#
# We compute it's value for a particular x0 like so:
#
# +-------------------------------------+
# |((((5) * x0 + 10) * x0 + 7) * x0 + 2)| * x0 + 9
# |    ^                                |   ------
# |Base Case                            | Current Step
# +-------------------------------------+
#            Recursive Step
#
# Suppose we put the coefficients in a list like this:
# [5, 10, 7, 2, 9]
#
# We can see that we can work starting from the outside
# and trust the recursion to do the rest. This is the 
# recursive step.
# The base case is when we have only one coefficient.

def horner(coeff, x):
    """
    Evaluates the value of a polynomial using Horner's method.

    Keyword arguments:
    coeff -- a list containing the coefficients. Highest degree first.
             Coefficients whose value is zero must be there too.
    x     -- the value of the independent variable at which the 
             polynomial must be evaluated.
    """
    if len(coeff) == 1:
        return coeff[0]
    return horner(coeff[:-1], x) * x + coeff[-1]
