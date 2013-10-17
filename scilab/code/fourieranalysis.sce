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
