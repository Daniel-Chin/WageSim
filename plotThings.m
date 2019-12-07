LINEWIDTH = 1.5;

plot_upper_bound = ceil(max([ ...
  max(sum_r_history), ...
  max(capital_GDP_history), ...
  max(consumer_GDP_history)] ...
));

plot_lower_bound = floor(min([ ...
  min(sum_r_history), ...
  min(capital_GDP_history), ...
  min(consumer_GDP_history)] ...
));

plot_ratio = 1 / (plot_upper_bound - plot_lower_bound);
transformPlot = @(x)((x - plot_lower_bound) * plot_ratio + 1);

hh = [];
hold off;
hh(4+1:4+N_GOOD) = area(p_history);
hold on;
hh(1) = plot(transformPlot(sum_r_history), 'b', 'DisplayName', 'sum(r)', 'linewidth', LINEWIDTH);
hh(2) = plot(transformPlot(capital_GDP_history), 'r', 'DisplayName', 'capital GDP', 'linewidth', LINEWIDTH);
hh(3) = plot(transformPlot(consumer_GDP_history), 'g', 'DisplayName', 'consumer GDP', 'linewidth', LINEWIDTH);
hh(4) = plot(structural_change_history * 10 + 1, 'k--', 'DisplayName', 'structural change', 'linewidth', LINEWIDTH);
legend(hh(1:4), 'Location', 'northwest');
axis([0, length(sum_r_history), 0, 2]);
