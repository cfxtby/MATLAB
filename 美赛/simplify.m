syms B L l a b c d lumta n a2 b2 c2

Q1=(n*a+n*b*lumta/B+c*n*lumta/B+d*l*(B-L)^2*(2*n-1)*n)*(2*n+1);
Q12=(n*a2+(n*2-1)*b2*lumta/B+c2*l*(B-L)^2*(2*n-1)*n)*(2*n+1);
Q2=n*(2*n+1);
Q3=symsum(Q12,n,1,B-L);
Q4=symsum(Q2,n,1,B-L);
Q=Q3/Q4;
a1=3.402;
b1=0.00456;
c1=0.0048;
d1=-0.01278;
a1=2.624;
b1=0.0053;
c1=-0.0183;
d1=-0.01278;

Q=subs(subs(subs(Q,a2,a1),b2,b1),c2,c1);
%Q=subs(subs(subs(subs(Q,a,a1),b,b1),c,c1),d,d1);