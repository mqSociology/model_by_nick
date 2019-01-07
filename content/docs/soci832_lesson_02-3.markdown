---
title: "SOCI832 Lesson 2.3: Regression in R"

lastmod: 2019-01-07T00:00:00.000Z

draft: false
toc: false
type: docs

linktitle: "2.3 Linear Regression"
menu:
  docs:
    parent: SOCI832
    weight: 40
---

{{% toc %}}

Last updated: 7 Jan 2019

*_Author_: Nicholas Harrigan*

# Stuff you need to do before starting 

### 1) Set your working directory

    setwd("C:/G/2018, SOCI832/Datasets/AES 2013/") 

### 2) Put the file "elect_2013.csv" into that folder This file can be found here:
<https://mqsociology.github.io/learn-r/soci832/elect_2013.csv> 

### 3) Keep the codebook openned in a browser so you can refer to it when you need it. The codebook is here: 
<https://mqsociology.github.io/learn-r/soci832/codebook%20aes%202013.html>

### 4) Import the data


```r
elect_2013 <- read.csv("elect_2013.csv") # loads dataset 
```

### 5) The next command (below) gets rid of the first column which is not needed. 
FYI the command works by saying  "copy all columns except the first". 

**NOTE:** Only run this command **ONCE** (after you run the 'read.csv' command). 

If you run the next line of coded multiple times, each time you run the code it will delete whatever the first variable is (i.e. the first time it gets rid of a not needed column, the second time you run it it deletes the first variable, the second time you run it it deletes the second variable, etc.) 


```r
elect_2013 <- elect_2013[,2:ncol(elect_2013)]
```

# 1. Linear Regression

This section shows how to run basic linear regression models.

So far we have looked at the relationship between two variables - correlations and comparisons of means. However, often  we want to look at the relationship between three or more variables. 

A linear regression is one model - and probably the most popular model - for exploring the relationship between three or more variables. 

A linear regression has a number of fundamental characteristics, including: 

* there is one outcome (dependent) variable 
* which is continuous (i.e. not a binary, or categorical variable) 
* the predictor (independent) variables are either binary (0/1) or continious (they are not categorical)

Let's use a silly example - because it is memorable. Say we are interested in knowing how many time a patron of a bar visits the rest room in an evening. And supposing we have some ethical way to measure this and collect the data on 100 people who are in  this busy bar on a saturday night. 

In this case, our dependent variable is 'visits to the rest room', and it might vary between 0 and 10. 

And the question we ask ourselves is - what cause or predicts the number of visits? 

Well we might think that there are two important variables (1) the number of hours the person has been in the bar; and (2) the number of drinks the person has had at the bar. 

To express this as a line we could say that, on average:

```{}
    Rest room visits = B1*hours_at_bar + B2*drinks + C
```

And we have three 'coefficients' which we need to try to estimate. These are 
* B1 - which is the slope of the relations between hours_at_bar and rest_room_visits. 
* B2 - the slope of the relationship between drinks and vists 
* C - the constant or y-intercept, which is the number of rest_room_visits (on average) for someone with zero for the other two variables - i.e. who just arrive at the bar (hours_at_bar = 0) and has not had a drink yet (drinks = 0).

Now if we want to try to work out what B1, B2, and C are we would first need to get a whole lot of data.  Well we are lucky, because we have collected data from 100 people on a Saturday night at a local Irish Pub. 

The data looks like this, with four columns 

| Patron | Visits | Hours | Drinks |
|:------:|:------:|:-----:|:------:|
|   01   |   3    |  1    |   4    |
|   02   |   1    |  0.5  |   1    |
|   03   |   1    |  2    |   1    |
|   04   |   6    |  4    |   4    |
|   05   |   9    |  5    |   6    |
|   06   |   2    |  3    |   2    |
|   07   |   1    |  0    |   1    |
|   08   |   0    |  2    |   0    |
|   09   |   15   |  9    |   13   |
|   10   |   4    |  2    |   3    |

  ... AND SO ON FOR 100 people ... 

We can ignore the first colum (patron) which is just an identifing column. 

Now we could, if we wanted to, plot each person on a chart, where the y axis is visits, and the x axis is one of the predictor/independent variables (e.g. hours). 

If we did this we would have a very messy graph but there would be a general tendency for visits to go up, and number of hours at the pub went up.

In a linear regression, the statistical software calculates the 'line of best fit' - meaning the line that is as close as possible to all persons - all the dots on our graph. 

This line of best fit can then be described with the three coefficients discussed earlier: B1, B2, and C.

B1 and B2 are 'slopes' - which you would have learnt about in year 8 mathematics. Remember the equation y = bx + c Well b is the slope, and c is the intercept, and it is the same in linear regression models. 

Exactly how the statistical packages calcuate the line of best fit is not our concern, and it involves some complex maths. What matters to us as social scientists is that - so long as basic assumptions about the nature of the data are true, and the statistical package is sound - these models can estimate the relationship between various causes - independent variables - and a dependent variable we care about. 

So let's say we did analyse our data, and we got a value for B1 (of 0.5), B2 (of 0.8), and C (of 0.2). What does this mean? It means that - on average - for each one hour a person spends at the bar the will visit the rest room 0.5 times. For each drink they have, they will visit the rest room 0.8 times, and for someone who stays for zero hours and has no drinks, they will visit the rest room 0.2 times.

Let's run a model in R ourselves now, and see how it is done with a real dataset - the dataset from McAllister 2016. 

## Example 1: Political Knowledge

Let's start with a very simple model of political knowledge, looking at the impact of being 18-24 years of age (or not) on political knowledge.

Now remember, our political knowledge scale goes from 0 to 10, and each one point represents one quiz question the person go right (out of a total of 10 questions)  

The independent variable we are using to use is a binary variable (also called a dummy variable) which is equal to 1 if the person in aged 18-24 years of age or zero otherwise.

To run a linear regression model, we need to run two lines of code. The first run's the model, with the command 'lm()'. Inside the brackets we put the dependent variable and then a tilde ( ~ ) and then the independent variable/s (if we have multiple independent variables, we separate them with plus (+) sign).

We send this model to a variable to hold it, and then in the second line we call the summary command to give us a very useful summary of the model. when you are ready, run the following commands:


```r
model1 <- lm(elect_2013$pol_knowledge ~ elect_2013$age_18_24)
summary(model1)
```

```
## 
## Call:
## lm(formula = elect_2013$pol_knowledge ~ elect_2013$age_18_24)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.8545 -2.5405  0.1455  2.1455  6.4595 
## 
## Coefficients:
##                      Estimate Std. Error t value Pr(>|t|)    
## (Intercept)           4.85451    0.04792 101.312  < 2e-16 ***
## elect_2013$age_18_24 -1.31396    0.19957  -6.584  5.2e-11 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.887 on 3849 degrees of freedom
##   (104 observations deleted due to missingness)
## Multiple R-squared:  0.01114,	Adjusted R-squared:  0.01088 
## F-statistic: 43.35 on 1 and 3849 DF,  p-value: 5.198e-11
```

Now this code might look confusing, but it will become easy - with some practice reading it. 

Remember the rule "First look at the p-value". 

However, for models (e.g. regression models like this), we aren't that interested in the p-value for the model overall. What you should look at is the p-value for the coefficients. and for some reason in R these p-values are listed under the heading "Pr(>\|t\|)". Why? I don't know.

Anyway, so we look at the two numbers under "Pr" and they are both very small numbers (with 11 and 16 zeros after the decimal point), which means that p < 0.05, and so they are significant and we can interpret the coefficients.

What do the coefficients say? Well lets start with the first that is just called "(Intercept)". This is the C which we discussed in the earlier section, as in the value of y, when all the x's are equal to zero. 

In this case, the intercept has a value of 4.85, which means that people who have a zero for the variable 18-24 year old (i.e. everyone else) have a mean score on the political knowledge quiz of 4.85.

And now let's look at the second coefficient - the first variable - which is -1.31. So this means persons who are 18-24 years of age, get, on average, 1.31 less questions correct in the quiz than persons who are older. 

So, in essence, this model says that 25+ year olds get on average 4.85 quiz questions right, and 18-24 year olds get 3.54 question right. 

# 2. R-squared and Adjusted R-squared

What else can this model tell us? Well towards the bottom of the model you can see that it gives a value for the R-squared and the Adjusted R-squared. 

We were introduced to the notion of an R-squared in the last set of notes (Week 2, Part 2 - correlation), because R-squared is literally the square of Pearson's R.   

We learnt in that that R-squared is an measure of effect size, and that it can it represents the proportion (percentage) of variation in the dependent variable that MIGHT be able to be explained by the independent variable/s.

We also said that roughly speaking we can look at R-squared and say that: 

* small effect size is 0.01-0.04 (i.e 1%-4%)
* medium effect size is 0.09-0.16 (i.e.9%-16%)
* large effect size is 0.25+ (ie. 25%+)

So given this, what does the output for our regression model say? It says that the multiple R-squared is 0.01. So basically the difference between 18-24 year olds and the rest of the population explains about 1% of the variation in political knowledge - at best!

## Example 2: A more complex model 

So let's now make a more complex model of political engagement. I will just write the model out below. You should understand it's meaning: 


```r
    model2 <- lm(elect_2013$pol_knowledge ~ 
               elect_2013$age_18_24 
             + elect_2013$internet_skills
             + elect_2013$female
             + elect_2013$tertiary_ed
             + elect_2013$income_quintiles
             + elect_2013$aust_born
             + elect_2013$interest_pol)
    summary(model2)
```

```
## 
## Call:
## lm(formula = elect_2013$pol_knowledge ~ elect_2013$age_18_24 + 
##     elect_2013$internet_skills + elect_2013$female + elect_2013$tertiary_ed + 
##     elect_2013$income_quintiles + elect_2013$aust_born + elect_2013$interest_pol)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -7.0520 -1.8193  0.0145  1.7488  8.0475 
## 
## Coefficients:
##                             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                  7.25724    0.16747  43.335  < 2e-16 ***
## elect_2013$age_18_24        -0.72437    0.18756  -3.862 0.000115 ***
## elect_2013$internet_skills   0.11722    0.03581   3.273 0.001073 ** 
## elect_2013$female           -0.74846    0.08348  -8.965  < 2e-16 ***
## elect_2013$tertiary_ed       0.87490    0.09883   8.852  < 2e-16 ***
## elect_2013$income_quintiles  0.13042    0.03345   3.899 9.84e-05 ***
## elect_2013$aust_born         0.04310    0.09517   0.453 0.650638    
## elect_2013$interest_pol     -1.56222    0.05367 -29.108  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.416 on 3423 degrees of freedom
##   (524 observations deleted due to missingness)
## Multiple R-squared:  0.2926,	Adjusted R-squared:  0.2912 
## F-statistic: 202.3 on 7 and 3423 DF,  p-value: < 2.2e-16
```
    
If you run this model and look at the output you will see that it is a much better model, with nearly 1/3 of all political knowledge explainable by the model itself. One question you might have is: "Which of these varibles is most important?"

This is essentially an effect size question. There are two ways of answering this question: the first uses R-square; and the second Standardised regression coefficients.

We can measure the effect size of a particular variable by looking at the change in the R-squared when we run the model with and without the variable.

For example, let's run exactly the same model as model 2 but we will drop out interest in politics:


```r
    model3 <- lm(elect_2013$pol_knowledge ~ 
               elect_2013$age_18_24 
             + elect_2013$internet_skills
             + elect_2013$female
             + elect_2013$tertiary_ed
             + elect_2013$income_quintiles
             + elect_2013$aust_born)
    summary(model3)
```

```
## 
## Call:
## lm(formula = elect_2013$pol_knowledge ~ elect_2013$age_18_24 + 
##     elect_2013$internet_skills + elect_2013$female + elect_2013$tertiary_ed + 
##     elect_2013$income_quintiles + elect_2013$aust_born)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -6.8976 -2.1343  0.0906  2.1452  6.6690 
## 
## Coefficients:
##                             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                  4.25792    0.14715  28.936  < 2e-16 ***
## elect_2013$age_18_24        -1.52965    0.20706  -7.387 1.87e-13 ***
## elect_2013$internet_skills   0.16802    0.03986   4.215 2.56e-05 ***
## elect_2013$female           -1.08989    0.09213 -11.830  < 2e-16 ***
## elect_2013$tertiary_ed       1.15270    0.10969  10.509  < 2e-16 ***
## elect_2013$income_quintiles  0.16298    0.03722   4.379 1.23e-05 ***
## elect_2013$aust_born         0.10165    0.10592   0.960    0.337    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.697 on 3435 degrees of freedom
##   (513 observations deleted due to missingness)
## Multiple R-squared:  0.1179,	Adjusted R-squared:  0.1163 
## F-statistic: 76.48 on 6 and 3435 DF,  p-value: < 2.2e-16
```
    
What is the R-squared (or actually Adjusted R-squared - this is a better measure)? It is around 0.11, meaning that  the explanatory power of the model has dropped from explaining around 30% of variation in political  knowledge, to only explaining approximately 10%.

We can also use a second method to measure effect size: standardized regression coefficients.

# 3. Standardised Coefficients - Beta

The other method that is commonly used to measure effect size and to compare effect size across independent variables in a regression model is 'standardised regression coefficients'. 

At some level these are quite simple to understand. To estimate standardised coefficients, all of the variables are standardised (also called normalised) so that their mean is zero and their standard deviation is 1. And then they are put in the regression model.

The effect of this is to make the coefficients all measured in the same units: Each coefficient is a number that represents "The number of standard deviations change in y (the dependent variables) are predicted/caused by a one standard deviation change in each X (each independent variable)."

## Example 2 (continued)

Let's estimate the standardised regression coefficients - which are also called 'standardized betas' or just 'betas' - for model 2.

To do this we need to install and then load the package "lm.beta".


```r
    install.packages("lm.beta", repos = 'http://cran.rstudio.com')
```

```
## Installing package into 'C:/Users/nickh/Documents/R/win-library/3.5'
## (as 'lib' is unspecified)
```

```
## package 'lm.beta' successfully unpacked and MD5 sums checked
## 
## The downloaded binary packages are in
## 	C:\Users\nickh\AppData\Local\Temp\RtmpAF5C4Y\downloaded_packages
```

```r
    library(lm.beta)
```

```
## Warning: package 'lm.beta' was built under R version 3.5.2
```

and then the command is simple: we just run lm.beta() before we run summary (and after we have run lm())


```r
    model2b <- lm.beta(model2)
    summary(model2b)
```

```
## 
## Call:
## lm(formula = elect_2013$pol_knowledge ~ elect_2013$age_18_24 + 
##     elect_2013$internet_skills + elect_2013$female + elect_2013$tertiary_ed + 
##     elect_2013$income_quintiles + elect_2013$aust_born + elect_2013$interest_pol)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -7.0520 -1.8193  0.0145  1.7488  8.0475 
## 
## Coefficients:
##                              Estimate Standardized Std. Error t value
## (Intercept)                  7.257238     0.000000   0.167467  43.335
## elect_2013$age_18_24        -0.724365    -0.058174   0.187560  -3.862
## elect_2013$internet_skills   0.117223     0.054972   0.035811   3.273
## elect_2013$female           -0.748458    -0.130416   0.083484  -8.965
## elect_2013$tertiary_ed       0.874900     0.140944   0.098833   8.852
## elect_2013$income_quintiles  0.130415     0.062661   0.033448   3.899
## elect_2013$aust_born         0.043104     0.006551   0.095170   0.453
## elect_2013$interest_pol     -1.562223    -0.431747   0.053669 -29.108
##                             Pr(>|t|)    
## (Intercept)                  < 2e-16 ***
## elect_2013$age_18_24        0.000115 ***
## elect_2013$internet_skills  0.001073 ** 
## elect_2013$female            < 2e-16 ***
## elect_2013$tertiary_ed       < 2e-16 ***
## elect_2013$income_quintiles 9.84e-05 ***
## elect_2013$aust_born        0.650638    
## elect_2013$interest_pol      < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.416 on 3423 degrees of freedom
##   (524 observations deleted due to missingness)
## Multiple R-squared:  0.2926,	Adjusted R-squared:  0.2912 
## F-statistic: 202.3 on 7 and 3423 DF,  p-value: < 2.2e-16
```

```r
    sd(elect_2013$age, na.rm = TRUE)
```

```
## [1] 16.97413
```

```r
    sd(elect_2013$pol_knowledge, na.rm = TRUE)
```

```
## [1] 2.939528
```

This information is identity to the output from a summary of a normally linear regression model, except that it has added the standardised beta coefficients, as the second set of numbers (under the heading 'Standardized').

If we look at these, we can see that the highest beta is for interest in politics, which is -0.43. When assessing effect size, we can ignore the sign (+/-), and a beta of 0.4 is very large.

When thinking about effect size, and beta, a rough rule of thumb is

* small = ~ 0.1 
* medium = ~ 0.2-0.3 
* large = 0.4+

Reading the beta's we can see that the three variables in our model with the largest impact on political knowledge are, in rank order: 

1. Interest in politics 
2. Tertiary education 
3. Gender

*This is the end of the Linear Regression R code/ R-script file. The class continues next week (Week 3), where we learn about logistic regression and also regression diagnostics.*

