LINEWIDTH = 1.5;
SHIFT = 3;

hold off;
hh = [];
hh(1) = plot(sum_r_history + SHIFT, 'DisplayName', 'sum(r)', 'linewidth', LINEWIDTH);
hold on;
hh(2) = plot(capital_GDP_history + SHIFT, 'DisplayName', 'capital GDP', 'linewidth', LINEWIDTH);
hh(3) = plot(consumer_GDP_history + SHIFT, 'DisplayName', 'consumer GDP', 'linewidth', LINEWIDTH);
hh(4) = plot(structural_change_history * 10 + 1, 'DisplayName', 'structural change', 'linewidth', LINEWIDTH);
hh(4+1:4+N_GOOD) = area(p_history);
legend(hh(1:4), 'Location', 'northwest');
axis([0 length(sum_r_history) 0 5]);
