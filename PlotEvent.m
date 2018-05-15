function [] = PlotEvent(timestamp,data)
%PLOTEVENT Summary of this function goes here
%   Detailed explanation goes here
day = data;
timeline = day.Timestamp;
timeline = sortrows(timeline, 1);
% 
% last = length(timeline);
% 
% starttime = timeline(1,:);
% endtime = timeline(last,:);
% 
timeline = unique(timeline);

%%
% t = timeline(323);



%% load park image
parkmap = imread('Auxiliary Files/Park Map.jpg');

%Flip the image upside down before showing it
%imagesc([min(sortedM.(4)) max(sortedM.(4))], [min(sortedM.(5)) max(sortedM.(5))], flip(parkmap, 1));
% imagesc([0 max(data.(4))], [0 max(data.(5))], flip(parkmap, 1)); 
% hold on;

for j=1:length(timeline)
    imagesc([0 max(data.(4))], [0 max(data.(5))], flip(parkmap, 1)); 
    hold on;
    
    t = timeline(j);
    d = day(day.Timestamp == t, :);
    for i=1:height(d)
        p = d(i,:);
        
        personid = p.id;
        person = data(data.id == personid, :);
        [psize, ~] = size(p);
        % Plot everything directly
%         plot(person.(4)(1:),person.(5),'-','linewidth',1.5);
        
    end
    set(gca,'ydir','normal');  
     pause(0.01);
     clf('reset');
end

% for i=1:height(d)
%     p = d(i,:);
%     
%     [psize, ~] = size(p);
%     % Plot everything directly
%     plot(p.(4),p.(5),'bo','linewidth',1.5);
%     set(gca,'ydir','normal');  
% end




end

