%% Does a person visit the park more days than one?
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

%% Which attractions is visited which day?

% CreateSeqTable            <-- creates sequences for chosen ids
fridayVisits = CreateSeqTable(FriSatSun, friday);
satVisits = CreateSeqTable(FriSatSun, saturday);
sunVisits = CreateSeqTable(FriSatSun, sunday);
%% Check attractions visited for one ID
%idSeq = fridayVisits.(2)();
%idSeq = satVisits.(2)(1);
idSeq = sunVisits.(2)(1);

% AttractionsSequence(seq, attractions)     <-- prints which attraction one person has visited 
% seq = one sequence in a group
% attractions = attractions.mat
idstr = idSeq{1};
AttractionSequence(idstr, attractions);

%% This could be more elegant
% Want to do not manually
fri941 = [69 1 24 8 1 3 72 72 6 20 2 1 24 6 6 5 23 24 1 1 1 4 8 81 7 1 5 2 ...
            25 8 8 32 4 4 24 32 4 1 2 2 20];
sat941 = [69 8 3 6 64 8 4 81 28 72 31 2 6 1 2 20 32 7 4 8 64 81 21];
sun941 = [69 2 31 29 6 81 5 6 4 2 28 7 5 3 8 4 24 5 29 2 1 7];
% size(fri941)
% size(sat941)
% size(sun941)

%hist(fri941, 87)
%hist(sat941, 87)
%hist(sun941, 87)

% the histogram does not work as I want them to. Can we do this
% differently?

% Conclusion: this person goes to more attractions on friday and the least on sunday.

%% Print the different visits on the map
fridSeq = fridayVisits.(2)(1);
fridSeq = cell2mat(fridSeq);
satidSeq = satVisits.(2)(1);
satidSeq = cell2mat(satidSeq);
sunidSeq = sunVisits.(2)(1);
sunidSeq = cell2mat(sunidSeq);

idstr = idSeq{1};
fride = AttractionSequence2(fridSeq, attractions);
satride = AttractionSequence2(satidSeq, attractions);
sunride = AttractionSequence2(sunidSeq, attractions);
%[rideSize, ~] = size(ride);

parkmap = imread('Auxiliary Files/Park Map.jpg');

%Flip the image upside down before showing it
%imagesc([min(sortedM.(4)) max(sortedM.(4))], [min(sortedM.(5)) max(sortedM.(5))], flip(parkmap, 1));
imagesc([0 100], [0 100], flip(parkmap, 1)); 
hold on;

% Plot everything directly
plot(fride.xpos, fride.ypos, 'bx','MarkerSize',10);
plot(satride.xpos, satride.ypos, 'go','MarkerSize',10);
plot(sunride.xpos, sunride.ypos, 'm+','MarkerSize',10);

%end

% set the y-axis back to normal.
set(gca,'ydir','normal');
