clc;
clear all;

p=2;
L=5;
snrdb=10;
SNR=10^(snrdb/10);
X=((2^(p/2))/L);
Y=((sqrt(pi))*gamma(((2*p)+1)/2))-(((gamma((p+1)/2))^2));
Z=gamma((p+1)/2)*sqrt(pi);
W=X*(Y/Z); %normalizes the equ

A=L*((gamma((p+1)/2))^2);
B=A/Y;

C=((1+SNR)^(p/2))*W;

lamda=0:0.5:50;

u=10;

for z=1:length(lamda)

%pf(z)=(gammainc(B,lamda(z)./W));

%pd(z)=(gammainc(B,lamda(z)./C));

pf(z)=(gammainc(lamda(z)./2,u,'upper'));

pd(z)=marcumq(sqrt(2*SNR),sqrt(lamda(z)),u);

pm(z)=1-pd(z);

pe=0;

pfe(z)=(pf(z)*(1-pe))+((1-pf(z))*pe);

pde(z)=(pd(z)*(1-pe))+((1-pd(z))*(pe));

M=4;
%n=M-2;
n=2;
k=1+n;
Qd=0;
Qf=0;

for l=k:1:M
Qd1(z)=Qd+(factorial(M).*(pde(z).^l)*((1-pde(z))^(M-l))/(factorial(l)*factorial(M-l)));
Qf1(z)=Qf+(factorial(M).*(pfe(z).^l)*((1-pfe(z))^(M-l))/(factorial(l)*factorial(M-l)));

Qm(z)=1-Qd1(z);

end

Qd=Qd1;
Qf=Qf1;

Cavg(z)=(11.5)+((1.5).*Qd(z))-(7*Qf(z))

end

plot(lamda,Cavg,'r-*')
% % semilogy(lamda,U,'m-*')
grid on

hold on
