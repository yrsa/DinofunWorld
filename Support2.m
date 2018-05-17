function [times_visited, support] = Support2(items, seq_table)
%SUPPORT2 Summary of this function goes here
%   Items is a nX1 array containing strings, representing the names in a 
% combined item set.

%get the combinations
% [row, ~] = size(items);
% first = items(1:row-1, :);
% 
% %get the most recently added item in the set
% last = items(row,:);

%%
load 'attractions.mat';

%find the positions corresponding to the items

if(ischar(items))
   items = convertCharsToStrings(items); 
end

positions = zeros(length(items), 2);
for i=1:length(items)
    pos = attractions(strcmp(attractions.name, items(i)),:);
    x = pos.xpos(1);
    y = pos.ypos(1);
    positions(i,:) = [x y];

end

% positions = table2array(positions(1, 3:4));


support = 0;
times_visited = 0;
for i=1:height(seq_table) 
    row = seq_table(i,:);
    seq = row.sequence(1);
    seq = seq{1};
    seq = eval(seq);
    
    %Store a 1 if the current position exists in the person's sequence
    contains = zeros(length(positions(:,1)), 1); 
    
    [r ~] = size(positions);
    %for each ride in the set
    for j=1:r
%         seqstr = [num2str(seq(j,1)), num2str(seq(j,2))];
        pos = positions(j,:);
        
        %compare it to the places in the sequences
        [r2 ~] = size(seq);
        for k = 1:r2
            
            if(seq(k,:) == pos)
                contains(j) = 1;

            end
        end   
    end
    
        %if contains only has non-zero elements, all the rides in positions
        %have been visited -> increase visit count
        %THIS IS POTENTIALLY SLIGHTLY WRONG
%         c = ;
        if(isempty(find(contains == 0)))
            times_visited = times_visited + 1;
        end
end



support = times_visited / height(seq_table);


end

