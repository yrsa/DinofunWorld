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
Atemp.xpos = 47;
Atemp.ypos = 11;
Atemp.name = "Wrightiraptor Mountain";
attractions = [attractions;Atemp];

Atemp.attrNr = 2;
Atemp.type = "Thrill Ride";
Atemp.xpos = 27;
Atemp.ypos = 15;
Atemp.name = "Galactosaurus Rage";
attractions = [attractions;Atemp];

Atemp.attrNr = 3;
Atemp.type = "Thrill Ride";
Atemp.xpos = 38;
Atemp.ypos = 90;
Atemp.name = "Auvilotops Express";
attractions = [attractions;Atemp];

Atemp.attrNr = 4;
Atemp.type = "Thrill Ride";
Atemp.xpos = 78;
Atemp.ypos = 48;
Atemp.name = "TerrorSaur";
attractions = [attractions;Atemp];

Atemp.attrNr = 5;
Atemp.type = "Thrill Ride";
Atemp.xpos = 16;
Atemp.ypos = 66;
Atemp.name = "Wendisaurus Chase";
attractions = [attractions;Atemp];

Atemp.attrNr = 6;
Atemp.type = "Thrill Ride";
Atemp.xpos = 86;
Atemp.ypos = 44;
Atemp.name = "Keimosaurus Chase";
attractions = [attractions;Atemp];

Atemp.attrNr = 7;
Atemp.type = "Thrill Ride";
Atemp.xpos = 17;
Atemp.ypos = 43;
Atemp.name = "Firefall";
attractions = [attractions;Atemp];

Atemp.attrNr = 8;
Atemp.type = "Thrill Ride";
Atemp.xpos = 45;
Atemp.ypos = 24;
Atemp.name = "Atmosfear";
attractions = [attractions;Atemp];

Atemp.attrNr = 9;
Atemp.type = "Kiddie Ride";
Atemp.xpos = 92;
Atemp.ypos = 81;
Atemp.name = "North Line";
attractions = [attractions;Atemp];

Atemp.attrNr = 10;
Atemp.type = "Kiddie Ride";
Atemp.xpos = 81;
Atemp.ypos = 77;
Atemp.name = "Jeredactyl Jump";
attractions = [attractions;Atemp];

Atemp.attrNr = 11;
Atemp.type = "Kiddie Ride";
Atemp.xpos = 73;
Atemp.ypos = 79;
Atemp.name = "Sauroma Bumpers";
attractions = [attractions;Atemp];

Atemp.attrNr = 12;
Atemp.type = "Kiddie Ride";
Atemp.xpos = 73;
Atemp.ypos = 84;
Atemp.name = "Flying TyrAndrienkos";
attractions = [attractions;Atemp];

Atemp.attrNr = 13;
Atemp.type = "Kiddie Ride";
Atemp.xpos = 79;
Atemp.ypos = 87;
Atemp.name = "Cyndisaurus Asteroid";
attractions = [attractions;Atemp];

Atemp.attrNr = 14;
Atemp.type = "Kiddie Ride";
Atemp.xpos = 76;
Atemp.ypos = 88;
Atemp.name = "Beelzebufo";
attractions = [attractions;Atemp];

Atemp.attrNr = 15;
Atemp.type = "Kiddie Ride";
Atemp.xpos = 79;
Atemp.ypos = 89;
Atemp.name = "Enchanted Toadstools";
attractions = [attractions;Atemp];

Atemp.attrNr = 16;
Atemp.type = "Kiddie Ride";
Atemp.xpos = 82;
Atemp.ypos = 80;
Atemp.name = "Stegocycles";
attractions = [attractions;Atemp];

Atemp.attrNr = 17;
Atemp.type = "Kiddie Ride";
Atemp.xpos = 83;
Atemp.ypos = 88;
Atemp.name = "Blue Iguanodon";
attractions = [attractions;Atemp];

Atemp.attrNr = 18;
Atemp.type = "Kiddie Ride";
Atemp.xpos = 85;
Atemp.ypos = 86;
Atemp.name = "Wild Jungle Cruise";
attractions = [attractions;Atemp];

Atemp.attrNr = 19;
Atemp.type = "Kiddie Ride";
Atemp.xpos = 87;
Atemp.ypos = 81;
Atemp.name = "Stone Cups";
attractions = [attractions;Atemp];

Atemp.attrNr = 20;
Atemp.type = "Rides for Everyone";
Atemp.xpos = 6;
Atemp.ypos = 43;
Atemp.name = "Scholtz Express";
attractions = [attractions;Atemp];

Atemp.attrNr = 21;
Atemp.type = "Rides for Everyone";
Atemp.xpos = 34;
Atemp.ypos = 68;
Atemp.name = "Paleocarrie Carousel";
attractions = [attractions;Atemp];

Atemp.attrNr = 22;
Atemp.type = "Rides for Everyone";
Atemp.xpos = 17;
Atemp.ypos = 67;
Atemp.name = "Jurrasic Road";
attractions = [attractions;Atemp];

Atemp.attrNr = 23;
Atemp.type = "Rides for Everyone";
Atemp.xpos = 16;
Atemp.ypos = 49;
Atemp.name = "Rhynasaurus Rampage";
attractions = [attractions;Atemp];

Atemp.attrNr = 24;
Atemp.type = "Rides for Everyone";
Atemp.xpos = 43;
Atemp.ypos = 56;
Atemp.name = "Kauf?s Lost Canyon Escape";
attractions = [attractions;Atemp];

Atemp.attrNr = 25;
Atemp.type = "Rides for Everyone";
Atemp.xpos = 26;
Atemp.ypos = 59;
Atemp.name = "Maiasaur Madness";
attractions = [attractions;Atemp];

Atemp.attrNr = 26;
Atemp.type = "Rides for Everyone";
Atemp.xpos = 28;
Atemp.ypos = 66;
Atemp.name = "Kristanodon Kaper";
attractions = [attractions;Atemp];

Atemp.attrNr = 27;
Atemp.type = "Rides for Everyone";
Atemp.xpos = 48;
Atemp.ypos = 87;
Atemp.name = "Squidosaur";
attractions = [attractions;Atemp];

Atemp.attrNr = 28;
Atemp.type = "Rides for Everyone";
Atemp.xpos = 23;
Atemp.ypos = 54;
Atemp.name = "Eberlesaurus Roundup";
attractions = [attractions;Atemp];

Atemp.attrNr = 29;
Atemp.type = "Rides for Everyone";
Atemp.xpos = 87;
Atemp.ypos = 48;
Atemp.name = "Dykesadactyl Thrill";
attractions = [attractions;Atemp];

Atemp.attrNr = 30;
Atemp.type = "Rides for Everyone";
Atemp.xpos = 78;
Atemp.ypos = 37;
Atemp.name = "Ichthyoroberts";
attractions = [attractions;Atemp];

Atemp.attrNr = 31;
Atemp.type = "Rides for Everyone";
Atemp.xpos = 43;
Atemp.ypos = 78;
Atemp.name = "Raptor Race";
attractions = [attractions;Atemp];

Atemp.attrNr = 32;
Atemp.type = "Shows & Entertainment";
Atemp.xpos = 32;
Atemp.ypos = 33;
Atemp.name = "Creighton Pavilion";
attractions = [attractions;Atemp];

Atemp.attrNr = 62;
Atemp.type = "Information & Assistance";
Atemp.xpos = 50;
Atemp.ypos = 57;
Atemp.name = "Liggement Fix-Me-Up";
attractions = [attractions;Atemp];

Atemp.attrNr = 63;
Atemp.type = "Shows & Entertainment";
Atemp.xpos = 76;
Atemp.ypos = 22;
Atemp.name = "Grinosaurus Stage";
attractions = [attractions;Atemp];

Atemp.attrNr = 64;
Atemp.type = "Shows & Entertainment";
Atemp.xpos = 87;
Atemp.ypos = 63;
Atemp.name = "SabreTooth Theatre";
attractions = [attractions;Atemp];

Atemp.attrNr = 81;
Atemp.type = "Thrill Rides";
Atemp.xpos = 69;
Atemp.ypos = 44;
Atemp.name = "Flight of the Swingodon";
attractions = [attractions;Atemp];

Atemp.attrNr = 68;
Atemp.type = "Entry";
Atemp.xpos = 0;
Atemp.ypos = 67;
Atemp.name = "Entry Thundra";
attractions = [attractions;Atemp];

Atemp.attrNr = 69;
Atemp.type = "Entry";
Atemp.xpos = 63;
Atemp.ypos = 99;
Atemp.name = "Entry Corridor";
attractions = [attractions;Atemp];

Atemp.attrNr = 70;
Atemp.type = "Entry";
Atemp.xpos = 99;
Atemp.ypos = 77;
Atemp.name = "Entry Kiddie Land";
attractions = [attractions;Atemp];

Atemp.attrNr = 71;
Atemp.type = "Park";
Atemp.xpos = 67;
Atemp.ypos = 37;
Atemp.name = "Park 1";
attractions = [attractions;Atemp];

Atemp.attrNr = 72;
Atemp.type = "Park";
Atemp.xpos = 60;
Atemp.ypos = 37;
Atemp.name = "Park 2";
attractions = [attractions;Atemp];

Atemp.attrNr = 73;
Atemp.type = "Park";
Atemp.xpos = 42;
Atemp.ypos = 37;
Atemp.name = "Park 3";
attractions = [attractions;Atemp];

%save('attractions.mat', 'attractions');
