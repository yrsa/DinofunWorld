%% Read data
%Timestamp (%{yyyy-MM-dd HH:mm:ss})D, id(%d), type(%C), X(%d), Y(%d)
% formatSpec = '%{yyyy-MM-dd HH:mm:ss}D%d%C%d%d';
% 
% load 'MatlabData/friday.mat';
% load 'MatlabData/saturday.mat';
% load 'MatlabData/sunday.mat';

%% load park image
parkmap = imread('Auxiliary Files/Park Map.jpg');
%imshow(parkmap) 

%% sort sunday data on the rows
M = saturday;
sortedM = sortrows(M, 2);

Ids = unique(sortedM.(2));

%dsMale = hospital(hospital.Sex=='Male',:);
p = sortedM(sortedM.id == Ids(127),:);         %change here if you want another person    %friday, id(19)
q = sortedM(sortedM.id == Ids(128),:);
c = sortedM(p.type == 'check-in',:); 

d = M(M.type == 'check-in',:);
sortedD = sortrows(d, 4);
nrAttractions = unique(sortedD.(4));

histogram(sortedD.(4))
hold on
histogram(sortedD.(5))
hold off

%histogram2(sortedD.(4), sortedD.(5))


%%
%Flip the image upside down before showing it
%imagesc([min(sortedM.(4)) max(sortedM.(4))], [min(sortedM.(5)) max(sortedM.(5))], flip(parkmap, 1));
imagesc([0 max(sortedM.(4))], [0 max(sortedM.(5))], flip(parkmap, 1)); 
hold on;

% plot(sortedM.(4)(2:1481),sortedM.(5)(2:1481),'b-','linewidth',1.5); %436
%plot(sortedM.(4)(1482:3377),sortedM.(5)(1482:3377),'b-','linewidth',1.5);   %878

[psize, ~] = size(p);

% Plot in time
% for i=1:psize
%     plot(p.(4)(1:i),p.(5)(1:i),'b-','linewidth',1.5);
%     plot(q.(4)(1:i),q.(5)(1:i),'g-','linewidth',1.5);
%     pause(0.1);
% end

% Plot everything directly
% plot(p.(4),p.(5),'b-','linewidth',1.5);
% plot(q.(4),q.(5),'g-','linewidth',1.5);

% plot(c.(4),c.(5),'r*','linewidth',1.5);   % p's check-in
plot(d.(4),d.(5),'b*','linewidth',1.5);     % all check-in

% plot check-in in red/stars
% plot in time, like in lab


% set the y-axis back to normal.
set(gca,'ydir','normal');


%% Show the positions on top of the map
%Source: http://www.peteryu.ca/tutorials/matlab/plot_over_image_background

%% Might want to read this:
% Visually driven analysis of movement data by progressive clustering
% https://pdfs.semanticscholar.org/193f/048ae443b1559bc23195738917b65caa730b.pdf

