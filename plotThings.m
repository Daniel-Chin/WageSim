LINEWIDTH = 1.5;

plot_upper_bound = ceil(max([ ...
  max(sum_r_history), ...
  max(population_history), ...
  max(GDP_history) ...
]));

plot_lower_bound = floor(min([ ...
  min(sum_r_history), ...
  min(population_history) ...
]));

plot_ratio = 1 / (plot_upper_bound - plot_lower_bound);
transformPlot = @(x)((x - plot_lower_bound) * plot_ratio + 1);

hh = [];
hold off;
hh(4+1:4+N_GOOD) = area(p_history(:, end:-1:1));
hold on;
hh(1) = plot(transformPlot(sum_r_history), 'b', 'DisplayName', 'sum(r)', 'linewidth', LINEWIDTH);
hh(2) = plot(transformPlot(GDP_history), 'g', 'DisplayName', 'GDP', 'linewidth', LINEWIDTH);
hh(3) = plot(structural_change_history * 10 + 1, 'k--', 'DisplayName', 'structural change', 'linewidth', LINEWIDTH);
hh(4) = plot(transformPlot(population_history), 'r:', 'DisplayName', 'population', 'linewidth', LINEWIDTH);
% hh(5) = plot(transformPlot(capital_GDP_history), 'r', 'DisplayName', 'capital GDP', 'linewidth', LINEWIDTH);
legend(hh(1 : 4+N_LABOR), {'sum(r)', 'GDP', 'structural change', 'population', 'Farm Labor','Factory Labor','IT Labor'}, 'Location', 'northeast');
axis([0, length(sum_r_history), 0, 2]);
