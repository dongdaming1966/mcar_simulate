ts=0.002;
r=0.004;
g=10;

times=swp(:,1);
body_angle=swp(:,2);
body_vel=swp(:,3);
body_acc=zeros(length(swp),1);
est_vel=zeros(length(swp),1);
est_acc=zeros(length(swp),1);
motor_acc=swp(:,5);

for i=2:length(swp)-100
    body_acc(i)=(swp(i+1,3)-swp(i-1,3))/(ts*2);
    est_acc(i)=-r*cos(body_angle(i))*motor_acc(i)/0.010;
%     est_acc(i)=(6*g*sin(body_angle(i))-3*r*cos(body_angle(i))*motor_acc(i))/(5*(0.2)+3*r*cos(body_angle(i)));
    est_vel(i)=est_vel(i-1)+est_acc(i);
end

plot(times,body_vel,times,est_acc,':',times,est_vel-mean(est_vel));

