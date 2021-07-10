clear; clear all; clc;

% Aidan Taff - 4/30/2021 - MECH103

% Arduino Setup %
button_arduino = arduino('/dev/tty.usbserial-D308G80T', 'uno');
while(1)
% Button Setup %
button_yellow = 'D10';            % LED on = 1
button_green = 'D9';             % LED off = 0
button_red = 'D8';
button_state_y = readDigitalPin(button_arduino, button_yellow);
button_state_g = readDigitalPin(button_arduino, button_green);
button_state_r = readDigitalPin(button_arduino, button_red);

%button_state = button_state_y + button_state_g + button_state_r;

% Speaker Fun Stuff % 
SPEAK_PIN = 'D12';
% playTone(sensyArduino,SPEAK_PIN,440,1);

% LED Setup %
LED_Y = 'D7';
LED_G = 'D6';
LED_R = 'D5';


                    % Yellow LED %
% 5 Blinks % 
if button_state_y == 1
    playTone(button_arduino, SPEAK_PIN, 262, .1); % Play C
    for i = 1:5
        writeDigitalPin(button_arduino, LED_Y, 1); %LED on
        pause(0.25)
        writeDigitalPin(button_arduino, LED_Y, 0); %LED off
        pause(0.25)
    end
        if button_state_y == 0
        writeDigitalPin(button_arduino, LED_Y, 0); 
        end
end
% If Button is held %         
if button_state_y == 1
    while(button_state_y == 1)
        writeDigitalPin(button_arduino, LED_Y, 1);
        button_state_y = readDigitalPin(button_arduino, button_yellow);
    end
end 
% Terimate LED %
if button_state_y == 0
    writeDigitalPin(button_arduino, LED_Y, 0); 
end  


                % Green LED %
% 5 Blinks % 
if button_state_g == 1
    playTone(button_arduino, SPEAK_PIN, 330, .1); % Play E
    for i = 1:5
        writeDigitalPin(button_arduino, LED_G, 1); %LED on
        pause(0.25)
        writeDigitalPin(button_arduino, LED_G, 0); %LED off
        pause(0.25)
    end
        if button_state_g == 0
        writeDigitalPin(button_arduino, LED_G, 0); 
        end
end
% If Button is held %         
if button_state_g == 1
    while(button_state_g == 1)
        writeDigitalPin(button_arduino, LED_G, 1);
        button_state_g = readDigitalPin(button_arduino, button_green);
    end
end 
% Terimate LED %
if button_state_g == 0
    writeDigitalPin(button_arduino, LED_G, 0); 
end 


                    % Red LED %
% 5 Blinks % 
if button_state_r == 1
    playTone(button_arduino, SPEAK_PIN, 392, .1); % Play G
    for i = 1:5
        writeDigitalPin(button_arduino, LED_R, 1); %LED on
        pause(0.25)
        writeDigitalPin(button_arduino, LED_R, 0); %LED off
        pause(0.25)
    end
        if button_state_r == 0
        writeDigitalPin(button_arduino, LED_R, 0); 
        end
end
% If Button is held %         
if button_state_r == 1
    while(button_state_r == 1)
        writeDigitalPin(button_arduino, LED_R, 1);
        button_state_r = readDigitalPin(button_arduino, button_red);
    end
end 
% Terimate LED %
if button_state_r == 0
    writeDigitalPin(button_arduino, LED_R, 0); 
end 
end