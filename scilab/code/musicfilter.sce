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

clear;            // Clear all variables.
xdel(winsid());   // Close all graphics windows.
stacksize('max'); //Increase available memory
clc;              // Clear command window.

//Load the sound clip
//music1 - music data
//Fs1 - Sampling Rate
//Bits - Digital resolution (ignore)
[music1, Fs1, bits] = wavread("<Enter Filename Here>");

//Playing a sound clip
playsnd(music1,Fs1);

//sleep(12*1000);

Fc1 = 1000;
Fc2 = 2000;
FcD1 = Fc1/Fs1;
FcD2 = Fc2/Fs1;
RippleP = 0.01;
RippleS = 0.0001;
fil1=iir(3,'hp','ellip',[FcD1 FcD2],[RippleP RippleS]);
scf;
[fil1_m,f1]=frmag(fil1,1024);
plot2d(f1,fil1_m);

music1_fil1(1,:) = flts(music1(1,:), fil1); 
music1_fil1(2,:) = flts(music1(2,:), fil1);

playsnd(music1_fil1,Fs1);
