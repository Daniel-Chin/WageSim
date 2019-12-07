% All global parameters

N_GOOD = 13;
N_PROCESS = 3000;
CAPITAL_GOOD_PROPORTION = .5;
DEPRECIATION = .9;  % capital good depreciation
BLESS = 0.5;  % scales the product of all processes. Kinda like the "difficulty level" of the world.
R_STICKY = [.9 .1]';
LOSS_TOLERANCE = 10 ^ (-6);
N_LABOR = 3;

n_capital_good = round(N_GOOD * CAPITAL_GOOD_PROPORTION);
n_consumer_good = N_GOOD - n_capital_good;

test_i_max = inf;
saved_R_STICKY = R_STICKY;
