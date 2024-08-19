% �bertragungsfunktion 1
numerator1_1 = [-1, -4.268e04, -5.653e07];  % Z�hler der ersten �bertragungsfunktion
denominator1_1 = [1, 2838, 5.653e07];  % Nenner der ersten �bertragungsfunktion
sys1_1 = tf(numerator1_1, denominator1_1);

% Frequenzbereich festlegen
f = logspace(1, 6, 1000);  % Frequenzbereich von 10 Hz bis 10^6 Hz
w = 2*pi*f;  % Umrechnung von Frequenz (Hz) in Kreisfrequenz (rad/s)

% Bode-Plot erstellen f�r die erste �bertragungsfunktion
[mag1_1, phase1_1, wout1_1] = bode(sys1_1, w);  % Amplituden- und Phasengang berechnen
mag1_1 = squeeze(mag1_1);  % Extrahieren der Magnitude-Daten
phase1_1 = squeeze(phase1_1);  % Extrahieren der Phasen-Daten

% Ermittlung der Resonanzfrequenz f�r die erste �bertragungsfunktion
[~, resonance_index1_1] = max(20*log10(mag1_1));
resonance_freq1_1 = f(resonance_index1_1);
resonance_magnitude1_1 = 20*log10(mag1_1(resonance_index1_1));

% �bertragungsfunktion 2
numerator1_2 = [-1, -6.702e05, -1.394e10];  % Z�hler der zweiten �bertragungsfunktion
denominator1_2 = [1, 4.457e04, 1.394e10];  % Nenner der zweiten �bertragungsfunktion
sys1_2 = tf(numerator1_2, denominator1_2);

% Bode-Plot erstellen f�r die zweite �bertragungsfunktion
[mag1_2, phase1_2, wout1_2] = bode(sys1_2, w);  % Amplituden- und Phasengang berechnen
mag1_2 = squeeze(mag1_2);  % Extrahieren der Magnitude-Daten
phase1_2 = squeeze(phase1_2);  % Extrahieren der Phasen-Daten

% Ermittlung der Resonanzfrequenz f�r die zweite �bertragungsfunktion
[~, resonance_index1_2] = max(20*log10(mag1_2));
resonance_freq1_2 = f(resonance_index1_2);
resonance_magnitude1_2 = 20*log10(mag1_2(resonance_index1_2));

% �bertragungsfunktion 3
numerator2_1 = [-1, -2838, -5.653e07];  % Z�hler der dritten �bertragungsfunktion
denominator2_1 = [1, 4.268e04, 5.653e07];  % Nenner der dritten �bertragungsfunktion
sys2_1 = tf(numerator2_1, denominator2_1);

% Bode-Plot erstellen f�r die dritte �bertragungsfunktion
[mag2_1, phase2_1, wout2_1] = bode(sys2_1, w);  % Amplituden- und Phasengang berechnen
mag2_1 = squeeze(mag2_1);  % Extrahieren der Magnitude-Daten
phase2_1 = squeeze(phase2_1);  % Extrahieren der Phasen-Daten

% Ermittlung der Resonanzfrequenz f�r die dritte �bertragungsfunktion
[~, resonance_index2_1] = min(20*log10(mag2_1));  % Findet das Minimum der Magnitude
resonance_freq2_1 = f(resonance_index2_1);
resonance_magnitude2_1 = 20*log10(mag2_1(resonance_index2_1));

% �bertragungsfunktion 4
numerator2_2 = [-1, -4.457e04, -1.394e10];  % Z�hler der vierten �bertragungsfunktion
denominator2_2 = [1, 6.702e05, 1.394e10];  % Nenner der vierten �bertragungsfunktion
sys2_2 = tf(numerator2_2, denominator2_2);

% Bode-Plot erstellen f�r die vierte �bertragungsfunktion
[mag2_2, phase2_2, wout2_2] = bode(sys2_2, w);  % Amplituden- und Phasengang berechnen
mag2_2 = squeeze(mag2_2);  % Extrahieren der Magnitude-Daten
phase2_2 = squeeze(phase2_2);  % Extrahieren der Phasen-Daten

% Ermittlung der Resonanzfrequenz f�r die vierte �bertragungsfunktion
[~, resonance_index2_2] = min(20*log10(mag2_2));  % Findet das Minimum der Magnitude
resonance_freq2_2 = f(resonance_index2_2);
resonance_magnitude2_2 = 20*log10(mag2_2(resonance_index2_2));

% Plotten
figure;

% Subplot f�r Amplitudeng�nge
subplot(2,1,1);
semilogx(f, 20*log10(mag1_1), 'b-', 'DisplayName', '�TF 1.1: Magnitude');  % Amplitudengang der ersten �bertragungsfunktion
hold on;
semilogx(f, 20*log10(mag1_2), 'g-', 'DisplayName', '�TF 1.2: Magnitude');  % Amplitudengang der zweiten �bertragungsfunktion
semilogx(f, 20*log10(mag2_1), 'r-', 'DisplayName', '�TF 2.1: Magnitude');  % Amplitudengang der dritten �bertragungsfunktion
semilogx(f, 20*log10(mag2_2), 'm-', 'DisplayName', '�TF 2.2: Magnitude');  % Amplitudengang der vierten �bertragungsfunktion

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

% Subplot f�r Phaseng�nge
subplot(2,1,2);
semilogx(f, phase1_1, 'b-', 'DisplayName', '�TF 1.1: Phase');  % Phasengang der ersten �bertragungsfunktion
hold on;
semilogx(f, phase1_2, 'g-', 'DisplayName', '�TF 1.2: Phase');  % Phasengang der zweiten �bertragungsfunktion
semilogx(f, phase2_1, 'r-', 'DisplayName', '�TF 2.1: Phase');  % Phasengang der dritten �bertragungsfunktion
semilogx(f, phase2_2, 'm-', 'DisplayName', '�TF 2.2: Phase');  % Phasengang der vierten �bertragungsfunktion

grid on;
title('Phasengang');
xlabel('Frequenz (Hz)');
ylabel('Phase (Grad)');
legend('show');
