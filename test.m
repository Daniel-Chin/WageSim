close all;

SEC_PER_FRAME = 1;

initRP();
p_history = [];
sum_r_history = [];
GDP_history = [];
structural_change_history = [];
population_history = [];
last_plot_time = now;
p_array = zeros(1, N_GOOD);
sum_r_array = zeros(1, 1);
GDP_array = zeros(1, 1);
structural_change_array = zeros(1, 1);
population_array = zeros(1, 1);
R_STICKY = saved_R_STICKY;
test_i = 0;
while test_i < test_i_max
  batch_i = 0;
  while now - last_plot_time < SEC_PER_FRAME * .00001 || batch_i == 0
    test_i = test_i + 1;
    batch_i = batch_i + 1;
    p_array(batch_i, :) = p;
    
    last_r = r;
    aDay();
    sum_r_array(batch_i) = log(sum(r));
    value = sum(supply .* p, 1);
    GDP_array(batch_i) = log(sum(value));
    structural_change_array(batch_i) = norm(r/norm(r) - last_r/norm(last_r));
    population_array(batch_i) = log(sum(supply(:, N_GOOD-N_LABOR+1:end), 'all'));
  end
  % fprintf('concat...');
  p_history = cat(1, p_history, p_array(1:batch_i, :));
  sum_r_history = cat(2, sum_r_history, sum_r_array(1:batch_i));
  GDP_history = cat(2, GDP_history, GDP_array(1:batch_i));
  structural_change_history = cat(2, structural_change_history, structural_change_array(1:batch_i));
  population_history = cat(2, population_history, population_array(1:batch_i));
  % fprintf('plot...');
  plotThings();
  last_plot_time = now;
  fprintf('GDP growth = %f%%\n', (2.718^(sum_r_history(end) - sum_r_history(end - 1)) - 1) * 100);
  % fprintf('done.\n');
  % disp('Press Enter...');
  % pause
  pause(.1)
end
