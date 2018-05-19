function [combos] = ComputeCombinations(cell, k)
%COMPUTECOMBINATIONS Summary of this function goes here
%   Detailed explanation goes here

names = string(cell);

combos = nchoosek(names,k);


