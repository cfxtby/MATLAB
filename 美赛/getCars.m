function cars = getCars(lamt,n)
%lumta为输出数据的均值
%n为输出数据的量,本函数为了处理生成道路中的符合指数分布的
cars=zeros(n,1); 
cars(1)=exprnd(lamt);
for i=2:n
    cars(i)=cars(i-1)+exprnd(lamt);
end