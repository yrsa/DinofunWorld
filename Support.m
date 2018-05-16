function [itemsets] = Support(nr_of_people, itemsets)
%SUPPORT Calculate the support of an item set
%   for 

support = zeros(height(itemsets), 1);

for i = 1:length(support)
    frequency = itemsets.times_visited(i);
    support(i) = frequency / nr_of_people;
end

support = array2table(support);
itemsets = [itemsets support];
end

