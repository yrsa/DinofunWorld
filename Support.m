function [itemsets] = Support(seq_table)
%SUPPORT Calculate the support of an item set
%   for 

%for every person visiting the park
for k = 1:height(seq_table)
    person = seq_table(k,:);
    seq = person.sequence{1};
    seq = eval(seq);
    %find out how many people has visited each ride.
    for i=1:height(itemsets)
        a = attractions(i,3:5);
        pos = table2array(a(:,1:2));
        
        [row ~] = size(seq);
        for j=1:row
            
            if(seq(j,:) == pos)
                val = itemsets.times_visited(i);
                 itemsets.times_visited(i) = val +1;
            end
        end
    end
end


support = zeros(height(itemsets), 1);

for i = 1:length(support)
    frequency = itemsets.times_visited(i);
    support(i) = frequency / nr_of_people;
end

support = array2table(support);
itemsets = [itemsets support];
end

