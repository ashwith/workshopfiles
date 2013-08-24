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
H = 100;
g = 9.8;
T = sqrt(2*H/g);

t = linspace(0,T,1000);
v = g*t;
s = H - 0.5*g*t**2;

scf;
plot2d(t, [s' v']);
xtitle("Height and Velocity of a falling body.", "Time in seconds", "Height" ...
                                             + " in meters/Velocity in"...
                                             + " meters per second");
legend("Height", "Velocity")
xgrid(1);

//Exercise 2
Io = 1e-9;
k = 1.3806488e-23;
eta = 1;
q = 1.60217657e-19;
VD = linspace(-0.5,0.5,1000);
T0 = 250;
TStep = 10;
I = [];
labels = [];
for i = 0:5
    T = T0 + i*TStep;
    VT = k*T/q;
    tmpI = Io*(exp(VD/(eta*VT)) - 1);
    I = [I tmpI'];
    labels = [labels (string(T) + "K")];
end
scf;
plot2d(VD, I);
xtitle("Diode Characteristics", "Voltage", "Current");
legend(labels);
xgrid(1);

//Exercise 3
radius = 2;
area = %pi*radius**2;
disp("Area of a circle of radius " + string(radius) + " units is " + ...
                                                string(area) + " square units")

//Exercise 4
f =100;
omega = 2*%pi*f;
VMag = 12;
VPhase = 60*%pi/180;
Vi = VMag*(cos(VPhase) + %i*sin(VPhase));
R = 100e3;
L = 1e-3;
XL = %i*omega*L;
C = 12e-12;
XC = 1. / (%i*omega*C);

VC = XC*Vi/(R + XC + XL);
[r, theta] = polar(VC);
disp("The complex voltage across the capacitor is " + string(real(r))...
+ " <" + string(real(theta)) + " Volts");

f = logspace(1, 12, 1000);
omega = 2*%pi*f;
XL = %i*omega*L;
XC = 1 ./ (%i*omega*C);

Z = R + XC + XL;
I = Vi ./ Z;
scf
plot2d("ln", omega, abs(I))
xgrid(1);

//Exercise 5
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
I = inv(R)*V;
IR4 = I(2) - I(3);
disp("Current through R4 is " + string(IR4) + "A");

//Exercise 6
function [x1, x2] = solveQuad(a,b,c)
    D = b**2 - 4*a*c;
    if D == 0 then
        x1 = -b/(2*a);
        x2 = x1;
    else
        x1 = (-b + sqrt(D))/(2*a);
        x2 = (-b - sqrt(D))/(2*a);
    end
endfunction

//Exercise 7
function y = fpw(x)
    if x <= -10 then
        y = x + 1;
    elseif -10 < x & x <= 0 then
        y = x;
    elseif 0 < x & x <= 5 then
        y = exp(x);
    else
        y = x ** 2;
    end
endfunction
scf;
x = -20:0.01:20;
plot2d(x,feval(x, fpw));
xtitle("Piecewise Function", "x", "f(x)");
xgrid(1);

//Exercise 8
theta = linspace(0,2*%pi, 1000);

a1 = 2
n1 = 5
r1 = a1*sin(n1*theta);
scf;
polarplot(theta, r1);

//Exercise 9
a2 = 3
n2 = 6
r2 = a2*cos(n2*theta);
scf;
polarplot(theta, r2);

seriesSum = 0
for n = 7:220
    seriesSum = seriesSum + 2*n + 5*n**2 + 3;
end
disp("The sum of the series 2n + 5n^2 + 3 is " + string(seriesSum));

//Exercise 10
sizes = [];
n = 1000;
for i = 1:n
    tmpnum = rand();
    cnt = 0;
    while tmpnum > 0.5
        tmpnum = rand();
        cnt = cnt + 1;
    end
    if cnt > 0 then
        try
            sizes(cnt) = sizes(cnt) + 1;
        catch
            sizes(cnt) = 1;
        end
    end
end

scf;
x_axis = 1:length(sizes);
bar(x_axis, sizes);

//Exercise 11
function y = projectile(v, theta)
    g = 9.8;
    theta = theta*%pi/180;
    D = (v**2)*sin(2*theta)/g;
    Dmax = (v**2)/g
    x = 0:0.001:Dmax;
    x1 = 0:0.001:D;
    
    y = x.*tan(theta) - (g*(x**2))./(2*(v**2).*(cos(theta)**2));
    y(length(x1):length(x)) = 0
endfunction

v = 10;
Y = [];
labels = [];
for theta = 0:5:90
    y = projectile(v,theta);
    Y = [Y y'];
    labels = [labels (string(theta)+ " degrees")];
end

scf;
plot(Y);
xtitle("Projectile Motion", "Distance", "Height");
legend(labels);
xgrid(1);

//Exercise 12
function impmag = RCtf(sigma, omega)
    R = 100e3;
    C = 12e-12;
    s = sigma + %i*omega;
    impmag = abs(1/(R*C*s + 1));
endfunction

sigma = linspace(1, 1e7, 100);
omega = linspace(1, 1e7, 100);
z = feval(sigma,omega, RCtf);
scf;
surf(sigma,omega,z);

//Exercise 13
val = sin(%pi);
disp("sin(" + string(%pi) + ") = " +  string(val)...
    + ". This is less than %eps = " + string(%eps)...
    + " and can therefore be considered as 0");

//Exercise 14
M = rand(5,5);
MI = inv(M);
I = MI*M;
disp("M * MI = ")
disp(I)
disp("There are several entries that are of the order of %eps. These are "...
      + "essentially zero");
disp("So the matrix can be considered as:");
disp(eye(5,5));

//Exercise 15
n = logspace(1,3,1000);
constant = ones(1,1000);
logarithmic = log(n)/log(2);
linear = n;
linearithmic = linear.*logarithmic;
quadratic = n**2;
exponential = 2**n;

runtimes = [constant;
logarithmic;
linear;
linearithmic;
quadratic;
exponential];
scf;
for i = 1:6
    plot2d("ll", n,runtimes(i,:));
    sleep(2000);
end
