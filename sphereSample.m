function y = sphereSample(dim)
  y = 99;
  i = 0;
  while norm(y) > 1
    i = i + 1;
    y = rand(1, dim);
  end
  y = y / norm(y);
  if i > 1000
    fprintf('Warning: Rejection sampling took %d tries.\n', i);
  end
end
