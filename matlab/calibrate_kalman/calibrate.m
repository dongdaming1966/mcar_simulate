delay=0;
time=swp(1:end-delay,1);
body_v=swp(delay+1:end,2);
body_p=swp(delay+1:end,3);
motor_v=swp(1:end-delay,4);
motor_p=swp(1:end-delay,5);
kalman_p=swp(1:end-delay,6);
kalman_v=swp(1:end-delay,7);

% remove meam
body_p=body_p-mean(body_p-motor_p);
body_v=body_v-mean(body_v-motor_v);
kalman_p=kalman_p-mean(kalman_p-motor_p);
kalman_v=kalman_v-mean(kalman_v-motor_v);

body_p_std=std(body_p-motor_p);
body_v_std=std(body_v-motor_v);

% L=1024;
% Fs=500;
% Y = fft(body_p(1:L));
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;

% %kalman filter
% X=[body_p(1);body_v(1)];
% A=[1 -0.002;0 1];
% B=[0.002 0;0 0];
% C=[1 0];
% I=[1 0; 0 1];
% P=[1 0; 0 1];
% Q=[1e-5 0;0 0.1];
% R=[0.0345 0; 0 0.0539];
% Y=[body_p,body_v];
% body_p_k=body_p;
% body_v_k=body_v;
% 
% for i=2:length(body_p)
%     X=A*X+B*body_v(i);
%     P=A*P*A'+Q;
%     K=P*C'*(C*P*C'+R)^(-1);
%     X=X+K*(Y(i,:)'-C*X);
%     P=(I-K*C)*P;
%     
%     body_p_k(i)=X(1);
%     body_v_k(i)=X(2); 
% end
% 
% body_p_cov=cov(body_p-body_p_k)
% 


%plot
figure
subplot(2,1,1)
plot(time,kalman_p,time,body_p,time,motor_p,'--')
title('angle','fontsize',15)

subplot(2,1,2)
plot(time,kalman_v,time,body_v,time,motor_v,'--')
title('velocity','fontsize',15)