BATCH = 2;

initRP();
p_history = [];
while true
  p_array = zeros(BATCH, N_GOOD);
  for batch_i = 1 : BATCH
    p_array(batch_i, :) = p;
    aDay();
    p
    fprintf('sum(r) = %f\n', sum(r));
    fprintf('GDP = %f\n', sum(supply .* p, 'all'));
  end
  p_history = cat(1, p_history, p_array);
  plotP
  disp('Press Enter...');
  % pause
  pause(.1)
end
