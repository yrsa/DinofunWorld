%% 


%% Plot the positions on map
parkmap = imread('Auxiliary Files/Park Map.jpg');

%Flip the image upside down before showing it
%imagesc([min(sortedM.(4)) max(sortedM.(4))], [min(sortedM.(5)) max(sortedM.(5))], flip(parkmap, 1));
imagesc([0 max(sortedM.(4))], [0 max(sortedM.(5))], flip(parkmap, 1)); 
hold on;

% plot(sortedM.(4)(2:1481),sortedM.(5)(2:1481),'b-','linewidth',1.5); %436
%plot(sortedM.(4)(1482:3377),sortedM.(5)(1482:3377),'b-','linewidth',1.5);   %878


for i = 1:982
f = fri_groups{i};

row = f(1,2);

visitorSequence = table2array(row);
visitorSequenceMat = cell2mat(visitorSequence);
visSec = eval(visitorSequenceMat);

visSecx = visSec(:,1);
visSecy = visSec(:,2);

% Plot everything directly
plot(visSecx, visSecy, 'bx','linewidth',1.5);

end



% set the y-axis back to normal.
set(gca,'ydir','normal');


%% Create a table with type of attraction, position, and name
attractions = table;
Atemp = table;

Atemp.attrNr = 1;
Atemp.type = "Thrill Ride";
Atemp.pos = "47 11";
Atemp.name = "Wrightiraptor Mountain";
attractions = [attractions;Atemp];

Atemp.attrNr = 2;
Atemp.type = "Thrill Ride";
Atemp.pos = "27 15";
Atemp.name = "Galactosaurus Rage";
attractions = [attractions;Atemp];

Atemp.attrNr = 3;
Atemp.type = "Thrill Ride";
Atemp.pos = "38 90";
Atemp.name = "Auvilotops Express";
attractions = [attractions;Atemp];

Atemp.attrNr = 4;
Atemp.type = "Thrill Ride";
Atemp.pos = "78 48";
Atemp.name = "TerrorSaur";
attractions = [attractions;Atemp];

Atemp.attrNr = 5;
Atemp.type = "Thrill Ride";
Atemp.pos = "16 66";
Atemp.name = "Wendisaurus Chase";
attractions = [attractions;Atemp];

Atemp.attrNr = 6;
Atemp.type = "Thrill Ride";
Atemp.pos = "86 44";
Atemp.name = "Keimosaurus Chase";
attractions = [attractions;Atemp];

Atemp.attrNr = 7;
Atemp.type = "Thrill Ride";
Atemp.pos = "17 43";
Atemp.name = "Firefall";
attractions = [attractions;Atemp];

Atemp.attrNr = 8;
Atemp.type = "Thrill Ride";
Atemp.pos = "45 24";
Atemp.name = "Atmosfear";
attractions = [attractions;Atemp];

Atemp.attrNr = 9;
Atemp.type = "Kiddie Ride";
Atemp.pos = "92 81";
Atemp.name = "North Line";
attractions = [attractions;Atemp];

Atemp.attrNr = 10;
Atemp.type = "Kiddie Ride";
Atemp.pos = "81 77";
Atemp.name = "Jeredactyl Jump";
attractions = [attractions;Atemp];

Atemp.attrNr = 11;
Atemp.type = "Kiddie Ride";
Atemp.pos = "73 79";
Atemp.name = "Sauroma Bumpers";
attractions = [attractions;Atemp];

Atemp.attrNr = 12;
Atemp.type = "Kiddie Ride";
Atemp.pos = "73 84";
Atemp.name = "Flying TyrAndrienkos";
attractions = [attractions;Atemp];

Atemp.attrNr = 13;
Atemp.type = "Kiddie Ride";
Atemp.pos = "79 87";
Atemp.name = "Cyndisaurus Asteroid";
attractions = [attractions;Atemp];

Atemp.attrNr = 14;
Atemp.type = "Kiddie Ride";
Atemp.pos = "76 88";
Atemp.name = "Beelzebufo";
attractions = [attractions;Atemp];

Atemp.attrNr = 15;
Atemp.type = "Kiddie Ride";
Atemp.pos = "79 89";
Atemp.name = "Enchanted Toadstools";
attractions = [attractions;Atemp];

Atemp.attrNr = 16;
Atemp.type = "Kiddie Ride";
Atemp.pos = "82 80";
Atemp.name = "Stegocycles";
attractions = [attractions;Atemp];

Atemp.attrNr = 17;
Atemp.type = "Kiddie Ride";
Atemp.pos = "83 88";
Atemp.name = "Blue Iguanodon";
attractions = [attractions;Atemp];

Atemp.attrNr = 18;
Atemp.type = "Kiddie Ride";
Atemp.pos = "85 86";
Atemp.name = "Wild Jungle Cruise";
attractions = [attractions;Atemp];

Atemp.attrNr = 19;
Atemp.type = "Kiddie Ride";
Atemp.pos = "87 81";
Atemp.name = "Stone Cups";
attractions = [attractions;Atemp];

Atemp.attrNr = 20;
Atemp.type = "Rides for Everyone";
Atemp.pos = "6 43";
Atemp.name = "Scholtz Express";
attractions = [attractions;Atemp];

Atemp.attrNr = 21;
Atemp.type = "Rides for Everyone";
Atemp.pos = "34 68";
Atemp.name = "Paleocarrie Carousel";
attractions = [attractions;Atemp];

Atemp.attrNr = 22;
Atemp.type = "Rides for Everyone";
Atemp.pos = "17 67";
Atemp.name = "Jurrasic Road";
attractions = [attractions;Atemp];

Atemp.attrNr = 23;
Atemp.type = "Rides for Everyone";
Atemp.pos = "16 49";
Atemp.name = "Rhynasaurus Rampage";
attractions = [attractions;Atemp];

Atemp.attrNr = 24;
Atemp.type = "Rides for Everyone";
Atemp.pos = "43 56";
Atemp.name = "Kauf?s Lost Canyon Escape";
attractions = [attractions;Atemp];

Atemp.attrNr = 25;
Atemp.type = "Rides for Everyone";
Atemp.pos = "26 59";
Atemp.name = "Maiasaur Madness";
attractions = [attractions;Atemp];

Atemp.attrNr = 26;
Atemp.type = "Rides for Everyone";
Atemp.pos = "28 66";
Atemp.name = "Kristanodon Kaper";
attractions = [attractions;Atemp];

Atemp.attrNr = 27;
Atemp.type = "Rides for Everyone";
Atemp.pos = "48 87";
Atemp.name = "Squidosaur";
attractions = [attractions;Atemp];

Atemp.attrNr = 28;
Atemp.type = "Rides for Everyone";
Atemp.pos = "23 54";
Atemp.name = "Eberlesaurus Roundup";
attractions = [attractions;Atemp];

Atemp.attrNr = 29;
Atemp.type = "Rides for Everyone";
Atemp.pos = "87 48";
Atemp.name = "Dykesadactyl Thrill";
attractions = [attractions;Atemp];

Atemp.attrNr = 30;
Atemp.type = "Rides for Everyone";
Atemp.pos = "78 37";
Atemp.name = "Ichthyoroberts";
attractions = [attractions;Atemp];

Atemp.attrNr = 31;
Atemp.type = "Rides for Everyone";
Atemp.pos = "43 78";
Atemp.name = "Raptor Race";
attractions = [attractions;Atemp];

Atemp.attrNr = 32;
Atemp.type = "Shows & Entertainment";
Atemp.pos = "32 33";
Atemp.name = "Creighton Pavilion";
attractions = [attractions;Atemp];

Atemp.attrNr = 62;
Atemp.type = "Information & Assistance";
Atemp.pos = "50 57";
Atemp.name = "Liggement Fix-Me-Up";
attractions = [attractions;Atemp];

Atemp.attrNr = 63;
Atemp.type = "Shows & Entertainment";
Atemp.pos = "76 22";
Atemp.name = "Grinosaurus Stage";
attractions = [attractions;Atemp];

Atemp.attrNr = 64;
Atemp.type = "Shows & Entertainment";
Atemp.pos = "87 63";
Atemp.name = "SabreTooth Theatre";
attractions = [attractions;Atemp];

Atemp.attrNr = 81;
Atemp.type = "Thrill Rides";
Atemp.pos = "69 44";
Atemp.name = "Flight of the Swingodon";
attractions = [attractions;Atemp];

Atemp.attrNr = 68;
Atemp.type = "Entry";
Atemp.pos = "0 67";
Atemp.name = "Entry Thundra";
attractions = [attractions;Atemp];

Atemp.attrNr = 69;
Atemp.type = "Entry";
Atemp.pos = "63 99";
Atemp.name = "Entry Corridor";
attractions = [attractions;Atemp];

Atemp.attrNr = 70;
Atemp.type = "Entry";
Atemp.pos = "99 77";
Atemp.name = "Entry Kiddie Land";
attractions = [attractions;Atemp];

Atemp.attrNr = 71;
Atemp.type = "Park";
Atemp.pos = "67 37";
Atemp.name = "Park 1";
attractions = [attractions;Atemp];

Atemp.attrNr = 72;
Atemp.type = "Park";
Atemp.pos = "60 37";
Atemp.name = "Park 2";
attractions = [attractions;Atemp];

Atemp.attrNr = 73;
Atemp.type = "Park";
Atemp.pos = "42 37";
Atemp.name = "Park 3";
attractions = [attractions;Atemp];

%save('attractions.mat', 'attractions');
