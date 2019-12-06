% A day in the economy

supply = B .* r;

fun = @(x)(norm(max(0, ...
  trade(x, supply, A) ...
)));
a = []; b = [];
Aeq = ones(1, N_GOOD);
beq = 1;
lb = zeros(1, N_GOOD);
ub = ones(1, N_GOOD);
i = 0;
while true
  i = i + 1;
  [p, fval, exitflag, output] = fmincon( ...
    fun, p, ...
    a, b, Aeq, beq, lb, ub, [], optimset('Display', 'off') ...
  );
  if fval < LOSS_TOLERANCE
    break;
  end
  fprintf('fmincon fails with exitflag = %d, fval = %f\n', exitflag, fval);
  % This could be local minima, or near-constraint freak-out. 
  p = rand(1, N_GOOD);
  p = p / sum(p);
end
if i > 1
  fprintf('Solved with i = %d\n', i);
end
[excess_demand, new_r] = trade(p, supply, A);

% sticky r, to avoid stiffness
r = [r, new_r] * R_STICKY;
