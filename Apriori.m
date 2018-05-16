function [itemsets] = Apriori(seq_table)
%Apriori algorithm to find frequently occuring sequences in the
%data

load attractions.mat;
itemsets = attractions(:,3:5);
times_visited = zeros(height(itemsets), 1);
times_visited = array2table(times_visited);
itemsets = [itemsets times_visited];

size(itemsets)

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

% calclulate the support for each item.
itemsets = Support(height(seq_table), itemsets);

% Remove the items that are not interesting enough according to a threshold
threshold = 0.5; %50
to_remove = itemsets.support < threshold;
itemsets(to_remove, :) = [];

% now compute the different combinations of items



end

