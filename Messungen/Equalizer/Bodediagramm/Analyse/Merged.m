% Numerator und Denominator der ersten Übertragungsfunktion
num1 = [1 2.107e04 1.441e07 0 0];
den1 = [1 1480 1.451e07 1.4e08 6.064e07];

% Numerator und Denominator der zweiten Übertragungsfunktion
num2 = [1 1471 1.441e07 0 0];
den2 = [1 2.108e04 1.453e07 1.4e08 6.064e07];

% Übertragungsfunktionen definieren
sys1 = tf(num1, den1);
sys2 = tf(num2, den2);

% Import data from text files
opts = delimitedTextImportOptions("NumVariables", 3);
opts.DataLines = [2, Inf];
opts.Delimiter = ",";
opts.VariableNames = ["FrequencyHz", "AmplitudedB", "Phasedeg"];
opts.VariableTypes = ["double", "double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
Data1 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\751212.csv", opts);
Data5 = readtable("Z:\Korschunov\Praxisphase\Messungen\Equalizer\Bodediagramm\Red Pitaya\551212.csv", opts);
clear opts

% Plotten der Amplitudengänge und Phasengänge
figure;

% Amplitudengang plotten
subplot(2,1,1);
semilogx(Data1.FrequencyHz, Data1.AmplitudedB, 'b', 'DisplayName', 'Messung 1');
hold on;
semilogx(Data5.FrequencyHz, Data5.AmplitudedB, 'r', 'DisplayName', 'Messung 5');

% Plot der Übertragungsfunktionen
[mag1,~,wout1] = bode(sys1);
[mag2,~,wout2] = bode(sys2);

% Umwandeln der Magnitude in dB und Frequenz in Hz
mag1_dB = 20*log10(squeeze(mag1));
mag2_dB = 20*log10(squeeze(mag2));
wout1_Hz = wout1 / (2 * pi);
wout2_Hz = wout2 / (2 * pi);

% Plotte Magnitude der Übertragungsfunktionen
semilogx(wout1_Hz, mag1_dB, 'b--', 'DisplayName', 'TF1');
semilogx(wout2_Hz, mag2_dB, 'r--', 'DisplayName', 'TF2');

xlabel('Frequenz [Hz]');
ylabel('Amplitude [dB]');
legend('show');
grid on;
xlim([min([Data1.FrequencyHz; Data5.FrequencyHz]), max([Data1.FrequencyHz; Data5.FrequencyHz])]);
ylim([min([Data1.AmplitudedB; Data5.AmplitudedB]), max([Data1.AmplitudedB; Data5.AmplitudedB])]);
hold off;

% Phasengang plotten
subplot(2,1,2);
semilogx(Data1.FrequencyHz, Data1.Phasedeg, 'b', 'DisplayName', 'Messung 1');
hold on;
semilogx(Data5.FrequencyHz, Data5.Phasedeg, 'r', 'DisplayName', 'Messung 5');

% Plot der Übertragungsfunktionen Phasengang
[~,phase1,~] = bode(sys1);
[~,phase2,~] = bode(sys2);

% Umwandeln der Phase in Grad und Frequenz in Hz
phase1_deg = squeeze(phase1);
phase2_deg = squeeze(phase2);
semilogx(wout1_Hz, phase1_deg, 'b--', 'DisplayName', 'TF1 Phase');
semilogx(wout2_Hz, phase2_deg, 'r--', 'DisplayName', 'TF2 Phase');

xlabel('Frequenz [Hz]');
ylabel('Phase [deg]');
legend('show');
grid on;
xlim([min([Data1.FrequencyHz; Data5.FrequencyHz]), max([Data1.FrequencyHz; Data5.FrequencyHz])]);
ylim([min([Data1.Phasedeg; Data5.Phasedeg]), max([Data1.Phasedeg; Data5.Phasedeg])]);
hold off;
