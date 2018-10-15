delay=3;
time=swp(1:end-delay,1);
body_v=swp(delay+1:end,2)*pi/180;
body_p=swp(delay+1:end,3)*pi/180;
motor_v=swp(1:end-delay,4)*(2*pi/60)/23;
motor_p=swp(1:end-delay,5)*(2*pi/60)/23;

%remove meam
body_p=body_p-mean(body_p-motor_p);
body_v=body_v-mean(body_v-motor_v);

L=1024;
Fs=500;
Y = fft(body_p(1:L));
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure
subplot(2,1,1)
% plot(f,P1)
plot(time,body_p,time,motor_p,'--')
title('angle')

subplot(2,1,2)
plot(time,body_v,time,motor_v,'--')
title('velocity')