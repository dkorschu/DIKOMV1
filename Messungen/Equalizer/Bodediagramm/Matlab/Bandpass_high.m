close all;

% 1. Übertragungsfunktion definieren
numerator1 = [1.992e04, -4.53e-09];  % Zähler der Übertragungsfunktion
denominator1 = [1, 4.268e04, 5.653e07];  % Nenner der Übertragungsfunktion

% Übertragungsfunktion erstellen
sys1 = tf(numerator1, denominator1);

% 2. Frequenzbereich festlegen
f = logspace(1, 6, 1000);  % Frequenzbereich von 10 Hz bis 10^6 Hz
w = 2*pi*f;  % Umrechnung von Frequenz (Hz) in Kreisfrequenz (rad/s)

% 3. Bode-Plot erstellen
[mag1, phase1, wout1] = bode(sys1, w);  % Amplituden- und Phasengang berechnen
mag1 = squeeze(mag1);  % Extrahieren der Magnitude-Daten
phase1 = squeeze(phase1);  % Extrahieren der Phasen-Daten

% 4. Resonanzfrequenz und 3dB-Grenzfrequenz ermitteln und markieren
[magnitude_dB1, freq_3db_index1] = min(abs(20*log10(mag1) - max(20*log10(mag1)) + 3));
freq_3db1 = f(freq_3db_index1);
[~, resonance_index1] = max(20*log10(mag1));
resonance_freq1 = f(resonance_index1);

% Zweiter Plot: Zweite Übertragungsfunktion

% 1. Übertragungsfunktion definieren
numerator2 = [3.128e05, 0];  % Zähler der Übertragungsfunktion
denominator2 = [1, 6.702e05, 1.394e10];  % Nenner der Übertragungsfunktion

% Übertragungsfunktion erstellen
sys2 = tf(numerator2, denominator2);

% 2. Bode-Plot erstellen
[mag2, phase2, wout2] = bode(sys2, w);  % Amplituden- und Phasengang berechnen
mag2 = squeeze(mag2);  % Extrahieren der Magnitude-Daten
phase2 = squeeze(phase2);  % Extrahieren der Phasen-Daten

% 3. Resonanzfrequenz ermitteln
[~, resonance_index2] = max(20*log10(mag2));
resonance_freq2 = f(resonance_index2);

% 4. 3dB-Grenzfrequenz auf der abfallenden Seite ermitteln
mag_max2 = max(20*log10(mag2));
falling_side_index2 = find(f > resonance_freq2);  % Indizes auf der abfallenden Seite
diff_from_3db2 = abs(20*log10(mag2(falling_side_index2)) - (mag_max2 - 3));
[~, min_index2] = min(diff_from_3db2);
freq_3db2 = f(falling_side_index2(min_index2));

% Gesamter Plot: Überlagerung der Amplituden- und Phasengänge

figure;

% Amplitudengang (Magnitude) plotten
subplot(2,1,1);
semilogx(f, 20*log10(mag1), 'b-', 'DisplayName', 'Übertragungsfunktion 1');  % Erste Übertragungsfunktion
hold on;
semilogx(f, 20*log10(mag2), 'r-', 'DisplayName', 'Übertragungsfunktion 2');  % Zweite Übertragungsfunktion

% Markierungen hinzufügen
h1 = plot(freq_3db1, 20*log10(mag1(freq_3db_index1)), 'bx', 'DisplayName', sprintf('3dB Frequenz 1: %.2f Hz', freq_3db1));
h2 = plot(resonance_freq1, 20*log10(mag1(resonance_index1)), 'bo', 'DisplayName', sprintf('Resonanzfrequenz 1: %.2f Hz', resonance_freq1));
h3 = plot(freq_3db2, 20*log10(mag2(falling_side_index2(min_index2))), 'rx', 'DisplayName', sprintf('3dB Frequenz 2: %.2f Hz', freq_3db2));
h4 = plot(resonance_freq2, 20*log10(mag2(resonance_index2)), 'ro', 'DisplayName', sprintf('Resonanzfrequenz 2: %.2f Hz', resonance_freq2));

grid on;
xlabel('Frequenz (Hz)');
ylabel('Amplitude (dB)');
legend([h1 h2 h3 h4]);

% Phasengang plotten
subplot(2,1,2);
semilogx(f, phase1);
hold on;
semilogx(f, phase2);
grid on;
xlabel('Frequenz (Hz)');
ylabel('Phase (Grad)');

