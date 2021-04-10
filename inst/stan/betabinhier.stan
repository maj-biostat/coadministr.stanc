data{
  int Ncoad; // cvd+flu, cvd+pbo
  int Nbrand; // az, pf
  int Ncohort;  // cvd dose 1, cvd dose 2
  int yflu[Ncohort, Nbrand];
  int ypbo[Ncohort, Nbrand];
  int nflu[Ncohort, Nbrand];
  int npbo[Ncohort, Nbrand];
  real<lower=0> eta0;
  real<lower=0> a0;
  real<lower=0> b0;
}
parameters{
  real<lower=0, upper=1> pflu[Ncohort, Nbrand]; // Pr AE in cvd+flu
  real<lower=0, upper=1> ppbo[Ncohort, Nbrand]; // Pr AE in cvd+pbo
  real<lower=0, upper=1> mu[Ncoad]; // Means for pflu and ppbo
  real<lower=0> eta[Ncoad]; // Samp sizes (a + b) for pflu and ppbo 
}
transformed parameters{
  real<lower=0> a[Ncoad];
  real<lower=0> b[Ncoad];
  for(i in 1:Ncoad){
    a[i] = mu[i] * eta[i];
    b[i] = (1-mu[i]) * eta[i]; 
  }
}
model{
  for(i in 1:Ncoad){
    target += beta_lpdf(mu[i] | a0, b0);
    target += exponential_lpdf(eta[i] | eta0);
  }
  for(i in 1:Nbrand){
    for(j in 1:Ncohort){
      target += beta_lpdf(pflu[j, i] | a[1], b[1]);
      target += binomial_lpmf(yflu[j, i] | nflu[j, i], pflu[j, i]);

      target += beta_lpdf(ppbo[j, i] | a[2], b[2]);
      target += binomial_lpmf(ypbo[j, i] | npbo[j, i], ppbo[j, i]);
    }
  }
}
generated quantities{
}


