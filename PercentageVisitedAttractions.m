function [personType] = PercentageVisitedAttractions(groupSequence, attractions)
% groupSequence = the sequence of one person/group
% attractions = attractions.mat

    rides = AttractionSequence2(groupSequence, attractions);     % All rides this group has been to

    % Get what type of rides they go to
    entry = rides(rides.type == 'Entry',:); 
    thrills = rides(rides.type == 'Thrill Ride',:);
    kiddie = rides(rides.type == 'Kiddie Ride',:);
    forEveryone = rides(rides.type == 'Rides for Everyone',:);
    shows = rides(rides.type == 'Shows & Entertainment',:);
    parks = rides(rides.type == 'Park',:);
    infoAssist = rides(rides.type == 'Information & Assistance',:);

    % Procentage:
    [nrOfRides, ~] = size(rides);
    [nrOfEntry, ~] = size(entry);       
    [nrOfThrills, ~] = size(thrills);
    [nrOfKiddies, ~] = size(kiddie);
    [nrOfEveryone, ~] = size(forEveryone);
    [nrOfShows, ~] = size(shows);
    [nrOfParks, ~] = size(parks);
    [nrOfInfoAssist, ~] = size(infoAssist);

    percEntry = (nrOfEntry/nrOfRides) * 100;
    percThrills = (nrOfThrills/nrOfRides) * 100;
    percKiddies = (nrOfKiddies/nrOfRides) * 100;
    percEveryone = (nrOfEveryone/nrOfRides) * 100;
    percShows = (nrOfShows/nrOfRides) * 100;
    percParks = (nrOfParks/nrOfRides) * 100;
    percInfoAssist = (nrOfInfoAssist/nrOfRides) * 100;


%     disp("Number of rides: " + nrOfRides);
%     disp("Percentage Entry: " + percEntry);
%     disp("Percentage Thrills: " + percThrills);
%     disp("Percentage Kiddies: " + percKiddies);
%     disp("Percentage Rides for Everyone: " + percEveryone);
%     disp("Percentage Shows: " + percShows);
%     disp("Percentage Parks: " + percParks);
%     disp("Percentage Information & Assistance: " + percInfoAssist);
%     
    if percEntry > percThrills && percEntry > percKiddies && percEntry > percEveryone && ...
            percEntry > percShows && percEntry > percParks && percEntry > percInfoAssist
        personType = "Entry-goer";
%         disp("Nr rides: " + nrOfRides);
%         disp("Nr Entry: " + nrOfEntry);
%         disp("Nr Ride for Everyone: " + nrOfEveryone);
%         disp("Entry: " + percEntry);
%         disp("Ride for Everyone: " + percEveryone);
%         disp(" ");
    %disp("EntryGoer");
        
    elseif percThrills > percEntry && percThrills > percKiddies && percThrills > percEveryone && ...
            percThrills > percShows && percThrills > percParks && percThrills > percInfoAssist
        personType = "Thrill-junkie";
        %disp("Thrill-Junkie")
        
    elseif percKiddies > percEntry && percKiddies > percThrills && percKiddies > percEveryone && ...
            percKiddies > percShows && percKiddies > percParks && percKiddies > percInfoAssist
        personType = "Kiddie";
        %disp("kiddie")
        
    elseif percShows > percEntry && percShows > percThrills && percShows > percEveryone && ...
            percShows > percKiddies && percShows > percParks && percShows > percInfoAssist
        personType = "Show-goer";
        %disp("showGoer")
        
    elseif percInfoAssist > percEntry && percInfoAssist > percThrills && percInfoAssist > percEveryone && ...
            percInfoAssist > percKiddies && percInfoAssist > percParks && percInfoAssist > percShows
        personType = "Help-seeker";
        %disp("help-seeker")
        
    elseif percEveryone > percEntry && percEveryone > percThrills && percEveryone > percInfoAssist && ...
            percEveryone > percKiddies && percEveryone > percParks && percEveryone > percShows
        personType = "For everyones";
        %disp("for everyones")
               
    elseif percParks > percEntry && percParks > percThrills && percParks > percInfoAssist && ...
            percParks > percKiddies && percParks > percEveryone && percParks > percShows
        personType = "Park-hanger";
        %disp("park-hanger")
    else
        personType = "undefined";
        %disp("undefined")
    end
    
end

