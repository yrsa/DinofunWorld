function [configurations] = ComputeConfigurations(itemsets)
%COMPUTECONFIGURATIONS compute all different combinations of the items
% and store them as the new configuration
% the itemsets x and y positions should maybe be combined into an array


headers = {'names'};
d = cell(1,1);
configurations = cell2table(d);
configurations.Properties.VariableNames = headers;

% config = [];

for i = 1:height(itemsets)-1
   %for item i, find all the possible cconfigurations with the rest of the
   %items
   item1 = itemsets(i,:);
%    x1 = item1.xpos(1);
%    y1 = item1.ypos(1);
%    position1 = [x1 y1];
   for j = i+1:height(itemsets)
      item2 = itemsets(j,:);
%       position2 = [item2.xpos(1) item2.ypos(2)];
%       combined_pos = [item1.xpos(1) item1.ypos(1); item2.xpos(1) item2.ypos(1)];
      names = [item1.name(1); item2.name(1)];
      
%       config = [config, names];
      
      combination = {names};
      combrow = cell2table(combination);
      combrow.Properties.VariableNames = headers;
      configurations = [configurations; combrow];   
   end
end
configurations(1,:) = []; %delete the empty row.


end

