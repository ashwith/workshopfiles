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

//We can't analyze the entire file 
//because it has too much data. So
//we pick the last 10000 samples.
[numtracks, clip_size] = size(music1);
sample_size = 10000;
music1_sample(1,:) = music1(1,clip_size - sample_size:clip_size);
music1_sample(2,:) = music1(2,clip_size - sample_size:clip_size);

//Spectrum Analysis
music1_sample_fft(1,:) = abs(fftshift(fft(music1_sample(1,:))));
music1_sample_fft(2,:) = abs(fftshift(fft(music1_sample(2,:))));
sample_length = length(music1_sample(1,:))
f = (-sample_length/2:sample_length/2 - 1)/(sample_length/Fs1);
t = (0:sample_length-1)/Fs1;
scf;
subplot(2,2,1);
plot(t, music1_sample(1,:));
title("Left Track - Time Domain");
subplot(2,2,2);
plot(f,music1_sample_fft(1,:));
title("Left Track - Frequency Domain");
subplot(2,2,3);
plot(t, music1_sample(2,:));
title("Right Track - Time Domain");
subplot(2,2,4);
plot(f,music1_sample_fft(2,:));
title("Right Track - Frequency Domain");
