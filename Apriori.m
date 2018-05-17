function [itemsets1] = Apriori(seq_table)
%APRIORI Summary of this function goes here
%   Detailed explanation goes here

%% find unique number of people
% ids = data.id;
% ids = unique(ids);
% nr_ids = length(ids);
% 
% %% Create a sequence table
% seq_table = CreateSeqTable(ids,data);

%% Define the itemset (ride names)
load attractions.mat;

itemsets1 = attractions.name;
itemsets1 = array2table(itemsets1);
itemsets1.Properties.VariableNames = {'name'};


%% calculate the support for each item.
times_visited = zeros(height(itemsets1), 1);
support = zeros(height(itemsets1),1); % array to store supports


for i=1:height(itemsets1)
    item = itemsets1.name(i);
    [t, s] = Support(item, seq_table); %calculate support one item at a time 
    times_visited(i) = t;
    support(i) = s;
end

% add the support to the table
times_visited = array2table(times_visited);
support = array2table(support);
itemsets1 = [itemsets1 times_visited support];

%% Remove items that do not meet the treshold
threshold = 0.5;
delete = itemsets1.support < threshold;
itemsets1(delete,:) = [];

%% Calculate the new itemsets from the combinations

for i=1:height(itemsets1)-1
    name1 = 1
    for j=i+1:height(itemsets1)
        
    end
end

