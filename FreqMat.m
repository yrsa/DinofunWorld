function [rides] = FreqMat(c)
%FREQMAT Summary of this function goes here
%   Detailed explanation goes here
load 'attractions.mat';
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
end

