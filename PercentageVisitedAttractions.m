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
    [nrOfEntry, ~] = size(entry);       % not really necessary? 
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
%     disp("Percentage Thrills for Everyone: " + percEveryone);
%     disp("Percentage Shows: " + percShows);
%     disp("Percentage Parks: " + percParks);
%     disp("Percentage Information & Assistance: " + percInfoAssist);
%     
    if percEntry > percThrills & percEntry > percKiddies & percEntry > percEveryone & ...
            percEntry > percShows & percEntry > percParks & percEntry > percInfoAssist
        personType = "Entry-goer";
        
    elseif percThrills > percEntry & percThrills > percKiddies & percThrills > percEveryone & ...
            percThrills > percShows & percThrills > percParks & percThrills > percInfoAssist
        personType = "Thrill-junkie";
        
    elseif percKiddies > percEntry & percKiddies > percThrills & percKiddies > percEveryone & ...
            percKiddies > percShows & percKiddies > percParks & percKiddies > percInfoAssist
        personType = "Kiddie";
    elseif percShows > percEntry & percShows > percThrills & percShows > percEveryone & ...
            percShows > percKiddies & percShows > percParks & percShows > percInfoAssist
        personType = "Show-goer";
        
    elseif percInfoAssist > percEntry & percInfoAssist > percThrills & percInfoAssist > percEveryone & ...
            percInfoAssist > percKiddies & percInfoAssist > percParks & percInfoAssist > percShows
        personType = "Help-seeker";
        
    elseif percEveryone > percEntry & percEveryone > percThrills & percEveryone > percInfoAssist & ...
            percEveryone > percKiddies & percEveryone > percParks & percEveryone > percShows
        personType = "For everyones";
    elseif percParks > percEntry & percParks > percThrills & percParks > percInfoAssist & ...
            percParks > percKiddies & percParks > percEveryone & percParks > percShows
        personType = "Park-hanger";
    else
        personType = "undefined";
    end

end

