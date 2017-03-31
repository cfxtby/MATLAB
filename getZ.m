function Z = getZ(X,Y)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
[m,n]=size(X);
Z=zeros(m,n);
for i=1:m
    for j=1:n
        x=X(i,j);
        y=Y(i,j);
        if x<=1 & y^2+x^2<=1
            Z(i,j)=(1-y^2)^0.5+x;
        else if x<=0
                Z(i,j)=0;
            else
                Z(i,j)=(1-y^2)^0.5*2;
            end
        end
    end
end


end

