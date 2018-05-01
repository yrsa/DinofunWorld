%% Read data
%Timestamp (%{yyyy-MM-dd HH:mm:ss})D, id(%d), type(%C), X(%d), Y(%d)
formatSpec = '%{yyyy-MM-dd HH:mm:ss}D%d%C%d%d';
M = readtable('MC1 Data June 2015 V3/park-movement-Fri-FIXED-2.0.csv','Delimiter',',', ...
    'Format',formatSpec);

%%
%load image
parkmap = imread('Auxiliary Files/Park Map.jpg');
%imshow(parkmap)

%% Visa positionerna ovanpå kartan
%Källa för nedanstående: http://www.peteryu.ca/tutorials/matlab/plot_over_image_background

% Flip the image upside down before showing it
imagesc([min(M.(4)) max(M.(4))], [min(M.(5)) max(M.(5))], flip(parkmap, 1));
 
hold on;
plot(M.(4),M.(5),'b-*','linewidth',1.5);
 
% set the y-axis back to normal.
set(gca,'ydir','normal');