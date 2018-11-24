body_angle=zeros(10000,1);
body_vel=zeros(10000,1);
body_acc=zeros(10000,1);
motor_acc=zeros(10000,1);
r=0.04;
len=0.08;
Kp=10000;
Kd=5;
m=2;
g=10;
Ib=2*0.08^2;

body_angle(1)=30/180*pi;

for i=2:10000
    if mod(i,10) == 0
%          motor_acc(i)=-Kp*(-sign(body_angle(i-1))*sqrt(2*m*g*len/Ib)*sqrt(1-cos(body_angle(i-1)))-body_vel(i-1));
         motor_acc(i)=100000*sign(50*(body_angle(i-1)+randn/10)+(body_vel(i-1)+randn/100));
%         motor_acc(i)=Kp*body_angle(i-1)+Kd*body_vel(i-1);
    end
    
%     body_acc(i)=m*g*cos(body_angle(i-1))*len/Ib-r*cos(body_angle(i-1))*motor_acc(i)/len;
    body_acc(i)=(6*g*sin(body_angle(i-1))-3*r*cos(body_angle(i-1))*motor_acc(i))/(5*len+3*r*cos(body_angle(i-1)));
%     body_acc(i)=(6*g*sin(body_angle(i-1))-3*r*cos(body_angle(i-1))*motor_acc(i))/(5*len);
    body_vel(i)=body_vel(i-1)+body_acc(i)*0.0001;
    body_angle(i)=body_angle(i-1)+body_vel(i)*0.0001;

%     if body_angle(i)>0.75*pi/2
%         body_angle(i)=0.75*pi/2;
%     end
% 
%     if body_angle(i)<-0.75*pi/2
%         body_angle(i)=-0.75*pi/2;
%     end

end

plot(body_angle);