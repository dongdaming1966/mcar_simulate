function [K_mpc,Phi,F,A_e,B_e,C_e] =mpcgain(A,B,C,T_s,N_c,N_p)

%测量输入输出维数
[ny,~]=size(C);
[~,nu]=size(B);
D=zeros(ny,nu);
if T_s ==0
    %直接使用模型
    sysd=ss(A,B,C,D,T_s);
else
    %离散化
    sysc=ss(A,B,C,D);
    sysd=c2d(sysc,T_s);
end


%计算增量式模型
[nx,~]=size(B);
A_e=eye(nx+ny,nx+ny);
A_e(1:nx,1:nx)=sysd.A;
A_e(nx+1:nx+ny,1:nx)=sysd.C*sysd.A;
B_e=zeros(nx+ny,nu);
B_e(1:nx,:)=sysd.B;
B_e(nx+1:nx+ny,:)=sysd.C*sysd.B;
C_e=zeros(ny,nx+ny);
C_e(:,nx+1:nx+ny)=eye(ny,ny);
% A_e=sysd.A;
% B_e=sysd.B;
% C_e=sysd.C;

%测量增量模型的输入输出维数
[ny,~]=size(C);
[~,nu]=size(B);

%计算增益
F(1:ny,:)=C_e*A_e;
Phi_t(1:ny,:)=C_e;
for kk=1:N_p-1
    F(kk*ny+1:(kk+1)*ny,:)=F((kk-1)*ny+1:kk*ny,:)*A_e;
    Phi_t(kk*ny+1:(kk+1)*ny,:)=Phi_t((kk-1)*ny+1:kk*ny,:)*A_e;
end
for kk=1:N_p-1
        Phi_t((kk-1)*ny+1:kk*ny,1:nu)=Phi_t((kk-1)*ny+1:kk*ny,:)*B_e;
end
Phi=zeros(N_p*ny,N_c*nu);
Phi(:,1:nu)=Phi_t(:,1:nu);
for kk=2:N_c
    Phi(:,(kk-1)*nu+1:kk*nu)=[zeros((kk-1)*ny,nu);Phi_t(1:(N_p-kk+1)*ny,1:nu)];
end

K_mpc=zeros(nu,nu*N_c);
K_mpc(1:nu,1:nu)=eye(nu);
K_mpc=-(K_mpc/(Phi'*Phi))*(Phi'*F);

end
