function test(x,y)
for i=1:6
    subplot(3,2,i);
    slim(x,y,11,1,i-1);
end