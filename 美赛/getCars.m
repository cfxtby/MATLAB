function cars = getCars(lamt,n)
%lumtaΪ������ݵľ�ֵ
%nΪ������ݵ���,������Ϊ�˴������ɵ�·�еķ���ָ���ֲ���
cars=zeros(n,1); 
cars(1)=exprnd(lamt);
for i=2:n
    cars(i)=cars(i-1)+exprnd(lamt);
end