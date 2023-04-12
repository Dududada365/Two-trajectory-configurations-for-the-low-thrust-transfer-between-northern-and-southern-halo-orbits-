function PSI = transfer_bcs(Y0,Yf,tf)
global T y00 y11
y0=y00;
y1=y11;
C1=1e-3*366201.5728;

mu=0.01215;
alpha1=-Yf(11)./sqrt(Yf(11).^2+Yf(12).^2+Yf(13).^2);
alpha2=-Yf(12)./sqrt(Yf(11).^2+Yf(12).^2+Yf(13).^2);
alpha3=-Yf(13)./sqrt(Yf(11).^2+Yf(12).^2+Yf(13).^2); u=1;c=2000*9.8;

r1=sqrt((Yf(1)+mu)^2+Yf(2)^2+Yf(3)^2);
r2=sqrt((Yf(1)-1+mu)^2+Yf(2)^2+Yf(3)^2);


PSI = [Y0(1)-y0(1) 
Y0(2)-y0(2) 
Y0(3)-y0(3) 
Y0(4)-y0(4) 
Y0(5)-y0(5)
Y0(6)-y0(6)
Y0(7)-1500

Yf(1)-y1(1) 
Yf(2)-y1(2) 
Yf(3)-y1(3) 
Yf(4)-y1(4) 
Yf(5)-y1(5) 
Yf(6)-y1(6) 
% Yf(8)*Yf(4)+Yf(9)*Yf(5)+Yf(10)*Yf(6)+Yf(11)*(Yf(1)+2*Yf(5)-(1-mu)*(Yf(1)+mu)/r1^3-mu*(Yf(1)+mu-1)/r2^3+T*u/Yf(7)*alpha1)+Yf(12)*(Yf(2)-2*Yf(4)-(1-mu)*Yf(2)/r1^3-mu*Yf(2)/r2^3+T*u/Yf(7)*alpha2)+Yf(13)*(-(1-mu)*Yf(3)/r1^3-mu*Yf(3)/r2^3+T*u/Yf(7)*alpha3)-Yf(14)*T*u/c*3.75676967e5+1-0;
Yf(8)*Yf(4)+Yf(9)*Yf(5)+Yf(10)*Yf(6)+Yf(11)*(Yf(1)+2*Yf(5)-(1-mu)*(Yf(1)+mu)/r1^3-mu*(Yf(1)+mu-1)/r2^3+C1*T*u/Yf(7)*alpha1)+Yf(12)*(Yf(2)-2*Yf(4)-(1-mu)*Yf(2)/r1^3-mu*Yf(2)/r2^3+C1*T*u/Yf(7)*alpha2)+Yf(13)*(-(1-mu)*Yf(3)/r1^3-mu*Yf(3)/r2^3+C1*T*u/Yf(7)*alpha3)-Yf(14)*T*u/c*3.75676967e5+1-0;
Yf(14)-0];

return
