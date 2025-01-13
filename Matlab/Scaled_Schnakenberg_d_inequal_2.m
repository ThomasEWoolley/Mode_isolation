ccc
fu=@(beta,gamma)(2*beta)./gamma-1;
fv=@(beta,gamma)gamma.^2;
gu=@(beta,gamma)-(2*beta)./gamma;
gv=@(beta,gamma)-gamma.^2;

n=100;
[beta,gamma,dv]=meshgrid(linspace(0,20,n),linspace(0,20,n),linspace(0,500,n));
% 
% T3=@(beta,gamma,dv)(dv.*fu(beta,gamma) + gv(beta,gamma)).^2-...
%     4*dv.*(fu(beta,gamma).*gv(beta,gamma) - fv(beta,gamma).*gu(beta,gamma));
% 
% t3=T3(beta,gamma,dv);
% post3=(t3>0);
% ineq1=2*beta>gamma;
% ineq2=beta< gamma.*(1+gamma.^2)/2;
% ineq3=gamma>beta;
% beta=beta.*post3.*ineq1.*ineq2.*ineq3;
% gamma=gamma.*post3.*ineq1.*ineq2.*ineq3;
% dv=dv.*post3.*ineq1.*ineq2.*ineq3;
% t3=t3.*post3.*ineq1.*ineq2.*ineq3;


T1=fu(beta,gamma) + gv(beta,gamma)<0;
T2=fu(beta,gamma).*gv(beta,gamma) - fv(beta,gamma).*gu(beta,gamma)>0;
T3=dv.*fu(beta,gamma) + gv(beta,gamma)>0;
T4=(dv.*fu(beta,gamma) + gv(beta,gamma)).^2-...
    4*dv.*(fu(beta,gamma).*gv(beta,gamma) - fv(beta,gamma).*gu(beta,gamma));
T4i=T4>0;

beta=beta.*T1.*T2.*T3.*T4i;
gamma=gamma.*T1.*T2.*T3.*T4i;
dv=dv.*T1.*T2.*T3.*T4i;
% t3=t3.*post3.*ineq1.*ineq2.*ineq3;


gamma=gamma(beta>0);
dv=dv(beta>0);
T4=T4(beta>0);
% t3=t3(beta>0);
beta=beta(beta>0);


scatter3(beta(:),gamma(:),dv(:),1,T4(:))
% min(t3(:))
% max(t3(:))
xlabel('$\beta$')
ylabel('$\gamma$')
zlabel('$D_v$')
% set(gca,'zscale','log')
colorbar
caxis([0 1000])