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
load('attractions.mat')
load('sat_condensed.mat')

% get one group
FriTypeGroup = sat_condensed;       % copy to later add personType
%FriTypeGroup.personType = "";
[friGroupSize, ~] = size(sat_condensed);

for i = 1:friGroupSize
    [smallGroupSize, ~] = size(FriTypeGroup{i,1});
    for j = 1:smallGroupSize
        friGroup = sat_condensed{i,1}.(2)(j);
        
        friGroup = cell2mat(friGroup);
        
        personType = PercentageVisitedAttractions(friGroup, attractions);
        if personType == ""
            FriTypeGroup{i,1}.personType(j) = "somethingWrongWithThisOne";
        else
            FriTypeGroup{i,1}.personType(j) = personType;
        end
    end
end

% M = saturday;
% sortedM = sortrows(M, 2);
% Ids = unique(sortedM.(2));
% p = sortedM(sortedM.id == 619064,:);
% PlotPath(saturday, p)
% 

%% TEST
% 
% testperson = fri_condensed{226,1}.(1)(1);
% testpos = fri_condensed{226,1}.(2)(1);
% t = cell2mat(testpos);
% 
% testpersonType = PercentageVisitedAttractions(t, attractions);



%% Save a group for each attraction that is most visited + undefined

entryGoer = table;
thrillJunkie = table;
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
        
        if attrGroup == "Entry-goer"
            entryGoer = [entryGoer; FriTypeGroup{i,1}(j,:)];
            
        elseif attrGroup == "Thrill-junkie"
            thrillJunkie = [thrillJunkie; FriTypeGroup{i,1}(j,:)];
            
        elseif attrGroup == "Kiddie"
            kiddie = [kiddie; FriTypeGroup{i,1}(j,:)];
            
        elseif attrGroup == "Show-goer"
            showGoer = [showGoer; FriTypeGroup{i,1}(j,:)];
            
        elseif attrGroup == "Help-seeker"
            helpSeeker = [helpSeeker; FriTypeGroup{i,1}(j,:)];
        
        elseif attrGroup == "For everyones"
            forEveryones = [forEveryones; FriTypeGroup{i,1}(j,:)];
        
        elseif attrGroup == "Park-hanger"
            parkHanger = [parkHanger; FriTypeGroup{i,1}(j,:)];
         
        elseif attrGroup == "undefined"
            undefined = [undefined; FriTypeGroup{i,1}(j,:)];
        
        end
    end
end

%% Find all people that check into the park more than ones or only checks in
entryPeople = table;
entryTemp = table;

checkGroup = fri_condensed;       % copy to later add personType
[groupSize, ~] = size(checkGroup);

for i = 1:groupSize
    [smallGroupSize, ~] = size(checkGroup{i,1});
    for j = 1:(smallGroupSize)
        groupie = fri_condensed{i,1}.(2)(j);
        groupie = cell2mat(groupie);
        
        rides = AttractionSequence2(groupie, attractions);
        %personType = PercentageVisitedAttractions(groupie, attractions);
        entries = rides(rides.type == 'Entry',:);
        nrOfEntries = height(entries);
        
        if (height(entries) > 1) || (height(entries) == 1 && height(rides) == 1) 
            
            entryTemp.id = FriTypeGroup{i,1}.(1)(j);
            entryTemp.sequence = FriTypeGroup{i,1}.(2)(j);
            entryTemp.personType = FriTypeGroup{i,1}.(3)(j);
            entryTemp.nrInchecked = nrOfEntries;    %number of times they checked in
            entryPeople = [entryPeople; entryTemp];
        end
        
    end
end

%% Look att different entryPeople
parkmap = imread('Auxiliary Files/Park Map.jpg');
M = sunday;
sortedM = sortrows(M, 2);


%p = sortedM(sortedM.id == cell2mat(entryPeople{16,1}),:);    %change person here
%p = sortedM(sortedM.id == 521750,:);            % 521750 <-- spends time in 63 but never checks in
p = sortedM(sortedM.id == 834723,:);
c = p(p.type == 'check-in',:);

imagesc([0 max(sortedM.(4))], [0 max(sortedM.(5))], flip(parkmap, 1)); 
hold on;

[psize, ~] = size(p);

%Plot in time
% for i=1:psize
%     plot(p.(4)(1:i),p.(5)(1:i),'b-','linewidth',1.5);
% 
%     % set the y-axis back to normal.
%     set(gca,'ydir','normal');
%     pause(0.08);
% end
plot(p.(4),p.(5),'b-','linewidth',1.5);
plot(c.(4),c.(5),'g*','linewidth',1.5);

set(gca,'ydir','normal');

%%
figure
plot(co.Timestamp, co.X);


% %% Plot the movements for all person in a group
% M = friday;
% sortedM = sortrows(M, 2);
% % entryGoer, helpSeeker, parkHanger, showGoer, thrillJunkie, undefined,
% % kiddie
% tempGroup = kiddie;
% tempGroup = sortrows(tempGroup);
% [groupS, ~] = size(tempGroup);
% 
% testTable = table;
% temp = table;
% 
% sizeM = height(sortedM);
% 
% for k = 1:groupS
% 
%     tempID = cell2mat(tempGroup(k, 1).id);
%     temp = sortedM(sortedM.id == tempID,:);
%     testTable = [testTable;temp];
% 
% end
%     
% 
% %%
% imagesc([0 max(sortedM.(4))], [0 max(sortedM.(5))], flip(parkmap, 1)); 
% hold on;
% 
% p = testTable;
% [psize, ~] = size(p);
% 
% set(gca,'ydir','normal');
% plot(p.(4),p.(5),'b-','linewidth',1.5);
% 

%% Does a person visit the park more days than one? <-- from personCharacteristics.m
F = friday;
sortedF = sortrows(F, 2);
FIds = unique(sortedF.(2));     % All unique ids during Friday

Sat = saturday;
sortedSat = sortrows(Sat, 2);
SatIds = unique(sortedSat.(2)); % All unique ids during Saturday

Sun = sunday;
sortedSun = sortrows(Sun, 2);
SunIds = unique(sortedSun.(2)); % All unique ids during Sunday

allIds = [FIds; SatIds; SunIds];
allUniqueIds = unique(allIds);      % conclusion -> there are people coming back.

% Which Ids are coming back?
FriSat = intersect(FIds,SatIds);    % Visits both Friday and Saturday
FriSun = intersect(FIds, SunIds);   % Visists both Friday and Sunday
SatSun = intersect(SatIds, SunIds); % Visits both Saturday and Sunday
FriSatSun = intersect(FriSat, FriSun);   %Visits Friday, Saturday and Sunday

wholeWeekend = isequal(FriSun, FriSatSun);   %There are none that only visits the park friday and sunday

onlyFriSat = setdiff(FriSat, SatSun);       %returns what is in FriSay but not in SatSun
onlySatSun = setdiff(SatSun, FriSat);       %returns what is in SatSun but not in FriSat

%% They who go into the park 3 or more times a day, do they come back sat sun?

% People that entries three or more times on friday
PeopleThatEntriesManyTimes = entryPeople(entryPeople.nrInchecked > 2,:);
sortedEntries = sortrows(PeopleThatEntriesManyTimes);

[wsize ~] = size(FriSatSun);

friSatTable  = table;
%temp = table;

for i = 1:wsize
    
    temp = PeopleThatEntriesManyTimes(cell2mat(PeopleThatEntriesManyTimes.id) == FriSatSun(i),:);
    friSatTable = [friSatTable; temp];
    
end

