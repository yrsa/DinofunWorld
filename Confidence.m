function [] = Confidence(itemsets, configurations)
%CONFIDENCE calculate the confidence for an itemset using it's support

for i = 1:height(configurations)
    
    config = configurations.names(i);
    names = config{1};
    
    a = names(1); %get the first ride in the combination
    for j = 2:length(names)-1
        a = strcat(a, names(j)); % add the other rides except the last
    end
    b = names(length(names)); % the last ride in the combination.
    
    %find the support for a
    a_row = itemsets(strcmp(itemsets.name, a));
    a_support = a_row.support(1);
    


end

