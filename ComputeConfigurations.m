function [outputArg1,outputArg2] = ComputeConfigurations(itemsets)
%COMPUTECONFIGURATIONS compute all different combinations of the items
% and store them as the new configuration

header = {'combined_pos' 'names'};


for i = 1:height(itemsets)-1
   %for item i, find all the possible cconfigurations with the rest of the
   %items
   item1 = itemsets(i,:);
   for j = i+1:height(itemsets)
      item2 = itemsets(j,:);
      
      combined_pos = [item1.xpos(1) item1.ypos(2); item2.xpos(1) item2.ypos(2);]
      names = [item1.name(1); item2.name(2)];
      
      combination = {combined_pos names};
      combrow = cell2table(combination)
      
   end
end


end

