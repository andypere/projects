%Andy Perez Energy with respect to Altitude
G=6.674*10^-11; %m^3/kgs^2
mE=5.972*10^24 ;%kg
mM=7.346*10^22; %kg
rE=6.371*10^6; %m
rM=1.7375*10^6; %m
m=100 ;%kg
y=150*10^3:100:1000000*10^3;
%F=(m*G*mE)./(y.^2);
W2=(m*G*mE).*((1./y)-(1/rE));
%W=F.*y;
lny=log(y);
%figure
%plot(lny,-W)
figure
plot(lny,-W2)
title('Negative Work of Earth(J)')
xlabel('log altitude(m)')
ylabel('-Work(J)')
grid on
%2
W3=(m*G*mM).*((1./y)-(1/rM));
figure
plot(lny,-W3)
title('Negative Work of Moon(J)')
xlabel('log altitude(m)')
ylabel('-Work(J)')
grid on
%3
v=(G*mE./(y)).^.5;
Ke=.5*m.*v.^2;
figure
plot(lny,Ke)
title('Kinetic Energy of Earth(J)')
xlabel('log altitude(m)')
ylabel('Kinetic Energy(J)')
grid on
%4
four=Ke-W2;
figure
plot(lny,four)
title('Negative Work+Kinetic Energy of Earth(J)')
xlabel('log altitude(m)')
ylabel('(J)')
grid on
