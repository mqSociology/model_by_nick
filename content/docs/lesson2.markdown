+++
title = "SOCI832 Lesson 2.1: Univariate analysis"

date = 2018-09-09T00:00:00
# lastmod = 2018-09-09T00:00:00

draft = false  # Is this a draft? true/false
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.

# Add menu entry to sidebar.
linktitle = "2.1 Univariate analysis"
[menu.docs]
  parent = "SOCI832"
  weight = 30
+++
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
quantile(elect_2013$likelihood_vote, 
         na.rm = TRUE, probs = c(0,0.2,0.4,0.6,0.8,1))
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

<img src="/docs/lesson2_files/figure-html/unnamed-chunk-13-1.png" width="672" />

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

<img src="/docs/lesson2_files/figure-html/unnamed-chunk-16-1.png" width="672" />

#### Histogram Example 2: Political knowledge

We are now going to move on to a few slighly more complex examples. 

Let's start by visualising the histogram for the 'political knowledge' variable (from 0 to 10), which represents the number of Australian politics quiz questions the survey respondent got right.


```r
barplot(table(elect_2013$pol_knowledge))
```

<img src="/docs/lesson2_files/figure-html/unnamed-chunk-17-1.png" width="672" />

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

<img src="/docs/lesson2_files/figure-html/unnamed-chunk-20-1.png" width="672" />
    
#### Histogram Example 3: Age

We will do one quick last example with age. 

Let's look at the age histogram, with bins just one year wide:


```r
barplot(table(elect_2013$age))
```

<img src="/docs/lesson2_files/figure-html/unnamed-chunk-21-1.png" width="672" />

Let's now look at it, with the variable divided into bins of width 5 years.


```r
bins <- seq(0, 110, by=5)
x <- cut(elect_2013$age, breaks=bins)
barplot(table(x))
```

<img src="/docs/lesson2_files/figure-html/unnamed-chunk-22-1.png" width="672" />
    
And as a probablity density graph:


```r
cases <- length(elect_2013$age
            [!is.na(elect_2013$age)])
barplot(table(x)/cases)
```

<img src="/docs/lesson2_files/figure-html/unnamed-chunk-23-1.png" width="672" />
    
There is lots more you can do with 'barplot()'. A simple extension is to give the graph colour. 


```r
barplot(table(x)/cases, col="Red")
```

<img src="/docs/lesson2_files/figure-html/unnamed-chunk-24-1.png" width="672" />

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
## 	C:\Users\nickh\AppData\Local\Temp\RtmpyQo6P6\downloaded_packages
```

```r
# install the package (once, and then # it out)
        library(summarytools) # load the library(package)ry(package)
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
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-28</p>
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
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-28</p>
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
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-28</p>
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
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-28</p>
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
    <tr>
      <td>
        <strong>know9</strong></td>
      <td><span>3.71</span></td>
      <td><span>1.00</span></td>
      <td><span>1.00</span></td>
      <td><span>5.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know10</strong></td>
      <td><span>3.59</span></td>
      <td><span>1.30</span></td>
      <td><span>1.00</span></td>
      <td><span>5.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>general_internet</strong></td>
      <td><span>2.23</span></td>
      <td><span>2.05</span></td>
      <td><span>1.00</span></td>
      <td><span>7.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>election_internet</strong></td>
      <td><span>3.60</span></td>
      <td><span>1.16</span></td>
      <td><span>1.00</span></td>
      <td><span>5.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>internet_skills</strong></td>
      <td><span>2.14</span></td>
      <td><span>1.38</span></td>
      <td><span>0.00</span></td>
      <td><span>4.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>int_attch</strong></td>
      <td><span>0.79</span></td>
      <td><span>0.41</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>int_post</strong></td>
      <td><span>0.54</span></td>
      <td><span>0.50</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>int_blog</strong></td>
      <td><span>0.19</span></td>
      <td><span>0.39</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>int_down</strong></td>
      <td><span>0.62</span></td>
      <td><span>0.48</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>election_newspaper</strong></td>
      <td><span>2.53</span></td>
      <td><span>0.99</span></td>
      <td><span>1.00</span></td>
      <td><span>4.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>election_tv</strong></td>
      <td><span>2.10</span></td>
      <td><span>0.95</span></td>
      <td><span>1.00</span></td>
      <td><span>4.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>election_radio</strong></td>
      <td><span>2.69</span></td>
      <td><span>1.04</span></td>
      <td><span>1.00</span></td>
      <td><span>4.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>female</strong></td>
      <td><span>0.52</span></td>
      <td><span>0.50</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>highest_qual</strong></td>
      <td><span>3.44</span></td>
      <td><span>2.16</span></td>
      <td><span>1.00</span></td>
      <td><span>7.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>tertiary_ed</strong></td>
      <td><span>0.32</span></td>
      <td><span>0.47</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>country_birth</strong></td>
      <td><span>2.66</span></td>
      <td><span>3.58</span></td>
      <td><span>1.00</span></td>
      <td><span>12.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>aust_born</strong></td>
      <td><span>0.76</span></td>
      <td><span>0.43</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>age</strong></td>
      <td><span>48.46</span></td>
      <td><span>17.85</span></td>
      <td><span>14.00</span></td>
      <td><span>103.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>income</strong></td>
      <td><span>11.92</span></td>
      <td><span>6.24</span></td>
      <td><span>1.00</span></td>
      <td><span>22.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>rural_urban</strong></td>
      <td><span>3.96</span></td>
      <td><span>1.40</span></td>
      <td><span>1.00</span></td>
      <td><span>5.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>interest_pol</strong></td>
      <td><span>1.98</span></td>
      <td><span>0.86</span></td>
      <td><span>1.00</span></td>
      <td><span>4.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>age_cat</strong></td>
      <td><span>3.78</span></td>
      <td><span>1.65</span></td>
      <td><span>1.00</span></td>
      <td><span>6.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>age_18_24</strong></td>
      <td><span>0.11</span></td>
      <td><span>0.31</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>weight</strong></td>
      <td><span>1.31</span></td>
      <td><span>1.00</span></td>
      <td><span>0.36</span></td>
      <td><span>6.65</span></td>
    </tr>
    <tr>
      <td>
        <strong>know1_correct</strong></td>
      <td><span>0.73</span></td>
      <td><span>0.44</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know2_correct</strong></td>
      <td><span>0.46</span></td>
      <td><span>0.50</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know3_correct</strong></td>
      <td><span>0.33</span></td>
      <td><span>0.47</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know4_correct</strong></td>
      <td><span>0.23</span></td>
      <td><span>0.42</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know5_correct</strong></td>
      <td><span>0.28</span></td>
      <td><span>0.45</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know6_correct</strong></td>
      <td><span>0.40</span></td>
      <td><span>0.49</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know7_correct</strong></td>
      <td><span>0.50</span></td>
      <td><span>0.50</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know8_correct</strong></td>
      <td><span>0.60</span></td>
      <td><span>0.49</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know9_correct</strong></td>
      <td><span>0.58</span></td>
      <td><span>0.49</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>know10_correct</strong></td>
      <td><span>0.47</span></td>
      <td><span>0.50</span></td>
      <td><span>0.00</span></td>
      <td><span>1.00</span></td>
    </tr>
    <tr>
      <td>
        <strong>income_quintiles</strong></td>
      <td><span>3.17</span></td>
      <td><span>1.38</span></td>
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
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-28</p>
</div><!--/html_preserve-->

The next command gives a summary of the entire dataset:


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
    <tr>
      <td align="center">6</td>
      <td align="left">know4
[integer]</td>
      <td align="left">mean (sd) : 2.15 (0.81)
min &lt; med &lt; max :
1 &lt; 2 &lt; 3
IQR (CV) : 2 (0.38)</td>
      <td align="left">1 : 1012 (26.7%)
2 : 1202 (31.7%)
3 : 1573 (41.5%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABOCAMAAAD1sh+SAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAIFJREFUaIHt17kNwEAMA0E//ffsBgzYPEA4BrMVTCAGOu7Kjt2A92pZ53CrrGs0LCwsLCwsLCwsLKwpVueLURlW0vxtLV3b+BLXtomFhYWFhYWFhYWF9c3qfDEqw0racVs/2rDEH2ElYSVhJWElYSVhJWElYSVhJRWzGqt9yCorZT1ttWb96l3fsgAAAABJRU5ErkJggg=="></td>
      <td align="center">3787
(95.75%)</td>
      <td align="center">168
(4.25%)</td>
    </tr>
    <tr>
      <td align="center">7</td>
      <td align="left">know5
[integer]</td>
      <td align="left">mean (sd) : 1.65 (0.76)
min &lt; med &lt; max :
1 &lt; 1 &lt; 3
IQR (CV) : 1 (0.46)</td>
      <td align="left">1 : 1985 (52.2%)
2 : 1151 (30.3%)
3 : 664 (17.5%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABOCAMAAAD1sh+SAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAHxJREFUaIHt17EBgDAMA8EA++8MA9AISFBxP8EVdqFxVDb+BtxXy9oau1h7X1hJWElYSVhJWElYSVhJWElYScWsxmoHWWW1rEnX8Zo155ewsLCwsLCwsLCwsGazOidGZVhJj25rCWv1l2FhYWFhYWFhYWFhfcPqnBiVYSWdqtttvRZiLjMAAAAASUVORK5CYII="></td>
      <td align="center">3800
(96.08%)</td>
      <td align="center">155
(3.92%)</td>
    </tr>
    <tr>
      <td align="center">8</td>
      <td align="left">know6
[integer]</td>
      <td align="left">mean (sd) : 2.15 (0.74)
min &lt; med &lt; max :
1 &lt; 2 &lt; 3
IQR (CV) : 1 (0.34)</td>
      <td align="left">1 : 795 (21.1%)
2 : 1615 (42.9%)
3 : 1356 (36.0%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABOCAMAAAD1sh+SAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAH1JREFUaIHt17ERgEAMA8EH+u+ZBiAQ4+EV7FWwgR1oXZWt3YDnalnHWLOscygsLCwsLCwsLCwsrH9ZnROjMqykydsabPATB8NKwkrCSsJKwkrCSsJKwkrCSipmNVY7yCqrZe09onfW1pfDwsLCwsLCwsLCwvrM6pwYlWEl3boxZ+2faIeYAAAAAElFTkSuQmCC"></td>
      <td align="center">3766
(95.22%)</td>
      <td align="center">189
(4.78%)</td>
    </tr>
    <tr>
      <td align="center">9</td>
      <td align="left">know7
[integer]</td>
      <td align="left">mean (sd) : 3.52 (1.1)
min &lt; med &lt; max :
1 &lt; 3 &lt; 5
IQR (CV) : 2 (0.31)</td>
      <td align="left">1 : 118 (3.2%)
2 : 267 (7.1%)
3 : 2081 (55.7%)
4 : 80 (2.1%)
5 : 1191 (31.9%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACCCAMAAACTmMFdAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAANBJREFUeJzt2FGKAjEQQEFd739n/XB1BgbcxypppN4JCtINSU6XkZ1WA47DKo1lnR+ttmy6sX7uYb0Mq4RVwiphlbBKWCWsElYJqzT2iTEyrNJ2tgZN2WYTn2FhYWFhYWFhYWFh7Vgz7/Ijwyodz9byDjdxeVglrBJWCauEVcIqYZWwSlilwayJjX2QjWws636aqyH7fjcR6y9hlbBKWCWsElYJq4RVwiphlcY+MUaGVfrU18j/We/5+9mHhYWFhYWFhYWF9VWsmXf5kWGVsEpXe53Kq4IGLjsAAAAASUVORK5CYII="></td>
      <td align="center">3737
(94.49%)</td>
      <td align="center">218
(5.51%)</td>
    </tr>
    <tr>
      <td align="center">10</td>
      <td align="left">know8
[integer]</td>
      <td align="left">mean (sd) : 2.83 (1.35)
min &lt; med &lt; max :
1 &lt; 2 &lt; 5
IQR (CV) : 3 (0.48)</td>
      <td align="left">1 : 142 (3.7%)
2 : 2462 (64.1%)
3 : 164 (4.3%)
4 : 58 (1.5%)
5 : 1016 (26.4%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACCCAMAAACTmMFdAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAM9JREFUeJzt2VEKwkAMQEFb739nBUWrCPoQacB5J5iPBDbs4Tiyw96A12GVxrKWW3tbNp1Z6zWst2GVsEpYJawSVgmrhFXCKmGVxp4YI8MqbWdrUJtNHBRWCauEVcIqYZWwSlglrBJWaRn7lh8ZVulhtvbG3NtuIta7sEpYJawSVgmrhFXCKmGVsEpjT4yRYZWus7U347nLJmJ9FlYJq4RVwiphlbBKWCWsElZp7IkxMqzStz/7v2OtX4SFhYWFhYWFhYX1F6yZb/mRYZWwSif9uM5csUyXZgAAAABJRU5ErkJggg=="></td>
      <td align="center">3842
(97.14%)</td>
      <td align="center">113
(2.86%)</td>
    </tr>
    <tr>
      <td align="center">11</td>
      <td align="left">know9
[integer]</td>
      <td align="left">mean (sd) : 3.65 (0.98)
min &lt; med &lt; max :
1 &lt; 3 &lt; 5
IQR (CV) : 2 (0.27)</td>
      <td align="left">1 : 60 (1.6%)
2 : 10 (0.3%)
3 : 2342 (61.3%)
4 : 213 (5.6%)
5 : 1194 (31.3%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACCCAMAAACTmMFdAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAM5JREFUeJzt2FFqAzEQBUF7c/87J8Z/iwlpWNhHqD5BgSTQzONrssfdgM9hlWZZz1d3M879sI7jwPpbWCWsElYJq4RVwiphlbBKWKXZEWMyrNLrbt1t+BBWCauEVcIqYZWwSlglrBJWCas0O/lMNst6Lvbe2KyFVcIqYZWwSlglrBJWCauEVRpmLTY7kE02yzqd6t2gd+eXiPVbWCWsElYJq4RVwiphlbBKWKXZEWMyrNLFq5ELWcd1YWFhYWFhYWFhYf1P1uZffjKsElbpG2bpzNAodV3QAAAAAElFTkSuQmCC"></td>
      <td align="center">3819
(96.56%)</td>
      <td align="center">136
(3.44%)</td>
    </tr>
    <tr>
      <td align="center">12</td>
      <td align="left">know10
[integer]</td>
      <td align="left">mean (sd) : 3.49 (1.29)
min &lt; med &lt; max :
1 &lt; 3 &lt; 5
IQR (CV) : 2 (0.37)</td>
      <td align="left">1 : 429 (11.2%)
2 : 43 (1.1%)
3 : 1936 (50.6%)
4 : 50 (1.3%)
5 : 1368 (35.8%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACCCAMAAACTmMFdAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAMpJREFUeJzt2EFqQzEQBUEnuf+dDfYuCfj3xnqG6hMUSALN3H4mu50G/B9WaZb19bIzrO8XYWFhYWFhYWFhYWFtsjZHjMmwSs+7dVrxp8dLxLoYVgmrhFXCKmGVsEpYJazSLmvzLz8ZVunKDuJAFzY2B8IqYZWwSlglrBJWCauEVcIqDbMWmx3IJptlPc7yNON3z5eIdS2sElYJq4RVwiphlbBKWCWs0uyIMRlW6Z2rkcZ623YICwsLCwsLCwsL61NZm3/5ybBKWKU7J3LIP7hZhBcAAAAASUVORK5CYII="></td>
      <td align="center">3826
(96.74%)</td>
      <td align="center">129
(3.26%)</td>
    </tr>
    <tr>
      <td align="center">13</td>
      <td align="left">general_internet
[integer]</td>
      <td align="left">mean (sd) : 2.49 (2.22)
min &lt; med &lt; max :
1 &lt; 1 &lt; 7
IQR (CV) : 2 (0.89)</td>
      <td align="left">1 : 2154 (56.0%)
2 : 565 (14.7%)
3 : 199 (5.2%)
4 : 173 (4.5%)
5 : 94 (2.4%)
6 : 61 (1.6%)
7 : 597 (15.5%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAC2CAMAAAAMc4TmAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAQ9JREFUeJzt3EFqQkEQQEE1979zAmrEnyDzNk6D9U5Qi27o2czpa2Sn3YD/wyphlcayzhP7YV3mhVXCKmGVsEpYJawSVgmrhFU6j73lR4ZVWp+td7MWlwMLCwsLCwsLCwsLaxhr5hNjZFilP7O1G3TtuIlYr8IqYZWwSlglrBJWCauEVZrLmnnLjwyrdJit3Zx7z5uI9TqsElYJq4RVwiphlbBKWCWs0tgnxsiwSo/Z2i156ncTsRbCKmGVsEpYJawSVgmrhFWay5p5y48Mq3Sbrd2MY9dNxFoLq4RVwiphlbBKWCWsElYJqzT2iTEyrFL56Oq9rMtiWFhYWFhYWFhYWB/LmnnLjwyrhFXCKn0DnJgmQoje1HsAAAAASUVORK5CYII="></td>
      <td align="center">3843
(97.17%)</td>
      <td align="center">112
(2.83%)</td>
    </tr>
    <tr>
      <td align="center">14</td>
      <td align="left">election_internet
[integer]</td>
      <td align="left">mean (sd) : 3.52 (1.1)
min &lt; med &lt; max :
1 &lt; 3 &lt; 5
IQR (CV) : 2 (0.31)</td>
      <td align="left">1 : 118 (3.2%)
2 : 267 (7.1%)
3 : 2081 (55.7%)
4 : 80 (2.1%)
5 : 1191 (31.9%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACCCAMAAACTmMFdAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAANBJREFUeJzt2FGKAjEQQEFd739n/XB1BgbcxypppN4JCtINSU6XkZ1WA47DKo1lnR+ttmy6sX7uYb0Mq4RVwiphlbBKWCWsElYJqzT2iTEyrNJ2tgZN2WYTn2FhYWFhYWFhYWFh7Vgz7/Ijwyodz9byDjdxeVglrBJWCauEVcIqYZWwSlilwayJjX2QjWws636aqyH7fjcR6y9hlbBKWCWsElYJq4RVwiphlcY+MUaGVfrU18j/We/5+9mHhYWFhYWFhYWF9VWsmXf5kWGVsEpXe53Kq4IGLjsAAAAASUVORK5CYII="></td>
      <td align="center">3737
(94.49%)</td>
      <td align="center">218
(5.51%)</td>
    </tr>
    <tr>
      <td align="center">15</td>
      <td align="left">internet_skills
[integer]</td>
      <td align="left">mean (sd) : 1.92 (1.39)
min &lt; med &lt; max :
0 &lt; 2 &lt; 4
IQR (CV) : 2 (0.72)</td>
      <td align="left">0 : 942 (23.8%)
1 : 629 (15.9%)
2 : 721 (18.2%)
3 : 1121 (28.3%)
4 : 542 (13.7%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACCCAMAAACTmMFdAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAL5JREFUeJzt2tENwjAQRMEA/fdMA1hog8MtaF4F8+GTfHGOR2XHNOB1WEm1rNtoa9Z9MCwsLCwsLCwsLCys86zOFaMyrKRrztYO1vfmCwsLCwsLCwsLC+tHWZ13+cqwkq7/BnGWtX8SP59KLCwsLCwsLCwsLKz3rM4VozKspOkn9EXDPxwswkrCSsJKwkrCSsJKwkrCSsJKKmY1VruQVVbL2nYeNrN2TQ8WFhYWFhYWFhbW37I67/KVYSVhJT0BEfiy3sdymH0AAAAASUVORK5CYII="></td>
      <td align="center">3955
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">16</td>
      <td align="left">int_attch
[integer]</td>
      <td align="left">mean (sd) : 0.74 (0.44)
min &lt; med &lt; max :
0 &lt; 1 &lt; 1
IQR (CV) : 1 (0.59)</td>
      <td align="left">0 : 1019 (25.8%)
1 : 2936 (74.2%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGJJREFUWIXt17ERgDAQA0GD+++ZBiCQZ2wU7FWwwX+gMSsbfwPeG/Na6QDrzsPCwsLCwsLCwsLCwvpidS6fyrCSFm9rd2ufuDusJKwkrCSsJKwkrCSsJKwkrKRiVmO1g6yyB6cWR/KuhFfLAAAAAElFTkSuQmCC"></td>
      <td align="center">3955
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">17</td>
      <td align="left">int_post
[integer]</td>
      <td align="left">mean (sd) : 0.47 (0.5)
min &lt; med &lt; max :
0 &lt; 0 &lt; 1
IQR (CV) : 1 (1.06)</td>
      <td align="left">0 : 2098 (53.0%)
1 : 1857 (46.9%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGJJREFUWIXt16EBACEQA0F4+u/5KQATDBGzFYy4iBursvEacG6s2dhmfX1hJWElYSVhJWElYSVhJWElYSVhJc3az6cyrKSO2zqxXs9uDw8LCwsLCwsLCwsL64JV0IFVWSnrB4gGQCrPeJgdAAAAAElFTkSuQmCC"></td>
      <td align="center">3955
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">18</td>
      <td align="left">int_blog
[integer]</td>
      <td align="left">mean (sd) : 0.15 (0.35)
min &lt; med &lt; max :
0 &lt; 0 &lt; 1
IQR (CV) : 0 (2.41)</td>
      <td align="left">0 : 3372 (85.3%)
1 : 583 (14.7%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGFJREFUWIXt17ERgEAMA0E/33/PUAAwo+gV7FWwgR1odmVzGvDe7NXYw7r6wkrCSsJKwkrCSsJKwkrCSsJKwkpatcunMqyk39s6yvr+BywsLCwsLCwsLCysZlbnxKislHUDyVtKAsv+N3sAAAAASUVORK5CYII="></td>
      <td align="center">3955
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">19</td>
      <td align="left">int_down
[integer]</td>
      <td align="left">mean (sd) : 0.56 (0.5)
min &lt; med &lt; max :
0 &lt; 1 &lt; 1
IQR (CV) : 1 (0.88)</td>
      <td align="left">0 : 1729 (43.7%)
1 : 2226 (56.3%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGFJREFUWIXt18ENgEAMA8GD679nGkACf4iFZiuYR/Lw2pWtacB9ax8DvWGdn4eFhYWFhYWFhYWF9WNW5/KpDCtp5rYeG/nEx7CSsJKwkrCSsJKwkrCSsJKwkopZjdUOssouLg9By6tycNEAAAAASUVORK5CYII="></td>
      <td align="center">3955
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">20</td>
      <td align="left">election_newspaper
[integer]</td>
      <td align="left">mean (sd) : 2.43 (0.97)
min &lt; med &lt; max :
1 &lt; 2 &lt; 4
IQR (CV) : 1 (0.4)</td>
      <td align="left">1 : 736 (18.7%)
2 : 1400 (35.5%)
3 : 1160 (29.5%)
4 : 642 (16.3%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABoCAMAAAAkR/m5AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAJ5JREFUaIHt19EJw0AMRMFz3H/PaSAENsi+jZlXwXxIIK2zsrUb8DmspHUes42xXpNhYWFhYWFhYWFhYd3G6nwxKsNKGp+tmaY3cSasJKwkrCSsJKwkrCSsJKwkrKRiVmO1D1lltaydI/SNtXHhsLCwsLCwsLCwsP6D1XnLV4aVVMu6dnZ/Z1266VhYWFhYWFhYWFhPYHXe8pVhJZWy3mgoj37Y8mPkAAAAAElFTkSuQmCC"></td>
      <td align="center">3938
(99.57%)</td>
      <td align="center">17
(0.43%)</td>
    </tr>
    <tr>
      <td align="center">21</td>
      <td align="left">election_tv
[integer]</td>
      <td align="left">mean (sd) : 2.01 (0.92)
min &lt; med &lt; max :
1 &lt; 2 &lt; 4
IQR (CV) : 2 (0.46)</td>
      <td align="left">1 : 1316 (33.8%)
2 : 1530 (39.3%)
3 : 741 (19.1%)
4 : 303 (7.8%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABoCAMAAAAkR/m5AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAJ5JREFUaIHt18ENwzAMBEEl7r/nNKA8zhDMSzBbwTxIgFxXZWsasA8raV2v6b6w3rNhYWFhYWFhYWFhYd1kTbdnVYaVVDBbu+Y3cRdWElYSVhJWElYSVhJWElYSVlIxq7Hah6yyWtaxeTjMOrU9WFhYWFhYWFhYWH/L6rzlK8NKqmU9N8cZ67Gtx8LCwsLCwsLCwvpVVuctXxlWUinrA3c5kuQGk2tKAAAAAElFTkSuQmCC"></td>
      <td align="center">3890
(98.36%)</td>
      <td align="center">65
(1.64%)</td>
    </tr>
    <tr>
      <td align="center">22</td>
      <td align="left">election_radio
[integer]</td>
      <td align="left">mean (sd) : 2.6 (1.05)
min &lt; med &lt; max :
1 &lt; 3 &lt; 4
IQR (CV) : 2 (0.4)</td>
      <td align="left">1 : 591 (17.3%)
2 : 1068 (31.2%)
3 : 879 (25.7%)
4 : 885 (25.9%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABoCAMAAAAkR/m5AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAKFJREFUaIHt2NEJw0AMRMFL3H/PaSAxLD5Ha5hXwXxIoLt1VLamAd/DSlrHa39bWO/dYWFhYWFhYWFhYWH9hdX5xKgMK+mW2breHZt4PawkrCSsJKwkrCSsJKwkrCSspGJWY7UPsspqWYMTdMqa2zcsLCwsLCwsLCysh7A6b/nKsJJqWYMj/3vmRz+SsLCwsLCwsLCwsB7C6rzlK8NKKmV9APtcikSethGjAAAAAElFTkSuQmCC"></td>
      <td align="center">3423
(86.55%)</td>
      <td align="center">532
(13.45%)</td>
    </tr>
    <tr>
      <td align="center">23</td>
      <td align="left">female
[integer]</td>
      <td align="left">mean (sd) : 0.52 (0.5)
min &lt; med &lt; max :
0 &lt; 1 &lt; 1
IQR (CV) : 1 (0.96)</td>
      <td align="left">0 : 1855 (47.8%)
1 : 2023 (52.2%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGZJREFUWIXt17EVgDAMxFBD9t+ZNuTRqEKF/gQqfIVnKc3fAd9mXRZH1u1QFlEWURZRFlEWURZRFlEWURZRFnFmWbyzlMoiRLe18yxxVxZRFlEWURZRFlEWURZRFlEWIc4y0j5kSg8GiT++T7yU5AAAAABJRU5ErkJggg=="></td>
      <td align="center">3878
(98.05%)</td>
      <td align="center">77
(1.95%)</td>
    </tr>
    <tr>
      <td align="center">24</td>
      <td align="left">highest_qual
[integer]</td>
      <td align="left">mean (sd) : 3.43 (2.19)
min &lt; med &lt; max :
1 &lt; 3 &lt; 7
IQR (CV) : 5 (0.64)</td>
      <td align="left">1 : 1125 (29.6%)
2 : 510 (13.4%)
3 : 612 (16.1%)
4 : 168 (4.4%)
5 : 315 (8.3%)
6 : 665 (17.5%)
7 : 400 (10.5%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAC2CAMAAAAMc4TmAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAPVJREFUeJzt29EJwkAURNFE++9ZC4jgmLzsCOdWcD52YDeQ7VnZthpwHFYSVlIta2/szXr0hZWElYSVhJWElYSVhJWElYSVtNfe5SvDSrrmbE2wLhgOFhYWFhYWFhYWFtYCVucTozKspIlPI9ewzi/x+l1iYWFhYWFhYWFhVbE67/KVYSV9PFvLWWNzwsLCwsLCwsLCwsIaZXU+MSrDSoo+jdzKOlzi4nViYWFhYWFhYWFhVbE67/KVYSUN/il8kvX1ErOwsLCwsLCwsLCwsIZZnU+MyrCSfj1b86zbZ4aFhYWFhYWFhYX1b6zOu3xlWElYSVhJLyl5EJToZHCXAAAAAElFTkSuQmCC"></td>
      <td align="center">3795
(95.95%)</td>
      <td align="center">160
(4.05%)</td>
    </tr>
    <tr>
      <td align="center">25</td>
      <td align="left">tertiary_ed
[integer]</td>
      <td align="left">mean (sd) : 0.3 (0.46)
min &lt; med &lt; max :
0 &lt; 0 &lt; 1
IQR (CV) : 1 (1.54)</td>
      <td align="left">0 : 2673 (70.4%)
1 : 1122 (29.6%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGJJREFUWIXt17ERwCAQA0Ew/fdsF+BEwzAo2Ktgg/9AY1U2bgP+G2s29rGevrCSsJKwkrCSsJKwkrCSsJKwkrCSZu3yqQwrafu2jrH2fgYLCwsLCwsLCwsL6xarc2JUVsp6AYelRqIdwcuFAAAAAElFTkSuQmCC"></td>
      <td align="center">3795
(95.95%)</td>
      <td align="center">160
(4.05%)</td>
    </tr>
    <tr>
      <td align="center">26</td>
      <td align="left">country_birth
[integer]</td>
      <td align="left">mean (sd) : 2.65 (3.52)
min &lt; med &lt; max :
1 &lt; 1 &lt; 12
IQR (CV) : 1 (1.33)</td>
      <td align="left">12 distinct values</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABkCAMAAABThTnCAAAADFBMVEX9/v2mpqby8vL9/v28xacEAAAABHRSTlP///8AQCqp9AAAAKpJREFUaIHt2zEOwjAQAMEA//8zQlAEYUvZJrHQ7Adu5MLV3fZYsu1qwDis0pt1++pi0qsP674LaxpWCauEVcIqYZWwSlglrBJWCauEVcIqYZWwSlglrBJWCauEVcIqYZWwSlglrBJWCauEVcIqYZWwSlglrBJWCauEVcIqYZWwSljTBtv6S7B+p49YZ18aHGSd/XJYWFh/wDp2O9W/vTlroXas5cIqLcp6AvvGp4M4ye/wAAAAAElFTkSuQmCC"></td>
      <td align="center">3795
(95.95%)</td>
      <td align="center">160
(4.05%)</td>
    </tr>
    <tr>
      <td align="center">27</td>
      <td align="left">aust_born
[integer]</td>
      <td align="left">mean (sd) : 0.74 (0.44)
min &lt; med &lt; max :
0 &lt; 1 &lt; 1
IQR (CV) : 1 (0.59)</td>
      <td align="left">0 : 976 (25.7%)
1 : 2819 (74.3%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGJJREFUWIXt17ERgDAQA0GD+++ZBiCQZ2wU7FWwwX+gMSsbfwPeG/Na6ATrjsPCwsLCwsLCwsLCwvpkdS6fyrCS1m5re0ufuD2sJKwkrCSsJKwkrCSsJKwkrKRiVmO1g6yyB+DySAuQwtw3AAAAAElFTkSuQmCC"></td>
      <td align="center">3795
(95.95%)</td>
      <td align="center">160
(4.05%)</td>
    </tr>
    <tr>
      <td align="center">28</td>
      <td align="left">age
[integer]</td>
      <td align="left">mean (sd) : 54.11 (16.97)
min &lt; med &lt; max :
14 &lt; 56 &lt; 103
IQR (CV) : 24 (0.31)</td>
      <td align="left">84 distinct values</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABkCAMAAABThTnCAAAADFBMVEX9/v2mpqby8vL9/v28xacEAAAABHRSTlP///8AQCqp9AAAAO5JREFUaIHt19EOgyAMhWF17//OSxaMwTFsAe0h+88NiSTypReFLi/JLNGAcmB5Mpi1pvT+ZxRr92yf6LCSB5YlsDyB5Yka69Sw0tLbVvtZuSdb2qsGCxYsWLBgzcNay3d0OGureGDBgnU3K28MOqzTybBgwTo2W4frm1mtRYMFCxasEaziqCPAqp4MS5pVnZ8DWTUALFiw/pRlGesjWAYArPEs97hYZDleVjaWu2hllh0ACxas35v2RvEoa/8KC5YIq2EifITlB8CCBWta1vWNHcK6LhosWLBgSbIqXTWSlZbpWKtQvqulE1ieiLLeyBCUUCMrKCQAAAAASUVORK5CYII="></td>
      <td align="center">3853
(97.42%)</td>
      <td align="center">102
(2.58%)</td>
    </tr>
    <tr>
      <td align="center">29</td>
      <td align="left">income
[integer]</td>
      <td align="left">mean (sd) : 11.52 (6.25)
min &lt; med &lt; max :
1 &lt; 11 &lt; 22
IQR (CV) : 10 (0.54)</td>
      <td align="left">22 distinct values</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABkCAMAAABThTnCAAAADFBMVEX9/v2mpqby8vL9/v28xacEAAAABHRSTlP///8AQCqp9AAAAL5JREFUaIHt1kESgyAMBVDb3v/O3epopqRQifX9rZPwBHSyvEpmmQ04DlYmQ1iPTUZ0HMN6roL1IViZdLIOvpgSrH05FhYWFlZVVnr2OoeV3rk2Vu/r/orV2RfrMqzNDSzECiRYWNdmhb/8uax9BRYW1uVYTSPl+aywHAsL62tWNL9PZrWt/ves/PGcw0oviIWFhXUHVjRBT2aFxkKs8AEWFhYWFhYWFhYWFhYWFhYWFhbWHVmFsmKVC1YmRVlvPEGIpkdIDYEAAAAASUVORK5CYII="></td>
      <td align="center">3617
(91.45%)</td>
      <td align="center">338
(8.55%)</td>
    </tr>
    <tr>
      <td align="center">30</td>
      <td align="left">rural_urban
[integer]</td>
      <td align="left">mean (sd) : 3.91 (1.42)
min &lt; med &lt; max :
1 &lt; 5 &lt; 5
IQR (CV) : 2 (0.36)</td>
      <td align="left">1 : 418 (10.9%)
2 : 411 (10.7%)
3 : 306 (8.0%)
4 : 651 (17.0%)
5 : 2043 (53.4%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACCCAMAAACTmMFdAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAALRJREFUeJzt2LsRgDAMREE+/fdMA4C5BF2wr4INpBnL21nZNg24DyuplrW/N8Y63sLCwsLCwsLCwsLCqmV1nhiVYSXVzlbrJmJhYWFhYWFhYWH1sDrf8pVhJT3O1jiraQOxsLCwsLCwsLCwsL6zOk+MyrCSll8jM0O3+kgaWlEsLCwsLCwsLCwsrDWr88SoDCspn61fijfxl7CSsJKwkrCSsJKwkrCSsJKwkvbat3xlWElYSReFjsoF9UoPzQAAAABJRU5ErkJggg=="></td>
      <td align="center">3829
(96.81%)</td>
      <td align="center">126
(3.19%)</td>
    </tr>
    <tr>
      <td align="center">31</td>
      <td align="left">interest_pol
[integer]</td>
      <td align="left">mean (sd) : 1.87 (0.81)
min &lt; med &lt; max :
1 &lt; 2 &lt; 4
IQR (CV) : 1 (0.43)</td>
      <td align="left">1 : 1438 (36.5%)
2 : 1706 (43.3%)
3 : 661 (16.8%)
4 : 137 (3.5%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABoCAMAAAAkR/m5AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAKZJREFUaIHt10EKwzAMRFGnuf+dsy7UhUlpNdD3T/AWkpHXWdmaBrwOK2mdx2h71mMwLCwsLCwsLCwsLKz7rM4vRmVYSdOztWl4EzdhJWElYSVhJWElYSVhJWElYSUVsxqr/ZBVVsv6YAK+yrq/L1hYWFhYWFhYWFh/wuq85SvDSqpl/WiIs54fCKz3YSVhJWElYSVhJWElYSVhJfWyOm/5yrCSSlkX5UqV9d/HanIAAAAASUVORK5CYII="></td>
      <td align="center">3942
(99.67%)</td>
      <td align="center">13
(0.33%)</td>
    </tr>
    <tr>
      <td align="center">32</td>
      <td align="left">age_cat
[integer]</td>
      <td align="left">mean (sd) : 4.32 (1.53)
min &lt; med &lt; max :
1 &lt; 5 &lt; 6
IQR (CV) : 3 (0.35)</td>
      <td align="left">1 : 222 (5.8%)
2 : 363 (9.4%)
3 : 517 (13.4%)
4 : 749 (19.4%)
5 : 866 (22.5%)
6 : 1134 (29.4%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACcCAMAAACqRKK2AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAN5JREFUeJzt18ENhDAQBEE48s+ZBE6YQZY9j+oI6rFrrY+rsmM34H9YSVhJx3U+to/1ewgLCwsLCwsLCwsLq/aWrwwrqZb1PPKbtmDwQOx6M7CwsLCwsLCwsLCqWJ23fGVYSR9ma8W85Zu4ZDuxsLCwsLCwsLCwsMaszi9GZVhJk2Zr9uTN2cTpe4qFhYWFhYWFhYVVxeq85SvDSloyW/mordjED4uJhYWFhYWFhYWFhTVmdX4xKsNK2jFbL9qwiS/CSsJKwkrCSsJKwkrCSsJKwko6a2/5yrCSsJJKWTeVM+LIzKX9WAAAAABJRU5ErkJggg=="></td>
      <td align="center">3851
(97.37%)</td>
      <td align="center">104
(2.63%)</td>
    </tr>
    <tr>
      <td align="center">33</td>
      <td align="left">age_18_24
[integer]</td>
      <td align="left">mean (sd) : 0.06 (0.23)
min &lt; med &lt; max :
0 &lt; 0 &lt; 1
IQR (CV) : 0 (4.04)</td>
      <td align="left">0 : 3629 (94.2%)
1 : 222 (5.8%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGdJREFUWIXt17ENACAMxMAA++8MZQok5IovfBO4SIqvFal+B9zVGolO1sxjFmEWYRZhFmEWYRZhFmEWYRZhFjFil08ks4h+W79bmvaJZj2ZRZhFmEWYRZhFmEWYRZhFmEXEToxIoVkbWcZLmth4yb0AAAAASUVORK5CYII="></td>
      <td align="center">3851
(97.37%)</td>
      <td align="center">104
(2.63%)</td>
    </tr>
    <tr>
      <td align="center">34</td>
      <td align="left">weight
[numeric]</td>
      <td align="left">mean (sd) : 1 (0.56)
min &lt; med &lt; max :
0.36 &lt; 0.81 &lt; 6.65
IQR (CV) : 0.47 (0.56)</td>
      <td align="left">414 distinct values</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAABkCAMAAABThTnCAAAADFBMVEX9/v2mpqby8vL9/v28xacEAAAABHRSTlP///8AQCqp9AAAAKtJREFUaIHt2kEKwkAQAMGo//+zF8VgJNhEsitUv6CYgZ3LLrcpW0YDPodVemddXg3xPNqwrs+wtmGVsEpYJawSVgmrhFXCKmGVsEpYJawSVgmrhFXCKmGVsEpYJawSVgmrhFXCKmGVsEpYJawSVgmrhFXCKv0fa+QvwR3WyLlhYWFhHWOd/7B+xTp/blhYWFhYP2StzstUrH3M9KyzjvZmicNbsaYLqzQp6w79Yagi171i1gAAAABJRU5ErkJggg=="></td>
      <td align="center">3955
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">35</td>
      <td align="left">know1_correct
[integer]</td>
      <td align="left">mean (sd) : 0.74 (0.44)
min &lt; med &lt; max :
0 &lt; 1 &lt; 1
IQR (CV) : 1 (0.59)</td>
      <td align="left">0 : 971 (25.6%)
1 : 2827 (74.4%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGJJREFUWIXt17ERgDAQA0GD+++ZBiCQZ2wU7FWwwX+gMSsbfwPeG/Na6ATrjsPCwsLCwsLCwsLCwvpkdS6fyrCS1m5re0ufuD2sJKwkrCSsJKwkrCSsJKwkrKRiVmO1g6yyB+DySAuQwtw3AAAAAElFTkSuQmCC"></td>
      <td align="center">3798
(96.03%)</td>
      <td align="center">157
(3.97%)</td>
    </tr>
    <tr>
      <td align="center">36</td>
      <td align="left">know2_correct
[integer]</td>
      <td align="left">mean (sd) : 0.48 (0.5)
min &lt; med &lt; max :
0 &lt; 0 &lt; 1
IQR (CV) : 1 (1.04)</td>
      <td align="left">0 : 1952 (52.0%)
1 : 1805 (48.0%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGhJREFUWIXt17ENACAMxMAA++8MDQUSjSseyTeBi3yRGpHqdcBdjZZoZfU8ZhFmEWYRZhFmEWYRZhFmEWYRZhEt9vOJZBaRdFtn1uvZbWYRZhFmEWYRZhFmEWYRZhFmEX9kxTiyIoVmTVpiP5rC2/6gAAAAAElFTkSuQmCC"></td>
      <td align="center">3757
(94.99%)</td>
      <td align="center">198
(5.01%)</td>
    </tr>
    <tr>
      <td align="center">37</td>
      <td align="left">know3_correct
[integer]</td>
      <td align="left">mean (sd) : 0.35 (0.48)
min &lt; med &lt; max :
0 &lt; 0 &lt; 1
IQR (CV) : 1 (1.35)</td>
      <td align="left">0 : 2439 (64.6%)
1 : 1334 (35.4%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGJJREFUWIXt17ERgDAQA0Eb998zFECiGRsU7FWwwX+gsSobfwPeG2s29rCuvrCSsJKwkrCSsJKwkrCSsJKwkrCSZu3yqQwr6cRt7WFtfyMsLCwsLCwsLCwsrE9YnROjslLWDd0LRNqbikI/AAAAAElFTkSuQmCC"></td>
      <td align="center">3773
(95.4%)</td>
      <td align="center">182
(4.6%)</td>
    </tr>
    <tr>
      <td align="center">38</td>
      <td align="left">know4_correct
[integer]</td>
      <td align="left">mean (sd) : 0.27 (0.44)
min &lt; med &lt; max :
0 &lt; 0 &lt; 1
IQR (CV) : 1 (1.66)</td>
      <td align="left">0 : 2775 (73.3%)
1 : 1012 (26.7%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGJJREFUWIXt17ERwCAQA0Ew/fdsF+BEzDAo2Ktgg/9AY1U2bgP+G2s29rGevrCSsJKwkrCSsJKwkrCSsJKwkrCSZu3yqQwrafu2jrP2fgULCwsLCwsLCwsL6zarc2JUVsp6AVLfR2LnYJMGAAAAAElFTkSuQmCC"></td>
      <td align="center">3787
(95.75%)</td>
      <td align="center">168
(4.25%)</td>
    </tr>
    <tr>
      <td align="center">39</td>
      <td align="left">know5_correct
[integer]</td>
      <td align="left">mean (sd) : 0.3 (0.46)
min &lt; med &lt; max :
0 &lt; 0 &lt; 1
IQR (CV) : 1 (1.52)</td>
      <td align="left">0 : 2649 (69.7%)
1 : 1151 (30.3%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGJJREFUWIXt17ERgDAQA0Eb998zFECiMYwV7FWwwX+gsSobpwHvjTUbe1hXX1hJWElYSVhJWElYSVhJWElYSVhJs3b5VIaV9MVt/cPafhssLCwsLCwsLCwsrCOszolRWSnrBlz/Rlq8+TjjAAAAAElFTkSuQmCC"></td>
      <td align="center">3800
(96.08%)</td>
      <td align="center">155
(3.92%)</td>
    </tr>
    <tr>
      <td align="center">40</td>
      <td align="left">know6_correct
[integer]</td>
      <td align="left">mean (sd) : 0.43 (0.49)
min &lt; med &lt; max :
0 &lt; 0 &lt; 1
IQR (CV) : 1 (1.15)</td>
      <td align="left">0 : 2151 (57.1%)
1 : 1615 (42.9%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGJJREFUWIXt17ERgDAQA0Eb998zFEBgzTBGwV4FG/wHGquy8TfgvbFmYw/r6gsrCSsJKwkrCSsJKwkrCSsJKwkradYun8qwks7f1i7r8JNhYWFhYWFhYWFhYX3E6pwYlZWybo3oQgqu0uEGAAAAAElFTkSuQmCC"></td>
      <td align="center">3766
(95.22%)</td>
      <td align="center">189
(4.78%)</td>
    </tr>
    <tr>
      <td align="center">41</td>
      <td align="left">know7_correct
[integer]</td>
      <td align="left">mean (sd) : 0.56 (0.5)
min &lt; med &lt; max :
0 &lt; 1 &lt; 1
IQR (CV) : 1 (0.89)</td>
      <td align="left">0 : 1656 (44.3%)
1 : 2081 (55.7%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGFJREFUWIXt17ENwDAMA0En3n/nLBA4YCUiuJ/gCqng2pWtacB7a18zfbLuibCwsLCwsLCwsLCw/srqXD6VYSWN3da5qU88h5WElYSVhJWElYSVhJWElYSVVMxqrHaQVfYAk3dBgH5lYE8AAAAASUVORK5CYII="></td>
      <td align="center">3737
(94.49%)</td>
      <td align="center">218
(5.51%)</td>
    </tr>
    <tr>
      <td align="center">42</td>
      <td align="left">know8_correct
[integer]</td>
      <td align="left">mean (sd) : 0.64 (0.48)
min &lt; med &lt; max :
0 &lt; 1 &lt; 1
IQR (CV) : 1 (0.75)</td>
      <td align="left">0 : 1380 (35.9%)
1 : 2462 (64.1%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGJJREFUWIXt17ENgDAQBEGD+++ZBkhOtsVJzFYwwX9wY1Y2vga8N+Z1oB2se3tYWFhYWFhYWFhYWD9mdS6fyrCSztzWckc+cTmsJKwkrCSsJKwkrCSsJKwkrKRiVmO1g6yyB9V5ROsCPzosAAAAAElFTkSuQmCC"></td>
      <td align="center">3842
(97.14%)</td>
      <td align="center">113
(2.86%)</td>
    </tr>
    <tr>
      <td align="center">43</td>
      <td align="left">know9_correct
[integer]</td>
      <td align="left">mean (sd) : 0.61 (0.49)
min &lt; med &lt; max :
0 &lt; 1 &lt; 1
IQR (CV) : 1 (0.79)</td>
      <td align="left">0 : 1477 (38.7%)
1 : 2342 (61.3%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGJJREFUWIXt17ENwDAMA0En3n/nLJCGBoQQyP0EV0gF165sfQ14b+1rtmPWPRkWFhYWFhYWFhYW1t9YncunMqyk8ds6a/oTz8JKwkrCSsJKwkrCSsJKwkrCSipmNVY7yCp7AICmQ9i8v818AAAAAElFTkSuQmCC"></td>
      <td align="center">3819
(96.56%)</td>
      <td align="center">136
(3.44%)</td>
    </tr>
    <tr>
      <td align="center">44</td>
      <td align="left">know10_correct
[integer]</td>
      <td align="left">mean (sd) : 0.51 (0.5)
min &lt; med &lt; max :
0 &lt; 1 &lt; 1
IQR (CV) : 1 (0.99)</td>
      <td align="left">0 : 1890 (49.4%)
1 : 1936 (50.6%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAA0CAMAAABfCzE1AAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAGRJREFUWIXt16ERwDAMxVCn2X/n5q40RKgCehMI2ODPVpq/A+5mL50v65EpiyiLKIsoiyiLKIsoiyiLKIsoi1jm5aNUFmG8rUP4iUdZRFlEWURZRFlEWURZRFlEWYQ4y0g7yJReS+g+3by1rWgAAAAASUVORK5CYII="></td>
      <td align="center">3826
(96.74%)</td>
      <td align="center">129
(3.26%)</td>
    </tr>
    <tr>
      <td align="center">45</td>
      <td align="left">income_quintiles
[integer]</td>
      <td align="left">mean (sd) : 3.08 (1.39)
min &lt; med &lt; max :
1 &lt; 3 &lt; 5
IQR (CV) : 2 (0.45)</td>
      <td align="left">1 : 629 (17.4%)
2 : 744 (20.6%)
3 : 701 (19.4%)
4 : 808 (22.3%)
5 : 735 (20.3%)</td>
      <td align="center" border="0"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACCCAMAAACTmMFdAAAADFBMVEX9/v2mpqb39/f9/v0TNkn1AAAABHRSTlP///8AQCqp9AAAAMtJREFUeJzt17sNAkEQBUE++eeMgTDuWONaQuwY1RGUMc+Y23Nkt92AdVilsaz7ji6wHv8PCwsLCwsLCwsLC+sHrJkvxsiwSptua9mRtWGJy7BKWCWsElYJq4RVwiphlbBKJ9aYDqyRYZUm3NaaNWmBWFhYWFhYWFhYWFjXWdtbskaGVZpwW4sGLHERVgmrhFXCKmGVsEpYJawSVmkwa2JjH7KRjWXtPqNPZ9bu2b3DKmGVsEpYJawSVgmrhFXCKn2xhnRijQyrhFV6AWQmpgOy8/lGAAAAAElFTkSuQmCC"></td>
      <td align="center">3617
(91.45%)</td>
      <td align="center">338
(8.55%)</td>
    </tr>
  </tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-28</p>
</div><!--/html_preserve-->

**This is the end of the Univariate statistics  R code/ R-script file. The class continues in the code "Week 2, Part 2, Bivariate statistics.R'**

