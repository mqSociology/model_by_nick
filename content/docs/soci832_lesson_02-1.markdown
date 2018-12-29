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


```r
setwd("C:/G/2018, SOCI832/Datasets/AES 2013/")
```

2) Put the file "elect_2013.csv" into that folder. This file can be found here: 
<https://mqsociology.github.io/learn-r/soci832/elect_2013.csv>

3) Keep the codebook openned in a browser so you can refer to it when you need it. The codebook is here:
<https://mqsociology.github.io/learn-r/soci832/codebook%20aes%202013.html>

4) Import the data


```r
library(readr)
elect_2013 <- read_csv("elect_2013.csv") # loads dataset
```

```
## Warning: Missing column names filled in: 'X1' [1]
```

```
## Parsed with column specification:
## cols(
##   .default = col_integer(),
##   weight = col_double()
## )
```

```
## See spec(...) for full column specifications.
```

5) Remove the first column which is not needed.

FYI the command works by saying "copy all columns except the first".

_NOTE: Only run this command once after you run the 'read.csv' command. Each time you run it, it deletes the first variable._ 


```r
elect_2013 <- elect_2013[,2:ncol(elect_2013)]
```

# Lesson 1: Basic Univariate Functions
This section introduces the basic functions for running univariate statistics. In most cases there are are easier commands to run, but we will learn about those later.

## 1.1 Mean
Mean is just the sum of a variable/number of cases. There is a built in function that calcuates the mean


```r
mean(elect_2013$likelihood_vote)
```

```
## [1] NA
```

Oh damn! We got ```[1] NA```

This happens because there are missing values in the variable 'likelihood_vote'. Why are there missing values? Because some people didn't answer that survey question. 

There is an easy way to deal with this. We add one more argument* to the function** 'mean()'. The argument is 'na.rm = TRUE'


```r
mean(elect_2013$likelihood_vote, na.rm = TRUE)
```

```
## [1] 4.362201
```

We can get the median with:


```r
median(elect_2013$likelihood_vote, na.rm = TRUE)
```

```
## [1] 5
```

We can also extract various quartiles and quintiles. The default setting gives us min, max, 25%, 50%, and 75%


```r
quantile(elect_2013$likelihood_vote, na.rm = TRUE)
```

```
##   0%  25%  50%  75% 100% 
##    1    4    5    5    5
```

We can also specify particular probablities with the argument 'probs ='


```r
quantile(elect_2013$likelihood_vote, na.rm = TRUE, probs = c(0, 0.2, 0.4, 0.6, 
    0.8, 1))
```

```
##   0%  20%  40%  60%  80% 100% 
##    1    4    5    5    5    5
```

NOTE: when we provide the 'probs' argument, we need specify the set of numbers inside the function 'c()'.

'c()' is a function in R which joins together a set of numbers and makes them into a vector. 

Vectors are particular data type, but in essence they are set of numbers, like row or column.

The thing to note is just that some functions and some arguments in R will need numbers passed to them is special ways. Some will need them passed in 'c()', others will need them passed in double inverted commas "", and some other formats. The main thing at this stage is to know to look out for this, as they are the sort of typo that will cause bugs in your code, and frustrate you for hours as you try to work out why your code isn't working.

## 1.2 Variance and standard deviation

Variance and standard deviation are calculated with very simple commands: var() and sd()


```r
var(elect_2013$likelihood_vote, na.rm = TRUE)
```

```
## [1] 1.147758
```


```r
sd(elect_2013$likelihood_vote, na.rm = TRUE)
```

```
## [1] 1.071335
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


```r
weighted.mean(elect_2013$likelihood_vote, 
              w = elect_2013$weight, na.rm =  TRUE)
```

```
## [1] 4.201089
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


```r
table(elect_2013$likelihood_vote)
```

```
## 
##    1    2    3    4    5 
##  126  269  236  721 2574
```

So of the 3955 respondents to our survey, 126 said that they would definitely not vote if voting was voluntary, while 2574 said they definitely would vote.

We can visualise this with the the 'barplot()' function:


```r
barplot(table(elect_2013$likelihood_vote))
```

<img src="/docs/soci832_lesson_02-1_files/figure-html/unnamed-chunk-13-1.png" width="672" />

in the 'Plots' windown on the bottom right corner of  RStudio, you will see these five numbers graphed as a histogram.

Often we want to graph a histogram as a probability density graph, where the y-axis is the proportion of  cases in each bin. To do this we need to confirm the number of cases (removing those that are missing) The number of cases can be calculated with the following code: 


```r
cases <- length(elect_2013$likelihood_vote
            [!is.na(elect_2013$likelihood_vote)])
```

To see how many cases there are, just type 'cases' and view the contents of the cases variable.


```r
cases
```

```
## [1] 3926
```

There are 3926 cases (from a total of 3955 people who did the survey).

To display the histogram as a probablity density, we just run:


```r
barplot(table(elect_2013$likelihood_vote)/cases)
```

<img src="/docs/soci832_lesson_02-1_files/figure-html/unnamed-chunk-16-1.png" width="672" />

#### Histogram Example 2: Political knowledge

We are now going to move on to a few slighly more complex examples. 

Let's start by visualising the histogram for the 'political knowledge' variable (from 0 to 10), which represents the number of Australian politics quiz questions the survey respondent got right.


```r
barplot(table(elect_2013$pol_knowledge))
```

<img src="/docs/soci832_lesson_02-1_files/figure-html/unnamed-chunk-17-1.png" width="672" />

We can see that there is pretty even distribution of respondents across the levels of answers, but only a very small number (around 130) got 10/10 for the quiz.

Imagine that for some reason we actually wanted to only have five bins, 0-1, 2-3, 4-5, etc. 

How do we do this?

First we create a variable called 'bins', using one of two commands: either 'seq()' or 'c()'

seq() allows us to specify the min and max, and then the width of bins. The following commands creates bins between 0 and 10, with a width of 2:


```r
bins <- seq(0, 10, by=2)
```

You could also make the bins with c(). With c() you just specify the exact bins


```r
bins <- c(0,2,4,6,8,10)
```

We then go through two steps to make a histogram based on these bins. We first use 'cut()' to create a new variable called 'x'. This creates a variable, x, which the values are simply the bins (so a person who had got one quiz question right, and had a 1 for 'political knowledge' would have that '1' replaced with the name of the 'bin', in this case "(0,2]")

We then plot x as done previously with barplot() and table()


```r
x <- cut(elect_2013$pol_knowledge, breaks=bins)
barplot(table(x))
```

<img src="/docs/soci832_lesson_02-1_files/figure-html/unnamed-chunk-20-1.png" width="672" />
    
#### Histogram Example 3: Age

We will do one quick last example with age. 

Let's look at the age histogram, with bins just one year wide:


```r
barplot(table(elect_2013$age))
```

<img src="/docs/soci832_lesson_02-1_files/figure-html/unnamed-chunk-21-1.png" width="672" />

Let's now look at it, with the variable divided into bins of width 5 years.


```r
bins <- seq(0, 110, by=5)
x <- cut(elect_2013$age, breaks=bins)
barplot(table(x))
```

<img src="/docs/soci832_lesson_02-1_files/figure-html/unnamed-chunk-22-1.png" width="672" />
    
And as a probablity density graph:


```r
cases <- length(elect_2013$age
            [!is.na(elect_2013$age)])
barplot(table(x)/cases)
```

<img src="/docs/soci832_lesson_02-1_files/figure-html/unnamed-chunk-23-1.png" width="672" />
    
There is lots more you can do with 'barplot()'. A simple extension is to give the graph colour. 


```r
barplot(table(x)/cases, col="Red")
```

<img src="/docs/soci832_lesson_02-1_files/figure-html/unnamed-chunk-24-1.png" width="672" />

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


```r
install.packages("summarytools", 
                 repos = 'http://cran.rstudio.com') 
```

```
## Installing package into 'C:/Users/nickh/Documents/R/win-library/3.5'
## (as 'lib' is unspecified)
```

```
## package 'summarytools' successfully unpacked and MD5 sums checked
## 
## The downloaded binary packages are in
## 	C:\Users\nickh\AppData\Local\Temp\RtmpmAh36o\downloaded_packages
```

```r
# install the package (once, and then # it out)
        library(summarytools) # load the library
```

```
## Warning: package 'summarytools' was built under R version 3.5.2
```

## LESSON 3.1: freq() function

This function gives the count and proportions of each value of a variable. Note that it only takes a single variable as input (not a whole dataframe).

### 3.1.1 Don't do this

You almost NEVER want to run 'summarytools' functions WITHOUT putting them inside the 'print()' function and sending them to the browser. To understand why, run the next line and look at the ugly output sent to the console.


```r
freq(elect_2013$pol_knowledge)
```

```
## Frequencies   
## elect_2013$pol_knowledge     
## Type: Numeric   
## 
##               Freq   % Valid   % Valid Cum.   % Total   % Total Cum.
## ----------- ------ --------- -------------- --------- --------------
##           0    410     10.37          10.37     10.37          10.37
##           1    303      7.66          18.03      7.66          18.03
##           2    380      9.61          27.64      9.61          27.64
##           3    382      9.66          37.29      9.66          37.29
##           4    403     10.19          47.48     10.19          47.48
##           5    425     10.75          58.23     10.75          58.23
##           6    376      9.51          67.74      9.51          67.74
##           7    435     11.00          78.74     11.00          78.74
##           8    387      9.79          88.52      9.79          88.52
##           9    318      8.04          96.56      8.04          96.56
##          10    136      3.44         100.00      3.44         100.00
##        <NA>      0                               0.00         100.00
##       Total   3955    100.00         100.00    100.00         100.00
```

OK, it's not terrible, but you wouldn't want to paste that straight into an article or presentation.

### 3.1.2 Basic command

Now let's run the same command, but we will put it inside a print() function, and send it to browser.


```r
print(freq(elect_2013$pol_knowledge), 
      method = 'browser')
```

A table should have openned in your browser (such as Chrome Safari, Internet Explorer, Firefox, or Edge) and look like the one below.

<!--html_preserve--><div class="container st-container">
<h3>Frequencies  </h3>
<strong>Variable</strong>: pol_knowledge
  <br><strong>Type</strong>: Numeric
<br/>
<table class="table table-striped table-bordered st-table st-table-striped st-table-bordered st-freq-table ">
  <thead>
    <tr>
      <th colspan="2"></th>
      <th colspan="2">Valid</th>
      <th colspan="2">Total</th>
    </tr>
    <tr>
      <th>pol_knowledge</th>
      <th>Freq</th>
      <th>%</th>
      <th>% Cumul</th>
      <th>%</th>
      <th>% Cumul</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td align="center">410</td>
      <td align="center">10.37</td>
      <td align="center">10.37</td>
      <td align="center">10.37</td>
      <td align="center">10.37</td>
    </tr>
    <tr>
      <th>1</th>
      <td align="center">303</td>
      <td align="center">7.66</td>
      <td align="center">18.03</td>
      <td align="center">7.66</td>
      <td align="center">18.03</td>
    </tr>
    <tr>
      <th>2</th>
      <td align="center">380</td>
      <td align="center">9.61</td>
      <td align="center">27.64</td>
      <td align="center">9.61</td>
      <td align="center">27.64</td>
    </tr>
    <tr>
      <th>3</th>
      <td align="center">382</td>
      <td align="center">9.66</td>
      <td align="center">37.29</td>
      <td align="center">9.66</td>
      <td align="center">37.29</td>
    </tr>
    <tr>
      <th>4</th>
      <td align="center">403</td>
      <td align="center">10.19</td>
      <td align="center">47.48</td>
      <td align="center">10.19</td>
      <td align="center">47.48</td>
    </tr>
    <tr>
      <th>5</th>
      <td align="center">425</td>
      <td align="center">10.75</td>
      <td align="center">58.23</td>
      <td align="center">10.75</td>
      <td align="center">58.23</td>
    </tr>
    <tr>
      <th>6</th>
      <td align="center">376</td>
      <td align="center">9.51</td>
      <td align="center">67.74</td>
      <td align="center">9.51</td>
      <td align="center">67.74</td>
    </tr>
    <tr>
      <th>7</th>
      <td align="center">435</td>
      <td align="center">11.00</td>
      <td align="center">78.74</td>
      <td align="center">11.00</td>
      <td align="center">78.74</td>
    </tr>
    <tr>
      <th>8</th>
      <td align="center">387</td>
      <td align="center">9.79</td>
      <td align="center">88.52</td>
      <td align="center">9.79</td>
      <td align="center">88.52</td>
    </tr>
    <tr>
      <th>9</th>
      <td align="center">318</td>
      <td align="center">8.04</td>
      <td align="center">96.56</td>
      <td align="center">8.04</td>
      <td align="center">96.56</td>
    </tr>
    <tr>
      <th>10</th>
      <td align="center">136</td>
      <td align="center">3.44</td>
      <td align="center">100.00</td>
      <td align="center">3.44</td>
      <td align="center">100.00</td>
    </tr>
    <tr>
      <th>&lt;NA&gt;</th>
      <td align="center">0</td>
      <td align="center"></td>
      <td align="center"></td>
      <td align="center">0.00</td>
      <td align="center">100.00</td>
    </tr>
    <tr>
      <th>Total</th>
      <td align="center">3955</td>
      <td align="center">100.00</td>
      <td align="center">100.00</td>
      <td align="center">100.00</td>
      <td align="center">100.00</td>
    </tr>
  </tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-29</p>
</div><!--/html_preserve-->

Notice how it has a much more attractive layout.

### 3.1.3 Settings

There are a few different settings we can use to make this table prettier.

We can omit the headings
           

```r
print(freq(elect_2013$pol_knowledge,
      omit.headings = TRUE), 
      method = 'browser')
```

<!--html_preserve--><div class="container st-container">
<table class="table table-striped table-bordered st-table st-table-striped st-table-bordered st-freq-table ">
  <thead>
    <tr>
      <th colspan="2"></th>
      <th colspan="2">Valid</th>
      <th colspan="2">Total</th>
    </tr>
    <tr>
      <th>pol_knowledge</th>
      <th>Freq</th>
      <th>%</th>
      <th>% Cumul</th>
      <th>%</th>
      <th>% Cumul</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td align="center">410</td>
      <td align="center">10.37</td>
      <td align="center">10.37</td>
      <td align="center">10.37</td>
      <td align="center">10.37</td>
    </tr>
    <tr>
      <th>1</th>
      <td align="center">303</td>
      <td align="center">7.66</td>
      <td align="center">18.03</td>
      <td align="center">7.66</td>
      <td align="center">18.03</td>
    </tr>
    <tr>
      <th>2</th>
      <td align="center">380</td>
      <td align="center">9.61</td>
      <td align="center">27.64</td>
      <td align="center">9.61</td>
      <td align="center">27.64</td>
    </tr>
    <tr>
      <th>3</th>
      <td align="center">382</td>
      <td align="center">9.66</td>
      <td align="center">37.29</td>
      <td align="center">9.66</td>
      <td align="center">37.29</td>
    </tr>
    <tr>
      <th>4</th>
      <td align="center">403</td>
      <td align="center">10.19</td>
      <td align="center">47.48</td>
      <td align="center">10.19</td>
      <td align="center">47.48</td>
    </tr>
    <tr>
      <th>5</th>
      <td align="center">425</td>
      <td align="center">10.75</td>
      <td align="center">58.23</td>
      <td align="center">10.75</td>
      <td align="center">58.23</td>
    </tr>
    <tr>
      <th>6</th>
      <td align="center">376</td>
      <td align="center">9.51</td>
      <td align="center">67.74</td>
      <td align="center">9.51</td>
      <td align="center">67.74</td>
    </tr>
    <tr>
      <th>7</th>
      <td align="center">435</td>
      <td align="center">11.00</td>
      <td align="center">78.74</td>
      <td align="center">11.00</td>
      <td align="center">78.74</td>
    </tr>
    <tr>
      <th>8</th>
      <td align="center">387</td>
      <td align="center">9.79</td>
      <td align="center">88.52</td>
      <td align="center">9.79</td>
      <td align="center">88.52</td>
    </tr>
    <tr>
      <th>9</th>
      <td align="center">318</td>
      <td align="center">8.04</td>
      <td align="center">96.56</td>
      <td align="center">8.04</td>
      <td align="center">96.56</td>
    </tr>
    <tr>
      <th>10</th>
      <td align="center">136</td>
      <td align="center">3.44</td>
      <td align="center">100.00</td>
      <td align="center">3.44</td>
      <td align="center">100.00</td>
    </tr>
    <tr>
      <th>&lt;NA&gt;</th>
      <td align="center">0</td>
      <td align="center"></td>
      <td align="center"></td>
      <td align="center">0.00</td>
      <td align="center">100.00</td>
    </tr>
    <tr>
      <th>Total</th>
      <td align="center">3955</td>
      <td align="center">100.00</td>
      <td align="center">100.00</td>
      <td align="center">100.00</td>
      <td align="center">100.00</td>
    </tr>
  </tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-29</p>
</div><!--/html_preserve-->

We can omit the totals


```r
print(freq(elect_2013$pol_knowledge, 
        totals = FALSE), 
        method = 'browser')
```

We can omit the reporting of NAs (missing)


```r
print(freq(elect_2013$pol_knowledge, 
       report.nas = FALSE), 
       method = 'browser')
```

We can remove the footnote


```r
print(freq(elect_2013$pol_knowledge, 
       report.nas = FALSE), 
       method = 'browser', footnote = NA)
```

### 3.1.4. Putting it all together

And we can put all that together


```r
print(freq(elect_2013$pol_knowledge, 
       omit.headings = TRUE, 
       totals = FALSE, 
       report.nas = FALSE), 
       method = 'browser', footnote = NA)
```


<!--html_preserve--><div class="container st-container"><table class="table table-striped table-bordered st-table st-table-striped st-table-bordered st-freq-table-nomiss ">
  <thead>
    <tr>
      <th>pol_knowledge</th>
      <th>Freq</th>
      <th>%</th>
      <th>% Cumul</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td align="center">410</td>
      <td align="center">10.37</td>
      <td align="center">10.37</td>
    </tr>
    <tr>
      <th>1</th>
      <td align="center">303</td>
      <td align="center">7.66</td>
      <td align="center">18.03</td>
    </tr>
    <tr>
      <th>2</th>
      <td align="center">380</td>
      <td align="center">9.61</td>
      <td align="center">27.64</td>
    </tr>
    <tr>
      <th>3</th>
      <td align="center">382</td>
      <td align="center">9.66</td>
      <td align="center">37.29</td>
    </tr>
    <tr>
      <th>4</th>
      <td align="center">403</td>
      <td align="center">10.19</td>
      <td align="center">47.48</td>
    </tr>
    <tr>
      <th>5</th>
      <td align="center">425</td>
      <td align="center">10.75</td>
      <td align="center">58.23</td>
    </tr>
    <tr>
      <th>6</th>
      <td align="center">376</td>
      <td align="center">9.51</td>
      <td align="center">67.74</td>
    </tr>
    <tr>
      <th>7</th>
      <td align="center">435</td>
      <td align="center">11.00</td>
      <td align="center">78.74</td>
    </tr>
    <tr>
      <th>8</th>
      <td align="center">387</td>
      <td align="center">9.79</td>
      <td align="center">88.52</td>
    </tr>
    <tr>
      <th>9</th>
      <td align="center">318</td>
      <td align="center">8.04</td>
      <td align="center">96.56</td>
    </tr>
    <tr>
      <th>10</th>
      <td align="center">136</td>
      <td align="center">3.44</td>
      <td align="center">100.00</td>
    </tr>
  </tbody>
</table></div><!--/html_preserve-->

### 3.1.5. Save to file

If we want to save this to a file, then we use the same command, but replace the 'method =' argument with a 'file =' argument, as below:


```r
print(freq(elect_2013$pol_knowledge, 
       omit.headings = TRUE, 
       totals = FALSE, 
       report.nas = FALSE), 
       file = "pol_know_freq.html", footnote = NA)
```

```
## Output file written: pol_know_freq.html
```

and if you go to your default folder (set at the beginning of this session), then you will find the file 'pol_know_freq.html'. If you double click on it then it will open in a browser.

## Lesson 3.2: descr() function

This function calculates a wide range basic univariate statistics such as mean, standard deviation, min, max, skewness, etc.  This function can calcuate these on all variables in a dataset meaning it can be used to summarise an entire dataset very quickly. This command is great for doing a descriptive statistics table - a table which is expected in almost all academic papers.

This is the simplest form of the command


```r
print(descr(elect_2013$pol_knowledge), 
      method = "browser")
```

<!--html_preserve--><div class="container st-container">
<h3>Descriptive Statistics  </h3>
<h4>elect_2013$pol_knowledge</h4>
<strong>N</strong>: 3955
<table class="table table-bordered table-striped st-table st-table-bordered st-table-striped st-descr-table ">
  <thead>
    <tr>
      <th></th>
      <th align="center">pol_<br/>knowledge</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <strong>Mean</strong></td>
      <td><span>4.69</span></td>
    </tr>
    <tr>
      <td>
        <strong>Std.Dev</strong></td>
      <td><span>2.94</span></td>
    </tr>
    <tr>
      <td>
        <strong>Min</strong></td>
      <td><span>0.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>Q1</strong></td>
      <td><span>2.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>Median</strong></td>
      <td><span>5.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>Q3</strong></td>
      <td><span>7.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>Max</strong></td>
      <td><span>10.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>MAD</strong></td>
      <td><span>2.97</span></td>
    </tr>
    <tr>
      <td>
        <strong>IQR</strong></td>
      <td><span>5.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>CV</strong></td>
      <td><span>0.63</span></td>
    </tr>
    <tr>
      <td>
        <strong>Skewness</strong></td>
      <td><span>-0.01</span></td>
    </tr>
    <tr>
      <td>
        <strong>SE.Skewness</strong></td>
      <td><span>0.04</span></td>
    </tr>
    <tr>
      <td>
        <strong>Kurtosis</strong></td>
      <td><span>-1.12</span></td>
    </tr>
    <tr>
      <td>
        <strong>N.Valid</strong></td>
      <td><span>3955</span></td>
    </tr>
    <tr>
      <td>
        <strong>Pct.Valid</strong></td>
      <td><span>100.00</span></td>
    </tr>
  </tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-29</p>
</div><!--/html_preserve-->


However, when reporting variables, we often like them to be presented as the rows, not columns. To change this we used the argument 'transpose'


```r
print(descr(elect_2013$pol_knowledge, transpose = TRUE),
      method = "browser")
```

<!--html_preserve--><div class="container st-container">
<h3>Descriptive Statistics  </h3>
<h4>elect_2013$pol_knowledge</h4>
<strong>N</strong>: 3955
<table class="table table-bordered table-striped st-table st-table-bordered st-table-striped st-descr-table ">
  <thead>
    <tr>
      <th></th>
      <th align="center">Mean</th>
      <th align="center">Std.Dev</th>
      <th align="center">Min</th>
      <th align="center">Q1</th>
      <th align="center">Median</th>
      <th align="center">Q3</th>
      <th align="center">Max</th>
      <th align="center">MAD</th>
      <th align="center">IQR</th>
      <th align="center">CV</th>
      <th align="center">Skewness</th>
      <th align="center">SE.Skewness</th>
      <th align="center">Kurtosis</th>
      <th align="center">N.Valid</th>
      <th align="center">Pct.Valid</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <strong>pol_knowledge</strong></td>
      <td><span>4.69</span></td>
      <td><span>2.94</span></td>
      <td><span>0.00</span></td>
      <td><span>2.00</span></td>
      <td><span>5.00</span></td>
      <td><span>7.00</span></td>
      <td><span>10.00</span></td>
      <td><span>2.97</span></td>
      <td><span>5.00</span></td>
      <td><span>0.63</span></td>
      <td><span>-0.01</span></td>
      <td><span>0.04</span></td>
      <td><span>-1.12</span></td>
      <td><span>3955.00</span></td>
      <td><span>100.00</span></td>
    </tr>
  </tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-29</p>
</div><!--/html_preserve-->

Generally we don't want all these statistics, so we can limit the statistics reported with the argument 'stats'.

Note: I've also removed the headings and footnote.


```r
print(descr(elect_2013$pol_knowledge, 
      omit.headings = TRUE,
      stats = c("mean", "sd", "min", "max"), 
      transpose = TRUE),
      method = "browser",
      footnote = NA)
```

<!--html_preserve--><div class="container st-container"><table class="table table-bordered table-striped st-table st-table-bordered st-table-striped st-descr-table ">
  <thead>
    <tr>
      <th></th>
      <th align="center">Mean</th>
      <th align="center">Std.Dev</th>
      <th align="center">Min</th>
      <th align="center">Max</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <strong>pol_knowledge</strong></td>
      <td><span>4.69</span></td>
      <td><span>2.94</span></td>
      <td><span>0.00</span></td>
      <td><span>10.00</span></td>
    </tr>
  </tbody>
</table></div><!--/html_preserve-->

Note that when using the stats argument, we put the names of the stats we want using the "c()" function. If you want to know the commands for each of the different stats, then look at the help file (type ?descr)

However, remember that the data from the Australian Electoral Study needs to be weighted to account for the difference between the sample and the population. We can do this with the argument 'weights'


```r
print(descr(elect_2013$pol_knowledge, 
      omit.headings = TRUE,
      stats = c("mean", "sd", "min", "max"), 
      transpose = TRUE,
      weights = elect_2013$weight),
      method = "browser", 
      footnote = NA)
```

<!--html_preserve--><div class="container st-container"><table class="table table-bordered table-striped st-table st-table-bordered st-table-striped st-descr-table ">
  <thead>
    <tr>
      <th></th>
      <th align="center">Mean</th>
      <th align="center">Std.Dev</th>
      <th align="center">Min</th>
      <th align="center">Max</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <strong>pol_knowledge</strong></td>
      <td><span>4.41</span></td>
      <td><span>2.94</span></td>
      <td><span>0.00</span></td>
      <td><span>10.00</span></td>
    </tr>
  </tbody>
</table></div><!--/html_preserve-->

The real power of descr() is that it can calculate these statistics for all variables in a dataset. We can do this by just calling descr() on the data frame.

**Note:** In this case, I've limited the output to this webpage to the first 10 variables, so that it doesn't take up too much space.


```r
print(descr(elect_2013, 
      omit.headings = TRUE, 
      stats = c("mean", "sd", "min", "max"),
      transpose = TRUE, 
      weights = elect_2013$weight), 
      method = "browser", footnote = NA)
```

<!--html_preserve--><div class="container st-container"><table class="table table-bordered table-striped st-table st-table-bordered st-table-striped st-descr-table ">
  <thead>
    <tr>
      <th></th>
      <th align="center">Mean</th>
      <th align="center">Std.Dev</th>
      <th align="center">Min</th>
      <th align="center">Max</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <strong>pol_knowledge</strong></td>
      <td><span>4.41</span></td>
      <td><span>2.94</span></td>
      <td><span>0.00</span></td>
      <td><span>10.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>likelihood_vote</strong></td>
      <td><span>4.20</span></td>
      <td><span>1.20</span></td>
      <td><span>1.00</span></td>
      <td><span>5.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know1</strong></td>
      <td><span>1.51</span></td>
      <td><span>0.86</span></td>
      <td><span>1.00</span></td>
      <td><span>3.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know2</strong></td>
      <td><span>1.96</span></td>
      <td><span>0.94</span></td>
      <td><span>1.00</span></td>
      <td><span>3.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know3</strong></td>
      <td><span>2.08</span></td>
      <td><span>0.81</span></td>
      <td><span>1.00</span></td>
      <td><span>3.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know4</strong></td>
      <td><span>2.21</span></td>
      <td><span>0.79</span></td>
      <td><span>1.00</span></td>
      <td><span>3.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know5</strong></td>
      <td><span>1.69</span></td>
      <td><span>0.79</span></td>
      <td><span>1.00</span></td>
      <td><span>3.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know6</strong></td>
      <td><span>2.17</span></td>
      <td><span>0.75</span></td>
      <td><span>1.00</span></td>
      <td><span>3.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know7</strong></td>
      <td><span>3.60</span></td>
      <td><span>1.16</span></td>
      <td><span>1.00</span></td>
      <td><span>5.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know8</strong></td>
      <td><span>2.94</span></td>
      <td><span>1.40</span></td>
      <td><span>1.00</span></td>
      <td><span>5.00</span></td>
    </tr>
  </tbody>
</table></div><!--/html_preserve-->

## Lesson 3.3: dfSummary() function

While the 'descr()' function is good for making publication quality tables, the dfSummary() function  is more for the private use of the data analyst.  dfSummary() is the kind of function you use to 'get a quick feel' for  your data. It lets you quickly see the number of missing values and a rough histogram of the values and also see the percent of cases of each value. This can be very useful when you are trying to assess the quality of data, or looking for interesting patterns you may want to explore later.

The following command gives a summary of just one variable:


```r
print(dfSummary(elect_2013$pol_knowledge), 
      method="browser")
```


```
## x was converted to a data frame
```

<!--html_preserve--><div class="container st-container">
<h3>Data Frame Summary  </h3>
<h4>pol_knowledge</h4>
<strong>N</strong>: 3955
<table class="table table-striped table-bordered st-table st-table-striped st-table-bordered st-multiline ">
  <thead>
    <tr>
      <th align="center"><strong>No</strong></th>
      <th align="center"><strong>Variable</strong></th>
      <th align="center"><strong>Stats / Values</strong></th>
      <th align="center"><strong>Freqs (% of Valid)</strong></th>
      <th align="center"><strong>Graph</strong></th>
      <th align="center"><strong>Valid</strong></th>
      <th align="center"><strong>Missing</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1</td>
      <td align="left">x
[integer]</td>
      <td align="left">mean (sd) : 4.69 (2.94)
min &lt; med &lt; max :
0 &lt; 5 &lt; 10
IQR (CV) : 5 (0.63)</td>
      <td align="left">11 distinct values</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABkCAMAAABThTnCAAAADFBMVEX9/v2mpqby8vL9/v28xacEAAAABHRSTlP///8AQCqp9AAAALtJREFUaIHt2EEOgjAURVG0+9+zAxNDY4s8O2jFc2c/acOBAAlsZcm22YB2WElP1q1usqm8WPd9WL2wkrCSsJKwkrCSsJKwkrCSsJKwkrCSsJKwkrCSsJKwkv6NNfY7dox1cOixMx1k9bdhlbdbZhlWvfLXWeFz2WQddcA6u/DEtWuyvpuCbVhYWFjd6ePLdQ6rnrCwsLCwsLCwsLCwsK7PanyercCqJywsLCwsLCysS7IWasdaLqykRVkPrh6QO629AhUAAAAASUVORK5CYII="></td>
      <td align="center">3955
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
  </tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-29</p>
</div><!--/html_preserve-->

The next command gives a summary of the entire dataset. For display purposes, I've just shown the first five variables:


```r
print(dfSummary(elect_2013), 
      method='browser')
```

<!--html_preserve--><div class="container st-container">
<h3>Data Frame Summary  </h3>
<h4>elect_2013</h4>
<strong>N</strong>: 3955
<table class="table table-striped table-bordered st-table st-table-striped st-table-bordered st-multiline ">
  <thead>
    <tr>
      <th align="center"><strong>No</strong></th>
      <th align="center"><strong>Variable</strong></th>
      <th align="center"><strong>Stats / Values</strong></th>
      <th align="center"><strong>Freqs (% of Valid)</strong></th>
      <th align="center"><strong>Graph</strong></th>
      <th align="center"><strong>Valid</strong></th>
      <th align="center"><strong>Missing</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1</td>
      <td align="left">pol_knowledge
[integer]</td>
      <td align="left">mean (sd) : 4.69 (2.94)
min &lt; med &lt; max :
0 &lt; 5 &lt; 10
IQR (CV) : 5 (0.63)</td>
      <td align="left">11 distinct values</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABkCAMAAABThTnCAAAADFBMVEX9/v2mpqby8vL9/v28xacEAAAABHRSTlP///8AQCqp9AAAALtJREFUaIHt2EEOgjAURVG0+9+zAxNDY4s8O2jFc2c/acOBAAlsZcm22YB2WElP1q1usqm8WPd9WL2wkrCSsJKwkrCSsJKwkrCSsJKwkrCSsJKwkrCSsJKwkv6NNfY7dox1cOixMx1k9bdhlbdbZhlWvfLXWeFz2WQddcA6u/DEtWuyvpuCbVhYWFjd6ePLdQ6rnrCwsLCwsLCwsLCwsK7PanyercCqJywsLCwsLCysS7IWasdaLqykRVkPrh6QO629AhUAAAAASUVORK5CYII="></td>
      <td align="center">3955
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">2</td>
      <td align="left">likelihood_vote
[integer]</td>
      <td align="left">mean (sd) : 4.36 (1.07)
min &lt; med &lt; max :
1 &lt; 5 &lt; 5
IQR (CV) : 1 (0.25)</td>
      <td align="left">1 : 126 (3.2%)
2 : 269 (6.8%)
3 : 236 (6.0%)
4 : 721 (18.4%)
5 : 2574 (65.6%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACCCAMAAACTmMFdAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAANJJREFUeJzt2EkOwkAMAEEC//8zCBCIJYi+JD5Uv6AOtjSew2lkh70B38MqjWUt9/aWvHRhHa9h/RFWCauEVcIqYZWwSlglrBJWaeyJMTKs0nO2lklD9tjER1jrYZWwSlglrBJWCauEVcIqzWXNfMuPDKv0MVt7g269byLWr7BKWCWsElYJq4RVwiphlbBKY0+MkWGVvnyNrLcp6/hvWFhYWFhYWFhYWFijWDNPjJFhldJsbVfZxO3CKmGVsEpYJawSVgmrhFXCKi1j3/Ijwyphlc6wYc6nueKInwAAAABJRU5ErkJggg=="></td>
      <td align="center">3926
(99.27%)</td>
      <td align="center">29
(0.73%)</td>
    </tr>
    <tr>
      <td align="center">3</td>
      <td align="left">know1
[integer]</td>
      <td align="left">mean (sd) : 1.48 (0.84)
min &lt; med &lt; max :
1 &lt; 1 &lt; 3
IQR (CV) : 1 (0.57)</td>
      <td align="left">1 : 2827 (74.4%)
2 : 105 (2.8%)
3 : 866 (22.8%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABOCAMAAAD1sh+SAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAIdJREFUaIHt2LENAkEQBMEH8s8ZDN5AwqAdfozqCEo6nTF7PCY7rgZ8b5Z1W+zFuu+FVcIqYZWwSlglrBJWCauEVRpmLTY7yCabZb1f82rIZ+dPxPolrBJWCauEVcIqYZWwSlglrNLsxJgMq5RPI39jtRMPFhYWFhYWFhYWFtYKa3NiTIZVegIiynWdVI7jagAAAABJRU5ErkJggg=="></td>
      <td align="center">3798
(96.03%)</td>
      <td align="center">157
(3.97%)</td>
    </tr>
    <tr>
      <td align="center">4</td>
      <td align="left">know2
[integer]</td>
      <td align="left">mean (sd) : 1.92 (0.94)
min &lt; med &lt; max :
1 &lt; 2 &lt; 3
IQR (CV) : 2 (0.49)</td>
      <td align="left">1 : 1805 (48.0%)
2 : 446 (11.9%)
3 : 1506 (40.1%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABOCAMAAAD1sh+SAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAH9JREFUaIHt2MEJgDAURMGo/fesBYhkEc0e5lUwEP5hM47KxmrAfbWsrbGLtfeFlYSVhJWElYSVhJWElYSVhJVUzGqsdpBVVsuae+z/WVOngYWFhYWFhYWFhYVVx+qcGJVhJS3+GnlgzVziR2FhYWFhYWFhYWFhvWB1TozKsJJOqFprZSko5hcAAAAASUVORK5CYII="></td>
      <td align="center">3757
(94.99%)</td>
      <td align="center">198
(5.01%)</td>
    </tr>
    <tr>
      <td align="center">5</td>
      <td align="left">know3
[integer]</td>
      <td align="left">mean (sd) : 2.03 (0.8)
min &lt; med &lt; max :
1 &lt; 2 &lt; 3
IQR (CV) : 2 (0.39)</td>
      <td align="left">1 : 1155 (30.6%)
2 : 1334 (35.4%)
3 : 1284 (34.0%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABOCAMAAAD1sh+SAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAIdJREFUaIHt16EVgFAQxMAP9N8zBgS8QwSzK5IKRtyKW0dlKw2Yq2Vt6T5YezZZsmTJkiVLlixZsmT9ZKWbWZXJIhXc1lR+iVOySLJIskiySLJIskiySLJIskjFrMZqH7LKalnpM3p3s9KzeyaLJIskiySLJIskiySLJIski9TOKutiVSaLdAITIGEVsgadCgAAAABJRU5ErkJggg=="></td>
      <td align="center">3773
(95.4%)</td>
      <td align="center">182
(4.6%)</td>
    </tr>
  </tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-29</p>
</div><!--/html_preserve-->

**This is the end of the Univariate statistics  R code/ R-script file. The class continues in the code "Week 2, Part 2, Bivariate statistics.R'**

