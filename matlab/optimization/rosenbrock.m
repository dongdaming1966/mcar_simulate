function f = rosenbrock(x)

swp = evalin('base', 'swp');

ts=0.002;
% mb=1.94;
% mw=0.086;
r=0.04;
% g=10;

outp=0;

for i=2:10000

    angle=swp(i,2)*pi/180;
    angle_vpast=swp(i-1,3)*pi/180;
    angle_v=swp(i,3)*pi/180;
    angle_vnext=swp(i+1,3)*pi/180;
    angle_a=(angle_vnext-angle_vpast)/(ts*2);
%     motor_v=swp(i,4)*(2*pi/60)/23+angle_v;
    motor_a=swp(i,5)*(2*pi/60)/23+angle_a;
    
    angle_vnext_est=angle_v+cos(angle)*motor_a/x(1);
    outp=outp+abs(angle_vnext-angle_vnext_est);
    
    
%     a11=mb*angle_a;
%     a12=mb*r*cos(angle)*motor_a;
%     a21=mb*r*cos(angle)*angle_a-mb*r*sin(angle)*angle_v^2-mb*g*sin(angle);
%     a22=motor_a;
%     a23=(1.5*mw+mb)*r^2*motor_a;
%         
%     ib=mb*x(1)^2/3;
%     outp=outp+abs(a11*x(1)^2+a12*x(1));%+a21*x(1)+a22*ib+a23;
end
f=outp;