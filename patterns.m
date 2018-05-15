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

%% Find which type of attractions one group goes to
% load('attractions.mat')
% load('fri_condensed.mat')

% get one group
FriTypeGroup = fri_condensed;       % copy to later add personType
%FriTypeGroup.personType = "";
[friGroupSize, ~] = size(fri_condensed);

for i = 1:friGroupSize
    [smallGroupSize, ~] = size(fri_condensed{i,1});
    for j = 1:smallGroupSize
        friGroup = fri_condensed{i,1}.(2)(j);
        friGroup = cell2mat(friGroup);
        
        personType = PercentageVisitedAttractions(friGroup, attractions);
        FriTypeGroup{i,1}.personType(j) = personType;
    end
end

disp("done");

% M = saturday;
% sortedM = sortrows(M, 2);
% Ids = unique(sortedM.(2));
% p = sortedM(sortedM.id == 619064,:);
% PlotPath(saturday, p)
% 

%% Save a group for each attraction that is most visited + undefined

% personType = "Entry-goer"
% personType = "Thrill-junkie";
% personType = "Kiddie";
% personType = "Show-goer";
% personType = "Help-seeker";
% personType = "For everyones";
% personType = "Park-hanger";
% personType = "undefined";

entryGoer = table;
trhillJunkie = table;
kiddie = table;
showGoer = table;
helpSeeker = table;
forEveryones = table;
parkHanger = table;
undefined = table;

for i = 1:friGroupSize
    [smallGroupSize, ~] = size(FriTypeGroup{i,1});
    for j = 1:smallGroupSize
        attrGroup = FriTypeGroup{i,1}.(3)(j);
        %attrGroup = cell2mat(attrGroup);
        
        if attrGroup == 'Entry-goer'
            entryGoer = [entryGoer; FriTypeGroup{i,1}];
            
        elseif attrGroup == "Thrill-junkie"
            thrillJunkie = [trhillJunkie; FriTypeGroup{i,1}];
            
        elseif attrGroup == "Kiddie"
            kiddie = [kiddie; FriTypeGroup{i,1}];
            
        elseif attrGroup == "Show-goer"
            showGoer = [showGoer; FriTypeGroup{i,1}];
            
        elseif attrGroup == "Help-seeker"
            helpSeeker = [helpSeeker; FriTypeGroup{i,1}];
        
        elseif attrGroup == "For everyones"
            forEveryones = [forEveryones; FriTypeGroup{i,1}];
        
        elseif attrGroup == "Park-hanger"
            parkHanger = [parkHanger; FriTypeGroup{i,1}];
         
        elseif attrGroup == "undefined"
            undefined = [undefined; FriTypeGroup{i,1}];
        
        end
    end
end


