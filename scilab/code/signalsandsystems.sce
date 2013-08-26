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
scf;
f = 10e3;
T = 1/f;
D = 70;
t_sq_wave = 0:T/100:5*T;
sq_wave = squarewave(2*%pi*f*t_sq_wave, D);
plot2d(t_sq_wave, sq_wave);

//Exercise 2
scf;
n_exp = 0:49;
y_exp1 = 0.8.^n_exp;
plot2d3(n_exp, y_exp1);

//Exercise 3
scf;
y_exp2 = 0.8.^-n_exp;
plot2d3(n_exp, y_exp2);

//Exercise 4
scf;
f = 5e3;
T = 1/f;
t_sine_wave = 0:T/1000:3*T;
sine_wave = sin(2*%pi*f*t_sine_wave);
plot2d(t_sine_wave, sine_wave);

//Exercise 5
scf;
n_x_n = 0:49;
x_n = sin(12*n_x_n);
plot2d3(n_x_n,x_n);

//Exercise 6
scf;
n = 0:49;
h_n = 0.95.^n;
u_n = ones(1,50);
r_n = n;
sin_n = sin((2*%pi/10) * n);

[y_u, e] = convol(u_n, h_n);
[y_r, e] = convol(r_n, h_n);
[y_sin, e] = convol(sin_n, h_n);
subplot(3, 2, 1);
plot2d3(n,u_n);
title("Step Input")
subplot(3, 2, 2);
plot2d3(n,y_u);
title("Step Output")
subplot(3, 2, 3);
plot2d3(n,r_n);
title("Ramp Input")
subplot(3, 2, 4);
plot2d3(n,y_r);
title("Ramp Output")
subplot(3, 2, 5);
plot2d3(n,sin_n);
title("Sinusoidal Input")
subplot(3, 2, 6);
plot2d3(n,y_sin);
title("Sinusoidal Output")

//Exercise 7
scf;
n = 2:12;
h_n = (0.9.^n);
x_n = 2*ones(1,14);
y_x = convol(x_n, h_n);
subplot(1,3,1);
plot2d3(x_n);
subplot(1,3,2);
plot2d3(h_n);
subplot(1,3,3);
plot2d3(y_x);

//Exercise 8
scf;
N = 50;
omega = -N/2:N/2-1;
D = 50;
n_sq_wave = 0:N-1;
sq_wave = squarewave(2*%pi*n_sq_wave/N, D);
sq_wave_spec = fftshift(fft(sq_wave)/length(sq_wave));
subplot(2, 1, 1);
plot2d3(n_sq_wave, sq_wave);
subplot(2, 1, 2);
plot2d3(omega,abs(sq_wave_spec));

//Exercise 9
scf;
N = 50
omega = -N/2:N/2-1
sawtooth = [-(N/2:-1:1) 0:N/2-1];
sawtooth_spec = fftshift(fft(sawtooth))/length(sawtooth);
subplot(2, 1, 1);
plot2d3(sawtooth);
subplot(2, 1, 2);
plot2d3(omega, abs(sawtooth_spec));

//Exercise 10
scf;
t = linspace(0, 1, 1000);
m_t = sin(2*%pi*t*10);
c_t = sin(2*%pi*t*100);
s_t = (0 + 0.5*m_t).*c_t;
S_K = abs(fftshift(fft(s_t)));
subplot(2,1,1);
plot(s_t);
title("Amplitude Modulated Wave - Time Domain")
subplot(2,1,2);
omega = -500:499;
plot(omega,S_K);
title("Amplitude Modulated Wave - Frequency Domain")
