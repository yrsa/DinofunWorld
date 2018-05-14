%% Find patterns in the data
%load the data
load 'MatlabData/friday.mat';
load 'MatlabData/saturday.mat';
load 'MatlabData/sunday.mat';

%Load the groups by visit sequence
load 'fri_groups.mat';
load 'sat_groups.mat';
load 'sun_groups.mat';

%%
groups = [fri_groups; sat_groups; sun_groups];


%% Find all large groups with more than 12 people

% large_group_fri = FindLargeGroup(fri_groups, 12);
% large_group_sat = FindLargeGroup(sat_groups, 12);
% large_group_sun = FindLargeGroup(sun_groups, 12);

%%
% 
% w = large_group_fri.(1);
% e = w(1,1);
% ids = e{1}.id;
% ids = cell2mat(ids);
% cl = friday(friday.id == ids(1),:);
% 
% seq = e{1}.sequence;
% seq = seq{1};
% 
% AttractionSequence(seq, attractions)



