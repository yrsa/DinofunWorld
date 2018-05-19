function ride = AttractionSequence2(seq, attractions)
%ATTRACTIONSEQUENCE Summary of this function goes here
%   Detailed explanation goes here
    evaluated_seq = eval(seq);
    ride = table;
   
   [row ~] = size(evaluated_seq);
   if row > 1
         for i = 1:length(evaluated_seq)

            tempride = attractions(attractions.xpos == evaluated_seq(i,1) & attractions.ypos == evaluated_seq(i,2),:);
            ride = [ride; tempride];
 
         end
   else
       if row == 0
           
           %do nothing
       else
       
           tempride = attractions(attractions.xpos == evaluated_seq(1,1) & attractions.ypos == evaluated_seq(1,2),:);
           ride = [ride; tempride];
       end
       %disp("Number of rides: " + height(ride));
    end
end