ccc
dv=1000;
gamma=linspace(0,20,2e4);
betap = (gamma.^2/2 + dv/2 + gamma*sqrt(dv)).*gamma/dv;
betan = (gamma.^2/2 + dv/2 - gamma*sqrt(dv)).*gamma/dv;
positivity=gamma.*(gamma.^2 + dv)/(2*dv);

[betavec,gammavec]=meshgrid(gamma,gamma);

L=20;

plotter=1;

% subplot(1,2,1)
hold on
if plotter==1
plot(betap,gamma,'r','linewidth',3)
plot(betan,gamma,'r--','linewidth',3)
plot(positivity,gamma,'r:','linewidth',3)
plot(gamma,gamma,'b','linewidth',3)
plot(gamma,2*gamma,'g','linewidth',3)
end

n=2;
if plotter==1
betanp1=gamma.*(n^2*pi^2 + L^2).*(dv*n^2*pi^2 + L^2*gamma.^2)/(2*L^2*dv*n^2*pi^2);
betanm1=(((n - 1)^2*pi^2 + L^2)*(dv*(n - 1)^2*pi^2 + L^2*gamma.^2).*gamma)/(2*L^2*dv*pi^2*(n - 1)^2);
plot(betanp1,gamma,'k:','linewidth',3)
plot(betanm1,gamma,'k--','linewidth',3)
end

betasgammas1=vectorize('@(beta,gamma,n,L,dv) n^2*pi^2/L^2 > ((dv*(2*beta/gamma - 1) - gamma^2 + sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv))');
betasgammas1 = str2func(betasgammas1);
betasgammas1=double(betasgammas1(betavec,gammavec,n,L,dv));
betasgammas1(betasgammas1==0)=nan;
betasgammas2=vectorize('@(beta,gamma,n,L,dv) (n - 1)^2*pi^2/L^2 < (dv*(2*beta/gamma - 1) - gamma^2 - sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv)');
betasgammas2 = str2func(betasgammas2);
betasgammas2=double(betasgammas2(betavec,gammavec,n,L,dv));
betasgammas2(betasgammas2==0)=nan;
betasgammas=betasgammas1.*betasgammas2;
betasgammas(betavec<= (gammavec.^2/2 + dv/2 + gammavec*sqrt(dv)).*gammavec/dv)=nan;
betavecplot=betavec(betasgammas>0);
gammavecplot=gammavec(betasgammas>0);
betasgammas=betasgammas(betasgammas>0);
scatter3(betavecplot,gammavecplot,betasgammas-2,10,"k");

n=3;
if plotter==1
betanp1=gamma.*(n^2*pi^2 + L^2).*(dv*n^2*pi^2 + L^2*gamma.^2)/(2*L^2*dv*n^2*pi^2);
betanm1=(((n - 1)^2*pi^2 + L^2)*(dv*(n - 1)^2*pi^2 + L^2*gamma.^2).*gamma)/(2*L^2*dv*pi^2*(n - 1)^2);
plot(betanp1,gamma,'r:','linewidth',3)
plot(betanm1,gamma,'r--','linewidth',3)
end

betasgammas1=vectorize('@(beta,gamma,n,L,dv) n^2*pi^2/L^2 > ((dv*(2*beta/gamma - 1) - gamma^2 + sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv))');
betasgammas1 = str2func(betasgammas1);
betasgammas1=double(betasgammas1(betavec,gammavec,n,L,dv));
betasgammas1(betasgammas1==0)=nan;
betasgammas2=vectorize('@(beta,gamma,n,L,dv) (n - 1)^2*pi^2/L^2 < (dv*(2*beta/gamma - 1) - gamma^2 - sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv)');
betasgammas2 = str2func(betasgammas2);
betasgammas2=double(betasgammas2(betavec,gammavec,n,L,dv));
betasgammas2(betasgammas2==0)=nan;
betasgammas=betasgammas1.*betasgammas2;
betasgammas(betavec<= (gammavec.^2/2 + dv/2 + gammavec*sqrt(dv)).*gammavec/dv)=nan;
betavecplot=betavec(betasgammas>0);
gammavecplot=gammavec(betasgammas>0);
betasgammas=betasgammas(betasgammas>0);
scatter3(betavecplot,gammavecplot,betasgammas-2,10,"r");


n=4;
if plotter==1
betanp1=gamma.*(n^2*pi^2 + L^2).*(dv*n^2*pi^2 + L^2*gamma.^2)/(2*L^2*dv*n^2*pi^2);
betanm1=(((n - 1)^2*pi^2 + L^2)*(dv*(n - 1)^2*pi^2 + L^2*gamma.^2).*gamma)/(2*L^2*dv*pi^2*(n - 1)^2);
plot(betanp1,gamma,'m:','linewidth',3)
plot(betanm1,gamma,'m--','linewidth',3)
end

betasgammas1=vectorize('@(beta,gamma,n,L,dv) n^2*pi^2/L^2 > ((dv*(2*beta/gamma - 1) - gamma^2 + sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv))');
betasgammas1 = str2func(betasgammas1);
betasgammas1=double(betasgammas1(betavec,gammavec,n,L,dv));
betasgammas1(betasgammas1==0)=nan;
betasgammas2=vectorize('@(beta,gamma,n,L,dv) (n - 1)^2*pi^2/L^2 < (dv*(2*beta/gamma - 1) - gamma^2 - sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv)');
betasgammas2 = str2func(betasgammas2);
betasgammas2=double(betasgammas2(betavec,gammavec,n,L,dv));
betasgammas2(betasgammas2==0)=nan;
betasgammas=betasgammas1.*betasgammas2;
betasgammas(betavec<= (gammavec.^2/2 + dv/2 + gammavec*sqrt(dv)).*gammavec/dv)=nan;
betavecplot=betavec(betasgammas>0);
gammavecplot=gammavec(betasgammas>0);
betasgammas=betasgammas(betasgammas>0);
scatter3(betavecplot,gammavecplot,betasgammas-2,10,"m");


xlabel('$\beta$')
ylabel('$\gamma$')
% l=legend({'$\beta_+$','$\beta_-$','positivity','$\beta$','$2\beta$',k{:}});
l=legend({'$\beta_+$','$\beta_-$','positivity','$\beta$','$2\beta$','$\beta_{k+}$','$\beta_{k-}$'});
set(l,'fontsize',15)
axis([0 max(gamma) 0 max(gamma)])

