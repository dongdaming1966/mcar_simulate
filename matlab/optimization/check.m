angle_a=ones(10000,1);
motor_a=ones(10000,1);
times=ones(10000,1);
for i=2:10001
    angle_vpast=swp(i-1,3)*pi/180;
    angle_vnext=swp(i+1,3)*pi/180;
    angle_a(i-1)=(angle_vnext-angle_vpast)/(ts*2);
    
    motor_a(i-1)=swp(i,5)*(2*pi/60)/23;
    
    times(i-1)=swp(i,1);
end

plot(times,angle_a,times,motor_a,':');

