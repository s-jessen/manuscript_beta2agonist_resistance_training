# Proteomics Analysis: β2-Agonist and Resistance Training

This repository contains the code and data to reproduce the analysis from the published proteomics study on β2-agonist treatment combined with resistance training  
**PMID:** [39366923](https://pubmed.ncbi.nlm.nih.gov/39366923)

# Project Setup

This project uses [`renv`](https://rstudio.github.io/renv/) to manage R package dependencies in a fully self-contained way.

##Installation Steps

1. **Clone the repository**  
   ```bash
   git clone https://github.com/s-jessen/manuscript_beta2agonist_resistance_training.git
   cd manuscript_beta2agonist_resistance_training
   ```

2. **Install packages and set up environment**

You can either run the setup file in a terminal:
  ```bash
  Rscript setup.R
  ```

  Or open setup.R in RStudio and run it interactively.
  
# Folder Structure
```
setup.R                         # Run this script for initial setup
├── raw-data/                   # MS/MS data, cell experiment data, and design file
├── data/                       # Output files from the analysis
│   └── figures/                # Output figures used in the manuscript
├── R/                          # Quarto analysis scripts
│   ├── 1_data_preparation.qmd         # Data wrangling and long-form creation
│   ├── 2_differential_expression.qmd  # Limma analysis
│   ├── figure1.qmd                    # Code for Figure 1
│   ├── figure2.qmd                    # Code for Figure 2
│   ├── figure3.qmd                    # Code for Figure 3
│   └── figure4.qmd                    # Code for Figure 4
│   └── settings.qmd                   # Contains plot theme and color palettes
├── renv/                       # renv project library
├── renv.lock                   # Lockfile for reproducible package versions
├── .Rprofile                   # Auto-activates renv on project load
└── README.md                   # This file
```

The R project contains code to reproduce the following highlighted figures:

# Figure 1
![Figure 1](https://github.com/user-attachments/assets/08d31e36-dd90-47dd-8cc5-2d78a09699fa)

# Figure 2
![Figure 2](https://github.com/user-attachments/assets/a4c82d3c-3ef6-44b9-9800-f152d30dc6f1)

# Figure 3
![Figure 3](https://github.com/user-attachments/assets/1e1b27e9-5c65-4e74-9a52-15f9f6620063)

# Figure 4
![Figure 4](https://github.com/user-attachments/assets/faa2794d-26b7-43df-b28a-752083c84fa7)

