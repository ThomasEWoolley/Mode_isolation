ccc

beta=8;
gamma=9.39;
r=1/1000;

% Spatial domain
x = linspace(0, 1, 100);

% Time domain
t = linspace(0, 20e3, 20e3+1);

options = odeset('RelTol',0.1,'AbsTol',0.1,'MaxStep',10); 
% Solve the PDE system
sol = pdepe(0, @(x, t, u, DuDx)pde_eqn(x, t, u, DuDx,beta,gamma,r), @(x)pde_ic(x,beta,gamma), @pde_bc, x, t,options);

% Extract solutions for u and v
ue = sol(:,:,1);
us = sol(:,:,3);

%%
% Plot results
figure;
subplot(1,3,1)
pcolor(x, t, ue);
xlabel('x');
ylabel('Time');
shading interp
subplot(1,3,2)
pcolor(x, t, us);
xlabel('x');
ylabel('Time');
shading interp
subplot(1,3,3)
loglog(range(ue,2));


function [c, f, s] = pde_eqn(x, t, u, DuDx,beta,gamma,r)
% Schnakenberg PDE system equations
c = [1; 1; 1; 1];
tfin=16e3;
L=@(r,t,tfin)(1/(1+r*t)*(t<tfin)+1/(1+r*tfin)*(t>=tfin));
f = [1*L(r,t,tfin)^2;1000*L(r,t,tfin)^2;1*L(r,tfin,tfin)^2;1000*L(r,tfin,tfin)^2].*DuDx;
% f = [1;1000].*DuDx*(1/(1+r*t)^2);
if t>tfin+1e3
    1;
end
% f = [1;1000].*DuDx;
s = [gamma-beta-u(1)+u(1)^2*u(2)+1e-6*cos(99*x); beta-u(1)^2*u(2)+1e-6*cos(99*x);gamma-beta-u(3)+u(3)^2*u(4); beta-u(3)^2*u(4)];
end

function u = pde_ic(x,beta,gamma)
% Initial conditions
u0 = abs(gamma+0.1*randn); % Initial condition for u
v0 = abs(beta/gamma^2+0.1*randn); % Initial condition for v
u=[u0;v0;u0;v0];
end

function [pl, ql, pr, qr] = pde_bc(xl, ul, xr, ur, t)
% Boundary conditions (no flux conditions)
pl = [0; 0; 0; 0];
ql = [1; 1; 1; 1];
pr = [0; 0; 0; 0];
qr = [1; 1; 1; 1];
end
