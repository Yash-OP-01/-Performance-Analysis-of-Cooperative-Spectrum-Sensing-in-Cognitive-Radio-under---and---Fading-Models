 clc;
 clear all;
 close all;
 
 lambda = 0:1:100;
 %N=1:1:10;
 
 SNRdB=10;
 snr=10^(SNRdB/10);
 q=0.01;
 p=2;
 M=3;
 N=3;
 
 for SS=1:length(lambda)
     
 rr(SS)=((lambda(SS))^(2/p));

 
  Pf(SS)=1-((1-exp(-rr(SS)))^M);
  
  K=0;
  D2=2/((1+snr));
  Pm1(SS)=marcumq(sqrt(2*K),((lambda(SS))^(1/p))*sqrt(D2*(1+K)));
  %Pm1(SS)=marcumq(sqrt(D2*snr),((lambda)^(1/p(SS)))*sqrt(D2));
  Pm(SS)=(1-Pm1(SS))^M;
  
  Qm(SS)=1-[((1-Pf(SS))*(1-q))+(q*Pf(SS))].^N;
  Qf(SS)=[(Pm(SS)*(1-q))+(q*(1-Pm(SS)))].^N;
 
 end
 
 Total=Qm+Qf
 
semilogy(lambda,Total,'r*-');
