ccc

par=[0.1 0.2 0.3 0.1 1e-6];%[c1 cn1 c2 c3 r]

% Spatial domain
x = linspace(0, 0.1, 200);

% Time domain
t = linspace(0, 3e6, 1e3);

% options = odeset('RelTol',0.1,'AbsTol',0.1,'MaxStep',10); 
% Solve the PDE system
sol = pdepe(0, @(x, t, u, DuDx)pde_eqn(x, t, u, DuDx,par), @(x)pde_ic(x,par), @pde_bc, x, t);

% Extract solutions for u and v
ue = sol(:,:,1);
us = sol(:,:,2);
save Too_slow
%%
% Plot results
close all
pcolor(x, t, ue);
xlabel('Space, $x$');
ylabel('Time, $t$');
shading interp



function [c, f, s] = pde_eqn(x, t, u, DuDx,par)
% Schnakenberg PDE system equations
c1=par(1);
cn1=par(2);
c2=par(3);
c3=par(4);
r=par(5);

tfin=16e3;
L=@(r,t,tfin)exp(r*t);

c = [1; 1];
f = [1e-4;1e-2].*DuDx/L(r,t,tfin)^2;
% s = [gamma-beta-u(1)+u(1)^2*u(2)+1e-6*cos(99*x); beta-u(1)^2*u(2)+1e-6*cos(99*x)];
s = [c1-cn1*u(1)+c3*u(1)^2*u(2)-r*u(1)+1e-6*cos(99*x); c2-c3*u(1)^2*u(2)-r*u(2)+1e-6*cos(99*x)];
end

function u = pde_ic(x,par)
% Initial conditions
c1=par(1);
cn1=par(2);
c2=par(3);
c3=par(4);
r=par(5);

u0 = abs((c1+c2)/cn1+0.1*randn); % Initial condition for u
v0 = abs(c2/(c3*((c1+c2)/cn1)^2)+0.1*randn); % Initial condition for v
u=[u0;v0];
end

function [pl, ql, pr, qr] = pde_bc(xl, ul, xr, ur, t)
% Boundary conditions (no flux conditions)
pl = [0; 0];
ql = [1; 1];
pr = [0; 0];
qr = [1; 1];
end
