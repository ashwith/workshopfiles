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

import pylab
import random
import math

#=================================================================
#          Radioactive Decay - Monte Carlo Simulation            #
#=================================================================


def simRadio(nMolecules, halfLife, nTrials, tStop, tStep):
    """
    Performs a Monte Carlo Simulation for radioactive decay

    Keyword arguments:
    nMolecules -- number of molecules in the material
    halfLife   -- Half life of the material in time units
    nTrials    -- Number of simulation trials to be performed
    tStop      -- Stop time for each simulation in time units
    tStep      -- Step time in simulation for each time unit.

    Return a list of time coordinates and a list of the average
    number of molecules at each time step.
    """

    # Calculate the decay constants,
    # the number of simulation steps
    k = math.log(2)/halfLife
    nSteps = int(tStop/tStep)

    # initialize list to store average number
    # of molecules after each simulations step
    nMol = [0] * nSteps

    # First loop - runs through each trial
    for index_i in range(nTrials):
        tmpNMolecules = nMolecules

        # Seond loop - runs through each simulations step
        for index_j in range(nSteps):

            # Third loop - decide the fate of each molecule
            # in a simulation step. Delete it randomly
            # probability k
            for index_k in range(tmpNMolecules):
                if random.uniform(0,1) <= k*tStep:
                    tmpNMolecules -= 1
            nMol[index_j] += tmpNMolecules
    
    tAxis = []
    # Calculate the average for each simulation step
    # and the coordinates for the time axis
    for index_i in range(nSteps):
        nMol[index_i] /= float(nTrials)
        tAxis += [index_i*tStep]

    return [0] + tAxis, [nMolecules] + nMol

def testSim():
    nMolecules = 100
    nTrials = 1000
    tStop = 15
    tStep = 0.1
    halfLife = 2
    pylab.figure();
    t, y =  simRadio(nMolecules, halfLife, nTrials, tStop, tStep)
    pylab.plot(t, y)
    pylab.title("Radioactive Decay - Monte Carlo Simulation")
    pylab.xlabel("Time")
    pylab.ylabel("Number of Molecules")
    pylab.text(6, 90, "Simulated Half Life = " + str(y[int(2/tStep)]) + " time units.")
    pylab.show()
