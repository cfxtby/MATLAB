%获得加入噪声的正弦曲线,y=sin(x)+rand()+1.5;
x=[0:pi/5:2*pi];
x=x';
y1=zeros(1,length(x));
for i=1:length(x)
    y1(1,i)=randn();
end
y=sin(x)*5+5+y1';
t=[0:0.01:2*pi];
plot(t,sin(t)*5+5);hold on;
plot(x,y,'r*');hold off;