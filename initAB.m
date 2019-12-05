% Randomly initialize goods and processes

A = zeros(N_PROCESS, N_GOOD);
B = zeros(N_PROCESS, N_GOOD);

for i = 1 : N_PROCESS
  for j = 1 : N_GOOD
    A(i, j) = floor(rand * 10) + 1;
    B(i, j) = 1;
  end
  for j = 1 : n_capital_good
    B(i, j) = A(i, j) * DEPRECIATION;
  end
  product = floor(rand * N_GOOD) + 1;
  B(i, product) = floor(rand * 10 * n_consumer_good * BLESS) + 1;
end
