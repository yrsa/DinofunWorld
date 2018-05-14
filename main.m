%% Read data
%Timestamp (%{yyyy-MM-dd HH:mm:ss})D, id(%d), type(%C), X(%d), Y(%d)
% formatSpec = '%{yyyy-MM-dd HH:mm:ss}D%d%C%d%d';
% 
load 'MatlabData/friday.mat';
load 'MatlabData/saturday.mat';
load 'MatlabData/sunday.mat';

%% load park image
parkmap = imread('Auxiliary Files/Park Map.jpg');
%imshow(parkmap) 

%% sort sunday data on the rows
M = friday;
sortedM = sortrows(M, 2);

Ids = unique(sortedM.(2));

p = sortedM(sortedM.id == group(1),:);         %change here if you want another person    %friday, id(19)
q = sortedM(sortedM.id == group(2),:);
q2 = sortedM(sortedM.id == group(3),:);
q3 = sortedM(sortedM.id == group(4),:);
q4 = sortedM(sortedM.id == group(5),:);

c = sortedM(p.type == 'check-in',:); 

d = M(M.type == 'check-in',:);
sortedD = sortrows(d, 4);
%nrAttractions = unique(sortedD.(4));        %not very accurate because we only look at one coord

A = table2array(sortedD(:,4:5));        % An array only with the locations checked-in
nrA = unique(A);            % number of attractions

%% Histogram, did not turn out as I expected
histogram(sortedD.(4))
hold on
histogram(sortedD.(5))
hold off

%histogram(A(:))        %% does it do what we want? Want to look at both X and Y, not only one
histogram2(sortedD.(4), sortedD.(5))

%% Lets find groups     <-- Does not work
[MRows Mcols] = size(sortedM); 
prevID = sortedM.(2)(1);
positions(1,1) = [sortedM.(4)(1) sortedM.(5)(1)]; 

% put in this person in the first slot

% Go through all persons in a day
for i = 2:MRows
    tempID = sortedM.(2)(i);
    thisPosition = [sortedM.(4)(i) sortedM.(5)(i)]
    
    if tempID == prevID
        %put in next col
        positions(i,1) = [positions, thisPosition]
        
    else % sortedM.(2)(is) ~= tempID        % this is same person
        %put in next row
    end
    
    prevID = tempID
end

% if .type == 'check-in' --> store in a vector
    % as a string like in lab 3?

% check if another person has the same vector

%% New less messy try

% Get all IDs in the data
Ids = unique(sortedM.(2));
[nrIds ~] = size(Ids);
T = table;
Ttemp = table;

% loop through the ids, one at a time
for i = 1:nrIds
    %positions = [];
    positions = "";
    n = sortedM(sortedM.id == Ids(i),:);
    [nsize, ~] = size(n);
     
    % get all positions for id and put them in a table
    for j = 1:nsize
        
        npos = [n.(4)(j) n.(5)(j)];
        
        positions = positions + npos;
    end
    
    Ttemp.id = Ids(i); %n.(2)(i);
    Ttemp.visitedAttractions = positions;
    T = [T;Ttemp];
end

%% Lets use the data
sortedT = sortrows(T, 2);
nrGroups = unique(sortedT.(2));

%% Next step:
% Make a table with all the groups. group number and a string of ids?


%%
%Flip the image upside down before showing it
%imagesc([min(sortedM.(4)) max(sortedM.(4))], [min(sortedM.(5)) max(sortedM.(5))], flip(parkmap, 1));
imagesc([0 max(sortedM.(4))], [0 max(sortedM.(5))], flip(parkmap, 1)); 
hold on;

% plot(sortedM.(4)(2:1481),sortedM.(5)(2:1481),'b-','linewidth',1.5); %436
%plot(sortedM.(4)(1482:3377),sortedM.(5)(1482:3377),'b-','linewidth',1.5);   %878

[psize, ~] = size(p);

% Plot in time
for i=1:psize
    plot(p.(4)(1:i),p.(5)(1:i),'b-','linewidth',1.5);
    plot(q.(4)(1:i),q.(5)(1:i),'g-','linewidth',1.5);
    plot(q2.(4)(1:i),q.(5)(1:i),'m-','linewidth',1.5);
    plot(q3.(4)(1:i),q.(5)(1:i),'c-','linewidth',1.5);
    plot(q4.(4)(1:i),q.(5)(1:i),'y-','linewidth',1.5);
    pause(0.1);
end

% Plot everything directly
% plot(p.(4),p.(5),'b-','linewidth',1.5);
% plot(q.(4),q.(5),'g-','linewidth',1.5);

% plot(c.(4),c.(5),'r*','linewidth',1.5);   % p's check-in
%plot(d.(4),d.(5),'b*','linewidth',1.5);     % all check-in

% plot check-in in red/stars
% plot in time, like in lab


% set the y-axis back to normal.
set(gca,'ydir','normal');


%% Show the positions on top of the map
%Source: http://www.peteryu.ca/tutorials/matlab/plot_over_image_background

%% Might want to read this:
% Visually driven analysis of movement data by progressive clustering
% https://pdfs.semanticscholar.org/193f/048ae443b1559bc23195738917b65caa730b.pdf

