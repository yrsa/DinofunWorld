function [] = AttractionSequence(seq, attractions)
%ATTRACTIONSEQUENCE Summary of this function goes here
%   Detailed explanation goes here
evaluated_seq = eval(seq);

for i = 1:length(evaluated_seq)

%     st = strcat(num2str(evaluated_seq(i,1)), " ", num2str(evaluated_seq(i,2)));
    ride = attractions(attractions.xpos == evaluated_seq(i,1) && attractions.ypos == evaluated_seq(i,2),:)
    
end

end

