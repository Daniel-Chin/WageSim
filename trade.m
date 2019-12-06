function [excess_demand, temp_r] = trade(p, supply, A)
  income = sum(supply .* p, 2);
  temp_r = income ./ sum(A .* p, 2);
  demand = A .* temp_r;
  excess_demand = sum(demand - supply, 1);
end
