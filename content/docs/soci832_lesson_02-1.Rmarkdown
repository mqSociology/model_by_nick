---
title: "SOCI832 Lesson 2.1: Univariate analysis"

lastmod: 2018-12-28T00:00:00.000Z

draft: false
toc: true
type: docs

linktitle: "2.1 Univariate analysis"
menu:
  docs:
    parent: SOCI832
    weight: 30
---

{{% toc %}}

Last updated: 27 Dec 2018

*_Author_: Nicholas Harrigan*

# Overview

### What does this lesson deal with?

* Introduces methods for making univariate statistics in R
 
### What does this teach me about R? 

1. Basic commands for univariate statistics
2. Handy packages and tricks for getting your data in publishable formats (e.g. table out; summary stats; etc.)

### What does this teach me about statistics?

Honestly most of the statistical knowledge is assumed as it can be found in a simple google search or any simple stats textbook.

### Tips, Comments, Trivia

The introduction to the package summarytools, continues into the next script (Week 2, Part 2), because one of the tools creates cross-tabulations of two variables (i.e. a bivariate cross tabulation)

### Stuff you need to do before starting

1) Change this to your working directory

```{r eval = FALSE}
setwd("C:/G/2018, SOCI832/Datasets/AES 2013/")
```

2) Put the file "elect_2013.csv" into that folder. This file can be found here: 
<https://mqsociology.github.io/learn-r/soci832/elect_2013.csv>

3) Keep the codebook openned in a browser so you can refer to it when you need it. The codebook is here:
<https://mqsociology.github.io/learn-r/soci832/codebook%20aes%202013.html>

4) Import the data

```{r}
library(readr)
elect_2013 <- read_csv("elect_2013.csv") # loads dataset
```

5) Remove the first column which is not needed.

FYI the command works by saying "copy all columns except the first".

_NOTE: Only run this command once after you run the 'read.csv' command. Each time you run it, it deletes the first variable._ 

```{r}
elect_2013 <- elect_2013[,2:ncol(elect_2013)]
```

# Lesson 1: Basic Univariate Functions
This section introduces the basic functions for running univariate statistics. In most cases there are are easier commands to run, but we will learn about those later.

## 1.1 Mean
Mean is just the sum of a variable/number of cases. There is a built in function that calcuates the mean

```{r}
mean(elect_2013$likelihood_vote)
```

Oh damn! We got ```[1] NA```

This happens because there are missing values in the variable 'likelihood_vote'. Why are there missing values? Because some people didn't answer that survey question. 

There is an easy way to deal with this. We add one more argument* to the function** 'mean()'. The argument is 'na.rm = TRUE'

```{r}
mean(elect_2013$likelihood_vote, na.rm = TRUE)
```

We can get the median with:

```{r}
median(elect_2013$likelihood_vote, na.rm = TRUE)
```

We can also extract various quartiles and quintiles. The default setting gives us min, max, 25%, 50%, and 75%

```{r}
quantile(elect_2013$likelihood_vote, na.rm = TRUE)
```

We can also specify particular probablities with the argument 'probs ='

```{r tidy=TRUE}
quantile(elect_2013$likelihood_vote, 
         na.rm = TRUE, probs = c(0,0.2,0.4,0.6,0.8,1))
```

NOTE: when we provide the 'probs' argument, we need specify the set of numbers inside the function 'c()'.

'c()' is a function in R which joins together a set of numbers and makes them into a vector. 

Vectors are particular data type, but in essence they are set of numbers, like row or column.

The thing to note is just that some functions and some arguments in R will need numbers passed to them is special ways. Some will need them passed in 'c()', others will need them passed in double inverted commas "", and some other formats. The main thing at this stage is to know to look out for this, as they are the sort of typo that will cause bugs in your code, and frustrate you for hours as you try to work out why your code isn't working.

## 1.2 Variance and standard deviation

Variance and standard deviation are calculated with very simple commands: var() and sd()

```{r}
var(elect_2013$likelihood_vote, na.rm = TRUE)
```

```{r}
sd(elect_2013$likelihood_vote, na.rm = TRUE)
```

Let's now compare out results with those of McAllister 2016. If you haven't already, download the article from here: <https://doi.org/10.1080/13676261.2016.1154936>

Once you have downloaded it go and look at Appendix 1 and look at the mean of the first variable 'Likelihood of voting' and compare the mean reported with the mean we calculated.

You will notice that the mean which they report (4.20) is different to ours (4.362201).

Why do you think this is?

One reason is that McAllister 2016 reports 'weighted means'. 

What does that mean? 

It means that the cases (i.e. the respondants in the survey) are given different weightings when calcuating statistics. 

Why does he do this? 

Because the survey aims to be representative of the Australian population but has the problem that the people who did the survey are systematically different from the Australian population? How? We don't know exactly, but generally  there tends to be overrepresentation of educated and older persons in surveys.

Regardless, McAllister and the people who collected this data have calculated a number that represents how much we should weight each person in this survey. People who from over-represented demographics will have a value for the variable 'weight' below 1, e.g. 0.6 While those who are from under-represented demographics will have higher weights (up to 6).

We are lucky that many of the statistical functions in R have a way to incorporate weighting into their calculations. 

For mean, there is a special command 'weighted.mean'. Note that we use three arguments: 
* the variable we are calculating the mean on 
* the weighting variable 
* the command to remove cases with missing values.

```{r}
weighted.mean(elect_2013$likelihood_vote, 
              w = elect_2013$weight, na.rm =  TRUE)
```

What weighted mean do you get? Is it similar to that reported in McAllister, Appendix 1 (he reports 4.20)?

# Lesson 2: Basic Univariate Visualisation

This section we are going to learn one simple univariate visualisation:  the histogram.

A histogram is one of the most basic and fundamental graphs in statistics. It graphs only one variable. The x-axis of a histogram is the various values of the variable, while the y-axis is the count of cases (units of analysis) that have each value of the variable.  Variables displayed in histograms must be discrete (i.e. they need to have a limited number of values, eg. 1,2,3,...). They can't be perfectly continuous (e.g. 1.00123, 1.3233, etc).  One of the ways which we deal with the need for discrete variables in a histogram is that we often create 'bins'. Bins collect cases (units of analysis) who all have a  value for the variable that is in a particular range. 

We actually use 'bins' in lots of different statistical applications. For example, say we have a survey question where respondents have given their age (between 0 and 120). Often we transform that into a smaller number of variables such as 0-19, 20-39, 40-59, etc. Each of these categories,  e.g. 0-19, is a 'bin'.

R has a built in histogram command (called 'hist()'), but when I have been testing it, and reading about it, I've found that there  is some problems that make it unreliable, so I'm going to  teach another simple method.

We are going to use two commands: 'table()' and 'barplot()'.

## Histogram Example 1: Likelihood of voting

First, let's see what table() does

```{r}
table(elect_2013$likelihood_vote)
```

So of the 3955 respondents to our survey, 126 said that they would definitely not vote if voting was voluntary, while 2574 said they definitely would vote.

We can visualise this with the the 'barplot()' function:

```{r}
barplot(table(elect_2013$likelihood_vote))
```

in the 'Plots' windown on the bottom right corner of  RStudio, you will see these five numbers graphed as a histogram.

Often we want to graph a histogram as a probability density graph, where the y-axis is the proportion of  cases in each bin. To do this we need to confirm the number of cases (removing those that are missing) The number of cases can be calculated with the following code: 

```{r}
cases <- length(elect_2013$likelihood_vote
            [!is.na(elect_2013$likelihood_vote)])
```

To see how many cases there are, just type 'cases' and view the contents of the cases variable.

```{r}
cases
```

There are 3926 cases (from a total of 3955 people who did the survey).

To display the histogram as a probablity density, we just run:

```{r}
barplot(table(elect_2013$likelihood_vote)/cases)
```

#### Histogram Example 2: Political knowledge

We are now going to move on to a few slighly more complex examples. 

Let's start by visualising the histogram for the 'political knowledge' variable (from 0 to 10), which represents the number of Australian politics quiz questions the survey respondent got right.

```{r}
barplot(table(elect_2013$pol_knowledge))
```

We can see that there is pretty even distribution of respondents across the levels of answers, but only a very small number (around 130) got 10/10 for the quiz.

Imagine that for some reason we actually wanted to only have five bins, 0-1, 2-3, 4-5, etc. 

How do we do this?

First we create a variable called 'bins', using one of two commands: either 'seq()' or 'c()'

seq() allows us to specify the min and max, and then the width of bins. The following commands creates bins between 0 and 10, with a width of 2:

```{r}
bins <- seq(0, 10, by=2)
```

You could also make the bins with c(). With c() you just specify the exact bins

```{r}
bins <- c(0,2,4,6,8,10)
```

We then go through two steps to make a histogram based on these bins. We first use 'cut()' to create a new variable called 'x'. This creates a variable, x, which the values are simply the bins (so a person who had got one quiz question right, and had a 1 for 'political knowledge' would have that '1' replaced with the name of the 'bin', in this case "(0,2]")

We then plot x as done previously with barplot() and table()

```{r}
x <- cut(elect_2013$pol_knowledge, breaks=bins)
barplot(table(x))
```
    
#### Histogram Example 3: Age

We will do one quick last example with age. 

Let's look at the age histogram, with bins just one year wide:

```{r}
barplot(table(elect_2013$age))
```

Let's now look at it, with the variable divided into bins of width 5 years.

```{r}
bins <- seq(0, 110, by=5)
x <- cut(elect_2013$age, breaks=bins)
barplot(table(x))
```
    
And as a probablity density graph:

```{r}
cases <- length(elect_2013$age
            [!is.na(elect_2013$age)])
barplot(table(x)/cases)
```
    
There is lots more you can do with 'barplot()'. A simple extension is to give the graph colour. 

```{r}
barplot(table(x)/cases, col="Red")
```

There are also lots of more powerful and beautiful graphs that can be made in R. Later in semester Young will teach you some of these techniques. If you want to teach yourself one place to start for graphing univariate statistics with the package ggplot2 is here:
<http://www.sthda.com/english/articles/32-r-graphics-essentials/133-plot-one-variable-frequency-graph-density-distribution-and-more/#density-plots>

# Lesson 3: Univariate statistics with summarytools

summarytools is a powerful package that allows users to quickly and easily generate tables that can be cut and pasted directly into papers, presentations, and/or codebooks. 

### RESOURCES

Excellent introduction by the author:
<https://cran.r-project.org/web/packages/summarytools/vignettes/Introduction.html>

The full manual:
<https://cran.r-project.org/web/packages/summarytools/summarytools.pdf>

### WHY USE IT? 

Because it quickly and easily generates beautiful tables that you will need for almost every paper, presentation, or codebook that you write.

### CORE FUNCTIONS: freq(), ctable(), descr(), dfSummary().

### TIPS:

* for beginners it is almost always easier to use html output, rather than rmarkdown;
* when writing code, send files to browser so you can see your output immediately;
* when you are ready to publish, you can (1) screenshot; (2) cut and paste the tables into excel or word; or (3) save as a html file, using the 'file=' argument in the print() function.

```{r}
install.packages("summarytools", 
                 repos = 'http://cran.rstudio.com') 
# install the package (once, and then # it out)
        library(summarytools) # load the library
```

## LESSON 3.1: freq() function

This function gives the count and proportions of each value of a variable. Note that it only takes a single variable as input (not a whole dataframe).

### 3.1.1 Don't do this

You almost NEVER want to run 'summarytools' functions WITHOUT putting them inside the 'print()' function and sending them to the browser. To understand why, run the next line and look at the ugly output sent to the console.

```{r}
freq(elect_2013$pol_knowledge)
```

OK, it's not terrible, but you wouldn't want to paste that straight into an article or presentation.

### 3.1.2 Basic command

Now let's run the same command, but we will put it inside a print() function, and send it to browser.

```{r eval=FALSE}
print(freq(elect_2013$pol_knowledge), 
      method = 'browser')
```

A table should have openned in your browser (such as Chrome Safari, Internet Explorer, Firefox, or Edge) and look like the one below.

```{r echo=FALSE}
print(freq(elect_2013$pol_knowledge), 
      method = 'render')
```

Notice how it has a much more attractive layout.

### 3.1.3 Settings

There are a few different settings we can use to make this table prettier.

We can omit the headings
           
```{r eval=FALSE}
print(freq(elect_2013$pol_knowledge,
      omit.headings = TRUE), 
      method = 'browser')
```

```{r echo=FALSE}
print(freq(elect_2013$pol_knowledge,
      omit.headings = TRUE), 
      method = 'render')
```

We can omit the totals

```{r eval=FALSE}
print(freq(elect_2013$pol_knowledge, 
        totals = FALSE), 
        method = 'browser')
```

We can omit the reporting of NAs (missing)

```{r eval=FALSE}
print(freq(elect_2013$pol_knowledge, 
       report.nas = FALSE), 
       method = 'browser')
```

We can remove the footnote

```{r eval=FALSE}
print(freq(elect_2013$pol_knowledge, 
       report.nas = FALSE), 
       method = 'browser', footnote = NA)
```

### 3.1.4. Putting it all together

And we can put all that together

```{r eval=FALSE}
print(freq(elect_2013$pol_knowledge, 
       omit.headings = TRUE, 
       totals = FALSE, 
       report.nas = FALSE), 
       method = 'browser', footnote = NA)
```


```{r echo=FALSE}
print(freq(elect_2013$pol_knowledge, 
       omit.headings = TRUE, 
       totals = FALSE, 
       report.nas = FALSE), 
       method = 'rmarkdown', footnote = NA)
```

### 3.1.5. Save to file

If we want to save this to a file, then we use the same command, but replace the 'method =' argument with a 'file =' argument, as below:

```{r}
print(freq(elect_2013$pol_knowledge, 
       omit.headings = TRUE, 
       totals = FALSE, 
       report.nas = FALSE), 
       file = "pol_know_freq.html", footnote = NA)
```

and if you go to your default folder (set at the beginning of this session), then you will find the file 'pol_know_freq.html'. If you double click on it then it will open in a browser.

## Lesson 3.2: descr() function

This function calculates a wide range basic univariate statistics such as mean, standard deviation, min, max, skewness, etc.  This function can calcuate these on all variables in a dataset meaning it can be used to summarise an entire dataset very quickly. This command is great for doing a descriptive statistics table - a table which is expected in almost all academic papers.

This is the simplest form of the command

```{r eval=FALSE}
print(descr(elect_2013$pol_knowledge), 
      method = "browser")
```

```{r echo=FALSE}
print(descr(elect_2013$pol_knowledge), 
      method = 'rmarkdown')
```


However, when reporting variables, we often like them to be presented as the rows, not columns. To change this we used the argument 'transpose'

```{r eval=FALSE}
print(descr(elect_2013$pol_knowledge, transpose = TRUE),
      method = "browser")
```

```{r echo=FALSE}
print(descr(elect_2013$pol_knowledge, transpose = TRUE),
      method = 'rmarkdown')
```

Generally we don't want all these statistics, so we can limit the statistics reported with the argument 'stats'.

Note: I've also removed the headings and footnote.

```{r eval=FALSE}
print(descr(elect_2013$pol_knowledge, 
      omit.headings = TRUE,
      stats = c("mean", "sd", "min", "max"), 
      transpose = TRUE),
      method = "browser",
      footnote = NA)
```

```{r echo=FALSE}
print(descr(elect_2013$pol_knowledge, 
      omit.headings = TRUE,
      stats = c("mean", "sd", "min", "max"), 
      transpose = TRUE),
      method = 'rmarkdown', 
      footnote = NA)
```

Note that when using the stats argument, we put the names of the stats we want using the "c()" function. If you want to know the commands for each of the different stats, then look at the help file (type ?descr)

However, remember that the data from the Australian Electoral Study needs to be weighted to account for the difference between the sample and the population. We can do this with the argument 'weights'

```{r eval=FALSE}
print(descr(elect_2013$pol_knowledge, 
      omit.headings = TRUE,
      stats = c("mean", "sd", "min", "max"), 
      transpose = TRUE,
      weights = elect_2013$weight),
      method = "browser", 
      footnote = NA)
```

```{r echo=FALSE}
print(descr(elect_2013$pol_knowledge, 
      omit.headings = TRUE,
      stats = c("mean", "sd", "min", "max"), 
      transpose = TRUE,
      weights = elect_2013$weight),
      method = 'rmarkdown', 
      footnote = NA)
```

The real power of descr() is that it can calculate these statistics for all variables in a dataset. We can do this by just calling descr() on the data frame.

**Note:** In this case, I've limited the output to this webpage to the first 10 variables, so that it doesn't take up too much space.

```{r eval=FALSE}
print(descr(elect_2013, 
      omit.headings = TRUE, 
      stats = c("mean", "sd", "min", "max"),
      transpose = TRUE, 
      weights = elect_2013$weight), 
      method = "browser", footnote = NA)
```

```{r echo=FALSE}
print(descr(elect_2013[,1:10], 
      omit.headings = TRUE, 
      stats = c("mean", "sd", "min", "max"),
      transpose = TRUE, 
      weights = elect_2013$weight), 
      method = 'rmarkdown', footnote = NA)
```

## Lesson 3.3: dfSummary() function

While the 'descr()' function is good for making publication quality tables, the dfSummary() function  is more for the private use of the data analyst.  dfSummary() is the kind of function you use to 'get a quick feel' for  your data. It lets you quickly see the number of missing values and a rough histogram of the values and also see the percent of cases of each value. This can be very useful when you are trying to assess the quality of data, or looking for interesting patterns you may want to explore later.

The following command gives a summary of just one variable:

```{r eval=FALSE}
print(dfSummary(elect_2013$pol_knowledge), 
      method="browser")
```

```{r echo=FALSE}
print(dfSummary(elect_2013$pol_knowledge),
      method='rmarkdown')
```

The next command gives a summary of the entire dataset. For display purposes, I've just shown the first five variables:

```{r eval=FALSE}
print(dfSummary(elect_2013), 
      method='browser')
```

```{r echo=FALSE}
print(dfSummary(elect_2013[,1:5]), 
      method='rmarkdown')
```

**This is the end of the Univariate statistics  R code/ R-script file. The class continues in the code "Week 2, Part 2, Bivariate statistics.R'**

