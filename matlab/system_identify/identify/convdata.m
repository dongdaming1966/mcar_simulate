% input=swp*[0; 0; 0; 1; 0; 0; 0];
% % input=swp*[0 0; 0 0; 1 0; 0 1; 0 0; 0 0; 0 0];
% output=swp*[0 0; 0 0; 0 0; 0 0; 1 0; 0 1; 0 0];
% % output=swp*[0; 0; 1; 0; 0; 0; 0];
% time=swp*[1; 0; 0; 0; 0; 0; 0];
% data=iddata(output,input,0.002);

input=swp*[0; 0; 0; 1; 0; 0; 0];
% input=swp*[0 0; 0 0; 1 0; 0 1; 0 0; 0 0; 0 0];
% output=swp2*[0 0; 0 0; 0 0; 0 0; 0 0.002; 1 0; 0 0];
output2=swp*[0; 0; 1; 0; 0; 0; 0];
time=swp2*[1; 0; 0; 0; 0; 0; 0];
data=iddata(output,input,0.002);

gyro=swp2*[0; 0; 0; 0; 1; 0; 0];
acc=swp2*[0; 0; 0; 0; 0; 1; 0];