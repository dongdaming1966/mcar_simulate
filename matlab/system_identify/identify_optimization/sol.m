ts=0.002;
mb=1.94;
mw=0.086;
r=0.04;
g=10;

% len=length(swp);
len=50;
num=len;

sl=zeros(len,1);
sIb=zeros(len,1);

sltotal=0;
sIbtotal=0;

syms l Ib;

i=10500;

for i=2000:2050

    angle=swp(i,2)*pi/180;
    angle_vpast=swp(i-1,3)*pi/180;
    angle_v=swp(i,3)*pi/180;
    angle_vnext=swp(i+1,3)*pi/180;
    angle_a=(angle_vnext-angle_vpast)/(ts*2);
    motor_v=swp(i,4)*(2*pi/60)/23+angle_v;
    motor_a=swp(i,5)*(2*pi/60)/23+angle_a;
    
    a11=mb*angle_a;
    a12=mb*r*cos(angle)*motor_a+mb*r*sin(angle)*(angle_v^2)*motor_v-mb*r*sin(angle)*angle_v*motor_v-mb*g*sin(angle)*angle_v+mb*g*sin(angle);
    a13=-motor_a;
    a21=mb*r*cos(angle)*angle_a-mb*r*sin(angle)*angle_v^2-mb*g*sin(angle);
    a22=motor_a;
    a23=(1.5*mw+mb)*r^2*motor_a;
    
    
    eqns = [a11*l^2+a12*l+a13*Ib == 0, a21*l+a22*Ib+a23 == 0];
    vars = [l Ib];
    [slt, sIbt]=solve(eqns,vars);
    slt=double(slt);
    sIbt=double(sIbt);
    sl(i)=slt(2,1);
    sIb(i)=sIbt(2,1);
    
%     if abs(slt(1,1))<0.001
%         sl(i)=slt(2,1);
%         sIb(i)=sIbt(2,1);
%     end
    
%     if sIb(i)>-0.001 || sIb(i)<-0.2
%         sl(i)=0;
%         sIb(i)=0;
%         num=num-1;
%     end
    
    sltotal=sltotal+sl(i);
    sIbtotal=sIbtotal+sIb(i);
end

sltotal=sltotal/num
sIbtotal=sIbtotal/num