L=3;
B=7;
l=100/1000;
lumta=200;
Q1=((1701*B)/100 + (117*lumta)/2500 + (117*B*lumta)/3125 - (117*L*lumta)/3125 + (1917*B^3*l)/50000 - (1917*B^4*l)/25000 - (1917*B^5*l)/25000 + (1701*B^2)/125 - (1701*B*L)/125 - (5751*B^2*L^2*l)/25000 + (1917*B^2*L^3*l)/6250 - (5751*B^3*L^2*l)/12500 + (1917*B*L^2*l)/50000 - (1917*B^2*L*l)/25000 + (1917*B*L^3*l)/25000 + (5751*B^3*L*l)/25000 - (1917*B*L^4*l)/25000 + (1917*B^4*L*l)/6250)/(B*(4*B - 4*L + 5));
Q2=(6*((53*lumta)/(10000*B) - ((B - L + 1)*((159*lumta)/5000 - (53*B*lumta)/2500 + (53*L*lumta)/2500 - (1312*B*L^2)/125 + (2624*B^2*L)/125 - (549*B^4*l)/10000 + (549*B^5*l)/5000 + (549*B^6*l)/5000 - (53*B^2*lumta)/1250 - (53*L^2*lumta)/1250 - (328*B^2)/25 - (1312*B^3)/125 + (328*B*L)/25 - (1647*B^2*L^2*l)/10000 - (549*B^2*L^3*l)/1250 + (1647*B^3*L^2*l)/2500 + (549*B^2*L^4*l)/1000 - (549*B^3*L^3*l)/500 + (549*B^4*L^2*l)/500 + (53*B*L*lumta)/625 + (549*B*L^3*l)/10000 + (1647*B^3*L*l)/10000 + (549*B*L^4*l)/5000 - (549*B^4*L*l)/1250 - (549*B*L^5*l)/5000 - (549*B^5*L*l)/1000))/(6*B)))/((B - L)*(B - L + 1)*(4*B - 4*L + 5));
disp(Q1);
disp(Q2);