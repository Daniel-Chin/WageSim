function [c, ceq] = sphereConstraint(q)
  c = [];
  ceq = norm(q) - 1;
end
