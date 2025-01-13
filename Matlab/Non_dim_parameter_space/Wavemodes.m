ccc
figure('Units','normalized','Position',[0 .1 1/2 1/3])
subplot(1,2,1)
s=plotter;
legend(s,'location','se','FontSize',12)
axis([0 10 0 10])

subplot(1,2,2)
plotter;
par=[9.3 8.9 8.76 8.73 8.71]; % Parameters used in functions and Jacobian
plot(10,par,'kx')
axis([9.99 10.01 8.65 9.46])

export_fig('C:\Users\Thomas Woolley\Dropbox\Apps\Overleaf\Mode_isolation_Turing\Pictures\Isolated_boundaries.png','-r300')

function s=plotter
gamma=linspace(0,11);
b=@(gamma,d,n) gamma.^3./(2*d) + ((2*n.^2 + 2*n + 1).*gamma.^2)./(2*n.*(n + 1).*sqrt(d)) + gamma/2;
dd=1e3;
hold on
for i=1:6
plot(gamma,b(gamma,dd,i),'LineWidth',1)
s{i}=['$n=$ ',num2str(i)];
end
plot(gamma,gamma,'r','LineWidth',3)%,'color',[0.1 0.1 0.1])
plot(gamma,gamma/2,'k','LineWidth',3)%'color',[0.1 0.1 0.1])
plot(gamma,gamma.*(1+gamma.^2)/2,'b','LineWidth',3)%,'color',[0.1 0.1 0.1])
plot(gamma,((2*gamma*sqrt(dd) + gamma.^2 + dd).*gamma)/(2*dd),'g--','LineWidth',3)%,'color',[0.1 0.1 0.1])
set(gca,'FontSize',15)
xlabel('$\gamma$')
ylabel('$\beta$')

end