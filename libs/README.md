# Libraries

If your workflow makes use of libraries that are not available on [PyPI][pypi],
but only on GitHub or similar,
add them here as Git submodules.
This way,
they may be packaged when the workflow is packaged for releas,
so even if the original repository is moved or deleted,
people are still able to install the requirements and run the workflow.

For example,
to add the `flow_analysis` library:

``` shellsession
cd libs
git submodule add flow_analysis
git commit -m "add flow_analysis"
```

You should also configure the Conda environment definitions in your workflows
to use this copy of the library.
For example,
if you have used `conda env export`
and the generated file has a reference to `flow-analysis` under the `pip` section,
replace the specification with `-e ../../libs/flow_analysis`.
(The `../../` here is because
the path is relative to the Snakemake Conda cache directory,
and the `-e` means that if you make updates to the library,
they are represented in the cached Conad environment.)

[pypi]: https://pypi.org
