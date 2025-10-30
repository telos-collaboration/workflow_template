# Rules

This directory contains rule definitions for Snakemake.
Each file should have a `.smk` extension,
and should likely contain more than one rule,
grouping together rules related to a single piece of functionality.

These should be included in the Snakefile using lines like

``` snakemake
include: "rules/example.smk"
```

Rules defined here have access to
all state existing at the point of the `include` statement,
and do not create a new scope.

Conda environments are located relative to the rule,
not to the Snakefile,
so any `conda:` paths should start `../envs/`.

For more detail,
see [the tutorial][tutorial].

[tutorial]: https://edbennett.github.io/snakemake-novice-lattice/cleanup.html
