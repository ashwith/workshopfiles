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

T=10;
Ts=1000;
t = 0:1/Ts:T-(1/Ts);

figure()
sleep(3000)
sq_wave = squarewave(2*%pi*t/T, 50);
subplot(2,1,1);
plot2d(t, sq_wave);
axis([0 T-1/Ts -1.1 1.1])
title("SquareWave");

N = 100;
sumsig = 0;


for n = 1:N
    if modulo(n,2) == 1 then
        tmpsig = (4/%pi)*(1/n)*(sin(2*n*%pi*t/T))
        sumsig = sumsig + tmpsig;
        sleep(100);
        clf;
        subplot(3,1,1);
        title("SquareWave");
        axis([0 T-1/Ts -1.1 1.1])
        plot2d(t, sq_wave);
        axis()
        subplot(3,1,2);
        title("Sum of Components");
        plot2d(t,sumsig);
        subplot(3,1,3);
        title("Current component");
        plot2d(t,tmpsig);
        
    end
end
