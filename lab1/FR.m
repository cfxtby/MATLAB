function [t,y1] = FR( x,y ,n,sigm)
%¹²éîÌÝ¶È·¨
%   
X=ones(size(x,1),1);
for i=1:n 
   X=[x.^i,X];
end
w=ones(n+1,1)*0;
g1=2*X'*(X*w-y)+sigm*w;
d1=-g1;
j=1;
l=(y-X*w)'*(y-X*w);


while true
    if (y-X*w)'*(y-X*w)+sigm*w'*w<10 || j>100000
        (y-X*w)'*(y-X*w)+sigm*w'*w
        w
        j
        break;
    end
    j=j+1;
   w=w-(g1'*g1)/(d1'*X'*X*d1)*d1;
   %w=w-(g1'*g1)/(g0'*g0)*d1;
   g0=g1;
   g1=2*X'*(X*w-y)+sigm*w;
   d1=-g1+(g1'*g1)/(g0'*g0)*d1;
end
t=[0:0.01:10];
y1=polyval(w,t);
plot(t,y1,'r');
axis([0 2*pi 0 5]);
hold on;
plot(x,y,'.');
plot(t,sin(t)+2,'g');
%plot(t,0.04*t.^2-0.4*t+2,'g');
hold off;
end
