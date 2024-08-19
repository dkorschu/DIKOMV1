close all;
clear all;

% Import data from text file
% Script for importing data from the following text file:
%
%    filename: Z:\Korschunov\Praxisphase\Messungen\Equalizer\SNR\RedPitayaRauschen.csv
%
% Auto-generated by MATLAB on 17-Jul-2024 11:04:10

% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["FrequencykHz", "IN2"];
opts.VariableTypes = ["double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
Data = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\SNR\RedPitayaRauschen.csv", opts);


% Clear temporary variables
clear opts


% Plotte FFT in db also +30
figure; 
p = plot(Data.FrequencykHz, Data.IN2+30);

xlabel('Frequenz [kHz]');
ylabel('Amplitude [dB]');
grid on;

xlim([min(Data.FrequencykHz), max(Data.FrequencykHz)]);
ylim([min(Data.IN2+30), 0]);


