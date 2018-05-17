function [times_visited, support] = Support(item, seq_table)
%SUPPORT Summary of this function goes here
%   Detailed explanation goes here
load 'attractions.mat';

pos = attractions(strcmp(attractions.name, item),:);
pos = table2array(pos(1, 3:4));

support = 0;
times_visited = 0;
%for every person
for i=1:height(seq_table) 
    row = seq_table(i,:);
    seq = row.sequence(1);
    seq = seq{1};
    seq = eval(seq);
    
    [r ~] = size(seq);
    %for each position in the sequence
    for j=1:r
        %compare it to the position
        if(seq(j,:) == pos)

            times_visited = times_visited + 1;
        end
    end
end

support = times_visited / height(seq_table);



