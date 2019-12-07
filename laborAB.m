% Initialize goods and processes, but including labor

R_STICKY = [0 1]';
saved_R_STICKY = R_STICKY;

A = zeros(N_PROCESS, N_GOOD);
B = zeros(N_PROCESS, N_GOOD);

for i = 1 : N_PROCESS
  for j = 1 : N_GOOD
    A(i, j) = floor(rand * 10) + 1;
    B(i, j) = floor(rand * 10 * BLESS) + 1;
  end
end
