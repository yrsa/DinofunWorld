%% File for test sequences of check ins.
% Plan: find the sequence of check ins on rides for 1 person. Then find all 
% people that follow the same sequence. These people are a group.

load 'MatlabData/friday.mat';
load 'MatlabData/saturday.mat';
load 'MatlabData/sunday.mat';

%% Find the unique sequences

% Day = friday;
% 
% sortedM = sortrows(Day, 2); %sort the data based on id, to pick out data for 1 individual
% fri_ids = unique(sortedM.(2)); % get a list of all unique ids
% 
% sortedM = sortrows(saturday, 2); %sort the data based on id, to pick out data for 1 individual
% sat_ids = unique(sortedM.(2)); % get a list of all unique ids
% 
% sortedM = sortrows(sunday, 2); %sort the data based on id, to pick out data for 1 individual
% sun_ids = unique(sortedM.(2)); % get a list of all unique ids
% 
% % Generate the unique sequences for each day
% fri_seq = GenerateSequences(fri_ids, friday);
% sat_seq = GenerateSequences(sat_ids, saturday);
% sun_seq = GenerateSequences(sun_ids, sunday);
%% Create sequence tables for everyone in the park
%groups = FindGroups(sequences, Ids, Day);
%load sequences.mat;
% table1 = CreateSeqTable(fri_ids, friday);
% table2 = CreateSeqTable(sat_ids, saturday);
% table3 = CreateSeqTable(sun_ids, sunday);
%% Create groups for Friday, Saturday and Sunday


% fri_groups = cell(length(fri_seq), 1);
% sat_groups = cell(length(sat_seq), 1);
% sun_groups = cell(length(sun_seq), 1);
% 
% for i = 1:length(fri_seq)
%     seq = fri_seq(i);
%     %stringseq = mat2str(cell2mat(seq{1}));
%     group = table1(strcmp(table1.sequence, fri_seq(i)),:);
%     fri_groups{i} = group;
% end
% 
% for i = 1:length(sat_seq)
%     seq = sat_seq(i);
%     %stringseq = mat2str(cell2mat(seq{1}));
%     group = table2(strcmp(table2.sequence, sat_seq(i)),:);
%     sat_groups{i} = group;
% end
% 
% for i = 1:length(sun_seq)
%     seq = sun_seq(i);
%     %stringseq = mat2str(cell2mat(seq{1}));
%     group = table3(strcmp(table3.sequence, sun_seq(i)),:);
%     sun_groups{i} = group;
% end
%% Look at the popularity of rides
% At what time during the day are rides most visited?

%Load the groups by visit sequence
load 'fri_groups.mat';
load 'sat_groups.mat';
load 'sun_groups.mat';

fri_checkins = friday(friday.type == 'check-in',[1 4:5]);
sat_checkins = saturday(saturday.type == 'check-in',[1 4:5]); 
sun_checkins = sunday(sunday.type == 'check-in',[1 4:5]); 

%% Create a histogram for one attraction to showcase when most people check in
day = fri_checkins;
attraction1 = attractions(26,:);
x = attraction1.xpos;
y = attraction1.ypos;

f = fri_checkins(day.X == x & day.Y == y, :);

time_axis = f.Timestamp;

bin = length(time_axis);

histogram(time_axis,bin);
title(strcat(attraction1.name, " (", num2str(attraction1.attrNr), ")"));

% sortrows(friche, 2);
%pos_formated = zeros
% for i=1:height(fri_checkins)
%     position = fri_checkins(i,2:3);
%     x = position.X;
%     y = position.Y;
%     pos_str = strcat(num2str(x), " ", num2str(y));
%     
%     pos_formated(i) = pos_str;
% 
% end
% 

