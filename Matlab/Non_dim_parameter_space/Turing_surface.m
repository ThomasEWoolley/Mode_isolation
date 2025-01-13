ccc
n=2000;
L=3;
Zl=1e2;
gammavv=linspace(0,L,n);
[gammav,betav]=meshgrid(linspace(0,L,n),linspace(0,L,n));
[gamma,beta,d]=meshgrid(linspace(0,L,n),linspace(0,L,n),linspace(0,Zl,n/10));


ids2=gamma>beta;
ids3=2*beta>gamma;
ids1=2*beta<gamma.*(1+gamma.^2);
ids4=((2*beta - gamma).*d - gamma.^3) > 2*gamma.^2.*sqrt(d);
ids5=ids1.*ids2.*ids3.*ids4;

ids2=gammav>betav;
ids3=2*betav>gammav;
ids1=2*betav<gammav.*(1+gammav.^2);
ids4=ids1.*ids2.*ids3;
ids4(ids4==0)=nan;



s=isosurface(gamma,beta,d, ids5);

close all
% p=pcolor(gamma(:,:),beta(:,:),ids5(:,:));
% shading interp
hold on
plot(gammavv,gammavv,'r','LineWidth',3)
plot(gammavv,gammavv/2,'k','LineWidth',3)
plot(gammavv,gammavv.*(1+gammavv.^2)/2,'b','LineWidth',3)
plot3(gammavv,((2*gammavv*sqrt(60) + gammavv.^2 + 60).*gammavv)/(2*60),60*ones(size(gammavv)),'g--','LineWidth',3)
surf(gammav,betav,ids4*0,'facecolor',[0 1 0])
caxis([-1e5 1])
shading interp


p = patch(s);
p.FaceColor = 'g';
p.EdgeColor = 'none';
view([-30 20])
camlight('right'); lighting gouraud

xlabel('$\gamma$')
ylabel('$\beta$')
zlabel('$D$')
axis([0 L 0 L 0 Zl])

export_fig('C:\Users\Thomas Woolley\Dropbox\Apps\Overleaf\Mode_isolation_Turing\Pictures\Parameter_region.png','-r300')


