% All global parameters

N_GOOD = 10;
N_PROCESS = 1000;
CAPITAL_GOOD_PROPORTION = .5;
DEPRECIATION = .9;  % capital good depreciation
BLESS = 0.5;  % scales the product of all processes. Kinda like the "difficulty level" of the world.
R_STICKY = [.8 .2]';
LOSS_TOLERANCE = .0001;

n_capital_good = round(N_GOOD * CAPITAL_GOOD_PROPORTION);
n_consumer_good = N_GOOD - n_capital_good;
