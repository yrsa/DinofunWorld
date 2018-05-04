%% Read data
%Timestamp (%{yyyy-MM-dd HH:mm:ss})D, id(%d), type(%C), X(%d), Y(%d)
formatSpec = '%{yyyy-MM-dd HH:mm:ss}D%d%C%d%d';

%% load park image
parkmap = imread('Auxiliary Files/Park Map.jpg');
%imshow(parkmap) 

%% sort sunday data on the rows
sortedM = sortrows(sunday, 2);

%%
%Flip the image upside down before showing it
imagesc([min(sortedM.(4)) max(sortedM.(4))], [min(sortedM.(5)) max(sortedM.(5))], flip(parkmap, 1));
 
hold on;
plot(sortedM.(4)(2:1481),sortedM.(5)(2:1481),'b-*','linewidth',1.5);
 
% set the y-axis back to normal.
set(gca,'ydir','normal');


%% Visa positionerna ovanp� kartan
%Source: http://www.peteryu.ca/tutorials/matlab/plot_over_image_background

% Flip the image upside down before showing it
% imagesc([min(M.(4)) max(M.(4))], [min(M.(5)) max(M.(5))], flip(parkmap, 1));
%  
% hold on;
% plot(M.(4),M.(5),'b-*','linewidth',1.5);
%  
% % set the y-axis back to normal.
% set(gca,'ydir','normal');