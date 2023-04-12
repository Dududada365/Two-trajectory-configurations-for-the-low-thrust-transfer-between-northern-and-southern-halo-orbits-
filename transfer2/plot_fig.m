clear all;clc
    ny0=250;
    ny1=250;
    load('000.mat');num=length(sol.x);
y00=[1.15388633391533;0;-0.138702756149394;0;-0.215047537035519;0];
y11=[1.15388633391533;0;0.138702756149394;0;-0.215047537035519;0];

figure(2)
subplot(1,2,1)
moonfigure;hold on
y0=y00;
options = odeset('RelTol',1e-12,'AbsTol',1e-12);
[t1,x1]=ode45('vdp0',[0 3.41507133822637],y0,options);
plot3(x1(:,1),x1(:,2),x1(:,3),'r','LineWidth',1)
hold on
axis equal

y0=y11;
options = odeset('RelTol',1e-12,'AbsTol',1e-12);
[t1,x1]=ode45('vdp0',[0 3.38250837276651],y0,options);
plot3(x1(:,1),x1(:,2),x1(:,3),'r','LineWidth',1)

plot3(sol.y(1,:),sol.y(2,:),sol.y(3,:),'g','LineWidth',2)
plot3(sol.y(1,1),sol.y(2,1),sol.y(3,1),'*k','LineWidth',2)
plot3(sol.y(1,end),sol.y(2,end),sol.y(3,end),'*k','LineWidth',2)
grid on

xlabel('\it{x}')
ylabel('\ity','Rotation',0)
zlabel('\itz','Rotation',0)
box on
set(gca,'linewidth',1,'Fontname','Times New Roman','fontsize',30);
axis([0.8 1.2 -0.2 0.25 -0.25 0.2]);view(31,28)
plot3(sol.y(1,:),sol.y(2,:),ones(1,num)*(-0.25),'b','LineWidth',1)
plot3(sol.y(1,1),sol.y(2,1),ones(1,1)*(-0.25),'k*','LineWidth',2)
plot3(sol.y(1,end),sol.y(2,end),ones(1,1)*(-0.25),'k*','LineWidth',2)

plot3(sol.y(1,:),ones(1,num)*(0.25),sol.y(3,:),'b','LineWidth',1)
plot3(sol.y(1,1),ones(1,1)*(0.25),sol.y(3,1),'k*','LineWidth',2)
plot3(sol.y(1,end),ones(1,1)*(0.25),sol.y(3,end),'k*','LineWidth',2)

plot3(ones(1,num)*(0.8),sol.y(2,:),sol.y(3,:),'b','LineWidth',1)
plot3(ones(1,1)*(0.8),sol.y(2,1),sol.y(3,1),'k*','LineWidth',1)
plot3(ones(1,1)*(0.8),sol.y(2,end),sol.y(3,end),'k*','LineWidth',2)
%%
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
ylabel('{\it¦È} ¡ã','Rotation',0)
h=legend('\it¦È_1','\it¦È_2');
set(h,'FontName','Times New Roman','FontSize',25,'EdgeColor','none','Color','none')
grid on
set(gca,'linewidth',1,'Fontname','Times New Roman','fontsize',30);

