ccc
% Specify the current directory
current_directory = pwd;  % Get the current directory

% List all contents of the current directory
contents = dir(current_directory);

% Initialize a cell array to store subfolder names
subfolder_names = {};

% Loop through each item in the current directory
for i = 1:numel(contents)
    item = contents(i);
    
    % Check if the item is a directory (folder) and not '.' or '..'
    if item.isdir && ~strcmp(item.name, '.') && ~strcmp(item.name, '..')
        % Add the folder name to the subfolder_names cell array
        subfolder_names{end+1} = item.name;
    end
end

for i = 1:numel(subfolder_names)
plotbra(subfolder_names{i})
end