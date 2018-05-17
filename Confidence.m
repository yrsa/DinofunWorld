function [confidence] = Confidence(combinations,seq_table)
%CONFIDENCE Summary of this function goes here
%   Detailed explanation goes here
%% calculate confidence
confidence = zeros(height(combinations), 1);
for i=1:height(combinations)
    combo = combinations.names(i);
    combo = combo{1};
    [row ~] = size(combo);
    
    A = combo; %all items
    B = combo(1:row-1,:); %all items except the last
    
    %find support
    [A_times_visited, A_support] = Support2(A, seq_table);
    [B_times_visited, B_support] = Support2(B, seq_table);
    
    confidence(i) = A_support / B_support;
    
end
end

