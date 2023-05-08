clear all;clc
load('000.mat')
load('resultl2-500.mat')
global T y00 y11
for T=0.05:0.001:0.05
    T
for num=10:3:10
    num
y00=xzvyL2(:,num);
y11=y00;y11(3)=-y11(3);
for i=1:1:10
tol=1e-4;
solinit.y = sol.y;solinit.x = sol.x;
solinit.parameters = sol.parameters;
opts = odeset('Reltol',tol,'AbsTol',tol);
sol = bvp4c(@transfer_odes33,@transfer_bcs,solinit,opts);
if sol.tol<tol
    save('000.mat','sol','T','num')
    break
end
end
end
end
%---------------------------------------------------------------------------
%% Plots
figure(2)
subplot(1,2,1)
y0=y00;
options = odeset('RelTol',1e-12,'AbsTol',1e-12);
[t1,x1]=ode45('vdp0',[0 3.5],y0,options);
plot3(x1(:,1),x1(:,2),x1(:,3),'r','LineWidth',2)
grid on
grid minor
hold on
axis equal
xlabel('x')
ylabel('y')

y0=y11;moonfigure;
options = odeset('RelTol',1e-12,'AbsTol',1e-12);
[t1,x1]=ode45('vdp0',[0 3.5],y0,options);
plot3(x1(:,1),x1(:,2),x1(:,3),'r','LineWidth',2)
grid on
hold on

plot3(sol.y(1,:),sol.y(2,:),sol.y(3,:),'g','LineWidth',3)
hold on
grid on
grid minor
axis equal
xlabel('x');ylabel('y');zlabel('z')
set(gca,'linewidth',1,'Fontname','Times New Roman','fontsize',20);
%%
subplot(1,2,2)

tr=sol.x/2.665314945662769e-06*sol.parameters;
v1=-sol.y(11,:)./sqrt(sol.y(11,:).^2+sol.y(12,:).^2+sol.y(13,:).^2);
v2=-sol.y(12,:)./sqrt(sol.y(11,:).^2+sol.y(12,:).^2+sol.y(13,:).^2);
v3=-sol.y(13,:)./sqrt(sol.y(11,:).^2+sol.y(12,:).^2+sol.y(13,:).^2);
ax=atan2d(-sol.y(12,:),-sol.y(11,:));
ay=atan2d(v3,v1./cosd(ax));
plot(tr/86400,ax,'LineWidth',2)
hold on
plot(tr/86400,ay,'LineWidth',2)
xlabel('day')
ylabel('{\it¦È} ¡ã')
legend('\it¦È_1','\it¦È_2')
grid on
% grid minor
set(gca,'linewidth',1,'Fontname','Times New Roman','fontsize',20);

