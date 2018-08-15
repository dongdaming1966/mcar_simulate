%��������
a=[0.98,-0.027;-0.0066,1.01];
b=[1.016e-05;2.813e-05];
c=[232.59,-3.23; -4.6305   -6.3122];
d=[0 ;0.0023];
p=[0.5,0;0,0.5];
q=[0.5,0;0,0.5];
r=[5 0; 0 0.5];
steps=5;
x=zeros(2,length(input));
est_output=zeros(2,length(input));
est_x=zeros(2,1);
% error_output=zeros(2,steps);
error_output=zeros(2,length(input));

for i=2:length(input)-steps
    %ʱ����·��� 
    x(:,i)=a*x(:,i-1)+b*input(i-1);
    p=a*p*a'+q;
    %ģ��Ԥ�����ͳ�� 
    est_x=x(:,i);
    for j=0:steps
    est_output(:,i+1)=c*est_x+d*input(i);
    error_output(:,i)=error_output(:,i)+abs(output(i+1,:)'-est_output(:,i+1));
    est_x=a*est_x+b*input(i+j);
    end
    %״̬���·���
    k=p*c'*(c*p*c'+r)^(-1);
    x(:,i)=x(:,i)+k*(output(i,:)'-(c*x(:,i)+d*input(i-1)));
    p=(eye(2)-k*c)*p;
end
%�����任
% error_output=error_output/length(input);
% error_sum_output=error_sum_output/steps;
%��ͼ
% figure(1);
% plot(error_output);
% title('����');
% figure(2);
% 
subplot(2,1,1) 
plot(time,est_output(1,:));
title('angle');
hold on;
plot(time,acc,'--');
plot(time,error_output(1,:));
hold off;
legend('acc_e_s_t','acc','error')

subplot(2,1,2) 
% plot(time,est_output(2,:));
plot(time,est_output(2,:));
title('vel');
hold on;
plot(time,gyro*0.002,'--');
plot(time,error_output(2,:));
hold off;
legend('gyro_e_s_t','gyro','error')