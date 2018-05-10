%% File for test sequences of check ins.
% Plan: find the sequence of check ins on rides for 1 person. Then find all 
% people that follow the same sequence. These people are a group.

load 'MatlabData/friday.mat';

%% Find 1 person
Day = friday;

sortedM = sortrows(Day, 2); %sort the data based on id, to pick out data for 1 individual
Ids = unique(sortedM.(2)); % get a list of all unique ids

% person = Day(Day.id == Ids(1),:); % fetch all the data for 1 person

% %% Find out where they've checked in
% check_ins = person(person.type == 'check-in', :);
% 
% places = [check_ins.(4) check_ins.(5)];
% [row col] = size(places);
% Sequence = cell(row, 1);
% 
% for i=1:row
%    Sequence{i} = places(i, :); % Find the chronological sequence in which they were visited
% end

g = GenerateSequences(Ids, Day);

%% Select all other persons that follow the same sequence
%groups = FindGroups(Ids, Day);
seqs = g;
for i=1:1ength(g)
    for j=length(seqs):-1:i+1
        if(CompareSequence(seqs{i},seqs{j}))
            seqs{j} = [];
        end
    end
end


