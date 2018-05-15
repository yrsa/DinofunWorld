function ride = AttractionSequence2(seq, attractions)
%ATTRACTIONSEQUENCE Summary of this function goes here
%   Detailed explanation goes here
    evaluated_seq = eval(seq);
    ride = table;
    
     for i = 1:length(evaluated_seq)
    
        tempride = attractions(attractions.xpos == evaluated_seq(i,1) & attractions.ypos == evaluated_seq(i,2),:);
        ride = [ride; tempride];
    end

end