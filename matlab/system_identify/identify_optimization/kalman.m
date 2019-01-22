ts=0.002;
r=0.004;

times=swp(:,1);
body_angle=swp(:,2);
body_vel=swp(:,3);
motor_acc=swp(:,5);
len=zeros(length(swp),1);

P=0;
Q=0.001;
R=10;

for i=3:length(swp)
    len(i-1)=len(i-2);
    P=P+Q;
    H=-r*cos(body_angle(i-1))*motor_acc(i-1);
    K=P*H/(H*P*H+R);
    len(i-1)=len(i-1)+K*(body_vel(i)-body_vel(i-1)-H*len(i-1));
    P=(1-K*H)*P;
end

plot(times,len);