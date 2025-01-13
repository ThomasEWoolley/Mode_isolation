ccc
dv=1000;
gamma=linspace(0,20,0.2e3);
betap = (gamma.^2/2 + dv/2 + gamma*sqrt(dv)).*gamma/dv;
betan = (gamma.^2/2 + dv/2 - gamma*sqrt(dv)).*gamma/dv;
positivity=gamma.*(gamma.^2 + dv)/(2*dv);

[betavec,gammavec,Lvec]=meshgrid(gamma,gamma,gamma);

L=20;

plotter=0;

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
betasgammas1=double(betasgammas1(betavec,gammavec,n,Lvec,dv));
betasgammas1(betasgammas1==0)=nan;
betasgammas2=vectorize('@(beta,gamma,n,L,dv) (n - 1)^2*pi^2/L^2 < (dv*(2*beta/gamma - 1) - gamma^2 - sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv)');
betasgammas2 = str2func(betasgammas2);
betasgammas2=double(betasgammas2(betavec,gammavec,n,Lvec,dv));
betasgammas2(betasgammas2==0)=nan;
betasgammas=betasgammas1.*betasgammas2;
betasgammas(betavec<= (gammavec.^2/2 + dv/2 + gammavec*sqrt(dv)).*gammavec/dv)=nan;
betavecplot=betavec(betasgammas>0);
gammavecplot=gammavec(betasgammas>0);
Lvecplot=Lvec(betasgammas>0);
betasgammas=betasgammas(betasgammas>0);
% scatter3(betavecplot,gammavecplot,Lvecplot,20,"k",'filled');
scatter(betavecplot,gammavecplot,20,"k",'filled');


betalim=(((n^2 - n)*dv^(3/2))/2 + (n*gamma*(n - 1)*sqrt(dv)/2 + dv*(n^2 - n + 1/2)).*gamma).*gamma/(dv^(3/2)*n*(n - 1));
plot(betalim,gamma,'o-')



% % betalim = vectorize('((16*n^4 + 6*sqrt(7*n^4 - 14*n^3 + 11*n^2 - 4*n + 1)*n^2 - 32*n^3 + 28*n^2 - 12*n + 3 - 6*sqrt(7*n^4 - 14*n^3 + 11*n^2 - 4*n + 1)*n + 3*sqrt(7*n^4 - 14*n^3 + 11*n^2 - 4*n + 1))*sqrt(dv)*(n - 1)*n)/(2*(2*n^2 + sqrt(7*n^4 - 14*n^3 + 11*n^2 - 4*n + 1) - 2*n + 1)^3)');
% % gammalim = vectorize('sqrt(dv)*(n - 1)*n/(2*n^2 + sqrt(7*n^4 - 14*n^3 + 11*n^2 - 4*n + 1) - 2*n + 1)');

n=3;
if plotter==1
betanp1=gamma.*(n^2*pi^2 + L^2).*(dv*n^2*pi^2 + L^2*gamma.^2)/(2*L^2*dv*n^2*pi^2);
betanm1=(((n - 1)^2*pi^2 + L^2)*(dv*(n - 1)^2*pi^2 + L^2*gamma.^2).*gamma)/(2*L^2*dv*pi^2*(n - 1)^2);
plot(betanp1,gamma,'g:','linewidth',3)
plot(betanm1,gamma,'g--','linewidth',3)
end

betasgammas1=vectorize('@(beta,gamma,n,L,dv) n^2*pi^2/L^2 > ((dv*(2*beta/gamma - 1) - gamma^2 + sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv))');
betasgammas1 = str2func(betasgammas1);
betasgammas1=double(betasgammas1(betavec,gammavec,n,Lvec,dv));
betasgammas1(betasgammas1==0)=nan;
betasgammas2=vectorize('@(beta,gamma,n,L,dv) (n - 1)^2*pi^2/L^2 < (dv*(2*beta/gamma - 1) - gamma^2 - sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv)');
betasgammas2 = str2func(betasgammas2);
betasgammas2=double(betasgammas2(betavec,gammavec,n,Lvec,dv));
betasgammas2(betasgammas2==0)=nan;
betasgammas=betasgammas1.*betasgammas2;
betasgammas(betavec<= (gammavec.^2/2 + dv/2 + gammavec*sqrt(dv)).*gammavec/dv)=nan;
betavecplot=betavec(betasgammas>0);
gammavecplot=gammavec(betasgammas>0);
Lvecplot=Lvec(betasgammas>0);
betasgammas=betasgammas(betasgammas>0);
% scatter3(betavecplot,gammavecplot,Lvecplot,20,"g",'filled');

scatter(betavecplot,gammavecplot,20,"g",'filled');
betalim=(((n^2 - n)*dv^(3/2))/2 + (n*gamma*(n - 1)*sqrt(dv)/2 + dv*(n^2 - n + 1/2)).*gamma).*gamma/(dv^(3/2)*n*(n - 1));
plot(betalim,gamma,'o-')
% 
% 
n=4;
if plotter==1
betanp1=gamma.*(n^2*pi^2 + L^2).*(dv*n^2*pi^2 + L^2*gamma.^2)/(2*L^2*dv*n^2*pi^2);
betanm1=(((n - 1)^2*pi^2 + L^2)*(dv*(n - 1)^2*pi^2 + L^2*gamma.^2).*gamma)/(2*L^2*dv*pi^2*(n - 1)^2);
plot(betanp1,gamma,'m:','linewidth',3)
plot(betanm1,gamma,'m--','linewidth',3)
end

betasgammas1=vectorize('@(beta,gamma,n,L,dv) n^2*pi^2/L^2 > ((dv*(2*beta/gamma - 1) - gamma^2 + sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv))');
betasgammas1 = str2func(betasgammas1);
betasgammas1=double(betasgammas1(betavec,gammavec,n,Lvec,dv));
betasgammas1(betasgammas1==0)=nan;
betasgammas2=vectorize('@(beta,gamma,n,L,dv) (n - 1)^2*pi^2/L^2 < (dv*(2*beta/gamma - 1) - gamma^2 - sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv)');
betasgammas2 = str2func(betasgammas2);
betasgammas2=double(betasgammas2(betavec,gammavec,n,Lvec,dv));
betasgammas2(betasgammas2==0)=nan;
betasgammas=betasgammas1.*betasgammas2;
betasgammas(betavec<= (gammavec.^2/2 + dv/2 + gammavec*sqrt(dv)).*gammavec/dv)=nan;
betavecplot=betavec(betasgammas>0);
gammavecplot=gammavec(betasgammas>0);
Lvecplot=Lvec(betasgammas>0);
betasgammas=betasgammas(betasgammas>0);
% scatter3(betavecplot,gammavecplot,Lvecplot,20,"m",'filled');

scatter(betavecplot,gammavecplot,20,"magenta",'filled');
betalim=(((n^2 - n)*dv^(3/2))/2 + (n*gamma*(n - 1)*sqrt(dv)/2 + dv*(n^2 - n + 1/2)).*gamma).*gamma/(dv^(3/2)*n*(n - 1));
plot(betalim,gamma,'o-')
% 
% n=5;
% if plotter==1
% betanp1=gamma.*(n^2*pi^2 + L^2).*(dv*n^2*pi^2 + L^2*gamma.^2)/(2*L^2*dv*n^2*pi^2);
% betanm1=(((n - 1)^2*pi^2 + L^2)*(dv*(n - 1)^2*pi^2 + L^2*gamma.^2).*gamma)/(2*L^2*dv*pi^2*(n - 1)^2);
% plot(betanp1,gamma,'c:','linewidth',3)
% plot(betanm1,gamma,'c--','linewidth',3)
% end
% 
% betasgammas1=vectorize('@(beta,gamma,n,L,dv) n^2*pi^2/L^2 > ((dv*(2*beta/gamma - 1) - gamma^2 + sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv))');
% betasgammas1 = str2func(betasgammas1);
% betasgammas1=double(betasgammas1(betavec,gammavec,n,Lvec,dv));
% betasgammas1(betasgammas1==0)=nan;
% betasgammas2=vectorize('@(beta,gamma,n,L,dv) (n - 1)^2*pi^2/L^2 < (dv*(2*beta/gamma - 1) - gamma^2 - sqrt((dv*(2*beta/gamma - 1) - gamma^2)^2 - 4*dv*(-(2*beta/gamma - 1)*gamma^2 + 2*gamma*beta)))/(2*dv)');
% betasgammas2 = str2func(betasgammas2);
% betasgammas2=double(betasgammas2(betavec,gammavec,n,Lvec,dv));
% betasgammas2(betasgammas2==0)=nan;
% betasgammas=betasgammas1.*betasgammas2;
% betasgammas(betavec<= (gammavec.^2/2 + dv/2 + gammavec*sqrt(dv)).*gammavec/dv)=nan;
% betavecplot=betavec(betasgammas>0);
% gammavecplot=gammavec(betasgammas>0);
% Lvecplot=Lvec(betasgammas>0);
% betasgammas=betasgammas(betasgammas>0);
% scatter3(betavecplot,gammavecplot,Lvecplot,20,"c",'filled');


xlabel('$\beta$')
ylabel('$\gamma$')
% l=legend({'$\beta_+$','$\beta_-$','positivity','$\beta$','$2\beta$',k{:}});
l=legend({'$\beta_+$','$\beta_-$','positivity','$\beta$','$2\beta$','$\beta_{k+}$','$\beta_{k-}$'});
set(l,'fontsize',15)
axis([0 max(gamma) 0 max(gamma)])

