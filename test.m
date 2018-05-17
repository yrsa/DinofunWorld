%% Apriori test
load 'MatlabData/friday.mat';

smalldata = friday(1:1000,:);

% data = friday;
% 
% ids = data.id;
% ids = unique(ids);
% nr_ids = length(ids);
% 
% %% Create a sequence table
% seq_table = CreateSeqTable(ids,data);

%%
e = Apriori(seq_table);
