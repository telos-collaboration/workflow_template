# Workflow environments

This directory should contain Conda environments,
in `.yml` format,
that Snakemake will instantiate as required.

Environment definitions can be generated from active Conda environments using

``` shellsession
conda env export --no-builds --file filename.yml
```

Some manual editing may be necessary
to produce environments that can be instantiated on both Linux and macOS.
Common culprits are:

- `libgcc`, `libgfortran`, `libgcc-ng`, `libgfortran-ng`, `libgfortran5`
- `libgomp`
- `libstdsxx`, `libstdcxx-ng`
- `libunwind`

For more detail,
see [the tutorial][tutorial].

[tutorial]: https://edbennett.github.io/snakemake-novice-lattice/python.html
