clear; close all; clc;

% Aidan Taff - 4/19/2021 - MECH103

% Pin definition % 
g1 = 'D9';
g2 = 'D8';
y1 = 'D7';
r1 = 'D3';
r2 = 'D2';
trig_pin = 'D12';
echo_pin = 'D13';

% Setup Arduino %
brakeArduino = arduino('/dev/tty.usbserial-D308G80T','Uno','libraries','ultrasonic');

% Setup Ultrasonic Sensor %
ultraSensor = ultrasonic(brakeArduino,trig_pin,echo_pin);

while(1)
    distance = readDistance(ultraSensor)
    
if (distance > 2) % 2 Green %
  writeDigitalPin(brakeArduino, g1, 1)
  writeDigitalPin(brakeArduino, g2, 1)
  writeDigitalPin(brakeArduino, y1, 0)
  writeDigitalPin(brakeArduino, r1, 0)
  writeDigitalPin(brakeArduino, r2, 0)


% doesnt work??? %
elseif (1.25 < distance) && (distance <= 2)
  writeDigitalPin(brakeArduino, g1, 0) % 1 Green %
  writeDigitalPin(brakeArduino, g2, 1)
  writeDigitalPin(brakeArduino, y1, 0)
  writeDigitalPin(brakeArduino, r1, 0)
  writeDigitalPin(brakeArduino, r2, 0)


elseif (1 < distance) && (1.25 <= distance)
  writeDigitalPin(brakeArduino, g1, 0) % 1 Green and Yellow %
  writeDigitalPin(brakeArduino, g2, 1)
  writeDigitalPin(brakeArduino, y1, 1)
  writeDigitalPin(brakeArduino, r1, 0)
  writeDigitalPin(brakeArduino, r2, 0)

      
elseif (0.75 < distance) && (distance <= 1) % 1 Red and Yellow %
        writeDigitalPin(brakeArduino, g1, 0)
        writeDigitalPin(brakeArduino, g2, 0)
        writeDigitalPin(brakeArduino, y1, 1)
        writeDigitalPin(brakeArduino, r1, 1)
        writeDigitalPin(brakeArduino, r2, 0)


else (0 <= distance) && (distance <= 0.75) % 2 Red %
      writeDigitalPin(brakeArduino, g1, 0)
      writeDigitalPin(brakeArduino, g2, 0)
      writeDigitalPin(brakeArduino, y1, 0)
      writeDigitalPin(brakeArduino, r1, 1)
      writeDigitalPin(brakeArduino, r2, 1) 
end
end
D_1 = 2;
D_2 = 1.25;
D_3 = 1;
D_4 = 0.75;