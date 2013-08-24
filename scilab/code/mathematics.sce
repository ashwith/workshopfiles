//
//    Copyright (c) 2013 Ashwith Jerome Rego
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

clear;           // Clear all variables.
xdel(winsid());  // Close all graphics windows.
clc;             // Clear command window.

//Exercise 1
R1 = 20e3;
R2 = 100e3;
R3 = 10e3;
R4 = 50e3;
R5 = 5e3;
V1 = 10;
V2 = 5;
V3 = 20;
R = [(R1 + R2)    (-R2)         0       0   ;...
     (-R2)       (R2 + R4)    (-R4)     0   ;...
       0           (-R4)    (R3 + R4)   0   ;...
       0             0          0      (R5)];

V = [V1; -V2; -V3; V3];
RD2 = R;
RD3 = R;
RD2(:,2) = V;
RD3(:,3) = V;
R_det = det(R);
I2 = det(RD2)/R_det;
I3 = det(RD3)/R_det;
IR4 = I2 - I3;
disp("Current through R4 is " + string(IR4) + "A");

//Exercise 2
I = R\V;
IR4 = I(2) - I(3);
disp("Current through R4 is " + string(IR4) + "A");

//Exercise 3
A = [  7  -2   1;
       4   3  -2;
      -2  11   4];
B = [31; 9; 23];
X = A\B;
disp("x = " + string(X(1)) + ", y = " + string(X(2)) + ", z = " + string(X(3)));

//Exercise 4
//Characteristic polynomial:
// -A^3 + 2A^2 - 4A + 18I
A = [ 1,  2,  1;
     -1,  0,  3;
      2, -1,  1];
      
val = -A**3 + 2*A**2 - 4*A + 18*eye();
disp("Value of the characteristic polynomial evaluated at A is:")
disp(val);

//Exercise 5
M = rand(50,50);
evec = spec(M);
evec = gsort(abs(evec));

scf;
bar(evec);


//Exercise 6
A = [1;2;3];
B = [2;3;5];
angle = acos(sum(A.*B)/(norm(A)*norm(B))) * 180/%pi;
disp("Angle between the vectors is " + string(angle) + " degrees");

//Exercise 7
A = [ 3,  2,  1;
      2,  1,  1;
      6,  2,  4];
ARank = rank(A);
disp("The rank of the matrix");
disp(A);
disp("is " + string(ARank));

//Exercise 8
N = 100;
n = 0 : N - 1;
impulse = [zeros(1,N/2) 1 zeros(1, N/2 - 1)];
step = ones(1, N);
ramp = n;
exponential = 0.9**n;

scf;
subplot(2,2,1);
plot2d3(n - N/2, impulse);
title("Impulse Function");
xgrid(1);
subplot(2,2,2);
plot2d3(n, step);
title("Step Function");
xgrid(1);
subplot(2,2,3);
plot2d3(n, ramp);
title("Ramp Function");
xgrid(1);
subplot(2,2,4);
plot2d3(n, exponential);
title("Exponential Function");
xgrid(1);

//Exercise 9
N = 5;
k = 0 : N - 1;
NthRoots = cos(2*%pi*k/N) + %i*sin(2*%pi*k/N);
disp("The " + string(N) + "th roots of unity are");
disp(NthRoots');

//Exercise 10
function ydot = f1(x,y)
    A = 10;
    B = 2;
    ydot = A*y - B*y**2;
endfunction


x0 = 0;
x = 0:0.001:1;
Y = [];
labels = [];
for y0 = 0:1:10
    y = ode(y0, x0, x, f1);
    Y = [Y y'];
    labels = [labels ("y0 = " + string(y0))];
end

scf;
plot(x,Y);
xtitle("Logistic Equation: Population Growth", "Time", "Population");
legend(labels);
xgrid(1);

//Exercise 11
function ydot = fHL(x, y)
    halfLife = 82.7;
    k = log(2)/halfLife;
    ydot = -k * y;
endfunction
x0 = 0;
y0 = 1000;
T = 24;
x = 0:0.1:T*60;
y = ode(y0, x0, x, fHL)
scf;
plot2d(x,y);
xtitle("Radioactive Decay", "Time in minutes", "Mass of Barium -139 in grams");
xgrid(1);

//Exercise 12
function ydot = f2(x,y)
    ydot = (x^4 + y^2)/(x*y);
endfunction
y0 = 1;
x0 = 2;
x = 2:0.01:10;
y = ode(y0, x0, x, f2);

scf;
plot2d(x,y)
xtitle("ODE Example", "x", "y");
xgrid(1);

//Exercise 13
function ydot = fRLC(x,y)
    R = 10e3;
    L = 1;
    C = 1e-6;
    ydot(1) = y(2);
    ydot(2) = -(1/(L*C))*y(1) - (R/L)*y(2);
endfunction
x = 0:1e-2:1;
x0 = 0;
y0 = [2; 0];
y = ode(y0, x0, x, fRLC);
scf;
plot2d(x, y(1,:));
xtitle("RLC Transient Response: No Source",...
       "Time in seconds", "Current in Amperes");
xgrid(1);

//Exercise 14
function ydot = fRLCV(x,y)
     R = 10e3;
    L = 1;
    C = 1e-6;
    ydot(1) = y(2);
    ydot(2) = -(1/(L*C))*y(1) - (R/L)*y(2) + 10*exp(-0.9*x);
endfunction
x = 0:1e-3:1;
x0 = 0;
y0 = [0; 1000];
y = ode(y0, x0, x, fRLCV);
scf;
plot2d(x, y(1,:));
xtitle("RLC Transient Response: With Source",...
       "Time in seconds", "Current in Amperes");
xgrid(1);

//Exercise 15
function ydot = f3(x,y)
    ydot(1) = y(2);
    ydot(2) = -5*y(1) - 2*y(2) + 80*exp(-0.5*x) + 40*cos(10*x) - 190*sin(20*x);
endfunction
x = 0:1e-3:30;
x0 = 0;
y0 = [0.16; 40.08];
y = ode(y0, x0, x, f3);
scf;
plot(x, y(1,:));
xtitle("ODE Example", "x", "y");
xgrid(1);
