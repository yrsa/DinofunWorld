%% Apriori test
load 'MatlabData/friday.mat';

smalldata = friday(1:1000,:);
Apriori(smalldata);
