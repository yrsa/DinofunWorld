%% Apriori test
load 'MatlabData/friday.mat';
load 'MatlabData/saturday.mat';
load 'MatlabData/sunday.mat';

smalldata = friday(1:1000,:);

ids1 = friday.id;
ids1 = unique(ids1);

ids2 = saturday.id;
ids2 = unique(ids2);

ids3 = sunday.id;
ids3 = unique(ids3);


% %% Create a sequence table
% friday_sequences = CreateSeqTable(ids1,friday);
% saturday_sequences = CreateSeqTable(ids2,saturday);
% sunday_sequences = CreateSeqTable(ids3,sunday);

load 'fs.mat';
load 'ss.mat';
load 'sss.mat';

%%
fri = Translate(friday_sequences);
sat = Translate(saturday_sequences);
sun = Translate(sunday_sequences);

%% translate
t_fri = FreqMat(fri);
t_sat = FreqMat(sat);
t_sun = FreqMat(sun);

%%
load 'attractions.mat';
minSup = 0.25;
minConf = 0.7;
nRules = 100;
sortFlag = 1;
fname1 = 'FridayRules';
fname2 = 'SaturdayRules';
fname3 = 'SundayRules';
labels = attractions.name';


[Rules1 FreqItemsets1] = findRules(t_fri, minSup, minConf, nRules, sortFlag, labels, fname1);
[Rules2 FreqItemsets2] = findRules(t_sat, minSup, minConf, nRules, sortFlag, labels, fname2);
[Rules3 FreqItemsets3] = findRules(t_sun, minSup, minConf, nRules, sortFlag, labels, fname3);

%%
itemsets = FreqItemsets1{3};
set = itemsets(3,:);

% labels(set(1))
% labels(set(2))
% labels(set(3))
%%
attrnrs = attractions.attrNr;
id = friday_sequences.id;

c = [id fri];

T = cell2table(c);
headers = {'id', 'sequence'};
T.Properties.VariableNames = headers;

[g g2] = FindGroupsByRides(set, T);

%% 
person = friday(friday.id == g(679),:);
person2 = friday(friday.id == g(3),:);

PlotPath(friday, person)
figure
PlotPath(friday, person2)
%% Find those that do not use as popular combination
T2 = [];
for i=1:length(g)
    row = find(friday.id == g(i));
    T2 = [T2;row];
    
end

%%
e = friday(T2, :);
h = setdiff(friday, e);

%% 
person = h(h.id == g2(67),:);
person2 = h(h.id == g2(3),:);

PlotPath(h, person)
figure
PlotPath(h, person2)

