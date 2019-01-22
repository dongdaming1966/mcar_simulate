% % clear;
% convdata;
% par=[0;0;0;0;0;0;0];
% % par = [0; 1; 0; 0; -1.56; 0; 0; 0; 0; 0; -57.52; 491; 0; 0; 0];
% aux = {};
% T = 0.002;
% m = idgrey('model',par,'d',aux,T);
% 
% % load('data.mat')
% 
% 
% m_est = greyest(data,m);
% compare(m_est,data)


par = [-1; -1; 0 ; 0; 0; 0];
aux = {};
T = 0;
m = idgrey('model',par,'c',aux,T);

% load(fullfile(matlabroot,'toolbox','ident','iddemos','data','dcmotordata'));
% data = iddata(y,u,0.002);

convdata;

m_est = greyest(data,m);
compare(m_est,data)


