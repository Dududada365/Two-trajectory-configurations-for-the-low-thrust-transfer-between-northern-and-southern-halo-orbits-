clear all
global T y00 y11
load('xx12.mat');
%% data1
load('ini-0.01.mat');ii=500;T=0.01; % Thrust 10 mN
%% data2
% load('ini-0.035.mat');ii=1;T=0.035;  % Thrust 35 mN
%% compute
y00=x2(1518-ii,:);y11=x1(ii,:);
tol=1e-5;solinit.y = sol.y;solinit.x = sol.x;
solinit.parameters = sol.parameters;
opts = odeset('Reltol',tol,'AbsTol',tol);
sol = bvp4c(@transfer_odes33,@transfer_bcs,solinit,opts);
save('000.mat','sol','T','ii')
%---------------------------------------------------------------------------
%% Plots
plot_fig