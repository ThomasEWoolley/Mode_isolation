ccc
load Peaks_scaled_10000_randn

h=histogram(Peaks,'Normalization','probability');
edges = h.BinEdges;
values = h.Values;
centers = edges(1:end-1)+diff(edges)/2;
text(centers, values+.05, string(round(values,4)), 'HorizontalAlignment', 'center')
ylabel('Probability')
xlabel('Final wave mode')
xticks(5:9)
ylim([0 0.6])
set(gca,'FontSize',15)
export_fig('C:\Users\Thomas Woolley\Dropbox\Apps\Overleaf\Mode_isolation_Turing\Pictures\Variation_histogram.png','-r300')
%%
figure('units','Normalized','Position',[0 0 1 1/3])
for i=5:9
    load(['Peaks_',num2str(i),'.mat'])
    subplot(1,5,i-4)
    
    plot(x,data(end,:),'LineWidth',3)
    ylabel('$u$')
xlabel('Space, $x$')
title(['$k=$',num2str(i)])
    set(gca,'FontSize',15)
    axis([0 60 0 3.5])
end
export_fig('C:\Users\Thomas Woolley\Dropbox\Apps\Overleaf\Mode_isolation_Turing\Pictures\Possible_patterns_1D.png','-r300')
