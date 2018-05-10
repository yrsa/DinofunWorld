function [groups] = FindGroups(ids, data)
%FINDGROUPS Summary of this function goes here
%   Finds groups of people that have the same check in sequence
%   Assume data is sorted on id

% find all unique sequences of check_ins
groups = cell(length(ids), 1); %Preallocate space. We will have max the number of individuals as groups
for i=1:length(ids)
    person = data(data.id == ids(i),:); % fetch all the data for 1 person
    
    % Find out where they've checked in
    check_ins = person(person.type == 'check-in', :);

    places = [check_ins.(4) check_ins.(5)];
    [row ~] = size(places);
    seq = cell(row, 1);

    for j=1:row
       seq{j} = places(j, :); % Find the chronological sequence in which they were visited
    end
    
    group = FindGroup(seq, ids, data);
    
    %remove all the ids that have already been grouped
    for j=1:length(group)
        ids = ids(ids ~= group(j));
    end
    
    % add the found group to the list of groups
    groups{i} = group;
end

end

