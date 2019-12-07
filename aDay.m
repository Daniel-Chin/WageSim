% A day in the economy

supply = B .* r;
sum_r = sum(r);

fun = @(x)(norm(max(0, ...
  trade(x .^ 2, supply, A) ...
) / sum_r) ^ 2);
q = sqrt(p);
a = []; b = [];
Aeq = []; beq = [];
% lb = ones(1, N_GOOD) * (-1);
% ub = ones(1, N_GOOD); 
lb=[]; ub=[];
i = 0;
while true
  i = i + 1;
  [q, fval, exitflag, output] = fmincon( ...
    fun, q, ...
    a, b, Aeq, beq, lb, ub, @sphereConstraint, optimset('Display', 'off') ...
  );
  if fval < LOSS_TOLERANCE
    fprintf('success, fval = %d\n', fval);
    break;
  end
  fprintf('fmincon fails with exitflag = %d, fval = %f\n', exitflag, fval);
  % This could be local minima
  q = sphereSample(N_GOOD);
end
p = q .^ 2;
if i > 1
  % fprintf('Solved with i = %d\n', i);
end
[excess_demand, new_r] = trade(p, supply, A);

% sticky r, to avoid stiffness
r = [r, new_r] * R_STICKY;
