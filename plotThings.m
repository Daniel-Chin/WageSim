LINEWIDTH = 1.5;
SHIFT = 3;

hold off;
hh = [];
hh(4+1:4+N_GOOD) = area(p_history);
hold on;
hh(1) = plot(sum_r_history + SHIFT, 'DisplayName', 'sum(r)', 'linewidth', LINEWIDTH);
hh(2) = plot(capital_GDP_history + SHIFT, 'DisplayName', 'capital GDP', 'linewidth', LINEWIDTH);
hh(3) = plot(consumer_GDP_history + SHIFT, 'DisplayName', 'consumer GDP', 'linewidth', LINEWIDTH);
hh(4) = plot(structural_change_history * 10 + 1, 'DisplayName', 'structural change', 'linewidth', LINEWIDTH);
legend(hh(1:4), 'Location', 'northwest');
axis([0, length(sum_r_history), 0, SHIFT+max(2, ceil(max(sum_r_history) / 3) * 3)]);
