clear; clc; 

% Aidan Taff - 4/1/2021 - MECH103

W_0 = 42; % weight of soda bottle in kilograms

            % Light Thresholds % 
% oneLight = 250 + W_0 < force <= 500 + W_0
% twoLight = 500 + W_0 < force <= 1000 + W_0
% threeLight = 1000 + W_0 , force <= 2000 + W_0
% fourLight = force > 2000

fsr_pin = 'A0'; % Force Sensor
led1 = 'D7';
led2 = 'D6';
led3 = 'D5';
led4 = 'D4'; 
            % Formula to find voltage out % 
%v_out = ((rM*v)/(rM + Rfsr))

v = 5; % 4.8?????? % Output of the Arduino
rM = 10000; % Resistor resistance 

            %Solve for Rfsr
% Rfsr = ((rM*v)/v_out)-rM

% Connect Arduino
forceArduino = arduino('/dev/tty.usbserial-D308G80T', 'uno');
    waitTime = 0.5; % time between readings
 while(1)
    fsrVoltage = readVoltage(forceArduino, 'A0'); % Read voltage from force sensor
 
    % Resistance % 
 fsrResistance = (((rM*v)/fsrVoltage)-rM);
fprintf("Resistance is %f\n", fsrResistance); %Display Resistance

    % Conductance %
 % G = 1/fsrR 
 G = 1/fsrResistance;
 fsrConductance = G;
 
 if fsrResistance <= 600
    force = (G - 7.5E-4)/3.2639E-7;
 else
     force = G/6.42857E-7;
 
     fprintf("The force is %f\n", force); %show force
     pause(waitTime)
 end
 
            % Turning Lights on %
if force <= 250
    fprintf('No Voltage Found')
  writeDigitalPin(forceArduino, 'D7', 0)
  writeDigitalPin(forceArduino, 'D6', 0)
  writeDigitalPin(forceArduino, 'D5', 0)
  writeDigitalPin(forceArduino, 'D4', 0)
  
elseif (250+W_0 < force) && (force <= 500+W_0)
      fprintf('The force is %f\n, force') % Show force #
    writeDigitalPin(forceArduino, 'D7', 1)
    writeDigitalPin(forceArduino, 'D6', 0)
    writeDigitalPin(forceArduino, 'D5', 0)
    writeDigitalPin(forceArduino, 'D4', 0)
    
elseif (500+W_0 < force) && (force <= 1000+W_0)
      fprintf('The force is %f\n, force') % Show force #
    writeDigitalPin(forceArduino, 'D7', 1)
    writeDigitalPin(forceArduino, 'D6', 1)
    writeDigitalPin(forceArduino, 'D5', 0)
    writeDigitalPin(forceArduino, 'D4', 0)
    
elseif (1000+W_0 < force) && (force <= 2000+W_0)
      fprintf('The force is %f\n, force') % Show force #
    writeDigitalPin(forceArduino, 'D7', 1)
    writeDigitalPin(forceArduino, 'D6', 1)
    writeDigitalPin(forceArduino, 'D5', 1)
    writeDigitalPin(forceArduino, 'D4', 0)
    
else force > (2000+W_0)
      fprintf('The force is %f\n, force') % Show force #
    writeDigitalPin(forceArduino, 'D7', 1)
    writeDigitalPin(forceArduino, 'D6', 1)
    writeDigitalPin(forceArduino, 'D5', 1)
    writeDigitalPin(forceArduino, 'D4', 1)
end
 end
 

            % Solving for Volume %
 %d = m/v
 d = 1000/2; % density of water @ 26.7
 m1 = 250;
 m2 = 500;
 m3 = 1000;
 m4 = 2000;
 
 V_1 = (m1+W_0)/d;
 V_2 = (m2+W_0)/d;
 V_3 = (m3+W_0)/d;
 V_4 = (m4+W_0)/d;
 
disp(V_1)
disp(V_2)
disp(V_3)
disp(V_4)