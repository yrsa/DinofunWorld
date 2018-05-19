function [c] = Translate(seq_table)
%TRANSLATE Summary of this function goes here
%   Detailed explanation goes here
load attractions.mat;

seq = seq_table.sequence;
seq = string(seq);

[row, ~] = size(seq);
c = cell(row,1);
for i=1:row
    mat = eval(seq(i));
    [nr ~] = size(mat);
    attrNr_seq = zeros(1, nr);
    for j = 1:nr
        place = mat(j, :);
        x = place(1,1);
        y = place(1,2);
        ride = attractions(attractions.xpos == mat(j,1) & attractions.ypos == mat(j,2),:);
        attrNr = ride.attrNr(1);
        attrNr_seq(1,j) = attrNr;
        %         attractions(attractions.xpos == evaluated_seq(i,1) & attractions.ypos == evaluated_seq(i,2),:)
%         name = attractions(attractions.xpos == x & attractions.ypos == y),:);
        
    end
    c{i} = attrNr_seq;
    
end

end

