ccc

directoryPath = './Mode_4/';
contents = dir(directoryPath );

% Initialize an empty cell array to store folder names
folderNames = {};

% Loop through the contents and filter out folder names
for i = 1:length(contents)
    if contents(i).isdir && ~strcmp(contents(i).name, '.') && ~strcmp(contents(i).name, '..')
        folderNames{end+1} = contents(i).name;
    end
end

hold on
for i=1:length(folderNames)
plotbra([directoryPath,folderNames{i}])
end