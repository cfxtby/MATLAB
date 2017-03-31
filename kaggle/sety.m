this=[x;x1];
tmp=zeros(0,18);
for i=1:1459+1460
    tmp=[tmp;(this(i,:)-allE)*base];
end