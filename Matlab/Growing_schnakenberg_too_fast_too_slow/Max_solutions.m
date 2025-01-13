ccc
load Too_slow.mat
T(1,:)=t;
L(1,:)=x(end)*exp(par(end)*t);
M(1,:)=max(sol(:,:,1)');
S{1}=['$r=$',num2str(par(end))];
Us(:,:,1)=sol(:,:,1);

load Just_right.mat
T(2,:)=t;
M(2,:)=max(sol(:,:,1)');
L(2,:)=x(end)*exp(par(end)*t);
S{2}=['$r=$',num2str(par(end))];
Us(:,:,2)=sol(:,:,1);

load Too_fast.mat
T(3,:)=t;
L(3,:)=x(end)*exp(par(end)*t);
M(3,:)=max(sol(:,:,1)');
S{3}=['$r=$',num2str(par(end))];
Us(:,:,3)=sol(:,:,1);


% plot(L',M','linewidth',3)
% legend(S)
% xlabel('$L(t)$')
% ylabel('$\max(u)$')
% axis([0 2 0 5])

figure('units','normalized','Position',[0 0.1 1 1/3])
for i=1:3
    subplot(1,3,i)
    pcolor(x, T(i,:), Us(:,:,i));
    xlabel('Space, $x$');
    ylabel('Time, $t$');
    shading interp
    set(gca,'FontSize',15)
end
