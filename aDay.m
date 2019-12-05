% A day in the economy

% produce
supply = B .* r;

% exchange
i = 0;
stride = 1;
problems = ones(1, N_GOOD);
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
end

% just to check that goods with excess supply are free
assert(all(p .* excess_demand <= MINIMA_QUALITY));
disp(sprintf('It took %d strides for the market to converge\n', i));