# Raw data

In this directory,
place _raw data_ as taken from HPC.
This should be in as unmodified a format as possible,
and include as much metadata as possible.
Try to avoid using text files that are just lists of numbers.
Full log files,
while larger,
are also easier to interpret and
less likely to strip information that may be useful to others.
If you are using a tool that outputs a specific data format,
such as HDF5, JSON, or XML,
such files would be ideal.

Place files in a hierarchical directory structure labeled by relevant metadata
such that each distinct ensemble has a unique directory,
for example,
`Sp4/nF2_nAS3/wilson/beta7.5/mF-0.72_mAS-1.132/48x24x24x24`.

This directory will not be committed as part of the repository,
so ensure that regular backups are taken as this file is worked on during development.
Its contents should be compressed and uploaded as part of the data release,
with instructions in the main `README.md` on what to download and where to extract it.
