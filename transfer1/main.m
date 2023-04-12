clear all
global T y00 y11
load('xx12.mat');
%% data1
load('ini-10-0.5.mat');ii=110;T=0.05; % Thrust 50 mN
%% data2
% load('ini-3-0.18.mat');ii=300;T=0.18; % Thrust 180 mN
%% compute
y00=x2(1518-ii,:);y11=x1(ii,:);
tol=1e-4;solinit.y = sol.y;solinit.x = sol.x;
solinit.parameters = sol.parameters;
opts = odeset('Reltol',tol,'AbsTol',tol);
sol = bvp4cg(@transfer_odes33,@transfer_bcs,solinit,opts);
save('000.mat','sol','T','ii')
%---------------------------------------------------------------------------
%% Plots
plot_fig