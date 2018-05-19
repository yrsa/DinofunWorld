load 'seq_table.mat';
load 'attractions.mat';
c = Translate(seq_table);
%%
cols = attractions.attrNr';

N = length(cols);
[M ~] = size(c);

rides = false(M,N);

for i=1:M
    row = c{i};
    for j=1:N
        if(ismember(cols(j),row))
            rides(i,j) = 1;
        end 
    end   
end

label = attractions.name';

%%
minSup = 0.3;
minConf = 0.7;
nRules = 100;
sortFlag = 1;
fname = 'FridayRules';

labels = label;

[Rules FreqItemsets] = findRules(rides, minSup, minConf, nRules, sortFlag, labels, fname);




