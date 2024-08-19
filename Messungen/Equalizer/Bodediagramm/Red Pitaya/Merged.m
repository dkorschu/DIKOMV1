% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 3);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["FrequencyHz", "AmplitudedB", "Phasedeg"];
opts.VariableTypes = ["double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import data for all four datasets

% Dataset 1
Data1_1 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\771212.csv", opts);
Data1_2 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\971212.csv", opts);
Data1_3 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\1271212.csv", opts);
Data1_4 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\371212.csv", opts);
Data1_5 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\571212.csv", opts);

% Dataset 2
Data2_1 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\751212.csv", opts);
Data2_2 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\951212.csv", opts);
Data2_3 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\1251212.csv", opts);
Data2_4 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\351212.csv", opts);
Data2_5 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\551212.csv", opts);

% Dataset 3
Data3_1 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\121275.csv", opts);
Data3_2 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\121295.csv", opts);
Data3_3 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\1212125.csv", opts);
Data3_4 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\121235.csv", opts);
Data3_5 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\121255.csv", opts);

% Dataset 4
Data4_1 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\121277.csv", opts);
Data4_2 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\121297.csv", opts);
Data4_3 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\1212127.csv", opts);
Data4_4 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\121237.csv", opts);
Data4_5 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\121257.csv", opts);

% Clear temporary variables
clear opts

% Plot data for all four datasets
figure;

% Dataset 1: Plot Amplitudengang
subplot(4, 2, 1);
semilogx(Data1_1.FrequencyHz, Data1_1.AmplitudedB);
hold on;
semilogx(Data1_2.FrequencyHz, Data1_2.AmplitudedB);
semilogx(Data1_3.FrequencyHz, Data1_3.AmplitudedB);
semilogx(Data1_4.FrequencyHz, Data1_4.AmplitudedB);
semilogx(Data1_5.FrequencyHz, Data1_5.AmplitudedB);
xlabel('Frequenz [Hz]');
ylabel('Amplitude [dB]');
title('Dataset 1: Amplitudengang');
grid on;
hold off;

% Dataset 1: Plot Phasengang
subplot(4, 2, 2);
semilogx(Data1_1.FrequencyHz, Data1_1.Phasedeg);
hold on;
semilogx(Data1_2.FrequencyHz, Data1_2.Phasedeg);
semilogx(Data1_3.FrequencyHz, Data1_3.Phasedeg);
semilogx(Data1_4.FrequencyHz, Data1_4.Phasedeg);
semilogx(Data1_5.FrequencyHz, Data1_5.Phasedeg);
xlabel('Frequenz [Hz]');
ylabel('Phase [deg]');
title('Dataset 1: Phasengang');
grid on;
hold off;

% Dataset 2: Plot Amplitudengang
subplot(4, 2, 3);
semilogx(Data2_1.FrequencyHz, Data2_1.AmplitudedB);
hold on;
semilogx(Data2_2.FrequencyHz, Data2_2.AmplitudedB);
semilogx(Data2_3.FrequencyHz, Data2_3.AmplitudedB);
semilogx(Data2_4.FrequencyHz, Data2_4.AmplitudedB);
semilogx(Data2_5.FrequencyHz, Data2_5.AmplitudedB);
xlabel('Frequenz [Hz]');
ylabel('Amplitude [dB]');
title('Dataset 2: Amplitudengang');
grid on;
hold off;

% Dataset 2: Plot Phasengang
subplot(4, 2, 4);
semilogx(Data2_1.FrequencyHz, Data2_1.Phasedeg);
hold on;
semilogx(Data2_2.FrequencyHz, Data2_2.Phasedeg);
semilogx(Data2_3.FrequencyHz, Data2_3.Phasedeg);
semilogx(Data2_4.FrequencyHz, Data2_4.Phasedeg);
semilogx(Data2_5.FrequencyHz, Data2_5.Phasedeg);
xlabel('Frequenz [Hz]');
ylabel('Phase [deg]');
title('Dataset 2: Phasengang');
grid on;
hold off;

% Dataset 3: Plot Amplitudengang
subplot(4, 2, 5);
semilogx(Data3_1.FrequencyHz, Data3_1.AmplitudedB);
hold on;
semilogx(Data3_2.FrequencyHz, Data3_2.AmplitudedB);
semilogx(Data3_3.FrequencyHz, Data3_3.AmplitudedB);
semilogx(Data3_4.FrequencyHz, Data3_4.AmplitudedB);
semilogx(Data3_5.FrequencyHz, Data3_5.AmplitudedB);
xlabel('Frequenz [Hz]');
ylabel('Amplitude [dB]');
title('Dataset 3: Amplitudengang');
grid on;
hold off;

% Dataset 3: Plot Phasengang
subplot(4, 2, 6);
semilogx(Data3_1.FrequencyHz, Data3_1.Phasedeg);
hold on;
semilogx(Data3_2.FrequencyHz, Data3_2.Phasedeg);
semilogx(Data3_3.FrequencyHz, Data3_3.Phasedeg);
semilogx(Data3_4.FrequencyHz, Data3_4.Phasedeg);
semilogx(Data3_5.FrequencyHz, Data3_5.Phasedeg);
xlabel('Frequenz [Hz]');
ylabel('Phase [deg]');
title('Dataset 3: Phasengang');
grid on;
hold off;

% Dataset 4: Plot Amplitudengang
subplot(4, 2, 7);
semilogx(Data4_1.FrequencyHz, Data4_1.AmplitudedB);
hold on;
semilogx(Data4_2.FrequencyHz, Data4_2.AmplitudedB);
semilogx(Data4_3.FrequencyHz, Data4_3.AmplitudedB);
semilogx(Data4_4.FrequencyHz, Data4_4.AmplitudedB);
semilogx(Data4_5.FrequencyHz, Data4_5.AmplitudedB);
xlabel('Frequenz [Hz]');
ylabel('Amplitude [dB]');
title('Dataset 4: Amplitudengang');
grid on;
hold off;

% Dataset 4: Plot Phasengang
subplot(4, 2, 8);
semilogx(Data4_1.FrequencyHz, Data4_1.Phasedeg);
hold on;
semilogx(Data4_2.FrequencyHz, Data4_2.Phasedeg);
semilogx(Data4_3.FrequencyHz, Data4_3.Phasedeg);
semilogx(Data4_4.FrequencyHz, Data4_4.Phasedeg);
semilogx(Data4_5.FrequencyHz, Data4_5.Phasedeg);
xlabel('Frequenz [Hz]');
ylabel('Phase [deg]');
title('Dataset 4: Phasengang');
grid on;
hold off;
