ccc

directoryPath = './';
contents = dir(directoryPath );

% Initialize an empty cell array to store folder names
folderNames = {};

% Loop through the contents and filter out folder names
for i = 1:length(contents)
    if contents(i).isdir && ~strcmp(contents(i).name, '.') && ~strcmp(contents(i).name, '..')
        folderNames{end+1} = contents(i).name;
    end
end
%%
close all
hold on
for i=1:length(folderNames)
plotbra([directoryPath,folderNames{i}])
end
axis([0 2 0 5])


load Too_slow.mat
L(1,:)=x(end)*exp(par(end)*t);
M(1,:)=max(sol(:,:,1)');
S{1}=['$r=$',num2str(par(end))];
Us(:,:,1)=sol(:,:,1);

load Just_right.mat
M(2,:)=max(sol(:,:,1)');
L(2,:)=x(end)*exp(par(end)*t);
S{2}=['$r=$',num2str(par(end))];
Us(:,:,2)=sol(:,:,1);

load Too_fast.mat
L(3,:)=x(end)*exp(par(end)*t);
M(3,:)=max(sol(:,:,1)');
S{3}=['$r=$',num2str(par(end))];
Us(:,:,3)=sol(:,:,1);


p=plot(L',M','linewidth',3);
legend(p,S)
xlabel('$L(t)$')
ylabel('$\max(u)$')
axis([0 2 0 5])