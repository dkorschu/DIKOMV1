% Öffne die .fig-Datei
h = openfig('EQ_Anfang_Ende.fig', 'invisible'); % unsichtbar öffnen, um Bildschirmpopups zu vermeiden
axesHandles = findall(h, 'type', 'axes');

% Wähle die erste Achse als die für den Amplitudengang
ax_amplitude = axesHandles(1);

% Extrahiere die Linienobjekte in der Achse
lineHandles = findall(ax_amplitude, 'Type', 'line');

% Falls keine Linien gefunden wurden, gebe eine Fehlermeldung aus
if isempty(lineHandles)
    error('Keine Linien im Amplitudengang gefunden.');
end

% Extrahiere die X- und Y-Daten von der ersten Linie
x_data = get(lineHandles(1), 'XData');
y_data = get(lineHandles(1), 'YData');

% Überprüfe, ob die Daten in Zellen gespeichert sind
if iscell(x_data)
    x_data = x_data{1};
end
if iscell(y_data)
    y_data = y_data{1};
end

% Überprüfe die Länge der Daten
fprintf('Länge der X-Daten: %d\n', length(x_data));
fprintf('Länge der Y-Daten: %d\n', length(y_data));

% Stelle sicher, dass die X- und Y-Daten die gleiche Länge haben
if length(x_data) ~= length(y_data)
    error('Die Längen der X- und Y-Daten stimmen nicht überein.');
end

% Überprüfe, ob genügend Daten vorhanden sind
if length(x_data) < 2
    error('Nicht genügend Datenpunkte vorhanden, um die zwei höchsten Amplituden zu identifizieren.');
end

% Sortiere die Y-Daten absteigend und finde die Indizes der höchsten Werte
[~, idx] = sort(y_data, 'descend');

% Die zwei höchsten Amplituden
highest_idx = idx(1:2);
x_highest = x_data(highest_idx);
y_highest = y_data(highest_idx);

% Aktiviere die Amplitudenachse und halte die Grafik
axes(ax_amplitude);
hold on;

% Markiere die zwei höchsten Amplitudenpunkte
plot(x_highest, y_highest, 'ro', 'MarkerSize', 10, 'LineWidth', 2); % 'ro' für rote Kreise

% Optional: Beschriftungen zu den markierten Punkten hinzufügen
for i = 1:length(x_highest)
    text(x_highest(i), y_highest(i), sprintf('Max %d', i), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
end

% Das Halten der aktuellen Grafik beenden
hold off;

% Speichern der geänderten Figur
savefig(h, 'EQ_Anfang_Ende_mit_Markierungen.fig');
