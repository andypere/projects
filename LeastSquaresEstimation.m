%  Least Squares Estimation Andy Perez
load('lsdata.mat')
figure
plot(x,y)
m=[0;0;20000;7000];
i=1;
ytilde=zeros(15,1);
while true==1
xo=m(1);
yo=m(2);
a=m(3);
b=m(4);
A=zeros(15,4);
ycalc=zeros(15,1);
for n=1:1:15
ycalc(n,1)=(((1-(((x(n)-xo)/(a))^2))*b^2)^.5)+yo;
dyda=(b*(x(n)-xo)^2)/((a^3*(1-((x(n)-xo)^2)/a^2)^.5));
dydb=(1-((x(n)-xo)^2)/a^2)^.5;
dyy0=1;
dyx0=(b*(x(n)-xo))/(a^2*((1-((x(n)-xo)^2)/(a^2))^.5));
A(n,1)=dyx0;
A(n,2)=dyy0;
A(n,3)=dyda;
A(n,4)=dydb;
end
if i>1
ytilde=ycha;
end
ycha=y'-ycalc;
if abs((sum(ycha.^2)-sum(ytilde.^2))/sum(ycha.^2))<10^-5
true=0;
elseif i==1000
true=0;
else
Atrans=A';
Ata=Atrans*A;
Atain=inv(Ata);
Ay=Atrans*ycha;
f=Atain*Ay;
m=m+(.9*f);
if sum(isnan(m))>0
true=0;
end
i=i+1;
end
2
end
ab=a-b;
ba=a+b;
G=6.67*10^-11;
me=5.972*10^24;
e=(1-(b^2/a^2))^.5 % eccentricity
L=a*(1-e^2)    %Semi latus rectum
T=2*pi*((a^3/(G*me))^.5)   % Time period
P=pi*ba*(((3*ab^2)/(((ba^2)*(((((-3*ab^2)/(ba^2))+4)^.5)+10))))+1)% Perimeter
