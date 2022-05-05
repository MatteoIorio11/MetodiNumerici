clc
clear all
format long
x1=1;
result=1;
val=0.1e-15;
x=ones(1,8)*0.1e-15
for counter=2:10
    result=result+val;
end
result
result=0;
for counter=2:10
    result=result+val;
end    
result=result +1
