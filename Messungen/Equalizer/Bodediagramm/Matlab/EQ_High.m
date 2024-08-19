% Übertragungsfunktion 1
numerator1_1 = [-1, -4.268e04, -5.653e07];  % Zähler der ersten Übertragungsfunktion
denominator1_1 = [1, 2838, 5.653e07];  % Nenner der ersten Übertragungsfunktion
sys1_1 = tf(numerator1_1, denominator1_1);

% Frequenzbereich festlegen
f = logspace(1, 6, 1000);  % Frequenzbereich von 10 Hz bis 10^6 Hz
w = 2*pi*f;  % Umrechnung von Frequenz (Hz) in Kreisfrequenz (rad/s)

% Bode-Plot erstellen für die erste Übertragungsfunktion
[mag1_1, phase1_1, wout1_1] = bode(sys1_1, w);  % Amplituden- und Phasengang berechnen
mag1_1 = squeeze(mag1_1);  % Extrahieren der Magnitude-Daten
phase1_1 = squeeze(phase1_1);  % Extrahieren der Phasen-Daten

% Ermittlung der Resonanzfrequenz für die erste Übertragungsfunktion
[~, resonance_index1_1] = max(20*log10(mag1_1));
resonance_freq1_1 = f(resonance_index1_1);
resonance_magnitude1_1 = 20*log10(mag1_1(resonance_index1_1));

% Übertragungsfunktion 2
numerator1_2 = [-1, -6.702e05, -1.394e10];  % Zähler der zweiten Übertragungsfunktion
denominator1_2 = [1, 4.457e04, 1.394e10];  % Nenner der zweiten Übertragungsfunktion
sys1_2 = tf(numerator1_2, denominator1_2);

% Bode-Plot erstellen für die zweite Übertragungsfunktion
[mag1_2, phase1_2, wout1_2] = bode(sys1_2, w);  % Amplituden- und Phasengang berechnen
mag1_2 = squeeze(mag1_2);  % Extrahieren der Magnitude-Daten
phase1_2 = squeeze(phase1_2);  % Extrahieren der Phasen-Daten

% Ermittlung der Resonanzfrequenz für die zweite Übertragungsfunktion
[~, resonance_index1_2] = max(20*log10(mag1_2));
resonance_freq1_2 = f(resonance_index1_2);
resonance_magnitude1_2 = 20*log10(mag1_2(resonance_index1_2));

% Übertragungsfunktion 3
numerator2_1 = [-1, -2838, -5.653e07];  % Zähler der dritten Übertragungsfunktion
denominator2_1 = [1, 4.268e04, 5.653e07];  % Nenner der dritten Übertragungsfunktion
sys2_1 = tf(numerator2_1, denominator2_1);

% Bode-Plot erstellen für die dritte Übertragungsfunktion
[mag2_1, phase2_1, wout2_1] = bode(sys2_1, w);  % Amplituden- und Phasengang berechnen
mag2_1 = squeeze(mag2_1);  % Extrahieren der Magnitude-Daten
phase2_1 = squeeze(phase2_1);  % Extrahieren der Phasen-Daten

% Ermittlung der Resonanzfrequenz für die dritte Übertragungsfunktion
[~, resonance_index2_1] = min(20*log10(mag2_1));  % Findet das Minimum der Magnitude
resonance_freq2_1 = f(resonance_index2_1);
resonance_magnitude2_1 = 20*log10(mag2_1(resonance_index2_1));

% Übertragungsfunktion 4
numerator2_2 = [-1, -4.457e04, -1.394e10];  % Zähler der vierten Übertragungsfunktion
denominator2_2 = [1, 6.702e05, 1.394e10];  % Nenner der vierten Übertragungsfunktion
sys2_2 = tf(numerator2_2, denominator2_2);

% Bode-Plot erstellen für die vierte Übertragungsfunktion
[mag2_2, phase2_2, wout2_2] = bode(sys2_2, w);  % Amplituden- und Phasengang berechnen
mag2_2 = squeeze(mag2_2);  % Extrahieren der Magnitude-Daten
phase2_2 = squeeze(phase2_2);  % Extrahieren der Phasen-Daten

% Ermittlung der Resonanzfrequenz für die vierte Übertragungsfunktion
[~, resonance_index2_2] = min(20*log10(mag2_2));  % Findet das Minimum der Magnitude
resonance_freq2_2 = f(resonance_index2_2);
resonance_magnitude2_2 = 20*log10(mag2_2(resonance_index2_2));

% Plotten
figure;

% Subplot für Amplitudengänge
subplot(2,1,1);
semilogx(f, 20*log10(mag1_1), 'b-', 'DisplayName', 'ÜTF 1.1: Magnitude');  % Amplitudengang der ersten Übertragungsfunktion
hold on;
semilogx(f, 20*log10(mag1_2), 'g-', 'DisplayName', 'ÜTF 1.2: Magnitude');  % Amplitudengang der zweiten Übertragungsfunktion
semilogx(f, 20*log10(mag2_1), 'r-', 'DisplayName', 'ÜTF 2.1: Magnitude');  % Amplitudengang der dritten Übertragungsfunktion
semilogx(f, 20*log10(mag2_2), 'm-', 'DisplayName', 'ÜTF 2.2: Magnitude');  % Amplitudengang der vierten Übertragungsfunktion

% Resonanzfrequenzen markieren
h1_1 = plot(resonance_freq1_1, resonance_magnitude1_1, 'bo', 'MarkerSize', 8, 'LineWidth', 2, ...
    'DisplayName', sprintf('Resonanzfrequenz 1.1: %.2f Hz, Magnitude: %.2f dB', resonance_freq1_1, resonance_magnitude1_1));
h1_2 = plot(resonance_freq1_2, resonance_magnitude1_2, 'go', 'MarkerSize', 8, 'LineWidth', 2, ...
    'DisplayName', sprintf('Resonanzfrequenz 1.2: %.2f Hz, Magnitude: %.2f dB', resonance_freq1_2, resonance_magnitude1_2));
h2_1 = plot(resonance_freq2_1, resonance_magnitude2_1, 'ro', 'MarkerSize', 8, 'LineWidth', 2, ...
    'DisplayName', sprintf('Resonanzfrequenz 2.1: %.2f Hz, Magnitude: %.2f dB', resonance_freq2_1, resonance_magnitude2_1));
h2_2 = plot(resonance_freq2_2, resonance_magnitude2_2, 'mo', 'MarkerSize', 8, 'LineWidth', 2, ...
    'DisplayName', sprintf('Resonanzfrequenz 2.2: %.2f Hz, Magnitude: %.2f dB', resonance_freq2_2, resonance_magnitude2_2));

grid on;
title('Amplitudengang');
xlabel('Frequenz (Hz)');
ylabel('Magnitude (dB)');
legend([h1_1, h1_2, h2_1, h2_2]);

% Subplot für Phasengänge
subplot(2,1,2);
semilogx(f, phase1_1, 'b-', 'DisplayName', 'ÜTF 1.1: Phase');  % Phasengang der ersten Übertragungsfunktion
hold on;
semilogx(f, phase1_2, 'g-', 'DisplayName', 'ÜTF 1.2: Phase');  % Phasengang der zweiten Übertragungsfunktion
semilogx(f, phase2_1, 'r-', 'DisplayName', 'ÜTF 2.1: Phase');  % Phasengang der dritten Übertragungsfunktion
semilogx(f, phase2_2, 'm-', 'DisplayName', 'ÜTF 2.2: Phase');  % Phasengang der vierten Übertragungsfunktion

grid on;
title('Phasengang');
xlabel('Frequenz (Hz)');
ylabel('Phase (Grad)');
legend('show');
