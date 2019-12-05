% All global parameters

N_GOOD = 10;
N_PROCESS = 100;
CAPITAL_GOOD_PROPORTION = .5;
DEPRECIATION = .9;  % capital good depreciation
BLESS = 0.9;  % scales the product of all processes. Kinda like the "difficulty level" of the world.
MINIMA_QUALITY = .0000001;  % quality of Stride Descend

n_capital_good = round(N_GOOD * CAPITAL_GOOD_PROPORTION);
n_consumer_good = N_GOOD - n_capital_good;
