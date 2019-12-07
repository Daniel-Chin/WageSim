close all;

SEC_PER_FRAME = 2;

initRP();
p_history = [];
sum_r_history = [];
capital_GDP_history = [];
consumer_GDP_history = [];
structural_change_history = [];
last_plot_time = now;
p_array = zeros(BATCH, N_GOOD);
sum_r_array = zeros(BATCH, 1);
capital_GDP_array = zeros(BATCH, 1);
consumer_GDP_array = zeros(BATCH, 1);
structural_change_array = zeros(BATCH, 1);
R_STICKY = saved_R_STICKY;
test_i = 0;
while test_i < test_i_max
  batch_i = 0;
  while now - last_plot_time < SEC_PER_FRAME * .00001
    if test_i > 45
      % R_STICKY = [.5 .5]';
    end
    if test_i > 55
      % R_STICKY = saved_R_STICKY;
    end
    if test_i > 80
      % R_STICKY = [.8 .2]';
    end
    if test_i > 100
      % R_STICKY = saved_R_STICKY;
    end
    if test_i > 130
      % R_STICKY = [.8 .2]';
    end
    if test_i > 140
      % R_STICKY = saved_R_STICKY;
    end
    test_i = test_i + 1;
    batch_i = batch_i + 1;
    p_array(batch_i, :) = p;
    sum_r_array(batch_i) = log(sum(r));
    value = sum(supply .* p, 1);
    capital_GDP_array(batch_i) = log(sum(value(1 : n_capital_good)));
    consumer_GDP_array(batch_i) = log(sum(value(n_capital_good+1 : n_capital_good+n_consumer_good)));

    last_r = r;
    aDay();
    structural_change_array(batch_i) = norm(r/norm(r) - last_r/norm(last_r));
  end
  fprintf('concat...');
  p_history = cat(1, p_history, p_array(1:batch_i, :));
  sum_r_history = cat(1, sum_r_history, sum_r_array(1:batch_i));
  capital_GDP_history = cat(1, capital_GDP_history, capital_GDP_array(1:batch_i));
  consumer_GDP_history = cat(1, consumer_GDP_history, consumer_GDP_array(1:batch_i));
  structural_change_history = cat(1, structural_change_history, structural_change_array(1:batch_i));
  fprintf('plot...');
  plotThings();
  last_plot_time = now;
  fprintf('done.\n');
  % disp('Press Enter...');
  % pause
  pause(.1)
end
