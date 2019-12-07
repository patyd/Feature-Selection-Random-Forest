# Comparing Feature Selection using Random Forest and Recursive Feature Elimination - Random Forest
## Resume
This code was made to compare these two algorithms of feature selection.

## Data set
The original dataset is available on the UCI Machine Learning Repository website: http://archive.ics.uci.edu/ml/datasets/breast+cancer+wisconsin+%28diagnostic%29 

## Data set information
The breast cancer dataset has 30 indenpendent variables that were computed from a digitized image of a fine needle aspirate (FNA) of a breast mass. They describe characteristics of the cell nuclei present in the image. 
The dependent variable indicates the diagnosis (Benign = B and Malign = M). 

## Results
Random Fores:
* Faster than RFE - RF.
* Although model performance was affected by correlated features, results were almost equal.

Recursive Feature Elimination - RF:
* The correlation among the features did not affect the results.
* The model spent much time to calculate the results.

## Conclusion
RF is a good model when the dataset has no correlated features.
RFE-RF is a good model to avoid the correlation problem.It's a good choice when the dataset is not large

## References
* Random Forest in R - Classification and Prediction Example with Definition & Steps: https://www.youtube.com/watch?v=dJclNIN-TPo
* Recursive Feature Elimination: http://ml-tutorials.kyrcha.info/rfe.html

## Author
Patricia Drapal
