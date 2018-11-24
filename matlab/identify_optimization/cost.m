function f = cost(x)

swp = evalin('base', 'swp');

ts=0.002;
r=0.03;
outp=0;
g=9.8;

for i=100:length(swp)-100
    body_angle=swp(i,2);
    body_vel=swp(i,3);
    body_acc=(swp(i+1,3)-swp(i-1,3))/(ts*2);
    motor_acc=swp(i-3,5);
    
%     body_acc_est=-r*cos(body_angle)*motor_acc/x(1);
%     body_acc_est=(6*g*sin(body_angle)-3*r*cos(body_angle)*motor_acc)/(5*x(1)+3*r*cos(body_angle));
%    body_acc_est=(6*g*sin(body_angle)-3*r*cos(body_angle)*motor_acc)/(5*x(1));
 
    body_acc_est=(9.8*x(1)*sin(body_angle)+0.03*x(1)*sin(body_angle)*body_vel^2+(-0.158766-0.03*x(1)*cos(body_angle))*motor_acc)/x(1)*(1.334*x(1)+0.03*cos(body_angle));

    outp=outp+abs(body_acc-body_acc_est);
end
f=outp;