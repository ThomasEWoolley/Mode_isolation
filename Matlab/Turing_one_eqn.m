ccc

gamma=2;
beta=1.45;

[t,y] = ode45(@(t,y)vdp1(t,y,gamma,beta),[0 10],[0.005+0*(beta/gamma^2-0.2); 0]);
plot(t,y(:,1))



function dydt = vdp1(t,y,gamma,beta)
v=y(1);
w=y(2);

dydt = [w;
    -beta+1/(4*v)*(1+sqrt(1-4*v*(gamma-beta)))^2];
end