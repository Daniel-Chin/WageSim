% A day in the economy
close all;

% produce
supply = B .* r;

% exchange
i = 0;
stride = .1;
problems = ones(1, N_GOOD);
old_r = r;
max_excess = 0; max_p = 0;
while true
  i = i + 1;
  income = sum(supply .* p, 2);
  r = income ./ sum(A .* p, 2);
  demand = A .* r;
  excess_demand = sum(demand - supply, 1);
  if norm(max(0, excess_demand)) < MINIMA_QUALITY
    break;
  end
  new_problems = excess_demand > 0;
  if any(new_problems - problems == 1)
    stride = stride * .5;
  else
    stride = stride * 1.1;
  end
  problems = new_problems;
  nudge = excess_demand / norm(excess_demand);
  p = max(0, p + nudge * stride);
  p = p / sum(p);
  if i > 5000
    max_excess = max(max_excess, max(excess_demand));
    max_p = max(max_p, max(p));
    bar([excess_demand / max_excess; p / max_p]');
    axis([.5, N_GOOD+.5, -.1, 1]);
    title('Invisible hand falls into a loop');
    legend('Excess Demand', 'Prices');
    pause(.05);
  end
end
fprintf('It took %d strides for the market to converge\n', i);

% just to check that goods with excess supply are free
assert(all(p .* excess_demand <= MINIMA_QUALITY));

% sticky r, to avoid stiffness
r = [old_r, r] * R_STICKY;
