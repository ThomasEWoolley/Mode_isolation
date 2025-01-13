ccc
for j=1:5
    figure
    load(['Names_numbers_mode_',num2str(j),'.mat'])
    directoryPath = ['./Mode_',num2str(j),'/'];

    hold on
    for k=1:length(largest_file_names)
        % flag=0;
        % j=i;
        %
        %
        %
        load([folder_names{k},'/',largest_file_names{k}])
        n1=1;
        n2=length(p.branch(8,:));

        % plot(p.branch(4,n1:n2),p.branch(8,n1:n2),'b','linewidth',3) %Plots branch max
        for i=n1:2:n2-2 % loop from first-point to last point
            lw=1;
            if(~ismember(p.branch(2,i),[-2 -1 1 2]) && p.branch(3,i)  ==0); lw=3;  end
            if( ismember(p.branch(2,i),[-2 -1 1 2]) && p.branch(3,i+2)==0); lw=3;  end

            plot(p.branch(4,i:i+2),p.branch(10,i:i+2),'b','Linewidth',lw);
            plot(p.branch(4,i:i+2),p.branch(11,i:i+2),'b','Linewidth',lw);
            % drawnow

            % if flag==0
            %     bifpoint(counter,:)=[p.branch(4,i),p.branch(12,i)];
            %     % text(p.branch(4,i:i+2),p.branch(12,i:i+2)+.5,num2str(counter))
            %     flag=1;
            %     counter=counter+1;
            % end

        end
        % title(num2str(j))
        % nexttile
        % hold on
    end
    xlabel('$L(t)$')
    ylabel('$\min(u)\, \&\, \max(u)$')
    xlim([0 40])
    set(gca,'FontSize',20)
    title(['$\beta=$ ',num2str(p.branch(8,1))])

export_fig(['C:\Users\Thomas Woolley\Dropbox\Apps\Overleaf\Mode_isolation_Turing\Pictures\Isolated_n_',num2str(j),'.png'],'-r300')

end