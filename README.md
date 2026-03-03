## Project Structure

This repository contains the implementation and analysis for Homework 3 in BIOS 731, focusing on optimization algorithms for logistic regression and the EM algorithm for censored exponential survival data. 
The project is organized to ensure full reproducibility by separating reusable source code, stored datasets, and the final analysis report.

### Repository Layout

The repository follows a structured workflow typical of reproducible statistical analyses.
- `analysis/`: Final reproducible report and knitted outputs.
- `data/`: Stored datasets used in the analysis.
- `source/`: Core algorithm implementations and helper functions used in the analysis.
- `BIOS 731 homework 3.Rproj`
- `README.md`

## `analysis/`

- `final_report_hw3_Xinyu_Dong.Rmd`

Main R Markdown analysis file that reproduces all results for the assignment.

This file:
1. loads the simulated dataset from data/
2. sources algorithm implementations from source/
3. runs the optimization algorithms
4. computes confidence intervals and comparisons
5. generates tables and figures used in the report

- `final_report_hw3_Xinyu_Dong.pdf`

Knitted PDF output of the final report produced from the R Markdown file.

## `data/`

- `logistic_sim_data.rds`

Simulated dataset used for the logistic regression experiments in Problem 3.

The dataset contains:
1. simulated predictor values
2. simulated binary outcomes
3. The dataset is stored so that all algorithms run on the same data each time the report is generated, ensuring reproducibility.

## `source/`

These scripts contain the main computational components of the assignment and are sourced by the report.

- `logistic_helpers.R`

Contains helper functions used by the logistic regression algorithms, including functions for:
1. evaluating the logistic log-likelihood
2. computing gradients
3. computing Hessian matrices
4. calculating Wald confidence intervals
5. These functions are shared by multiple optimization methods.

- `logistic_newton.R`

Implementation of Newton's method for fitting logistic regression.

This algorithm updates the parameter estimates using gradient and Hessian information from the likelihood function.

The function returns:
1. estimated coefficients
2. number of iterations required for convergence
3. computation time

- `logistic_mm.R`

Implementation of the Minorize–Maximize (MM) algorithm for logistic regression.

The function returns:
1. estimated coefficients
2. number of iterations
3. computation time

- `simulate_logistic.R`

Script used to generate the simulated dataset for the logistic regression experiments.

The simulation generates predictor values and binary outcomes according to a logistic regression model.

The resulting dataset is saved to data/logistic_sim_data.rds.

- `save_simulation.R`

Utility script used to save the simulated dataset to disk using saveRDS().

This ensures that the report always uses the same dataset instead of regenerating it each time the analysis is run.

- `em_exponential.R`

Implementation of the EM algorithm for estimating the rate parameter of an exponential distribution with right-censored data.

The function performs iterative expectation and maximization updates until convergence and returns:
1. the estimated rate parameter
2. the number of iterations required for convergence
3. a trace of parameter updates for monitoring convergence


### Running the Analysis

The entire homework can be reproduced by knitting the final report. The report automatically loads the data and sources all algorithm implementations.

1. Open the project

Open the R project in RStudio:

```{r}
BIOS 731 homework 3.Rproj
```
This ensures the correct working directory is used.

2. Install required packages

run the following in R console:

```{r}
install.packages(c(
  "here",
  "survival",
  "dplyr",
  "ggplot2",
  "knitr"
))
```
3. Generate the simulated dataset (optional)

The repository already contains the simulated dataset in data/logistic_sim_data.rds, so this step is not required.

If you want to regenerate the dataset:

```{r}
source(here::here("source", "simulate_logistic.R"))
source(here::here("source", "save_simulation.R"))
```

This will simulate logistic regression data and save it to the `data/` folder.

4. Run the final analysis

Open the report file:

```{r}
analysis/final_report_hw3_Xinyu_Dong.Rmd
```
Then click knit to pdf in RStudio.

5. Output

After knitting, the final report will be generated as:

```{r}
analysis/final_report_hw3_Xinyu_Dong.pdf
```

This PDF contains all results, tables, figures, and interpretations for the assignment.
