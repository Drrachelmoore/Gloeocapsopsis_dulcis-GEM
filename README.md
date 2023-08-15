# Gloeocapsopsis_dulcis-GEM: A genome-scale metabolic model of cyanobacterium _Gloeocapsopsis dulcis_ strain AAB1

* Brief Model Description:

This repository contains the current genome-scale metabolic model of the photoautorophic and highly desiccation-resistant cyanobacterium _Gloeocapsopsis dulcis_ strain AAB1, named **Gloeocapsopsis_dulcis-GEM**. The model contains 3 compartments: extracellular [e0], cytosol [c0], and thylakoid [u0]. 
* Last updated: 2023-08-15

* Main Model Descriptors:

|Taxonomy | Template Model <br />(Photosynthesis Reactions Only) | Reactions |Exchange reactions| Metabolites| Genes |
|:-------:|:--------------:|:---------:|:----------:|:-----:|:-----:|
|[_Gloeocapsopsis dulcis_](https://www.frontiersin.org/articles/10.3389/fmicb.2021.671742/full)|[_Synechocystis sp._ PCC 6803](https://link.springer.com/article/10.1007/s11120-019-00678-x)|1151|98|1198|895|

# Required Software
## For Python:
* [Python](https://www.python.org/downloads/) (version 3.10 was used in the manuscript + the [PyCharm 2021.2.3 IDE](https://www.jetbrains.com/pycharm/))
* [COBRApy](https://github.com/opencobra/cobrapy) (version 0.25.0 was used in the manuscript)
* [Gurobi Optimizer](http://www.gurobi.com/registration/download-reg) for any simulations

## For MATLAB:
* [MATLAB](https://www.mathworks.com/products/matlab.html) (version 9.13.0.2049777 (R2022b) was used in the manuscript)
* [ComMet](https://github.com/chaitrasarathy/ComMet) and its dependencies

## For R:
* [R and R studio](https://www.r-project.org/) (version 2021.09.0 was used in the manuscript)
* Several libraries that can be installed in the provided markdown document

### Installation Instructions
* For users: Clone it from [`main`](https://github.gatech.edu/PXL/Gloeocapsopsis_dulcis-GEM/tree/main) in the GitHub repo or download the latest release

## Usage

* In Python:
  * Run a growth simulation: `code/loadGdulcisModel.py`
    * This code will load the _G. dulcis_ `.xml` model and print the simulation summary (i.e., growth in white light on BG-11 medium with no water limitations). 
    * You can also follow [cobra documentation](https://cobrapy.readthedocs.io/en/latest/index.html) to simulate different growth experiments with this model in Python.
* In MATLAB:
  * Run the comparison of metabolic states: `code/ComMetUpdate/ComMet.mlx`. WARNING: this will take a while to run.
    * Raw data from our original run of ComMet.mlx is provided at [LINK WILL GO HERE]() if you wish to skip this step.
    * We have updated several of the ComMet scripts to work with our model. They are provided in `code/ComMetUpdate/`.
* In R:
  * Generate all plots from the manuscript: `code/Coming soon.rmd`.
* In Cytoscape:
  * Generate network plots from the manuscript: `networkfiles`.


## Model Files

The model is available in `.xml`, `.txt`, `.yml`, `.mat`, `.json`, and `.xlsx` formats. Please note that we have only worked with the `.xml` and `.mat` models in Python and MATLAB, respectively, for our manuscript. The other model formats have not been tested and are only provided for accessibility purposes.  The `.xlsx` version of the model contains all gene annotations, enzyme codes, notes, and confidence scores. Confidence scores are written according to [Thiele and Palsson 2010](https://www.nature.com/articles/nprot.2009.203). Additionally, the following 2 files are available:
* `dependencies.txt`: Tracks the versions of libraries & SBML used for simulating/saving the model.
* `Compounds.xlsx`: Contains a list of all compounds/metabolites in the model with abbreviations for those involved in photosynthesis reactions.

### Complementary Data

* `BiomassComposition.xlsx`: Information on the biomass composition and the biomass function developed for and used in the model.
* `BiomassComposition.md`: Just the biomass composition. Largely based off of [Shastri and Morgan 2005](https://aiche.onlinelibrary.wiley.com/doi/abs/10.1021/bp050246d), [Nogales et al. 2011](https://www.pnas.org/doi/full/10.1073/pnas.1117907109), and [Toyoshima, Toya, and Shimizu 2020](https://link.springer.com/article/10.1007/s11120-019-00678-x).
* `BG11Medium.xlsx`: Information on how the BG-11 medium was formulated according to [Marinos, Kaleta, and Waschina 2020](https://journals.plos.org/plosone/article/authors?id=10.1371/journal.pone.0236890). 
* `ConsensusSequence.fasta`: The genome used to build the model. This may be used to build a new model from scratch or to investigate the genome if interested. It contains the main chromosome (cluster_001) and two plasmids (cluster_003 and cluster_010).
* `ConsensusSequenceAnnotated.xlsx`: The genome as annotated by ['Rapid Annotation using Subsystem Technology' (RAST)](https://rast.nmpdr.org/rast.cgi). The amino acid sequences from these data were used to calculate amino acids in the biomass objective function.
* `GeneList.txt`: Raw tab-separated data linking the genes (numbered in model `.xlsx` file, see GPR under ModelReactions tab) to their positions in the consensus sequence. It contains all genes annotated from the main chromosome (cluster_001) and the two plasmids (cluster_003 and cluster_010). The numbering scheme was created via [KBase](https://www.kbase.us/). 


## Citation

>Coming soon!

## Contributors

* [Rachel Moore](https://www.pxl.earth/people), Georgia Institute of Technology, GA, USA.

## Disclaimer
This page is modeled after SysBioChalmers' repository of the _Kluyveromyces marxianus_ consensus GEM at https://github.com/SysBioChalmers/Kluyveromyces_marxianus-GEM/blob/master/README.md
