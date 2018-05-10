function [group] = FindGroup(target_seq,ids, data)
%FINDGROUP 
%   Finds a group of people that have the same check in sequence
%   Assume data is sorted on id

group = [];

%loop through all individuals
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
    
    %compare to target sequence
    if(CompareSequence(seq, target_seq))
        group = [group ids(i)]; %The ids of people in the group
        
        % Remove the grouped people from the data
        % data(data.id == ids(i),:) = [];
    end
  
end
end

