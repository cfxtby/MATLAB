function y = getRandomPoint( evl,d,n)
%输入均值和方差，获得一个行向量长度为n，为该均值evl和方差d的正态分布
y=zeros(1,n);
for i=1:n
    y(i)=randn() * sqrt(d) + evl;
end
end

