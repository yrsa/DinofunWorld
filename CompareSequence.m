function [res] = CompareSequence(seq1,seq2)
%COMPARESEQUENCE Function that compares two sequences of x and y
%coordindates, represented by cell arrays
% 
if(length(seq1) ~= length(seq2)) %if different sizes
   res = length(seq1) == length(seq2); %should return false

else
    rows = length(seq1);
    
    counter = 0;
    for i=1:rows
       if(~isequal(seq1{i},seq2{i}))
           counter = counter + 1;
       end
    end
    %If the counter has not increased the sequences are the same
    res = (counter == 0); 
    
end


end

