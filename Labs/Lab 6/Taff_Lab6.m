clear; clc;
%  Aidan Taff - March 18, 2021 - MECH103

fprintf(2,'Problem 1')

% Fix this! %
%H = [1 0 0 1 1 0 1]
%E = [0]
%L = [1 0 1 1 0 1 0 1 ]
%P = [1 0 0 0 0 1 1 1 0]

    % Given %
% Lines = 1 1 = 2 units
% Dots = 1 = 1 unit
% Letter Spacing = 1 unit 
% Word Spacing = 2 units
% Each word gets its own array

 
 %Correct Format of morse code
 %%% H = . . . .
 %%% E = .
 %%% L = . - . . 
 %%% P = . - - .

H = [1 0 1 0 1 0 1 0];
E = [1 0];
L = [1 0 1 1 0 1 0 1 0];
P = [1 0 1 1 0 1 1 0 1 0];
 
message = [H, E, L, P]

%%%---NEXT
fprintf(2,'Problem 2')

clear; clc; 
% Aidan Taff - March 18, 2021 - MECH103

cBeam = 1.2; % total length of beam
x = 0; % wall and beam meet
dx = cBeam/6; % length of each individual box

%%% Start at the first dot because the boxes are 0.2 in length and the dots
%%% are in the center of the square 0.1 being half of 0.2

sixCellLocations = linspace(0.1,1.1,6)

dx600 = cBeam/600

sixHundredCellLocations = [0.02:0.02:1.18]

%%%---NEXT
fprintf(2,'Problem 3')



% Aidan Taff - March 18, 2021 - MECH103

            % Recieve data % 
%%% Includes Variables: head and data %%%
[head,data] = getSteamTable();
 
% Row 83 <= 
hotProperties = data(83:end)

% Rows 13-24 and Columns 1,2,3,5,7,10

warmLiquid = data(13:24,[1 2 3 5 7 10])

% Rows 1-5, column for pressure and temperature (1,2)

x = data(1:5,1:2)

y = rot90(x,1);

transposedProperties = flip(y)


