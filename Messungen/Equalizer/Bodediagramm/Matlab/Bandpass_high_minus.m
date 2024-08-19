% 1. Übertragungsfunktion definieren
numerator = [1.992e04, -4.53e-09];  % Zähler der Übertragungsfunktion
denominator = [1, 4.268e04, 5.653e07];  % Nenner der Übertragungsfunktion

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
%title('Amplitudengang');
xlabel('Frequenz (Hz)');
ylabel('Amplitude (dB)');
hold on;

% 4. 3dB-Grenzfrequenz ermitteln und markieren
[magnitude_dB, freq_3db_index] = min(abs(20*log10(mag) - max(20*log10(mag)) + 3));
freq_3db = f(freq_3db_index);

h1 = plot(freq_3db, 20*log10(mag(freq_3db_index)), 'rx', 'DisplayName', sprintf('3dB Frequenz: %.2f Hz', freq_3db));

% 5. Resonanzfrequenz ermitteln und markieren (falls vorhanden)
[~, resonance_index] = max(20*log10(mag));
resonance_freq = f(resonance_index);

h2 = plot(resonance_freq, 20*log10(mag(resonance_index)), 'gx', 'DisplayName', sprintf('Resonanzfrequenz: %.2f Hz', resonance_freq));

% Legende hinzufügen
legend([h1 h2]);

subplot(2,1,2);
semilogx(f, phase);  % Phasengang in Grad
grid on;
%title('Phasengang');
xlabel('Frequenz (Hz)');
ylabel('Phase (Grad)');





