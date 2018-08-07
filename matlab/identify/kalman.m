%变量定义
a=[0.98,-0.027;-0.0066,1.01];
b=[1.016e-05;2.813e-05];
c=[232.59,-3.23];
p=[0.5,0;0,0.5];
q=[0.5,0;0,0.5];
r=0.5;
steps=10;
x=zeros(2,length(input));
est_output=zeros(1,length(input));
est_x=zeros(2,1);
error_output=zeros(steps,1);
error_sum_output=zeros(length(input),1);

for i=2:length(input)-steps
    %时间更新方程
    x(:,i)=a*x(:,i-1)+b*input(i-1);
    p=a*p*a'+q;
    %模型预测误差统计
    est_x=x(:,i);
    for j=1:steps
        est_output(i+j-1)=c*est_x;
        error_output(j)=error_output(j)+abs(est_output(i+j-1)-output(i+j-1));
        error_sum_output(i)=error_sum_output(i)+abs(est_output(i+j-1)-output(i+j-1));
        est_x=a*est_x+b*input(i+j-1);
    end  
    %状态更新方程
    k=p*c'*(c*p*c'+r)^(-1);
    x(:,i)=x(:,i)+k*(output(i)-c*x(:,i));
    p=(eye(2)-k*c)*p;
end
%比例变换
error_output=error_output/length(input);
error_sum_output=error_sum_output/steps;
%作图
figure(1);
plot(error_output);
title('步数');
figure(2);
hold on;
plot(error_sum_output);
title('时间');
plot(output);
hold off;
