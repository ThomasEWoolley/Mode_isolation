ccc

fu=@(beta,gamma)2*beta./(gamma + beta) - 1;
fv=@(beta,gamma)(gamma + beta).^2;
gu=@(beta,gamma)-2*beta./(gamma + beta);
gv=@(beta,gamma)-(gamma + beta).^2;

n=100;
[beta,gamma,dv]=meshgrid(linspace(0,2,n),linspace(0,1,n),linspace(0,100,n));

T3=@(beta,gamma,dv)(dv.*fu(beta,gamma) + gv(beta,gamma)).^2-...
    4*dv.*(fu(beta,gamma).*gv(beta,gamma) - fv(beta,gamma).*gu(beta,gamma));

t3=T3(beta,gamma,dv);
post3=(t3>0);
ineq1=2*gamma<beta;
ineq2=gamma>-beta/2.*(beta+1).*(beta-1);

beta=beta.*post3.*ineq1.*ineq2;
gamma=gamma.*post3.*ineq1.*ineq2;
dv=dv.*post3.*ineq1.*ineq2;
t3=t3.*post3.*ineq1.*ineq2;


gamma=gamma(beta>0);
dv=dv(beta>0);
t3=t3(beta>0);
beta=beta(beta>0);

scatter3(beta(:),gamma(:),dv(:),1,t3(:))
min(t3(:))
max(t3(:))
xlabel('$\beta$')
ylabel('$\gamma$')
zlabel('$D_v$')
colorbar
caxis([0 pi^2*3])
