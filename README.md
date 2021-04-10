# coadministr.stanc

Pre-compiled stan models for the coadministr trial simulation.

## Build

```
git clone https://github.com/maj-biostat/coadministr.stanc
R CMD build coadministr.stanc
```

## Install

```
git clone https://github.com/maj-biostat/coadministr.stanc
R CMD INSTALL --preclean coadministr.stanc
```

or after build:

```
R CMD INSTALL --preclean coadministr.stanc_1.0.tar.gz
```

## Environment

Brief environment information:

+ Ubuntu 20.04.2 LTS
+ StanHeaders_2.21.0-7
+ rstan_2.21.2

Tree:

```
coadministr.stanc/
├── configure
├── configure.win
├── DESCRIPTION
├── inst
│   ├── include
│   │   └── stan_meta_header.hpp
│   └── stan
│       └── betabinhier.stan
├── man
│   ├── coadministr.stanc-package.Rd
│   └── stanc_betabinhier.Rd
├── NAMESPACE
└── R
    ├── model_api.R
    └── stanmodels.R
```



