% 1. Übertragungsfunktion definieren
numerator = [3.128e05, 0];  % Zähler der Übertragungsfunktion
denominator = [1, 6.702e05, 1.394e10];  % Nenner der Übertragungsfunktion

% Übertragungsfunktion erstellen
sys = tf(numerator, denominator);

% 2. Frequenzbereich festlegen
f = logspace(1, 6, 1000);  % Frequenzbereich von 10 Hz bis 10^6 Hz
w = 2*pi*f;  % Umrechnung von Frequenz (Hz) in Kreisfrequenz (rad/s)

% 3. Bode-Plot erstellen
[mag, phase, wout] = bode(sys, w);  % Amplituden- und Phasengang berechnen
mag = squeeze(mag);  % Extrahieren der Magnitude-Daten
phase = squeeze(phase);  % Extrahieren der Phasen-Daten

figure;
subplot(2,1,1);
semilogx(f, 20*log10(mag));  % Amplitudengang in dB
grid on;
title('Amplitudengang');
xlabel('Frequenz (Hz)');
ylabel('Magnitude (dB)');
hold on;

% 4. Resonanzfrequenz ermitteln und markieren
[~, resonance_index] = max(20*log10(mag));
resonance_freq = f(resonance_index);

h2 = plot(resonance_freq, 20*log10(mag(resonance_index)), 'gx', 'MarkerSize', 8, 'LineWidth', 2, 'DisplayName', sprintf('Resonanzfrequenz: %.2f Hz', resonance_freq));

% 5. 3dB-Grenzfrequenz auf der abfallenden Seite ermitteln und markieren
% Suche nach dem Punkt, der 3dB unterhalb des Maximums auf der abfallenden Seite liegt
mag_max = max(20*log10(mag));
falling_side_index = find(f > resonance_freq);  % Indizes auf der abfallenden Seite
diff_from_3db = abs(20*log10(mag(falling_side_index)) - (mag_max - 3));
[~, min_index] = min(diff_from_3db);
freq_3db = f(falling_side_index(min_index));

h1 = plot(freq_3db, 20*log10(mag(falling_side_index(min_index))), 'rx', 'MarkerSize', 8, 'LineWidth', 2, 'DisplayName', sprintf('3dB Frequenz: %.2f Hz', freq_3db));

% Legende hinzufügen
legend([h1 h2]);

subplot(2,1,2);
semilogx(f, phase);  % Phasengang in Grad
grid on;
title('Phasengang');
xlabel('Frequenz (Hz)');
ylabel('Phase (Grad)');
