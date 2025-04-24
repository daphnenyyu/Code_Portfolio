# Portfolio Projects

## Table of Contents

-   Projects

    -   [Assessing mtDNA Variation and Cognitive Function](https://github.com/daphnenyyu/Code_Portfolio?tab=readme-ov-file#assessing-mtdna-variation-and-cognitive-function-midlife) (R, UNIX)

    -   [Behavioral Risk Factor Surveillance System Data Cleaning](https://github.com/daphnenyyu/Code_Portfolio/blob/master/README.md#model-comparison-of-coronary-heart-disease-risk-prediction) (Python)

    -   [Model Comparison of Coronary Heart Disease Risk Prediction](https://github.com/daphnenyyu/Code_Portfolio/blob/master/README.md#model-comparison-of-coronary-heart-disease-risk-prediction) (R)

    -   [Predicting CHD Risk with Convolutional Neural Network](https://github.com/daphnenyyu/Code_Portfolio?tab=readme-ov-file#predicting-chd-risk-with-convolutional-neural-network) (Python)

    -   [Idenitfying F1 Driver Performance Profiles with Clustering](https://github.com/daphnenyyu/Code_Portfolio/blob/master/README.md#idenitfying-f1-driver-performance-profiles-with-clustering) (Python, SQL)


## Projects

### Assessing mtDNA Variation and Cognitive Function Midlife

- **Code:** [CARDIA mtDNA Github](https://github.com/AndrewsLabUCSF/mtDNAhtz_CARDIA)

- **Goal:** To assess if mitochondrial heteroplasmy (mtHz) bruden or haplogroups (mtHg) are associated with cognitive performance in a multiracial midlife cohort

- **Description:** We analyzed the association between mtHz and mtHg with cognitive performance in the Coronary Artery Risk Development in Young Adults (CARDIA) study. Mitochondrial DNA (mtDNA) sequencing data was processed through a Nextflow pipeline with custom Bash script. Associations were analyzed using linear regression and linear mixed models in R. We implemented linear regression models to assess the cross-sectional associations between mtHz and mtHg with z-standardized cognitive performance, adjusting for education, race, age, and sex. Longitudinal analysis was conducted using linear mixed models. Sensitivity analyses, additionally adjusting for social determinants of health (SDOH) or *APOE ε4,* lifestyle variables, and comorbidities were conducted to test the robustness of our findings.

- **Skills:** bash scripting, data analysis, hypothesis testing, post-hoc testing, sensitivity tests, data visualization

- **Technology:** 

    - Nextflow pipeline
    
    - [R] `dyplr`, `ggplot`, `lm`, `lmer`, `effects`, `glht`

- **Results:** mtHg, not mtHz, is associated with cognitive function at midlife. Results remained robust in sensitivity analysis.



### Model Comparison of Coronary Heart Disease Risk Prediction 

- **Code:** [Clean_Data.ipynb](CHD_risk/Clean_Data.ipynb), [Model_Comparison.Rmd](CHD_risk/ML_model_comparison/ML_Model_Comparison.Rmd)

- **Goal:** Create a cost-effective and personalized machine learning model for predicting coronary heart disease (CHD) risk using non-clinical data

- **Description:** This project aims to predict coronary heart disease (CHD) risk using data from the 2015 Behavioral Risk Factor Surveillance System (BRFSS) survey. Key risk factors for CHD, including demographic, socioeconomic, health, and behavioral variables, were used to build predictive models. The project focused on balancing the dataset and applying machine learning techniques such as decision trees, random forests, and XGBoost to improve prediction accuracy and interpretability.

- **Skills:** downsampling, machine learning, model comparison, metrics calculation from confusion matrix, data visualization

- **Technology:** 

    - [Python] dictionary mapping, `pandas`, `matplotlib`, `seaborn`

    - [R] `dyplr`, ,`table1`, `rpart`, `ranger`, `caret`, `xgboost`, `rocit`, `ciAUC`, `kable`, `ggplot`

- **Results:**

    -   XGBoost was identified as the best-performing model, with \~75.4% accuracy, 73.5 % precision, 79.5% recall and 76.3% F1-score. Recall was the the most crucial metric, indicating its potential as a pre-clinical screening model for early CHD risk detection and intervention.
    
    -   Feature importance analysis showed that age, hypertension, and employment were among the most important predictors across models.


### Predicting CHD Risk with Convolutional Neural Network 

- **Code:** [CNN.ipynb](CHD_risk/CNN/CNN.ipynb)

- **Goal:** Designed a convolutional neural network (CNN) to predict coronary hear disease

- **Description:** CNN model was taken from a manuscript that attempted to use the CNN model to predict stroke risk with tabular EHR data. Model was adjusted to take in 3x5 tensor inputs instead of a 2x5 tensor inputs, with subsequent adjustments. 

- **Skills:** CNN, model evaluation

- **Technology:** 

    - [Python] `pandas`, `matplotlib`, `PyTorch`, `sklearn`

- **Results:** Final CNN has a stable performance in precision, recall, F-score, accuracy, miss rate, and fall out rate. 


### Idenitfying F1 Driver Performance Profiles with Clustering

- **Code:** [F1_clustering](F1_clustering)

- **Goal:** 

    1. Explore data and create a dataset to be used in unsupervised machine learning 
    2. Identify performance profiles of F1 drivers

- **Description:** This project aims to use K means clustering to identify driver performance profiles. 

- **Skills:** database design, variable engineering, hyperparameter tuning, data interpretation and visualization

- **Technology:**

    - [SQL] Joins, Common Table Expression, Temp Tables, Windows Functions, Aggregate Functions
    
    - [Python] `KMeans`, `StandardScaler`, `PCA`, `matplotlib`

- **Results:** Using Kmeans clustering, we catagorized drivers into 6 categories : Top Performers, Above Average Veterans, Underdogs, Mediocre Drivers, Passive Drivers, and Worst Drivers. 


