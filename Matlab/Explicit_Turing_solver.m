ccc

beta=8;
gamma=9.39;
r=1/1000;
n=50;
% Spatial domain
x = linspace(0, 6, n);
h=x(2)-x(1);

% Time domain
% t = linspace(0, 1e6, 1e6+1);
dt=1e-7;
% T=0:dt:1e5;

% LP=diag(-1:-1:-8)+diag(1:7,-1)+diag(randi(10,1,7),1);
e = ones(n,1);
LP = spdiags([e -2*e e], -1:1, n, n);
LP(1,1)=-1;
LP(end,end)=-1;
% full(LP)
LP=LP/h^2;
u0 = abs(gamma+0.1*randn(n,1)); % Initial condition for u
v0 = abs(beta/gamma^2+0.1*randn(n,1)); % Initial condition for v
w=[u0;v0];
for i=1:1/dt%length(T)
    if isnan(w)
    1
end
    u=w(1:n);
    v=w(n+1:end);
    w=w+dt*([LP*u;1000*LP*v]/(1+i*dt*5)^2+[gamma-beta-u+u.^2.*v; beta-u.^2.*v]);

end
plot(x,w(1:n))
