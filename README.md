# VI for Yield Prediction using Remote Sensing and Phenology

This repository contains scripts, notebooks, and data files for developing an early corn yield prediction workflow using remote sensing vegetation indices and phenological parameters. The project focuses on creating a modeling dataset from vegetation-index time-series information and using that dataset to build early-season yield prediction models for corn.

The workflow combines remote sensing-derived crop growth information with yield data to evaluate how phenological behavior and vegetation-index patterns can support yield estimation before harvest. The repository includes Google Earth Engine code for vegetation index extraction, data preparation notebooks, an artificial neural network model, regression analysis scripts, processed datasets, and prediction outputs.

---

## Repository Description

Early yield prediction is an important component of crop monitoring, food security assessment, and agricultural decision support. Remote sensing provides repeated observations of crop canopy development throughout the growing season, making it useful for capturing phenological patterns associated with crop growth and yield formation.

This project uses vegetation indices derived from remote sensing imagery to represent crop condition and seasonal growth dynamics. These vegetation-index features are processed and organized into a machine-learning-ready dataset for corn yield prediction. The repository demonstrates how to prepare the dataset, train an artificial neural network model, evaluate prediction performance, and generate prediction outputs.

---

## Main Objectives

The main objectives of this repository are:

1. To extract vegetation indices from remote sensing imagery using Google Earth Engine.
2. To organize yearly vegetation-index data for yield prediction.
3. To create a modeling dataset from remote sensing and phenological features.
4. To develop early corn yield prediction models.
5. To evaluate model performance using statistical and machine-learning approaches.
6. To provide a reusable workflow for remote-sensing-based crop yield modeling.

---

## Project Workflow

The overall workflow of the repository is:

```text
Remote sensing imagery
        ↓
Vegetation index calculation
        ↓
Year-wise vegetation index organization
        ↓
Phenology-based feature extraction
        ↓
Dataset creation for modeling
        ↓
Machine learning model development
        ↓
Corn yield prediction
        ↓
Model evaluation and output generation
```

---

## Repository Structure

```text
VI-for-Yield-Prediction-remotesensing-phenology-
│
├── yearly_separated_VI_files/
│   └── Year-wise vegetation index files used for dataset preparation
│
├── GEE_VI_calculator.txt
│   └── Google Earth Engine script for calculating vegetation indices
│
├── create_dataset_remotesensing.ipynb
│   └── Notebook for preparing the remote-sensing-based modeling dataset
│
├── ANN_for_corn_remotesensing_change_unit.ipynb
│   └── Artificial Neural Network workflow for corn yield prediction
│
├── r_output_regression.R
│   └── R script for regression-based statistical analysis
│
├── dataset_toMakemodel.csv
│   └── Processed dataset used for model development
│
├── ann_pred.csv
│   └── ANN model prediction output
│
├── .RData
│   └── R workspace file
│
├── .Rhistory
│   └── R command history file
│
├── LICENSE
│   └── MIT License
│
└── README.md
    └── Project documentation
```

---

## Data and Features

The repository is designed around remote sensing vegetation-index data and corn yield information. Vegetation indices are used as indicators of crop growth, canopy vigor, and phenological development during the growing season.

The dataset may include features such as:

- Vegetation index values at different time points
- Seasonal vegetation-index trends
- Phenological indicators derived from remote sensing
- Year-wise crop growth information
- Yield response variables for model development

The exact vegetation indices and processing steps are defined in the Google Earth Engine script and dataset preparation notebook.

---

## Google Earth Engine Vegetation Index Extraction

The file `GEE_VI_calculator.txt` contains the Google Earth Engine workflow for extracting vegetation indices from satellite imagery. This script can be used to calculate remote-sensing-based vegetation metrics for the study region and export the results for further analysis.

Typical steps include:

1. Selecting the satellite image collection.
2. Filtering imagery by date and region.
3. Applying cloud masking or quality filtering.
4. Calculating vegetation indices.
5. Exporting vegetation index data for analysis.

Users should review and modify the Google Earth Engine script according to their study area, crop type, year range, and image collection.

---

## Dataset Preparation

The notebook `create_dataset_remotesensing.ipynb` is used to create the modeling dataset from the vegetation-index files. This step organizes the extracted remote sensing data and prepares it for machine learning analysis.

The dataset preparation workflow may include:

- Reading year-wise vegetation-index files
- Cleaning and formatting input data
- Combining multiple years of vegetation-index information
- Aligning remote sensing features with yield data
- Creating the final model-ready dataset
- Exporting the dataset as `dataset_toMakemodel.csv`

The resulting dataset is used as input for yield prediction modeling.

---

## Machine Learning Model

The notebook `ANN_for_corn_remotesensing_change_unit.ipynb` contains the artificial neural network workflow for corn yield prediction. The ANN model uses remote-sensing-derived features to learn the relationship between vegetation-index patterns and yield.

The modeling workflow generally includes:

1. Loading the processed dataset.
2. Selecting input features and target yield variable.
3. Splitting data into training and testing sets.
4. Scaling or transforming variables if needed.
5. Training the artificial neural network.
6. Generating predicted yield values.
7. Evaluating model performance.
8. Saving prediction results.

The prediction output is saved in `ann_pred.csv`.

---

## Statistical Analysis

The file `r_output_regression.R` contains regression-based analysis for evaluating relationships between remote sensing features and yield. This script can be used to support model interpretation and compare statistical relationships between vegetation-index features and crop yield.

Possible analyses include:

- Linear regression
- Correlation analysis
- Model diagnostics
- Variable significance testing
- Yield response interpretation

---

## Expected Outputs

The repository produces several outputs, including:

- Processed vegetation-index datasets
- A model-ready corn yield prediction dataset
- ANN-based yield predictions
- Regression analysis results
- Model evaluation statistics
- Prediction output file: `ann_pred.csv`

---

## Applications

This workflow can support several agricultural and remote sensing applications, including:

- Early-season corn yield prediction
- Crop growth monitoring
- Phenology-based yield modeling
- Remote-sensing-based agricultural decision support
- Seasonal crop condition assessment
- Integration of vegetation indices into machine learning models
- Development of scalable yield forecasting workflows

---

## Requirements

The repository uses both Python and R.

### Python Requirements

Recommended Python packages include:

```bash
pip install numpy pandas matplotlib seaborn scikit-learn tensorflow keras jupyter
```

Depending on the notebook environment, additional packages may be required.

### R Requirements

The R script may require common data analysis and regression packages. Install packages as needed after reviewing `r_output_regression.R`.

Example:

```r
install.packages(c("tidyverse", "ggplot2", "dplyr"))
```

---

## How to Use This Repository

### 1. Clone the Repository

```bash
git clone https://github.com/mbasir25/VI-for-Yield-Prediction-remotesensing-phenology-.git
cd VI-for-Yield-Prediction-remotesensing-phenology-
```

### 2. Extract Vegetation Indices

Open the Google Earth Engine script:

```text
GEE_VI_calculator.txt
```

Run or modify the script in Google Earth Engine to extract vegetation-index data for the desired region and year.

### 3. Organize Yearly VI Files

Place or review the exported vegetation-index files in:

```text
yearly_separated_VI_files/
```

### 4. Create the Modeling Dataset

Open and run:

```text
create_dataset_remotesensing.ipynb
```

This notebook prepares the model-ready dataset and creates:

```text
dataset_toMakemodel.csv
```

### 5. Train the ANN Model

Open and run:

```text
ANN_for_corn_remotesensing_change_unit.ipynb
```

This notebook trains the artificial neural network model and generates prediction outputs.

### 6. Review Prediction Output

The ANN prediction results are stored in:

```text
ann_pred.csv
```

### 7. Run Regression Analysis

For statistical analysis, run:

```text
r_output_regression.R
```

---

## Methodological Concept

The project is based on the idea that vegetation-index time series can capture important crop phenological behavior. These patterns reflect crop growth, canopy development, and seasonal stress signals that may be related to final yield.

Instead of relying only on single-date imagery, the workflow uses vegetation-index information across time to better represent crop development. Machine learning is then used to learn the relationship between these remote-sensing-derived features and observed yield.

---

## Example Modeling Concept

```text
Vegetation index time series
        +
Phenological growth patterns
        +
Historical yield observations
        ↓
Machine learning model
        ↓
Predicted corn yield
```

---

## Notes for Users

- The Google Earth Engine script should be adapted to the user’s study area and available satellite imagery.
- The dataset structure may need modification if users add new years, regions, crops, or vegetation indices.
- Model performance may vary depending on data quality, spatial scale, temporal resolution, and yield data accuracy.
- The ANN notebook can be extended with other machine learning models such as Random Forest, XGBoost, Support Vector Regression, or linear regression.
- Users should validate the model carefully before applying it to new regions or years.

---

## Potential Future Improvements

Future versions of this workflow could include:

- Additional vegetation indices
- Weather and soil variables
- Multi-source satellite imagery
- More advanced phenological feature extraction
- Spatial cross-validation
- Comparison of multiple machine learning algorithms
- Model explainability analysis
- County-level or field-level yield forecasting
- Web-based yield prediction tools

---

## License

This repository is licensed under the MIT License. See the `LICENSE` file for details.

---

## Author

**Md. Samiul Basir**  
Ph.D. Candidate  
Department of Agricultural and Biological Engineering  
Purdue University  

GitHub: `mbasir25`

---

## Suggested Citation

If you use this repository, workflow, or code, please cite it as:

```bibtex
@misc{basir_vi_yield_prediction,
  author = {Basir, Md. Samiul},
  title = {VI for Yield Prediction using Remote Sensing and Phenology},
  year = {2022},
  publisher = {GitHub},
  url = {https://github.com/mbasir25/VI-for-Yield-Prediction-remotesensing-phenology-}
}
```

---

## Disclaimer

This repository is intended for research and educational purposes. Model predictions should be interpreted carefully and validated with independent data before being used for operational crop-yield forecasting or decision-making.
