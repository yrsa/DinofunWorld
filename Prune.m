load 'MatlabData/friday.mat';

smalldata = friday(1:1000,:);

data = friday;

ids = data.id;
ids = unique(ids);
nr_ids = length(ids);

% %% Create a sequence table
%seq_table = CreateSeqTable(ids,data);
load 'seq_table.mat';
%% Define the itemset (ride names)
load attractions.mat;

itemsets1 = attractions.name;
cellstr(itemsets1);
itemsets1 = cell2table(itemsets1);
itemsets1.Properties.VariableNames = {'name'};
%%
it = 0;
counter =0;
while(it ~= height(itemsets1) )
    it = height(itemsets1);
    counter = counter +1;
    times_visited = zeros(height(itemsets1), 1);
    support = zeros(height(itemsets1),1); % array to store supports
    
    for i=1:height(itemsets1)
        item = itemsets2.name(i)
        if(isstring(item))
           item = cellstr(item)
%            item = item{1}

        end
        item = item{i};
%         
        [t, s] = Support2(item, seq_table); %calculate support one item at a time 
        times_visited(i) = t;
        support(i) = s;
     end
    
%     % add the support to the table
%     times_visited = array2table(times_visited);
%     support = array2table(support);
%     itemsets1 = [itemsets1 times_visited support];
%     
%     % Remove items that do not meet the treshold
%     threshold = 0.5;
%     delete = itemsets1.support < threshold;
%     itemsets1(delete,:) = [];
%     
%     % Calculate the new itemsets from the combinations
% 
%     headers = {'name'};
%     d = cell(1,1);
%     combinations = cell2table(d);
%     combinations.Properties.VariableNames = headers;
% 
%     for i=1:height(itemsets1)-1
%         row = (itemsets1(i,:));
%         name1 = row.name(1);
%         combined_names = name1;
% 
%         for j=i+1:height(itemsets1)
%             row2 = (itemsets1(j,:));
%             name2 = row2.name(1);
%             combined_names = [combined_names; name2];
%             combination = {combined_names};
%             combrow = cell2table(combination);
%             combrow.Properties.VariableNames = headers;
%             combinations = [combinations; combrow];   
%         end
%     end
% 
%     combinations(1,:) = []; %delete the empty row.
%     itemsets1 = combinations;
end


