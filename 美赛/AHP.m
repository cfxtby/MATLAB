function [CR,w]=AHP(A)
[n,n]=size(A);
RI=[0 0 0.58 0.90 1.12 1.24 1.32 1.41 1.45 1.49 1.52 1.54 1.56 1.58 1.59];
[v,d]=eig(A);
[m,y]=find(d==max(d(:)));
r=d(m,m);
CI=(r-n)/(n-1);
CR=CI/RI(n);
w=v(:,m)/sum(v(:,m));
w=w';
end 