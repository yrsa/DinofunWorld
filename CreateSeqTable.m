function [seq_table] = CreateSeqTable(ids, data)
%UNTITLED Summary of this function goes here
%   Creates a table containing the checkin sequences for all people

%sequences = cell(length(ids), 1);
headers = {'id', 'sequence'};
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

%     for j=1:row
%        Sequence{j} = places(j, :); % Find the chronological sequence in which they were visited
%        
%     end
    strseq = mat2str(places);
    %Create a row in the table
    tablerow = {ids(i), strseq};
    seq_table = [seq_table; tablerow];
    
end
seq_table(1,:) = [];

end

