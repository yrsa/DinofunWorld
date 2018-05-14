function [res] = FindLargeGroup(groups,num)
%FINDLARGEGROUP Summary of this function goes here
%   Detailed explanation goes here
heights = cell(length(groups), 1);
for i=1:length(groups)
    row = groups{i};
    h = height(row);
    heights{i} = h;   
end

height_table = [groups heights];
headers = {'group', 'num_people'};

numbered_table = cell2table(height_table);
numbered_table.Properties.VariableNames = headers;

res = numbered_table(numbered_table.(2) > num, :);
end

