%% Find patterns in the data
%load the data
load 'MatlabData/friday.mat';
load 'MatlabData/saturday.mat';
load 'MatlabData/sunday.mat';

%Load the groups by visit sequence
load 'fri_groups.mat';
load 'sat_groups.mat';
load 'sun_groups.mat';

%% Apriori implmentation
%itemset = rides (check in points)
% 1. Start with itemset containing only one check in point
load attractions.mat;
itemsets = attractions(:,3:5);
times_visited = zeros(height(itemsets), 1);
times_visited = array2table(times_visited);
itemsets = [itemsets times_visited];
%% 
ids = friday.id;
ids = unique(ids);

% seq_table = CreateSeqTable(ids, friday);

person = seq_table(1,:);

seq = person.sequence{1};
seq = eval(seq);

for i=1:height(attractions)
    a = attractions(i,3:5);
    pos = table2array(a(:,1:2));
    
    for j=1:length(seq)
        if(seq(j,:) == pos)
            itemsets(i,:){4} = itemsets(i,:){4}+1;
        end
    end
    
end

%% Try adding the sequences containing the same rides into 1 table.
% End result:
% friday groups: 982 -> 972
% saturday groups: 1917->1901
% sunday groups: 2661 -> 2619
% total: minus 68 groups

% f = GatherGroupsByLocations(fri_groups);
% f = f(~cellfun('isempty',f));
% fri_condensed = f;
% sat_condensed = GatherGroupsByLocations(sat_groups);
% sun_condensed = GatherGroupsByLocations(sun_groups);

% save('fri_condensed.mat', 'fri_condensed');
% save('sat_condensed.mat', 'sat_condensed');
% save('sun_condensed.mat', 'sun_condensed');





