function [Phi,F,A_e,B_e,C_e] =mpcgainSISO(A,B,C,T_s,N_c,N_p)

[ny,~]=size(C);
[nx,nu]=size(B);
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
A_e=eye(nx+ny,nx+ny);
A_e(1:nx,1:nx)=sysd.A;
A_e(nx+1:nx+ny,1:nx)=sysd.C*sysd.A;
B_e=zeros(nx+ny,nu);
B_e(1:nx,:)=sysd.B;
B_e(nx+1:nx+ny,:)=sysd.C*sysd.B;
C_e=zeros(ny,nx+ny);
C_e(:,nx+1:nx+ny)=eye(ny,ny);

%计算增益
F(1,:)=C_e*A_e;
Phi_t(1,:)=C_e;
for kk=2:N_p
    F(kk,:)=F(kk-1,:)*A_e;
    Phi_t(kk,:)=Phi_t(kk-1,:)*A_e;
end
Phi_t=Phi_t*B_e;
Phi=zeros(N_p,N_c);
Phi(:,1)=Phi_t;
for kk=2:N_c
    Phi(:,kk)=[zeros(kk-1,1);Phi_t(1:N_p-kk+1,1)];
end

end
