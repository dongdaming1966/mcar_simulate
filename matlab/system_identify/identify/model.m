function [A,B,C,D,K,x0] = model(par,T)
A = [0 0 0;0 0 1; 0 par(1) 0]; 
B = [1;0;par(2)];
% A = [par(1) par(2) par(3); par(4) par(5) par(6); par(7) par(8) par(9)];
% B = [par(10); par(11); par(12)];
C = eye(3);
D = zeros(3,1);
K = zeros(3,3);
% x0 = [1.44192300000000;-0.749982000000000];
x0 = [par(3);par(4);par(5)];

% function [A,B,C,D,K,x0] = model(par,T)
% A = [0 1 0; 0 par(1) 0;1 2 3]; 
% B = [2;par(2);5];
% C = [0 1 0;0 0 1];
% D = [0;0];
% K = zeros(3,3);
% x0 = [par(3);0;0];

% function [A,B,C,D,K,x0] = model(par,T)
% A = [0 1 0;par(1) 0 0; 0 0 0]; 
% B = [0;par(2);1];
% % A = [par(1) par(2) par(3); par(4) par(5) par(6); par(7) par(8) par(9)];
% % B = [par(10); par(11); par(12)];
% C = eye(3);
% D = zeros(3,1);
% K = zeros(3,3);
% % x0 = [1.44192300000000;-0.749982000000000];
% x0 = [par(4);par(5);par(6)];