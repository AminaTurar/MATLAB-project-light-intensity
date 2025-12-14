H = 4;
C = 100;
d_range = linspace(0.1, 5, 100);

const = 4 + H^2;

I_corner = @(d) C ./ (d.^2 + const) + C ./ ((10-d).^2 + const);
I_midpoint = @(d) 2 * C ./ ((5-d).^2 + const);

f = @(d) I_corner(d) - I_midpoint(d);
d_optimal = fzero(f, 1.4);
I_min_intensity = I_corner(d_optimal);

Ic_values = I_corner(d_range);
Im_values = I_midpoint(d_range);

figure;
plot(d_range, Ic_values, 'r', 'LineWidth', 2);
hold on;
plot(d_range, Im_values, 'b', 'LineWidth', 2);
plot(d_optimal, I_min_intensity, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
xlabel('Bulb Position (d)');
ylabel('Intensity (I)');
title('Intensity at Darkest Spots vs. Bulb Position d');
legend({'Intensity at Corner (0,0)', 'Intensity at Midpoint (5,0)', 'Optimal Point'}, 'Location', 'NorthWest');
grid on;

disp(['Optimal d: ' num2str(d_optimal)]);
disp(['Minimum Intensity: ' num2str(I_min_intensity)]);