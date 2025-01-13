ccc
load Names_numbers.mat
figure('units','normalized','Position',[0 0.1 1 1/3])
for k=1:3
    subplot(1,3,k)
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

    if k==1
        load Too_slow.mat
        S{1}='$r=10^{-6}$';
    elseif k==2
        load Just_right.mat
        S{1}='$r=10^{-3}$';
    elseif k==3
        load Too_fast.mat
        S{1}='$r=5\times 10^{-2}$';
    end
    

    L=x(end)*exp(par(end)*t);
    M=max(sol(:,:,1)');
    m=min(sol(:,:,1)');
    
    Us=sol(:,:,1);

    %%
    hold on

    q(2)=plot(L',M','-', 'Color',[0 0 0],'linewidth',3);
    plot(L',m','-', 'Color',[0 0 0],'linewidth',3);

    % legend(q,'Steady states',S{1},'location','e')
    xlabel('$L(t)$')
    ylabel('$\min(u)\, \&\, \max(u)$')
    axis([0 2 0 5])
    set(gca,'FontSize',15)
end