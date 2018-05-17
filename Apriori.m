function [] = Apriori(data)
%APRIORI Summary of this function goes here
%   Detailed explanation goes here

%% find unique number of people
ids = data.id;
ids = unique(ids);
nr_ids = length(ids);

%% Create a sequence table
seq_table = CreateSeqTable(ids,data);

%% Define the itemset (ride names)
load attractions.mat;
itemsets1 = attractions.name;
itemsets1 = array2table(itemsets1);
itemsets1.Properties.VariableNames = {'name'};
%% calculate the support for each item.
support = zeros(height(itemsets1),1); % array to store supports
for i=1:height(itemsets1)
    item = itemsets1.name(i);
    support(i) = Support(item, seq_table);
end

% add the suport to the table
support = array2table(support);

itemsets1 = [itemsets1 support];

