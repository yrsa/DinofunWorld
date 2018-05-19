%% entroGoers: (from patterns.m)

%% Look att different entryPeople
parkmap = imread('Auxiliary Files/Park Map.jpg');
M = friday;
sortedM = sortrows(M, 2);


%p = sortedM(sortedM.id == cell2mat(entryPeople{16,1}),:);    %change person here
%p = sortedM(sortedM.id == 521750,:);            % 521750 <-- spends time in 63 but never checks in
%p = sortedM(sortedM.id == 1148243,:);
p = sortedM(sortedM.id == cell2mat(entryGoer{2,1}),:);
c = p(p.type == 'check-in',:);

imagesc([0 99], [0 99], flip(parkmap, 1)); 
hold on;

[psize, ~] = size(p);

%Plot in time
% for i=1:psize
%     plot(co.(4)(1:i),co.(5)(1:i),'b-','linewidth',1.5);
% 
%     % set the y-axis back to normal.
%     set(gca,'ydir','normal');
%     pause(0.08);
% end
plot(p.(4),p.(5),'b-','linewidth',1.5);
plot(c.(4),c.(5),'g*','linewidth',1.5);

set(gca,'ydir','normal');

%%

%p1 = p;
%p7 = p;
%p2 = p;
%p3 = p;
%p4 = p;
%p5 = p;
%p6 = p;
%p8 = p;
%p9 = p;
%p10 = p;
%p11 = p;
%p12 = p;
%p13 = p;
%p14 = p;
%p15 = p;
%p16 = p;
%figure

%plot(p.Timestamp, p.X);
% plot(p1.Timestamp, p1.X, 'b-');
 hold on
% plot(p2.Timestamp, p2.X, 'g-');
% plot(p3.Timestamp, p3.X, 'r-');
% plot(p4.Timestamp, p4.X);
% plot(p5.Timestamp, p5.X);
% plot(p6.Timestamp, p6.X);
% plot(p7.Timestamp, p7.X, 'g-');
% plot(p8.Timestamp, p8.X);
% plot(p9.Timestamp, p9.X);
% plot(p10.Timestamp, p10.X);
% plot(p11.Timestamp, p11.X);
% plot(p12.Timestamp, p12.X);
% plot(p13.Timestamp, p13.X);
% plot(p14.Timestamp, p14.X);
% plot(p15.Timestamp, p15.X);
% plot(p16.Timestamp, p16.X);

%% Do they return later in the weekend?
S = sunday;
sortedS = sortrows(S, 2);
co = sortedS(sortedS.id == cell2mat(entryGoer{13,1}), :);

%%
%entryGoerThatReturnsSat = table;
entryGoerThatReturnsSat = [entryGoerThatReturnsSat; co];
%%
%entryGoerThatReturnsSun = table;
entryGoerThatReturnsSun = [entryGoerThatReturnsSun; co];

%% Thrill Junkies
% do they come back saturday and sunday?

[wsize ~] = size(FriSatSun);

friSatTable  = table;
%temp = table;

for i = 1:wsize
    
    temp = thrillJunkie(cell2mat(thrillJunkie.id) == FriSatSun(i),:);
    friSatTable = [friSatTable; temp];
    
end

%% 

[wsize ~] = size(onlyFriSat);

friSatTable  = table;
%temp = table;

for i = 1:wsize
    
    temp = forEveryones(cell2mat(forEveryones.id) == onlyFriSat(i),:);
    friSatTable = [friSatTable; temp];
    
end