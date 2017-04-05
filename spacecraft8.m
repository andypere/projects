%Andy Perez Earth observing Properties
G=6.674*10^-11; %m^3/kgs^2
me=5.972*10^24; % kg
re=6.371*10^6;   % m
h=logspace(log10(200000),log10(36000000),20);
thetaew=39.6*pi/180;
alphans=27*pi/180;
syms theta
syms alpha
thetad=zeros(1,20);
alphad=zeros(1,20);

for n=1:18
alphad(1,n)=(vpasolve(re+h(n)-(re*sin(alpha))/(tan(alphans/2))==re*cos(alpha),alpha));
%thetad(1,n)=(vpasolve(re+h(n)-(re*sin(theta))/(tan(thetaew/2))==re*cos(theta),theta))
end
a=alphad;%alphad
h2=h(17:20);
a(17:20)=acos(re./(h2+re))
for n=1:16
thetad(1,n)=(vpasolve(re+h(n)-(re*sin(theta))/(tan(thetaew/2))==re*cos(theta),theta));
end
b=thetad;%thetad
b(17:20)=acos(re./(h2+re))
W=2*re*b
L=2*re*a
%2
%for m=1:20
   % alpham=asin(re/(h(m)+re))
   % perang=pi2-alpham
   % if W(m)==2*re*perang
        
   % else pixelw(m)=W/1920
%end
      %if  L=2*re*perang
          
      %end 

%x=(re^2-W.^2).^.5
x=((re+h)*tan(thetaew/2))-re;
pp=(pi*(re+x))/1920
arc=(2*pi*re)/4;
y=((re+h)*tan(alphans/2))-re;
ppy=(pi*(re+y))/1080
%3
ver=(2*pi*re)/(24*3600);
vs=((G*me)./(re+h)).^.5;
ewt=W./ver;
nst=L./vs;
tt=zeros(1,20);
for duh=1:20
    if tt(duh)<ewt(duh);
        tt(duh)=nst(duh); 
    else
        tt(duh)=ewt(duh);
    end
end
tt
%4 and 5
ot=(2*pi.*(re+h))./vs;
d=ver*ot;
lc=d*360/(2*pi*re)
%6
thet=W/(re);
dist=d/(re);
gap=zeros(1,20);
for pop=1:20
    if dist(pop)>thet(pop) && dist(pop)<(2*pi-thet(pop));
        gapang=dist(pop)-thet(pop);
        gap(pop)=2*pi*re*(gapang/(2*pi));
    else disp('no gap');
    end
end
gap





   

