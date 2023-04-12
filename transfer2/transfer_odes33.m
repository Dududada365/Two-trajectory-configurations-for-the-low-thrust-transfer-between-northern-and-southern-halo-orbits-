function dX_dtau = vdp3d(t,x,tf)
mu=0.01215;
global T
r=[x(1);x(2);x(3)];re=[-mu;0;0];rm=[1-mu;0;0];
r1=norm(r-re);r2=norm(r-rm); u=1;c=2000*9.80665;
alpha1=-x(11)/norm([x(11),x(12),x(13)]);
alpha2=-x(12)/norm([x(11),x(12),x(13)]);
alpha3=-x(13)/norm([x(11),x(12),x(13)]);
%%
dx_dtau = x(4)*tf;
dy_dtau = x(5)*tf;
dz_dtau = x(6)*tf;
dvx_dtau = (x(1)+2*x(5)-(1-mu)*(x(1)+mu)/r1^3-mu*(x(1)+mu-1)/r2^3+T*u/x(7)*alpha1*1e-3*366201.5728)*tf;
dvy_dtau = (x(2)-2*x(4)-(1-mu)*x(2)/r1^3-mu*x(2)/r2^3+T*u/x(7)*alpha2*1e-3*366201.5728)*tf;
dvz_dtau = (-(1-mu)*x(3)/r1^3-mu*x(3)/r2^3+T*u/x(7)*alpha3*1e-3*366201.5728)*tf;
dm_dtau = (-T*u/c*3.75676967e5)*tf;

dpx_dtau = (-x(11)*((mu - 1)/(r1^2)^(3/2) - mu/(r2^2)^(3/2) + (3*mu*(2*mu + 2*x(1) - 2)*(mu + x(1) - 1))/(2*(r2^2)^(5/2)) - (3*(2*mu + 2*x(1))*(mu + x(1))*(mu - 1))/(2*(r1^2)^(5/2)) + 1) - x(12)*((3*mu*x(2)*(2*mu + 2*x(1) - 2))/(2*(r2^2)^(5/2)) - (3*x(2)*(2*mu + 2*x(1))*(mu - 1))/(2*(r1^2)^(5/2))) - x(13)*((3*mu*x(3)*(2*mu + 2*x(1) - 2))/(2*(r2^2)^(5/2)) - (3*x(3)*(2*mu + 2*x(1))*(mu - 1))/(2*(r1^2)^(5/2))))*tf;
dpy_dtau = (-x(12)*((mu - 1)/(r1^2)^(3/2) - mu/(r2^2)^(3/2) - (3*x(2)^2*(mu - 1))/(r1^2)^(5/2) + (3*mu*x(2)^2)/(r2^2)^(5/2) + 1) - x(11)*((3*mu*x(2)*(mu + x(1) - 1))/(r2^2)^(5/2) - (3*x(2)*(mu + x(1))*(mu - 1))/(r1^2)^(5/2))+x(13)*((3*x(2)*x(3)*(mu - 1))/(r1^2)^(5/2) - (3*mu*x(2)*x(3))/(r2^2)^(5/2)))*tf;
dpz_dtau = (-x(13)*((mu - 1)/(r1^2)^(3/2) - mu/(r2^2)^(3/2) - (3*x(3)^2*(mu - 1))/(r1^2)^(5/2) + (3*mu*x(3)^2)/(r2^2)^(5/2)) + x(11)*((3*x(3)*(mu + x(1))*(mu - 1))/(r1^2)^(5/2) - (3*mu*x(3)*(mu + x(1) - 1))/(r2^2)^(5/2))+x(12)*((3*x(2)*x(3)*(mu - 1))/(r1^2)^(5/2) - (3*mu*x(2)*x(3))/(r2^2)^(5/2)))*tf;
dpvx_dtau = (-x(8)+2*x(12))*tf;
dpvy_dtau =( -x(9)-2*x(11))*tf;
dpvz_dtau = (-x(10))*tf;
dpm_dtau = (-T/x(7)^2*(norm([x(11),x(12),x(13)]))*1e-3*366201.5728)*tf;
dX_dtau = [dx_dtau; dy_dtau; dz_dtau; dvx_dtau; dvy_dtau;dvz_dtau;dm_dtau; ...
dpx_dtau; dpy_dtau; dpz_dtau; dpvx_dtau;dpvy_dtau;dpvz_dtau;dpm_dtau];

