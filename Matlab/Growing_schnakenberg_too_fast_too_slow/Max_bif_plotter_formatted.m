ccc
load Names_numbers.mat

% %%
close all
% tiledlayout('flow')
hold on
ids=1:length(folder_names)-1;
for i=[4,8,13,17,20,24]
ids(ids==i)=[];
end

for i=ids
    % j=i;
    %
    %
    %
    load([folder_names{i},'/',largest_file_names{i}])
    n1=1;
    n2=length(p.branch(8,:));

    % plot(p.branch(4,n1:n2),p.branch(8,n1:n2),'b','linewidth',3) %Plots branch max
    for i=n1:2:n2-2 % loop from first-point to last point
        lw=1;
        if(~ismember(p.branch(2,i),[-2 -1 1 2]) && p.branch(3,i)  ==0); lw=3;  end
        if( ismember(p.branch(2,i),[-2 -1 1 2]) && p.branch(3,i+2)==0); lw=3;  end

        plot(p.branch(4,i:i+2),p.branch(12,i:i+2),'b','Linewidth',lw);
        plot(p.branch(4,i:i+2),p.branch(13,i:i+2),'b','Linewidth',lw);
    end
    % title(num2str(j))
    % nexttile
    % hold on
end
q(1)=plot([0 0.1],2*[1 1],'b','Linewidth',3);
load Too_slow.mat
L(1,:)=x(end)*exp(par(end)*t);
M(1,:)=max(sol(:,:,1)');
m(1,:)=min(sol(:,:,1)');
S{1}=['$r=$',num2str(par(end))];
Us(:,:,1)=sol(:,:,1);

load Just_right.mat
M(2,:)=max(sol(:,:,1)');
m(2,:)=min(sol(:,:,1)');
L(2,:)=x(end)*exp(par(end)*t);
S{2}=['$r=$',num2str(par(end))];
Us(:,:,2)=sol(:,:,1);

load Too_fast.mat
L(3,:)=x(end)*exp(par(end)*t);
M(3,:)=max(sol(:,:,1)');
m(3,:)=min(sol(:,:,1)');
S{3}=['$r=$',num2str(par(end))];
Us(:,:,3)=sol(:,:,1);

%%
hold on

q(2)=plot(L(1,:)',M(1,:)','-', 'Color',[0 0.5 0 a],'linewidth',3);
q(3)=plot(L(2,:)',M(2,:)','-', 'Color',[0 0 0 a],'linewidth',3);
q(4)=plot(L(3,:)',M(3,:)','-', 'Color',[1 0 0 a],'linewidth',3);
plot(L(1,:)',m(1,:)','-', 'Color',[0 0.5 0 a],'linewidth',3);
plot(L(2,:)',m(2,:)','-', 'Color',[0 0 0 a],'linewidth',3);
plot(L(3,:)',m(3,:)','-', 'Color',[1 0 0 a],'linewidth',3);

legend(q,'Steady states','$r=10^{-6}$','$r=10^{-3}$','$r=5\times 10^{-3}$')
xlabel('$L(t)$')
ylabel('$\min(u)\, \&\, \max(u)$')
axis([0 2 0 5])
set(gca,'FontSize',15)