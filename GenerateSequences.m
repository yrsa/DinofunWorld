function [sequences] = GenerateSequences(ids,data)
%GENERATESEQUENCES Summary of this function goes here
%   Detailed explanation goes here
%%

% sequences = cell(length(ids), 1);
% for i=1:length(ids)
%     person = data(data.id == ids(i),:); % fetch all the data for 1 person
% 
%     % Find out where they've checked in
%     check_ins = person(person.type == 'check-in', :);
% 
%     places = [check_ins.(4) check_ins.(5)];
%     [row ~] = size(places);
%     Sequence = cell(row, 1);
% 
%     for j=1:row
%        Sequence{j} = places(j, :); % Find the chronological sequence in which they were visited
%     end
%     sequences{i} = Sequence;
%     
% end

%%
headers = {'id' 'sequence'};
d = cell(1, 2);
seq_table = cell2table(d);
seq_table.Properties.VariableNames = headers;

for i=1:length(ids)
    person = data(data.id == ids(i),:); % fetch all the data for 1 person

    % Find out where they've checked in
    check_ins = person(person.type == 'check-in', :);

    places = [check_ins.(4) check_ins.(5)];
    [row ~] = size(places);
    Sequence = cell(row, 1);

    strseq = mat2str(places);
    %Create a row in the table
    tablerow = {ids(i), strseq};
    seq_table = [seq_table; tablerow];
    
end
seq_table(1,:) = [];

%s = sortrows(table, 2);

sequences = unique(seq_table.(2));


%sequences = unique(sequences, 'rows');


end

