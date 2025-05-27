 clc;
 clear all;
 close all;
 
 lambda = 0:1:100; %thres value
 %N=1:1:10;
 
 SNRdB=10;
 snr=10^(SNRdB/10);  %snr to linear scale 
 q=0.01;
 p=2; %ene dec scheme
 M=3; %SU
 N=3; %CR invloved in FR
 
 for SS=1:length(lambda)
     
 rr(SS)=((lambda(SS))^(2/p));

 
 Pf(SS)=1-((1-exp(-rr(SS)))^M);
 %marcum PD on Fading envi
 K=0;
 D2=2/((1+snr)); %def depen parameter on SNR
 Pm1(SS)=marcumq(sqrt(2*K),((lambda(SS))^(1/p))*sqrt(D2*(1+K)));
 %Pm1(SS)=marcumq(sqrt(D2*snr),((lambda)^(1/p(SS)))*sqrt(D2));
 Pm(SS)=(1-Pm1(SS))^M;
  
 Qm(SS)=[(Pm(SS)*(1-q))+(q*(1-Pm(SS)))].^N;
 Qf(SS)=1-[((1-Pf(SS))*(1-q))+(q*Pf(SS))].^N;
 
 end
 
 Total=Qm+Qf
 
 semilogy(lambda,Total,'r*-');
