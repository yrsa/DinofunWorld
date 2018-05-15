function [groups] = GatherGroupsByLocations(groups)
%GATHERGROUPSBYLOCATIONS Summary of this function goes here
%   Detailed explanation goes here

for j = 1:length(groups)-1
    g = groups{j};
    if(~isempty(g))
        sequence = eval(g.sequence{1});
        for i=j+1:length(groups)
            g2 = groups{i};
            if(~isempty(g2))
                sequence2 = eval(g2.sequence{1});

                if(length(sequence2) == length(sequence))
                    v = ismember(sequence2, sequence);
                    r = v(v == 0);

                    %if there are only non-zero elements, the secuences contain the 
                    %same locations
                    if(isempty(r))
                        disp('Same locations found'); 
                        groups{j} =[groups{j}; g2];
                        groups{i} = [];
                    end

                end

            end
        end
    end
end
%remove all empty cells
groups = groups(~cellfun('isempty',groups));  

end

