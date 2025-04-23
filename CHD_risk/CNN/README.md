# Risk prediction for Coronary Heart Disease 
Dataset downloaded from Kaggle example [Behavioral Risk Factor Surveillance System](https://www.kaggle.com/datasets/cdc/behavioral-risk-factor-surveillance-system/data)

CNN model was adapted from: 
> Soumyabrata Dev, Hewei Wang, Chidozie Shamrock Nwosu, Nishtha Jain, Bharadwaj Veeravalli, and Deepu John, A predictive analytics approach for stroke prediction using machine learning and neural networks, Healthcare Analytics, 2022.


# Methods: 
Code of the model was adjusted to take in 3x5 tensor inputs instead of a 2x5 tensor inputs. Subsequent code was adjusted according to the input shape as well. The model contains the following layers: 

- torch.Size([32, 1, 3, 5]) - First convolutional layer with ReLu activation
- torch.Size([32, 1, 3, 5]) - Second convolutional layer with ReLu activation
- torch.Size([32, 8, 1, 4]) - A flatten layer 
- torch.Size([32, 32]) - First linear layer with Relu activation
- torch.Size([32, 16]) - Second linear layer with Sigmoid activation

# Results 
## CNN performance metrics for each repeat 

|               |   Repeat 1 |   Repeat 2 |   Repeat 3 |   Repeat 4 |   Repeat 5 |   Average |
|:--------------|-----------:|-----------:|-----------:|-----------:|-----------:|----------:|
| Precision     |   0.802118 |   0.800131 |   0.800656 |   0.8      |   0.796272 |  0.799835 |
| Recall        |   0.696152 |   0.703619 |   0.701321 |   0.705342 |   0.71166  |  0.703619 |
| F-score       |   0.745387 |   0.748778 |   0.747704 |   0.749695 |   0.751592 |  0.748631 |
| Accuracy      |   0.766695 |   0.768385 |   0.767822 |   0.768949 |   0.769231 |  0.768216 |
| Miss Rate     |   0.194414 |   0.189219 |   0.190826 |   0.187981 |   0.183883 |  0.189264 |
| Fall out rate |   0.165376 |   0.169248 |   0.168142 |   0.169801 |   0.175332 |  0.16958  |

## Evaluation: Loss and Accuracy Plots
![Training and Validation Accuracy](plot/epochs.png)

# Limitations

## Outcome Variable

![imbalanced](plot/imbalanceddata.png)

![balanced](plot/balanceddata.png)

The data had an imbalance between those that have coronary heart disease cases and those that do not. Without balancing data, we risk training a model that would predict non-cases better. Selected dataset must be downsampled to create balanced data for training. 

## Sample Size

The original BRFSS data included 441456 questionnaire answers of 330 varaibles. The final balanced data was reduced to 11830 rows of data that included 1 target variable and 15 predictor variables due to unanswered questtions and excluded categories in some variables. 

## Kernel Size

Kernel size of the second convolutional layer was changed from 2x2 to 3x2. 


## Interpretability

Although this project shows that results are reproducible, it is difficult to interpret the model in terms of variable importance to explain the prediction decisions of the model. 

# Decisions & Trade-offs

## Variable recoding

Some variables were regrouped, which may lead to a decrease in resolution. 

1. Hypertension and diabetes: Females who were only told to have the condition during pregnancy and those who were told to be borderline high risk for the conditions were excluded. 

2. Marriage status: Marriage status were grouped into 0 = never married or 1 = have married.

3. Smoking: Smoking was recoded into variable with 3 categories (never smoked, current smoker, former smoker). 

## Learning rate

Learning rate of the optimizer was decreased from 1e-4 in the original model to 1e-5. This may lead to more training time. However, 100 epochs has been shown to be enough to reach a plateau in accuracy. 

