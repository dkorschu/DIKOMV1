% Numerator und Denominator der ersten Übertragungsfunktion
num1 = [1 2.107e04 1.441e07 0 0];
den1 = [1 1480 1.451e07 1.4e08 6.064e07];

% Numerator und Denominator der zweiten Übertragungsfunktion
num2 = [1 1471 1.441e07 0 0];
den2 = [1 2.108e04 1.453e07 1.4e08 6.064e07];

% Übertragungsfunktionen definieren
sys1 = tf(num1, den1);
sys2 = tf(num2, den2);

% Bode-Diagramme der beiden Übertragungsfunktionen plotten
figure;
bode(sys1);
hold on;
bode(sys2);
legend('System 1', 'System 2');
grid on;

