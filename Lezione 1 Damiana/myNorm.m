function max = myNorm(matrix)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
max=0;
value=0;
for x=1:size(matrix,1)
    for y=1:size(matrix,2)
        value= value + abs(matrix(x,y));
    end
    if (max < value)
        max=value;
    end
    value=0;
end


