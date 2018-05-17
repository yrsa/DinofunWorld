%% Okay, we want to find out who has been staying for some time at the Beer garden. How to do it?

% This is not really doing as I want. I want to see if a person stays at a
% position for a long period of time. How is the time recordet? Can we find
% this. A person that starts att 33 might end at 34 even though thet only
% are at the Beer garden

% Beer gardens position:
% 21,33

% Search all data and save those who have movement data that is more than
% one at 21,33
parkmap = imread('Auxiliary Files/Park Map.jpg');
M = friday;
sortedM = sortrows(M, 2);

%q = sortedM(sortedM.type == "movement",:);
c = sortedM(sortedM.(4) == 21,:);
c = c(c.(5) == 33,:);

beerGardenPeople = unique(c.(2));       % they have been at the beerGarden
                                        % now we need to filter out those
                                        % who have stayed there a longer
                                        % time

BGPeople = table;
tempBGPeople = table;

%it has an id, and for how many recorded slots it has been at the garden
oldId = beerGardenPeople(1);

counter = 1;

% loop through c (with help from BeerGardenPeople
[BGPsize, ~] = size(beerGardenPeople);
%for j = 1:height(c)
 %   cId = c.(2)(j);
    
    for i = 1:BGPsize

        % fetch the id
        tempID = beerGardenPeople(i);

        tru = c(c.(2) == tempID,:);
        counter = height(tru);
        
        tempBGPeople.id = tempID;
        tempBGPeople.howLongStay = counter;
        BGPeople = [BGPeople; tempBGPeople];
        
%         if tempID == cId
%             counter = counter + 1;
%         end

    end
    
%     tempBGPeople.id = cId;
%     tempBGPeople.howLongStay = counter;
% 
% %    counter = 1;
% 
%     BGPeople = [BGPeople; tempBGPeople];

%end



