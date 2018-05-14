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

%% Try clustering using k-means
load attractions.mat

person = friday(friday.id == 534277,:);
 PlotPath(friday, person);

% parkmap = imread('Auxiliary Files/Park Map.jpg');
% figure
% % set(gca,'Ydir','Normal')
% imagesc([0 max(friday.(4))], [0 max(friday.(5))],parkmap);
% axis xy

% hold on;
% plot(person.(4)(1:50),person.(5)(1:50),'m-','linewidth',1.5);
%f = table2array(friday);
%[idx, clusters] = kmeans(f, 12);



