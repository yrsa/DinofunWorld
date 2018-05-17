function [support] = Support(item,seq_table)
%SUPPORT Summary of this function goes here
%   Detailed explanation goes here
load 'attractions.mat';

pos = attractions(strcmp(attractions.name, item));
pos = table2array(pos(1, 3:4));

support = 0;
for i=1:height(seq_table) 
    row = seq_table(i,:);
    seq = row.seq(1);
    seq = eval(seq);
    
    [r ~] = size(seq);
    for j=1:r
        if(seq(j,:) == pos)
            support = support + 1;
        end
    end
end

support = support / height(seq_table);

