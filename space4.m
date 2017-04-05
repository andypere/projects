%MAE 425 Two body problems
G=6.674*10^-11; %m^3/(kgs^2)
me=5.972*10^24; %kg
Ms=1.989*10^30; % kg
Mm=7.346*10^22; %kg
Masses=[me Ms Mm]
dse=1609.34*92.96*10^6; % meters
Dem=378000*1000 ; % meters
r_earth=6.371*10^6 ; %m
r_moon=1.7357*10^6 ; %m
r=[r_earth dse*1609.34 Dem*1000] %meters
rs=[dse dse-400000 dse-35786000 dse-Dem]
re=[r_earth r_earth+400000 r_earth+35786000 Dem-r_moon]
rm=[Dem Dem-400000 Dem-35786000]
rmreal=[Dem Dem-400000 Dem-35786000 r_moon]
%1a,b,c,d gravitational accelerations
gs=(Ms*G)./(rs.^2)%m/s^2
ge=(me*G)./(re.^2)%m/s^2
gm=(Mm*G)./(rm.^2)%m/s^2
gmlast=(Mm*G)./(r_moon.^2)%m/s^2
gmreal=(Mm*G)./(rmreal.^2)%m/s^2
fourth=gs./ge
fifth=gmreal./ge
gmge1=gm(1)/ge(1)
gmge2=gm(2)/ge(2)
gmge3=gm(3)/ge(3)
%2 Moment
rbuff=dse-(4000*1609.34*cos(.748746)*cos(.41));
rnp=dse-(4000*1609.34*cos(.41));
Msbuffalo=(Ms*68*G)/(rbuff)%N*m
Msnp=(Ms*68*G)/(rnp)%N*m
%3 Fluctuation of Weight at equinox
rnoon=dse-(4000*1609)
gnoon=(Ms*G)/(rnoon^2) %pull
rmid=dse+(4000*cos(pi))
gmid=(Ms*G)/(rmid^2) %push
weightnoon=50*(9.81+gnoon) % N
weightmid=50*(9.81-gnoon) % N
%4  location where suns gravitational acceleration equals Earths
a=1-(me/Ms);
b=-2*dse;
c=(dse^2);
rsd=(-b+(((b^2)-(4*a*c))^.5))/(2*a)
rsd2=(-b-(((b^2)-(4*a*c))^.5))/(2*a)
red=dse-rsd
1
red2=dse-rsd2
gs4=(Ms*G)/(rsd2^2)%m/s^2
ge4=(me*G)/(red2^2)%m/s^2
%5  location where objects angular velocity equals Earths angular velocity
%around the sun
wes=2*10^-7 ;% rad/s
rwes=((G*Ms)/((4*pi^2)*wes^2))^(1/3)%m
%6 location where moons gravitational acceleration equals Earths
a6=(1-(Mm/me));
b6=-2*Dem;
c6=Dem^2;
redm=(-b6+(((b6^2)-(4*a6*c6))^.5))/(2*a6)
redm2=(-b6-(((b6^2)-(4*a6*c6))^.5))/(2*a6)
rmde=Dem-redm;
rmde2=Dem-redm2
gm6=(Mm*G)/(rmde2^2)%m/s^2
ge6=(me*G)/(redm2^2)%m/s^2
%7 location where objects angular velocity equals Moons angular velocity
%around the Earth
wem=2.7*10^-6;
rwem=((G*me)/((4*pi^2)*wem^2))^(1/3)%m