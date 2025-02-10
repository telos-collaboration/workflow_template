# TELOS Collaboration Analysis Workflow Template

This repository contains a very basic recommended directory layout
for analysis workflows in the TELOS Collaboration.

## How to use this template

1. Clone this template
   to the computer where you will perform the analysis,
   giving it an appropriate name.
   Rename the default remote so that it is clear that it is the template.

   ```shellsession
   git clone https://github.com/telos-collaboration/workflow_template new_repository_name_202X
   cd new_repository_name_202X
   git remote rename origin template
   ```

2. Create a new, empty repository on GitHub,
   either under the [TELOS Collaboration][telos-org] organisation
   or under your personal account.
   (If the latter,
   then it must be moved to the TELOS Collaboration organisation before publishing.)
   Push your clone to this repository.
   
   ```shellsession
   git remote add origin git@github.com:telos-collaboration/new_repository_name_202X
   ```

3. Ensure that you have Snakemake installed,
   by following the instructions in the template README below.

4. Ensure that you have [pre-commit][pre-commit] installed in your Snakemake environment.

   ```shellsession
   conda activate snakemake
   pip install pre-commit
   ```

5. Install pre-commit into your working copy of the repository.

   ```shellsession
   pre-commit install
   ```

6. Open the file `CITATION.cff` and ensure that
   it represents all authors of the work being prepared.
   If not,
   edit it such that it does,
   for example by using [cffinit][cffinit].

7. Edit the template README below to fill in anything marked `TODO`.
   (The arXiv identifier cannot be filled in until the preprint is submitted;
   however,
   DOIs may be reserved in advance on [Zenodo][zenodo].)

8. Remove everything above the line `# TODO: Release name` from this file.

9. Commit these initial changes:

   ```shellsession
   git add README.md CITATION.cff
   git commit -m "Initial commit: set basic metadata"
   ```

10. Begin working on your analysis.
    The pre-created directories contain
    additional information on what to place in them,
    but to summarise:

    - Place raw data
      (and only raw data)
      in the `data` directory.
      Your workflow must not modify the files in this directory.
      These files will not be committed to the repository.
    - Add any non-PyPI Python libraries as Git submodules in the `libs` directory.
    - Place ensemble metadata, fit parameters, etc.
      in the `metadata` directory.
      (CSV and YAML are typical choices for this.)
      One file
      (e.g. `ensemble_metadata.csv`)
      is typically sufficient for this;
      do not use separate files for each ensemble.
      In general,
      numbers in this file should not need error bars,
      or many decimal places;
      if you need to put numbers with error bars in here,
      something has likely gone wrong with your analysis.
      These files will not be committed to the repository.
    - If you are quoting numbers from
      other work that does not have its own data release,
      place these in the `external_data` directory.
      Otherwise,
      delete this directory with

      ```shellsession
      git rm -r external_data
      ```
    - If adding new Matplotlib styles,
      add them to the `styles` directory.
      (For most work,
      this should not be needed.)
    - Add your workflow definition to `workflow/Snakefile`.
      If your workflow has many moving parts,
      break it up into modules and place these in `workflow/rules`.
    - Add environment definitions to `workflow/envs`.
    - Put the code itself in the `src` directory.
    - Your workflow should place files in the following locations:
      - Intermediary data in `intermediary_data`
      - Plots in `assets/plots`
      - Tables in `assets/tables`
      - Definitions in `assets/definitions`
      - Data products
        (such as summary CSVs)
        to be uploaded to Zenodo as part of the data release
        in `data_assets`
      These directories will be created automatically by Snakemake as needed.
      Their contents will not be committed to the repository.

For more information,
please see the [TELOS Collaboration Reproducibility/Open Science Strategy][strategy].


## Updating template changes

You can pull the latest changes from this template by running:

``` shellsession
git pull --no-ff template main
```

This may be useful to,
for example,
add more recommended sections to the README,
or more plot styles.
It will not make any changes to the directory structure,
other than moving the various README files to new locations.

[cffinit]: http://citation-file-format.github.io/cff-initializer-javascript/
[pre-commit]: https://pre-commit.com
[strategy]: https://github.com/telos-collaboration/strategy
[telos-org]: https://github.com/telos-collaboration
[zenodo]: https://zenodo.org

<!-- Delete this line and everything above it before committing. -->

# TODO: Release name [e.g. Paper title—Analysis workflow]

[![DOI](https://zenodo.org/badge/DOI/TODO DOI.svg)](https://doi.org/TODO DOI)

The workflow in this repository performs
the analyses presented in the paper
[TODO: paper title][paper].

## Requirements

- Conda, for example, installed from [Miniforge][miniforge]
- [Snakemake][snakemake], which may be installed using Conda
- LaTeX, for example, from [TeX Live][texlive]

## Setup

1. Install the dependencies above.
2. Clone this repository including submodules
   (or download its Zenodo release and `unzip` it)
   and `cd` into it:

   ```shellsession
   git clone --recurse-submodules https://github.com/telos-collaboration/TODO REPO NAME
   cd TODO REPO NAME
   ```

3. TODO Add instructions on which files to download from data release,
   and where to place them.

## Running the workflow

The workflow is run using Snakemake:

``` shellsession
snakemake --cores 1 --use-conda
```

where the number `1`
may be replaced by
the number of CPU cores you wish to allocate to the computation.

Snakemake will automatically download and install
all required Python packages.
This requires an Internet connection;
if you are running in an HPC environment where you would need
to run the workflow without Internet access,
details on how to preinstall the environment
can be found in the [Snakemake documentation][snakemake-conda].

TODO Add estimate of how long the analysis takes end-to-end,
and on what hardware.

## Output

Output plots, tables, and definitions
are placed in the `assets/plots`, `assets/tables`, and `assets/definitions` directories.

Output data assets are placed into the `data_assets` directory.

Intermediary data are placed in the `intermediary_data` directory.

## Reusability

This workflow is relatively tailored to the data
which it was originally written to analyse.
Additional ensembles may be added to the analysis
by adding relevant files to the `raw_data` directory,
and adding corresponding entries to the files in the `metadata` directory.
However,
extending the analysis in this way
has not been as fully tested as the rest of the workflow,
and is not guaranteed to be trivial for someone not already familiar with the code.

[datarelease]: https://doi.org/10.5281/zenodo.TODO_ZENODO_ID
[miniforge]: https://github.com/conda-forge/miniforge
[paper]: https://doi.org/10.48550/arXiv.TODO_ARXIV_ID
[snakemake]: https://snakemake.github.io
[snakemake-conda]: https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html
[texlive]: https://tug.org/texlive/
