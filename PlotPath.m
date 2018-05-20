function [] = PlotPath(data,p)
%PLOTPATH Summary of this function goes here
%   p is the data for 1 person
%% load park image
parkmap = imread('Auxiliary Files/Park Map.jpg');

%Flip the image upside down before showing it
%imagesc([min(sortedM.(4)) max(sortedM.(4))], [min(sortedM.(5)) max(sortedM.(5))], flip(parkmap, 1));
imagesc([0 max(data.(4))], [0 max(data.(5))], flip(parkmap, 1)); 
hold on;


[psize, ~] = size(p);

% Plot in time
% for i=1:psize
% 
%     plot(p.(4)(1:i),p.(5)(1:i),'b-','linewidth',1.5);
%     % set the y-axis back to normal.
%     set(gca,'ydir','normal');
%     pause(0.1);
%     
% end

% Plot everything directly
plot(p.(4),p.(5),'b-','linewidth',1.5);
set(gca,'ydir','normal');
% plot(q.(4),q.(5),'g-','linewidth',1.5);

% plot(c.(4),c.(5),'r*','linewidth',1.5);   % p's check-in
%plot(d.(4),d.(5),'b*','linewidth',1.5);     % all check-in

% plot check-in in red/stars
% plot in time, like in lab



%imshow(parkmap) 
end

