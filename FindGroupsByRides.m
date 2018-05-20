function [grouped_ids, not_grouped_ids] = FindGroupsByRides(rides, data)
%FINDGROUPSBYRIDES Summary of this function goes here
%   Detailed explanation goes here
grouped_ids = []; %save the ids of people who have visited the rides
not_grouped_ids = [];

load 'attractions.mat';
attrNrs = attractions.attrNr;

for i = 1:length(rides)
   rides(i) = attrNrs(rides(i), 1);
end

for i=1:height(data)
    row = data(i,:);
    seq = row.sequence{1};
    id = row.id(1);
    v = ismember(seq, rides);
    if(any(v))
       grouped_ids = [grouped_ids; id] ;
    else
        not_grouped_ids = [not_grouped_ids; id];
    end
    

end

