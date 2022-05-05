function max = normInf(matrix)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
sum=0;
max=0;
for y=1:size(matrix, 1)
    for x=1:size(matrix,2)
       sum=sum+abs(matrix(x,y));
    end
    if(max < sum)
        max=sum;
    end
    sum=0;
end

