clear; clc;
% Aidan Taff - 3/25/2021 - MECH103

        % Import data %
[date_times, voltages] = getVoltages; 

% Array containing date-time info
date_times = date_times(1:end)

% Array containing voltages info
voltages = voltages(1:end);

% Array containing temp in celsius 
    % Convert Voltages to Celsius
tempsC = ((voltages*1000)-500)/10

% Array containing temp in fahrenheit 
    % Convert Celsius to Fahrenheit
tempsF = (tempsC * (9/5))+32

plot(date_times, tempsF,'r')
title('Change in Temperature over Time')
xlabel('Time (hours)')
ylabel('Temperature (Fahrenheit)')
grid on


%%% Problem 2
fprintf(2,'Problem 2')


clear; clc;
% Aidan Taff - 3/25/2021 - MECH103

        % Import data %
miamiTemperatures = getMiamiTemperatures();
    % Need data from getVoltages
[date_times, voltages] = getVoltages;
    % Need data from getFairbanks
fairbanksTemperatures = getFairbanksTemperatures()

% Dates from getVoltages
date_times = date_times(1:end)

        % Temps from getVoltages
voltages = voltages(1:end);

% Array containing temp in celsius 
    % Convert Voltages to Celsius
tempsC = ((voltages*1000)-500)/10;

% Array containing temp in fahrenheit 
    % Convert Celsius to Fahrenheit
tempsF = (tempsC * (9/5))+32

    %%% DONT NEED to find freezing point %%%
%afreezing = find(tempsF==32)
%bfreezing = find(fairbanksTemperatures==32)
%cfreezing = find(miamiTemperatures==32)

freezing = linspace(32,32,72);

            % Graphing %
plot(date_times, tempsF, date_times, fairbanksTemperatures, 'r', date_times, miamiTemperatures, 'm', date_times, freezing);
title('Change in Temperature vs Time')
xlabel('Time (Hours)')
ylabel('Temperature (Fahrenheit)')
grid on
hold on


%%% Problem 3
fprintf(2,'Problem 3')


clear; clc;
% Aidan Taff - 3/25/2021 - MECH103

% Sources %
[date_times, voltages] = getVoltages;
miamiTemperatures = getMiamiTemperatures()
fairbanksTemperatures = getFairbanksTemperatures()

% Fort Collins Temperatures %
date_times = date_times(1:end)
voltages = voltages(1:end);
tempsC = ((voltages*1000)-500)/10;
tempsF = (tempsC * (9/5))+32

% Finding Minimum Temperatures at Each City %
minFoCo = min(tempsF);
minMiami = min(miamiTemperatures);
minFairbanks = min(fairbanksTemperatures);

minTemps = [minFairbanks minFoCo minMiami]

% Finding Maximum Temperatures at Each City %
maxFoCo = max(tempsF);
maxMiami = max(miamiTemperatures);
maxFairbanks = max(fairbanksTemperatures);

maxTemps = [maxFairbanks maxFoCo maxMiami] 

% Matrix of Temps %
matrixTemps = [maxTemps, minTemps];

% Info %
fairbanks = [maxFairbanks; minFairbanks];
fortCollins = [maxFoCo; minFoCo];
miami = [maxMiami; minMiami];

% Finding Standard Deviation %
stdFairbanks = std(fairbanks);
stdFoCo = std(fortCollins);
stdMiami = std(miami);

% In Matrix Form %
stdTemps = [stdFairbanks, stdFoCo, stdMiami]

% Plotting %
subplot(1,3,1)
x = linspace(0,1,1);
plot(x, stdFairbanks(1), 'db')
title('Fairbanks STD Temperature')
ylabel('STD Temperature (Fahrenheit)')
xlabel('Point')
grid on 

subplot(1,3,2)
plot(x, stdFoCo, 'dr');
title('Fort Collins STD Temperature')
ylabel('STD Temperature (Fahrenheit)')
xlabel('Point')
grid on

subplot(1,3,3)
plot(x, stdMiami, 'dm')
title('Miami STD Temperature')
ylabel('STD Temperature (Fahrenheit)')
xlabel('Point')
grid on