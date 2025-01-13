ccc

for i=1:5
% Specify the root directory where you want to start searching
root_directory = ['.\Mode_',num2str(i)];

% Initialize arrays to store folder names, largest file names, and largest numbers
[folder_names, largest_file_names, largest_numbers] = processFolder(root_directory);

% Display the collected information
fprintf('Folders and corresponding files with the largest numbers:\n');
for idx = 1:numel(folder_names)-1
    fprintf('Folder: %s\n', folder_names{idx});
    fprintf('File with the largest number: %s\n', largest_file_names{idx});
    fprintf('Largest number found: %d\n\n', largest_numbers(idx));
end

save(['Names_numbers_mode_',num2str(i),'.mat'])
end

function [folder_names, largest_file_names, largest_numbers] = processFolder(folder)
    % List all files and folders in the current directory
    contents = dir(folder);
    
    % Initialize arrays to store the results for the current folder
    folder_names = {};
    largest_file_names = {};
    largest_numbers = [];
    
    % Loop through each item in the current directory
    for i = 1:length(contents)
        item = contents(i);
        
        if item.isdir && ~strcmp(item.name, '.') && ~strcmp(item.name, '..')
            % If the item is a subfolder (and not '.' or '..'), recursively process it
            subfolder = fullfile(folder, item.name);
            [subfolder_names, subfolder_files, subfolder_numbers] = processFolder(subfolder);
            
            % Concatenate results from subfolder into the current folder's results
            folder_names = [folder_names; subfolder_names];
            largest_file_names = [largest_file_names; subfolder_files];
            largest_numbers = [largest_numbers; subfolder_numbers];
        elseif ~item.isdir
            % If the item is a file, extract numbers from the filename
            [~, filename, ext] = fileparts(item.name);
            if strcmpi(ext, '.mat')  % Adjust file extension as needed
                % Extract numbers from the filename using regular expression
                numbers = regexp(filename, '\d+', 'match');
                
                if ~isempty(numbers)
                    % Convert the extracted number from string to numeric format
                    current_number = str2double(numbers{end});  % Use the last number in the filename
                    
                    % Check if the current number is the largest found so far
                    if isempty(largest_numbers) || current_number > max(largest_numbers)
                        % Update the largest number and corresponding file name
                        largest_numbers = current_number;
                        largest_file_names = item.name;
                    end
                end
            end
        end
    end
    
    % Store the folder name in the results (only for non-empty largest_numbers)
    if ~isempty(largest_numbers)
        folder_names = [folder_names; {folder}];
    end
end

