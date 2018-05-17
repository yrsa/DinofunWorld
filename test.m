%% Apriori test
load 'MatlabData/friday.mat';

smalldata = friday(1:1000,:);

data = friday;

ids = data.id;
ids = unique(ids);
nr_ids = length(ids);

% %% Create a sequence table
 seq_table = CreateSeqTable(ids,data);

%%
% e = Apriori(seq_table);

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

headers = {'names'};
d = cell(1,1);
combinations = cell2table(d);
combinations.Properties.VariableNames = headers;

for i=1:height(itemsets1)-1
    row = (itemsets1(i,:));
    name1 = row.name(1);
    combined_names = name1;
    
    for j=i+1:height(itemsets1)
        row2 = (itemsets1(j,:));
        name2 = row2.name(1);
        combined_names = [combined_names; name2];
        combination = {combined_names};
        combrow = cell2table(combination);
        combrow.Properties.VariableNames = headers;
        combinations = [combinations; combrow];   
    end
end

combinations(1,:) = []; %delete the empty row.

%% calculate confidence

for i=1:height(combinations)
    combo = combinations.names(i);
    combo = combo{1};
    [row ~] = size(combo);
    
    A = combo(1:row-1,:);
    B = combo(row,:);
    
    %find support
    
    
end


