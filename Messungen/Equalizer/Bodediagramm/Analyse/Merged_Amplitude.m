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

% Plotten des Amplitudengangs
figure;
semilogx(Data1.FrequencyHz, Data1.AmplitudedB, 'b'); % Kurve der Messung 1
hold on;
semilogx(Data5.FrequencyHz, Data5.AmplitudedB, 'r'); % Kurve der Messung 5

% Plot der Übertragungsfunktionen
[mag1,~,wout1] = bode(sys1);
[mag2,~,wout2] = bode(sys2);

% Umwandeln der Magnitude in dB und Frequenz in Hz
mag1_dB = 20*log10(squeeze(mag1));
mag2_dB = 20*log10(squeeze(mag2));
wout1_Hz = wout1 / (2 * pi);
wout2_Hz = wout2 / (2 * pi);

% Plotte Magnitude der Übertragungsfunktionen
semilogx(wout1_Hz, mag1_dB, 'b--'); % Kurve TF1
semilogx(wout2_Hz, mag2_dB, 'r--'); % Kurve TF2

% Markiere den speziellen Punkt bei Messung 5
x_point = 600.1;
y_point = 21.59;
semilogx(x_point, y_point, 'rx', 'MarkerSize', 8, 'LineWidth', 1.5);

% Bestimme und zeichne die Maxima für TF1
[maxMagTF1, idxMaxTF1] = max(mag1_dB);
maxFreqTF1 = wout1_Hz(idxMaxTF1);
semilogx(maxFreqTF1, maxMagTF1, 'bx', 'MarkerSize', 8, 'LineWidth', 1.5);

% Legende nur für die Punkte
% Erstellen von leeren Linien für die Kurven, um sie in der Legende auszuschließen
h1 = semilogx(NaN, NaN, 'rx', 'MarkerSize', 8, 'LineWidth', 1.5); % Punkt bei x = 600.1
h2 = semilogx(NaN, NaN, 'bx', 'MarkerSize', 8, 'LineWidth', 1.5); % Max TF1

% Legende nur für die Punkte
legend([h1, h2], {'Punkt bei x = 600.1', 'Max TF1'}, 'Location', 'best');

xlabel('Frequenz [Hz]');
ylabel('Amplitude [dB]');
grid on;
xlim([min([Data1.FrequencyHz; Data5.FrequencyHz]), max([Data1.FrequencyHz; Data5.FrequencyHz])]);
ylim([min([Data1.AmplitudedB; Data5.AmplitudedB]), max([Data1.AmplitudedB; Data5.AmplitudedB])]);
hold off;
