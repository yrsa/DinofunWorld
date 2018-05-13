function [groups] = FindGroups(seqs, ids, data)
%FINDGROUPS Summary of this function goes here
%   Finds groups of people that have the same check in sequence
%   Assume data is sorted on id

groups = cell(length(seqs), 1); %Preallocate space. We will have max the number of individuals as groups

%for every unique sequence
for i=1:length(seqs)
    %find all individuals that match the sequence
    group = FindGroup(seqs{i}, ids, data); %group will contain ids
    
    %Remove the ids of people that have been found
    %remove all the ids that have already been grouped
    for j=1:length(group)
        ids = ids(ids ~= group(j));
    end
    
    groups{i} = group;

end

end

