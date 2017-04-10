%MAE 425 HW 9
%1
re=6371*1000; % m
R1=re+300000;   % m
R2=42186*1000;%m
R3=20180*1000; %m
mu=398600.64*10^9;   %m^3/s^2 
v1=(mu/R1)^.5;    %m/s
ar=R1/re;
deltav11=v1*((2*ar/(1+ar))^.5-1); %m/s
va=v1*((2/(1+ar))^.5);
deltavone=(va^2+v1^2-(2*va*v1*cos(28.6*pi/180)))^.5;
deltav1all=deltavone+deltav11
%2
R=R2/R1;
deltav1=v1*((2*R/(1+R))^.5-1); % m/s
v2=(mu/R2)^.5;         %m/s
vb=v2*((2/(1+R))^.5); %m/s
deltav2=(vb^2+v2^2-(2*vb*v2*cos(28.6*pi/180)))^.5;
deltav2all=deltav1+deltav2 %m/s 
v2inc=v1*(1/(R^.5)-((2/(R+R^2))^.5));
vdueinc2=deltav2all-v2inc-deltav1 %m/s
%3
Rr=R3/R1;
deltav1r=v1*((2*Rr/(1+Rr))^.5-1); % m/s
v3=(mu/R3)^.5;         %m/s
vc=v3*((2/(1+Rr))^.5); %m/s
deltav3=(vc^2+v3^2-(2*vc*v3*cos(28.6*pi/180)))^.5;
deltav3all=deltav1r+deltav3 %m/s 
v3inc=v1*(1/(Rr^.5)-((2/(Rr+Rr^2))^.5));
vdueinc3=deltav3all-v3inc-deltav1r %m/s

%4
g=9.81; % m/s^2
Isp=300;  % s
onem=-100/(-exp((-deltav1all/(g*Isp)))) %kg
twom=-100/(-exp((-deltav2all/(g*Isp)))) 
threem=-100/(-exp((-deltav3all/(g*Isp)))) 

