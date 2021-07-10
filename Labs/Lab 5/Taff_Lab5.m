%Aidan Taff 3/3/2021
clear; clc;
fprintf(2,'Probelm 1')
% x_t = x_0*(1+r)^t
% # of rice per sqaure = x_t, 
%x_t = #rice | # of t square

%Compund Interest = PV*(1+r)^n
%       Rice @ 64 = x_0*(1+r)^t


x_0 = 1;
r = 1; 
%Change t = 32
t = 64;

x_t = x_0*(1+r)^(t-1)

%the king made a mistake that's a lot of rice
%9,000,000,000,000,000,000 grains of rice

%this is not the answer for the total number of grains on the board 
%because you have to account for all of the previous squares

%%%---NEXT
fprintf(2,'Problem 2')

%Aidan Taff 3/4/2021
clear;

d_w = 1; %Density, g/cm^3
C_s = 12; %Circumference, in
M_s = 190; %Mass, g
C_r = 8; %Circumference, in
M_r = 160; %Mass, g
C_t = 8; %Circumference, in
M_t = 60; %Mass, g


circumference = C_r %inches

% radius of rubberball, Circumference (in) -> Radius (cm)
%C = 2*pi*r, r = C/(2*pi) | 1 in = 2.54 cm
radius = ((C_r)*2.54)/(2*pi)

%volume = 4/3*pi*r^3
volume = (4/3)*pi*(radius)^3

mass = M_r

%density = m/v (g/cm^3)
density = mass/volume 

%Specific Gravity = density object/density water
specificGravity = density/d_w

%WILL sink, specific gravity > 1

%%%---NEXT
fprintf(2,'Problem 3')

%Aidan Taff 3/4/2021
clear;

%Q_c net rate of radiant exchange
A_sun = 6.09E12*1000000; %surface area, km^2 * (1000m/1km)^2 = 1,000,000 m^2
T_sun = 5778; %Temperature, K
T_dyson = 263.15; %Temperature, K
E = 0.95; %Efficiency of Sun's radiation 
o = 5.67E-8; %Stefan-Boltzmann constant, W/(m^2-K^4)

Q_c = E*o*A_sun*(T_sun^4-T_dyson^4);

%Yotta SI prefix = E24
%FoCo = 11 cents/kWh
%# of seconds = 1 Yotta =1E24

netEnergyTransfer = Q_c %in seconds, Dyson energy/second

%sec * 3600 = 1 hour * 24 hour = 1 day
%sec -> day, # * 86400 = J/day
energyPerDay = Q_c * 86400

%#Seconds to make 1 Yotta*dollar
%%% FoCo -> 11 cents/kWh
kWh = 3.6*10^6; %in J/s
cps = 11/kWh; %cent/second

cps_d = Q_c * cps; %cent/second of the dysonsphere
%cent -> dollar, 0.01 -> 1 | 1*10^-2 cent = 1 dollar
dps = cps_d * 1*10^-2; %dollars/min

%dollar -> yotta | 1*10^24 dollars -> 1 yotta
yotta = 1*10^24; %yotta = 1*10^24 dollars
yps = dps / yotta; %yottas/sec

%Currently in yottas/ 1 sec; we want how many seconds for 1 yotta
secondsToYottaDolla = (yps)^-1



