function [y1,mx,mn] = tooney1(y)
mx=max(y);
mn=min(y);
y1=(y-mn)/(mx-mn)*100;
end