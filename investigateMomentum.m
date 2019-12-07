test_i_max = 120;
for momentum_i = 10 : 20
  R_MOMENTUM = momentum_i / 10;
  test;
  fprintf('Saving fig...\n');
  title(sprintf('R_MOMENTUM = %f', R_MOMENTUM));
  saveas(gcf, sprintf('./momentum/%d.png', momentum_i));
end
