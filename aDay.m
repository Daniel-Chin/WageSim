% A day in the economy
close all;

% produce
supply = B .* r;

% exchange
old_r = r;
tries = 0;
ok = false;
while true
  tries = tries + 1;
  i = 0;
  stride = .1;
  problems = ones(1, N_GOOD);
  max_excess = 0; max_p = 0;
  p_history = [];
  p_history_i = 1;
  n_loops_detected = 0;
  while true
    i = i + 1;
    if mod(i, 20) == 0
      p_history(p_history_i, :) = p;
      p_history_i = p_history_i + 1;
    end
    detected = false;
    for old = (p_history(1 : end - 2, :))'
      if norm(p - old') < stride
        n_loops_detected = n_loops_detected + 1;
        p_history = [];
        p_history_i = 1;
        break;
      end
    end
    if tries < 20
      if n_loops_detected > 200
        n_loops_detected = 0;
        break;
      end
    end
    income = sum(supply .* p, 2);
    r = income ./ sum(A .* p, 2);
    demand = A .* r;
    excess_demand = sum(demand - supply, 1);
    if norm(max(0, excess_demand)) < MINIMA_QUALITY
      ok = true;
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
    if i > 100000
      max_excess = max(max_excess, max(excess_demand));
      max_p = max(max_p, max(p));
      bar([excess_demand / max_excess; p / max_p]');
      axis([.5, N_GOOD+.5, -.1, 1]);
      title('Invisible hand falls into a loop');
      legend('Excess Demand', 'Prices');
      pause(.05);
    end
  end
  if ok
    break;
  end
  fprintf('Too many loops detected. Randomizing p.\n');
  r = old_r;
  p = rand(1, N_GOOD);
  p = p / sum(p);
end
if n_loops_detected > 0
  fprintf('There were %d false loops detected.\n', n_loops_detected);
end
if tries > 1
  fprintf('It took %d tries and %d strides for the market to converge\n', tries, i);
else
  fprintf('It took %d strides for the market to converge\n', i);
end

% just to check that goods with excess supply are free
assert(all(p .* excess_demand <= MINIMA_QUALITY));

% sticky r, to avoid stiffness
r = [old_r, r] * R_STICKY;
