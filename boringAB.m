% Initialize goods and processes like normal people

R_STICKY = [.4 .6]';
saved_R_STICKY = R_STICKY;

A = zeros(N_PROCESS, N_GOOD);
B = zeros(N_PROCESS, N_GOOD);

for i = 1 : N_PROCESS
  for j = 1 : N_GOOD
    A(i, j) = floor(rand * 10) + 1;
    B(i, j) = floor(rand * 10 * BLESS) + 1;
  end
  for j = 1 : n_capital_good
    % B(i, j) = A(i, j) * DEPRECIATION;
    % B(i, j) = B(i, j) * DEPRECIATION;
  end
  % if rand < .5
  %   B(i, floor(rand * n_capital_good) + 1) = floor(rand * 10 * BLESS) + 1;
  % end
end

C = B - A;
fprintf('AB consume Quality = %f\n', mean( ...
  C(:, n_capital_good+1 : n_capital_good+n_consumer_good), 'all' ...
));
fprintf('AB Quality = %f\n', mean( ...
  C, 'all' ...
));
