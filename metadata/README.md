# Metadata

In this directory,
place metadata parameters.
For example,
the parameters used to generate ensembles,
or parameters used in fitting of correlation functions
would be appropriate here.

Do not include numbers with error bars,
or numbers requiring significant precision.
For example,
$am_{\mathrm{AS}}=-1.4263$ would be fine,
as this is an input to the computation that was likely chosen by hand.
On the other hand,
$am_\pi = 0.314159(26)$ is not appropriate,
as this is an observable that should be an output of the workflow,
not an input to it.

Metadata can be specified in CSV format,
for example

``` csv
ensemble_name,group_family,Nc,nF,nAS,beta,mF,mAS,NT,NX,NY,NZ
DB4M1,Sp,4,2,0,7.2,-0.72,,48,24,24,24
DB4M2,Sp,4,2,0,7.2,-0.725,,48,24,24,24
```

Alternatively,
they may be specified in YAML format,
for example

``` yaml
DB1M4:
  ensemble_name: DB4M1
  group_family: Sp
  Nc: 4
  nF: 2
  nAS: 0
  beta: 7.2
  mF: -0.72
  NT: 48
  NX: 24
  NY: 24
  NZ: 24

DB1M4:
  ensemble_name: DB4M2
  group_family: Sp
  Nc: 4
  nF: 2
  nAS: 0
  beta: 7.2
  mF: -0.725
  NT: 48
  NX: 24
  NY: 24
  NZ: 24
```

YAML may be a better fit if significant structure is needed in the data;
CSV is likely easier if the data fit nicely into a flat table.

This directory will not be committed as part of the repository,
so ensure that regular backups are taken as this file is worked on during development.
Its contents should be uploaded as part of the data release,
with instructions in the main `README.md` on what to download and where to put it.
