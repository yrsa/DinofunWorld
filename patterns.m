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
groups1 = [fri_groups; sat_groups; sun_groups];

%% Find all large groups with more than 12 people

% large_group_fri = FindLargeGroup(fri_groups, 12);
% large_group_sat = FindLargeGroup(sat_groups, 12);
% large_group_sun = FindLargeGroup(sun_groups, 12);

%% PlotPath.
% load attractions.mat
% 
% person = friday(friday.id == 534277,:);
%  PlotPath(friday, person);

%% Try adding the sequences containing the same rides into 1 table.
% End result:
% friday groups: 982 -> 972
% saturday groups: 1917->1901
% sunday groups: 2661 -> 2619
% total: minus 68 groups

% f = GatherGroupsByLocations(fri_groups);
% f = f(~cellfun('isempty',f));
% fri_condensed = f;
% sat_condensed = GatherGroupsByLocations(sat_groups);
% sun_condensed = GatherGroupsByLocations(sun_groups);

% save('fri_condensed.mat', 'fri_condensed');
% save('sat_condensed.mat', 'sat_condensed');
% save('sun_condensed.mat', 'sun_condensed');

%% Study the timestamp to categorize events
day = friday;
timeline = day.Timestamp;
timeline = sortrows(timeline, 1);

last = length(timeline);

starttime = timeline(1,:);
endtime = timeline(last,:);

timeline = unique(timeline);

% PlotEvent(t, friday);
% for i=1:length(timeline)
%     t = timeline(i);
%     PlotEvent(t, friday);
%     pause(0.1);
% end

%% Apriori implmentation
%itemset = rides (check in points)
% 1. Start with itemset containing only one check in point
load attractions.mat;
itemsets = attractions(:,3:5);




