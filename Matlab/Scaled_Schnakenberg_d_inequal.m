ccc
fu=@(beta,gamma)(2*beta)./gamma-1;
fv=@(beta,gamma)gamma.^2;
gu=@(beta,gamma)-(2*beta)./gamma;
gv=@(beta,gamma)-gamma.^2;
bm=10;
gm=20;
dvm=100;
n=500;
[beta,gamma,dv]=meshgrid(linspace(0,bm,n),linspace(0,gm,n),linspace(0,dvm,n));
%
T3=@(beta,gamma,dv)(dv.*fu(beta,gamma) + gv(beta,gamma)).^2-...
    4*dv.*(fu(beta,gamma).*gv(beta,gamma) - fv(beta,gamma).*gu(beta,gamma));

t3=T3(beta,gamma,dv);
post3=(t3>0);
ineq1=2*beta>gamma;
ineq2=beta< gamma.*(1+gamma.^2)/2;
ineq3=gamma>beta;
ineq4=(dv.*fu(beta,gamma) + gv(beta,gamma))>0;
beta=beta.*post3.*ineq1.*ineq2.*ineq3.*ineq4;
gamma=gamma.*post3.*ineq1.*ineq2.*ineq3.*ineq4;
dv=dv.*post3.*ineq1.*ineq2.*ineq3.*ineq4;
t3=t3.*post3.*ineq1.*ineq2.*ineq3.*ineq4;



gamma=gamma(beta>0);
dv=dv(beta>0);

t3=t3(beta>0);
beta=beta(beta>0);


scatter3(beta(:),gamma(:),dv(:),1,t3(:))
% min(t3(:))
% max(t3(:))
xlabel('$\beta$')
ylabel('$\gamma$')
zlabel('$D_v$')
% set(gca,'zscale','log')
colorbar
caxis([0 1000])
hold on
L=20;
dv=linspace(0,dvm,n);
l=1;
for n=2:5;


beta=pi^2*(n - 1)*(n^2*pi^2 + L^2)*((n - 1)^2*pi^2 + L^2)*n*sqrt(dv)/(2*L^6);
gamma = sqrt(dv)*(n - 1)*pi^2*n/L^2;

    p(l)=scatter3(beta,gamma,dv,10,'filled');

    Legs{l}=['n=',num2str(n)];
    l=l+1;
end
legend(p,Legs)
axis([0 bm 0 gm 0 dvm])