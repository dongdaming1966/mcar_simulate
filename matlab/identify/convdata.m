input=swp*[0; 0; 0; 1; 0; 0; 0];
%input=swp*[0 0; 0 0; 1 0; 0 1; 0 0; 0 0; 0 0];
%output=swp*[0 0; 0 1; 1 0; 0 0; 0 0; 0 0; 0 0];
output=swp*[0; 0; 1; 0; 0; 0; 0];
time=swp*[1; 0; 0; 0; 0; 0; 0];
data=iddata(output,input,0.002);

input2=swp2*[0; 0; 0; 1; 0; 0; 0];
%input=swp*[0 0; 0 0; 1 0; 0 1; 0 0; 0 0; 0 0];
%output=swp*[0 0; 0 1; 1 0; 0 0; 0 0; 0 0; 0 0];
output2=swp2*[0; 0; 1; 0; 0; 0; 0];
time2=swp2*[1; 0; 0; 0; 0; 0; 0];
data2=iddata(output2,input2,0.002);