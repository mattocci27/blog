data{
  int<lower=0> N;
  int y[N];
}

parameters {
  real mu;
  real<lower=0> sigma;
  vector[N] log_lambda;
}

model {
  sigma ~ cauchy(0, 5);
  mu ~ normal(0, 10);
  log_lambda ~ normal(mu, sigma);
  for (n in 1:N)
    target += poisson_log_lpmf(y[n] | log_lambda[n]);
}
