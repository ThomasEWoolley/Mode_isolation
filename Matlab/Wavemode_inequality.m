ccc
for n=3:5;
dv=linspace(0,500,100);

% beta1 = sqrt(pi^4*dv)*(n - 1)*n*(pi^4*n^4 - 2*pi^4*n^3 + pi^4*n^2 + 2*pi^2*n^2 - 2*pi^2*n + pi^2 + 1)/2;
% gamma1 = sqrt(pi^4*dv)*(n - 1)*n;

beta2 = sqrt(dv)*n*(pi^2*n^2 + 1)*pi^2*(n - 1)*(1 + (n - 1)^2*pi^2)/2;
gamma2 = pi^2*sqrt(dv)*(n - 1)*n;


% scatter3(beta1,gamma1,dv,10)
hold on
scatter3(beta2,gamma2,dv,20)
Legs{n-2}=['n=',num2str(n)];
end
legend(Legs)
% legend