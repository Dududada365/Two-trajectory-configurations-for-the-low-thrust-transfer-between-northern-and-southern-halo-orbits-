clear all

y0=[1.15388633391533;0;-0.138702756149394;0;-0.215047537035519;0];
tf=14/4.342482227128214;

options = odeset('RelTol',1e-12,'AbsTol',1e-12);
[t,x]=ode45('vdp0',[0 tf],y0,options);
figure(1)
plot3(x(:,1),x(:,2),x(:,3),'r','LineWidth',2)
grid on;hold on;axis equal
xlabel('\itx');ylabel('\ity','Rotation',0);zlabel('\itz','Rotation',0)
%%
moonfigure
set(gca,'linewidth',1,'Fontname','Times New Roman','fontsize',20);

