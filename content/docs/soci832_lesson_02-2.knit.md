---
title: "SOCI832 Lesson 2.2: Bivariate analysis"

lastmod: 2018-12-28T00:00:00.000Z

draft: false
toc: true
type: docs

linktitle: "2.2 Bivariate analysis"
menu:
  docs:
    parent: SOCI832
    weight: 40
---

{{% toc %}}

Last updated: 27 Dec 2018

*_Author_: Nicholas Harrigan*


# Stuff you need to do before starting 

1) Change this to your working directory


```r
setwd("C:/G/2018, SOCI832/Datasets/AES 2013/") 
```

2) Put the file "elect_2013.csv" into that folder This file can be found here: <https://mqsociology.github.io/learn-r/soci832/elect_2013.csv> 

3) Keep the codebook openned in a browser so you can refer to it when you need it. The codebook is here: <https://mqsociology.github.io/learn-r/soci832/codebook%20aes%202013.html> 

4) Install summarytools package if you havne't already


```r
install.packages("summarytools", 
                 repos = 'http://cran.rstudio.com')  # install the package (once, and then # it out)
```

```
## Installing package into 'C:/Users/nickh/Documents/R/win-library/3.5'
## (as 'lib' is unspecified)
```

```
## package 'summarytools' successfully unpacked and MD5 sums checked
## 
## The downloaded binary packages are in
## 	C:\Users\nickh\AppData\Local\Temp\RtmpsRH8Xw\downloaded_packages
```

```r
library(summarytools) # load the library
```

```
## Warning: package 'summarytools' was built under R version 3.5.2
```

5) Import the data


```r
elect_2013 <- read.csv("elect_2013.csv")  # loads dataset 
```

6) The next command (below) gets rid of the first column which is not needed. FYI the command works by saying  "copy all columns except the first". NOTE: Only run this command once after you run the 'read.csv' command. Each time you run it, it deletes the first variable. 


```r
    elect_2013 <- elect_2013[,2:ncol(elect_2013)]
```

# 1. Crosstabs 

This section shows how to cross- tabulate the levels of two variables. This is often one of the simplest ways to get a quick look at the relationship between two variables

## Crosstabs Example 1: Pol Know vs Likelihood voting 

This is how the command 'ctable()' presents a cross tabulation with default settings:


```r
print(ctable(elect_2013$pol_knowledge, 
     elect_2013$likelihood_vote), 
     method = 'rmarkdown')
```

<!--html_preserve--><div class="container st-container">
<h3>Cross-Tabulation / Row Proportions</h3>
<strong>Variables</strong>: pol_knowledge * likelihood_vote
  <br><strong>Data Frame</strong>: elect_2013
<table class="table table-bordered st-table st-table-bordered st-cross-table ">
<thead>
<tr>
<th></th>
<th colspan="6">likelihood_vote</th>
<th></th>
</tr>
<tr>
<td align="center">
<strong>pol_knowledge</strong>
</td>
<th align="center">1</th>
<th align="center">2</th>
<th align="center">3</th>
<th align="center">4</th>
<th align="center">5</th>
<th align="center">&lt;NA&gt;</th>
<th align="center">Total</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">
<strong>0</strong>
</td>
<td>
<span>&nbsp;51&nbsp;(12.44&#37;)</span>
</td>
<td>
<span>&nbsp;78&nbsp;(19.02&#37;)</span>
</td>
<td>
<span>&nbsp;48&nbsp;(11.71&#37;)</span>
</td>
<td>
<span>&nbsp;99&nbsp;(24.15&#37;)</span>
</td>
<td>
<span>&nbsp;130&nbsp;(31.71&#37;)</span>
</td>
<td>
<span>&nbsp;4&nbsp;(0.98&#37;)</span>
</td>
<td>
<span>&nbsp;410&nbsp;(100.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>1</strong>
</td>
<td>
<span>&nbsp;18&nbsp;(5.94&#37;)</span>
</td>
<td>
<span>&nbsp;48&nbsp;(15.84&#37;)</span>
</td>
<td>
<span>&nbsp;38&nbsp;(12.54&#37;)</span>
</td>
<td>
<span>&nbsp;68&nbsp;(22.44&#37;)</span>
</td>
<td>
<span>&nbsp;128&nbsp;(42.24&#37;)</span>
</td>
<td>
<span>&nbsp;3&nbsp;(0.99&#37;)</span>
</td>
<td>
<span>&nbsp;303&nbsp;(100.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>2</strong>
</td>
<td>
<span>&nbsp;13&nbsp;(3.42&#37;)</span>
</td>
<td>
<span>&nbsp;41&nbsp;(10.79&#37;)</span>
</td>
<td>
<span>&nbsp;36&nbsp;(9.47&#37;)</span>
</td>
<td>
<span>106&nbsp;(27.89&#37;)</span>
</td>
<td>
<span>&nbsp;182&nbsp;(47.89&#37;)</span>
</td>
<td>
<span>&nbsp;2&nbsp;(0.53&#37;)</span>
</td>
<td>
<span>&nbsp;380&nbsp;(100.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>3</strong>
</td>
<td>
<span>&nbsp;13&nbsp;(3.40&#37;)</span>
</td>
<td>
<span>&nbsp;27&nbsp;(7.07&#37;)</span>
</td>
<td>
<span>&nbsp;22&nbsp;(5.76&#37;)</span>
</td>
<td>
<span>&nbsp;75&nbsp;(19.63&#37;)</span>
</td>
<td>
<span>&nbsp;243&nbsp;(63.61&#37;)</span>
</td>
<td>
<span>&nbsp;2&nbsp;(0.52&#37;)</span>
</td>
<td>
<span>&nbsp;382&nbsp;(100.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>4</strong>
</td>
<td>
<span>&nbsp;&nbsp;9&nbsp;(2.23&#37;)</span>
</td>
<td>
<span>&nbsp;25&nbsp;(6.20&#37;)</span>
</td>
<td>
<span>&nbsp;29&nbsp;(7.20&#37;)</span>
</td>
<td>
<span>&nbsp;79&nbsp;(19.60&#37;)</span>
</td>
<td>
<span>&nbsp;258&nbsp;(64.02&#37;)</span>
</td>
<td>
<span>&nbsp;3&nbsp;(0.74&#37;)</span>
</td>
<td>
<span>&nbsp;403&nbsp;(100.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>5</strong>
</td>
<td>
<span>&nbsp;&nbsp;9&nbsp;(2.12&#37;)</span>
</td>
<td>
<span>&nbsp;13&nbsp;(3.06&#37;)</span>
</td>
<td>
<span>&nbsp;18&nbsp;(4.24&#37;)</span>
</td>
<td>
<span>&nbsp;88&nbsp;(20.71&#37;)</span>
</td>
<td>
<span>&nbsp;296&nbsp;(69.65&#37;)</span>
</td>
<td>
<span>&nbsp;1&nbsp;(0.24&#37;)</span>
</td>
<td>
<span>&nbsp;425&nbsp;(100.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>6</strong>
</td>
<td>
<span>&nbsp;&nbsp;4&nbsp;(1.06&#37;)</span>
</td>
<td>
<span>&nbsp;16&nbsp;(4.26&#37;)</span>
</td>
<td>
<span>&nbsp;15&nbsp;(3.99&#37;)</span>
</td>
<td>
<span>&nbsp;60&nbsp;(15.96&#37;)</span>
</td>
<td>
<span>&nbsp;279&nbsp;(74.20&#37;)</span>
</td>
<td>
<span>&nbsp;2&nbsp;(0.53&#37;)</span>
</td>
<td>
<span>&nbsp;376&nbsp;(100.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>7</strong>
</td>
<td>
<span>&nbsp;&nbsp;2&nbsp;(0.46&#37;)</span>
</td>
<td>
<span>&nbsp;10&nbsp;(2.30&#37;)</span>
</td>
<td>
<span>&nbsp;12&nbsp;(2.76&#37;)</span>
</td>
<td>
<span>&nbsp;56&nbsp;(12.87&#37;)</span>
</td>
<td>
<span>&nbsp;352&nbsp;(80.92&#37;)</span>
</td>
<td>
<span>&nbsp;3&nbsp;(0.69&#37;)</span>
</td>
<td>
<span>&nbsp;435&nbsp;(100.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>8</strong>
</td>
<td>
<span>&nbsp;&nbsp;6&nbsp;(1.55&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;7&nbsp;(1.81&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;9&nbsp;(2.33&#37;)</span>
</td>
<td>
<span>&nbsp;46&nbsp;(11.89&#37;)</span>
</td>
<td>
<span>&nbsp;315&nbsp;(81.40&#37;)</span>
</td>
<td>
<span>&nbsp;4&nbsp;(1.03&#37;)</span>
</td>
<td>
<span>&nbsp;387&nbsp;(100.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>9</strong>
</td>
<td>
<span>&nbsp;&nbsp;0&nbsp;(0.00&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;3&nbsp;(0.94&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;6&nbsp;(1.89&#37;)</span>
</td>
<td>
<span>&nbsp;30&nbsp;(9.43&#37;)</span>
</td>
<td>
<span>&nbsp;274&nbsp;(86.16&#37;)</span>
</td>
<td>
<span>&nbsp;5&nbsp;(1.57&#37;)</span>
</td>
<td>
<span>&nbsp;318&nbsp;(100.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>10</strong>
</td>
<td>
<span>&nbsp;&nbsp;1&nbsp;(0.74&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;1&nbsp;(0.74&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;3&nbsp;(2.21&#37;)</span>
</td>
<td>
<span>&nbsp;14&nbsp;(10.29&#37;)</span>
</td>
<td>
<span>&nbsp;117&nbsp;(86.03&#37;)</span>
</td>
<td>
<span>&nbsp;0&nbsp;(0.00&#37;)</span>
</td>
<td>
<span>&nbsp;136&nbsp;(100.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>Total</strong>
</td>
<td>
<span>126&nbsp;(3.19&#37;)</span>
</td>
<td>
<span>269&nbsp;(6.80&#37;)</span>
</td>
<td>
<span>236&nbsp;(5.97&#37;)</span>
</td>
<td>
<span>721&nbsp;(18.23&#37;)</span>
</td>
<td>
<span>2574&nbsp;(65.08&#37;)</span>
</td>
<td>
<span>29&nbsp;(0.73&#37;)</span>
</td>
<td>
<span>3955&nbsp;(100.00&#37;)</span>
</td>
</tr>
</tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.8.8 (<a href='https://www.r-project.org/'>R</a> version 3.5.1)<br/>2018-12-30</p>
</div><!--/html_preserve-->

Notice that each cell in the table has two numbers the first number is the number of survey respondents who had those two values of the two variables.  For exampke, there are 51 people who got zero on the political knowledge quiz, and who also said their likelihood of voting if voting was not compulsory was 'definitely not' (i.e. a 1 on a 5 point scale). The second number in each cell (contained in brakets)  is a percentage. In this default setting, this is the row percentage - the percentage of people with a political knowledge score of zero, who have a '1' on the 'likelihood_vote' variable. You can see that this is 12.44%. 

Often when reading cross tabulations it can be difficult to work out whether the percentages are row or column percentages. One of the easiest ways to work this out is to simply look at the Total column, and Total row. Almost always you will find that one of the two Totals is equalt to 100% for all values of a variable. The total with the 100% is the denominator for all cells in it's row or column. 

So in this case, we can see that the Total column has 100% for all variables, telling you that the percentages are "percent of people with political knowledge of X, who had a likelihood of voting of Y." 'prop' ARGUMENT We can control the displaying of row and column percentages with the argument 'prop'. prop takes four different settings "r" for 'row percentages is the default (so you don't need to put this setting in). The other options are: "c" for column totals (cell count/column count) "t" for displaying percent of all cases (cell count/total count) "n" for none - no percentages

So this command displays column totals


```r
print(ctable(elect_2013$pol_knowledge, 
      elect_2013$likelihood_vote, 
      prop = "c"),
      method = 'rmarkdown', footnote = NA)
```

<!--html_preserve--><div class="container st-container">
<h3>Cross-Tabulation / Column Proportions</h3>
<strong>Variables</strong>: pol_knowledge * likelihood_vote
  <br><strong>Data Frame</strong>: elect_2013
<table class="table table-bordered st-table st-table-bordered st-cross-table ">
<thead>
<tr>
<th></th>
<th colspan="6">likelihood_vote</th>
<th></th>
</tr>
<tr>
<td align="center">
<strong>pol_knowledge</strong>
</td>
<th align="center">1</th>
<th align="center">2</th>
<th align="center">3</th>
<th align="center">4</th>
<th align="center">5</th>
<th align="center">&lt;NA&gt;</th>
<th align="center">Total</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">
<strong>0</strong>
</td>
<td>
<span>&nbsp;51&nbsp;(40.48&#37;)</span>
</td>
<td>
<span>&nbsp;78&nbsp;(29.00&#37;)</span>
</td>
<td>
<span>&nbsp;48&nbsp;(20.34&#37;)</span>
</td>
<td>
<span>&nbsp;99&nbsp;(13.73&#37;)</span>
</td>
<td>
<span>&nbsp;130&nbsp;(5.05&#37;)</span>
</td>
<td>
<span>&nbsp;4&nbsp;(13.79&#37;)</span>
</td>
<td>
<span>&nbsp;410&nbsp;(10.37&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>1</strong>
</td>
<td>
<span>&nbsp;18&nbsp;(14.29&#37;)</span>
</td>
<td>
<span>&nbsp;48&nbsp;(17.84&#37;)</span>
</td>
<td>
<span>&nbsp;38&nbsp;(16.10&#37;)</span>
</td>
<td>
<span>&nbsp;68&nbsp;(9.43&#37;)</span>
</td>
<td>
<span>&nbsp;128&nbsp;(4.97&#37;)</span>
</td>
<td>
<span>&nbsp;3&nbsp;(10.34&#37;)</span>
</td>
<td>
<span>&nbsp;303&nbsp;(7.66&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>2</strong>
</td>
<td>
<span>&nbsp;13&nbsp;(10.32&#37;)</span>
</td>
<td>
<span>&nbsp;41&nbsp;(15.24&#37;)</span>
</td>
<td>
<span>&nbsp;36&nbsp;(15.25&#37;)</span>
</td>
<td>
<span>106&nbsp;(14.70&#37;)</span>
</td>
<td>
<span>&nbsp;182&nbsp;(7.07&#37;)</span>
</td>
<td>
<span>&nbsp;2&nbsp;(6.90&#37;)</span>
</td>
<td>
<span>&nbsp;380&nbsp;(9.61&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>3</strong>
</td>
<td>
<span>&nbsp;13&nbsp;(10.32&#37;)</span>
</td>
<td>
<span>&nbsp;27&nbsp;(10.04&#37;)</span>
</td>
<td>
<span>&nbsp;22&nbsp;(9.32&#37;)</span>
</td>
<td>
<span>&nbsp;75&nbsp;(10.40&#37;)</span>
</td>
<td>
<span>&nbsp;243&nbsp;(9.44&#37;)</span>
</td>
<td>
<span>&nbsp;2&nbsp;(6.90&#37;)</span>
</td>
<td>
<span>&nbsp;382&nbsp;(9.66&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>4</strong>
</td>
<td>
<span>&nbsp;&nbsp;9&nbsp;(7.14&#37;)</span>
</td>
<td>
<span>&nbsp;25&nbsp;(9.29&#37;)</span>
</td>
<td>
<span>&nbsp;29&nbsp;(12.29&#37;)</span>
</td>
<td>
<span>&nbsp;79&nbsp;(10.96&#37;)</span>
</td>
<td>
<span>&nbsp;258&nbsp;(10.02&#37;)</span>
</td>
<td>
<span>&nbsp;3&nbsp;(10.34&#37;)</span>
</td>
<td>
<span>&nbsp;403&nbsp;(10.19&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>5</strong>
</td>
<td>
<span>&nbsp;&nbsp;9&nbsp;(7.14&#37;)</span>
</td>
<td>
<span>&nbsp;13&nbsp;(4.83&#37;)</span>
</td>
<td>
<span>&nbsp;18&nbsp;(7.63&#37;)</span>
</td>
<td>
<span>&nbsp;88&nbsp;(12.21&#37;)</span>
</td>
<td>
<span>&nbsp;296&nbsp;(11.50&#37;)</span>
</td>
<td>
<span>&nbsp;1&nbsp;(3.45&#37;)</span>
</td>
<td>
<span>&nbsp;425&nbsp;(10.75&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>6</strong>
</td>
<td>
<span>&nbsp;&nbsp;4&nbsp;(3.17&#37;)</span>
</td>
<td>
<span>&nbsp;16&nbsp;(5.95&#37;)</span>
</td>
<td>
<span>&nbsp;15&nbsp;(6.36&#37;)</span>
</td>
<td>
<span>&nbsp;60&nbsp;(8.32&#37;)</span>
</td>
<td>
<span>&nbsp;279&nbsp;(10.84&#37;)</span>
</td>
<td>
<span>&nbsp;2&nbsp;(6.90&#37;)</span>
</td>
<td>
<span>&nbsp;376&nbsp;(9.51&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>7</strong>
</td>
<td>
<span>&nbsp;&nbsp;2&nbsp;(1.59&#37;)</span>
</td>
<td>
<span>&nbsp;10&nbsp;(3.72&#37;)</span>
</td>
<td>
<span>&nbsp;12&nbsp;(5.08&#37;)</span>
</td>
<td>
<span>&nbsp;56&nbsp;(7.77&#37;)</span>
</td>
<td>
<span>&nbsp;352&nbsp;(13.68&#37;)</span>
</td>
<td>
<span>&nbsp;3&nbsp;(10.34&#37;)</span>
</td>
<td>
<span>&nbsp;435&nbsp;(11.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>8</strong>
</td>
<td>
<span>&nbsp;&nbsp;6&nbsp;(4.76&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;7&nbsp;(2.60&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;9&nbsp;(3.81&#37;)</span>
</td>
<td>
<span>&nbsp;46&nbsp;(6.38&#37;)</span>
</td>
<td>
<span>&nbsp;315&nbsp;(12.24&#37;)</span>
</td>
<td>
<span>&nbsp;4&nbsp;(13.79&#37;)</span>
</td>
<td>
<span>&nbsp;387&nbsp;(9.79&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>9</strong>
</td>
<td>
<span>&nbsp;&nbsp;0&nbsp;(0.00&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;3&nbsp;(1.12&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;6&nbsp;(2.54&#37;)</span>
</td>
<td>
<span>&nbsp;30&nbsp;(4.16&#37;)</span>
</td>
<td>
<span>&nbsp;274&nbsp;(10.64&#37;)</span>
</td>
<td>
<span>&nbsp;5&nbsp;(17.24&#37;)</span>
</td>
<td>
<span>&nbsp;318&nbsp;(8.04&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>10</strong>
</td>
<td>
<span>&nbsp;&nbsp;1&nbsp;(0.79&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;1&nbsp;(0.37&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;3&nbsp;(1.27&#37;)</span>
</td>
<td>
<span>&nbsp;14&nbsp;(1.94&#37;)</span>
</td>
<td>
<span>&nbsp;117&nbsp;(4.55&#37;)</span>
</td>
<td>
<span>&nbsp;0&nbsp;(0.00&#37;)</span>
</td>
<td>
<span>&nbsp;136&nbsp;(3.44&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>Total</strong>
</td>
<td>
<span>126&nbsp;(100.00&#37;)</span>
</td>
<td>
<span>269&nbsp;(100.00&#37;)</span>
</td>
<td>
<span>236&nbsp;(100.00&#37;)</span>
</td>
<td>
<span>721&nbsp;(100.00&#37;)</span>
</td>
<td>
<span>2574&nbsp;(100.00&#37;)</span>
</td>
<td>
<span>29&nbsp;(100.00&#37;)</span>
</td>
<td>
<span>3955&nbsp;(100.00&#37;)</span>
</td>
</tr>
</tbody>
</table>
</div><!--/html_preserve-->

Percentages of the total number of participants/cases


```r
    print(ctable(elect_2013$pol_knowledge, 
          elect_2013$likelihood_vote, 
          prop = "t"),
          method = 'rmarkdown', footnote = NA)
```

<!--html_preserve--><div class="container st-container">
<h3>Cross-Tabulation / Total Proportions</h3>
<strong>Variables</strong>: pol_knowledge * likelihood_vote
  <br><strong>Data Frame</strong>: elect_2013
<table class="table table-bordered st-table st-table-bordered st-cross-table ">
<thead>
<tr>
<th></th>
<th colspan="6">likelihood_vote</th>
<th></th>
</tr>
<tr>
<td align="center">
<strong>pol_knowledge</strong>
</td>
<th align="center">1</th>
<th align="center">2</th>
<th align="center">3</th>
<th align="center">4</th>
<th align="center">5</th>
<th align="center">&lt;NA&gt;</th>
<th align="center">Total</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">
<strong>0</strong>
</td>
<td>
<span>&nbsp;51&nbsp;(1.29&#37;)</span>
</td>
<td>
<span>&nbsp;78&nbsp;(1.97&#37;)</span>
</td>
<td>
<span>&nbsp;48&nbsp;(1.21&#37;)</span>
</td>
<td>
<span>&nbsp;99&nbsp;(2.50&#37;)</span>
</td>
<td>
<span>&nbsp;130&nbsp;(3.29&#37;)</span>
</td>
<td>
<span>&nbsp;4&nbsp;(0.10&#37;)</span>
</td>
<td>
<span>&nbsp;410&nbsp;(10.37&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>1</strong>
</td>
<td>
<span>&nbsp;18&nbsp;(0.46&#37;)</span>
</td>
<td>
<span>&nbsp;48&nbsp;(1.21&#37;)</span>
</td>
<td>
<span>&nbsp;38&nbsp;(0.96&#37;)</span>
</td>
<td>
<span>&nbsp;68&nbsp;(1.72&#37;)</span>
</td>
<td>
<span>&nbsp;128&nbsp;(3.24&#37;)</span>
</td>
<td>
<span>&nbsp;3&nbsp;(0.08&#37;)</span>
</td>
<td>
<span>&nbsp;303&nbsp;(7.66&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>2</strong>
</td>
<td>
<span>&nbsp;13&nbsp;(0.33&#37;)</span>
</td>
<td>
<span>&nbsp;41&nbsp;(1.04&#37;)</span>
</td>
<td>
<span>&nbsp;36&nbsp;(0.91&#37;)</span>
</td>
<td>
<span>106&nbsp;(2.68&#37;)</span>
</td>
<td>
<span>&nbsp;182&nbsp;(4.60&#37;)</span>
</td>
<td>
<span>&nbsp;2&nbsp;(0.05&#37;)</span>
</td>
<td>
<span>&nbsp;380&nbsp;(9.61&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>3</strong>
</td>
<td>
<span>&nbsp;13&nbsp;(0.33&#37;)</span>
</td>
<td>
<span>&nbsp;27&nbsp;(0.68&#37;)</span>
</td>
<td>
<span>&nbsp;22&nbsp;(0.56&#37;)</span>
</td>
<td>
<span>&nbsp;75&nbsp;(1.90&#37;)</span>
</td>
<td>
<span>&nbsp;243&nbsp;(6.14&#37;)</span>
</td>
<td>
<span>&nbsp;2&nbsp;(0.05&#37;)</span>
</td>
<td>
<span>&nbsp;382&nbsp;(9.66&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>4</strong>
</td>
<td>
<span>&nbsp;&nbsp;9&nbsp;(0.23&#37;)</span>
</td>
<td>
<span>&nbsp;25&nbsp;(0.63&#37;)</span>
</td>
<td>
<span>&nbsp;29&nbsp;(0.73&#37;)</span>
</td>
<td>
<span>&nbsp;79&nbsp;(2.00&#37;)</span>
</td>
<td>
<span>&nbsp;258&nbsp;(6.52&#37;)</span>
</td>
<td>
<span>&nbsp;3&nbsp;(0.08&#37;)</span>
</td>
<td>
<span>&nbsp;403&nbsp;(10.19&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>5</strong>
</td>
<td>
<span>&nbsp;&nbsp;9&nbsp;(0.23&#37;)</span>
</td>
<td>
<span>&nbsp;13&nbsp;(0.33&#37;)</span>
</td>
<td>
<span>&nbsp;18&nbsp;(0.46&#37;)</span>
</td>
<td>
<span>&nbsp;88&nbsp;(2.23&#37;)</span>
</td>
<td>
<span>&nbsp;296&nbsp;(7.48&#37;)</span>
</td>
<td>
<span>&nbsp;1&nbsp;(0.03&#37;)</span>
</td>
<td>
<span>&nbsp;425&nbsp;(10.75&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>6</strong>
</td>
<td>
<span>&nbsp;&nbsp;4&nbsp;(0.10&#37;)</span>
</td>
<td>
<span>&nbsp;16&nbsp;(0.40&#37;)</span>
</td>
<td>
<span>&nbsp;15&nbsp;(0.38&#37;)</span>
</td>
<td>
<span>&nbsp;60&nbsp;(1.52&#37;)</span>
</td>
<td>
<span>&nbsp;279&nbsp;(7.05&#37;)</span>
</td>
<td>
<span>&nbsp;2&nbsp;(0.05&#37;)</span>
</td>
<td>
<span>&nbsp;376&nbsp;(9.51&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>7</strong>
</td>
<td>
<span>&nbsp;&nbsp;2&nbsp;(0.05&#37;)</span>
</td>
<td>
<span>&nbsp;10&nbsp;(0.25&#37;)</span>
</td>
<td>
<span>&nbsp;12&nbsp;(0.30&#37;)</span>
</td>
<td>
<span>&nbsp;56&nbsp;(1.42&#37;)</span>
</td>
<td>
<span>&nbsp;352&nbsp;(8.90&#37;)</span>
</td>
<td>
<span>&nbsp;3&nbsp;(0.08&#37;)</span>
</td>
<td>
<span>&nbsp;435&nbsp;(11.00&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>8</strong>
</td>
<td>
<span>&nbsp;&nbsp;6&nbsp;(0.15&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;7&nbsp;(0.18&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;9&nbsp;(0.23&#37;)</span>
</td>
<td>
<span>&nbsp;46&nbsp;(1.16&#37;)</span>
</td>
<td>
<span>&nbsp;315&nbsp;(7.96&#37;)</span>
</td>
<td>
<span>&nbsp;4&nbsp;(0.10&#37;)</span>
</td>
<td>
<span>&nbsp;387&nbsp;(9.79&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>9</strong>
</td>
<td>
<span>&nbsp;&nbsp;0&nbsp;(0.00&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;3&nbsp;(0.08&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;6&nbsp;(0.15&#37;)</span>
</td>
<td>
<span>&nbsp;30&nbsp;(0.76&#37;)</span>
</td>
<td>
<span>&nbsp;274&nbsp;(6.93&#37;)</span>
</td>
<td>
<span>&nbsp;5&nbsp;(0.13&#37;)</span>
</td>
<td>
<span>&nbsp;318&nbsp;(8.04&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>10</strong>
</td>
<td>
<span>&nbsp;&nbsp;1&nbsp;(0.03&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;1&nbsp;(0.03&#37;)</span>
</td>
<td>
<span>&nbsp;&nbsp;3&nbsp;(0.08&#37;)</span>
</td>
<td>
<span>&nbsp;14&nbsp;(0.35&#37;)</span>
</td>
<td>
<span>&nbsp;117&nbsp;(2.96&#37;)</span>
</td>
<td>
<span>&nbsp;0&nbsp;(0.00&#37;)</span>
</td>
<td>
<span>&nbsp;136&nbsp;(3.44&#37;)</span>
</td>
</tr>
<tr>
<td align="center">
<strong>Total</strong>
</td>
<td>
<span>126&nbsp;(3.19&#37;)</span>
</td>
<td>
<span>269&nbsp;(6.80&#37;)</span>
</td>
<td>
<span>236&nbsp;(5.97&#37;)</span>
</td>
<td>
<span>721&nbsp;(18.23&#37;)</span>
</td>
<td>
<span>2574&nbsp;(65.08&#37;)</span>
</td>
<td>
<span>29&nbsp;(0.73&#37;)</span>
</td>
<td>
<span>3955&nbsp;(100.00&#37;)</span>
</td>
</tr>
</tbody>
</table>
</div><!--/html_preserve-->

No percentages


```r
    print(ctable(elect_2013$pol_knowledge, 
          elect_2013$likelihood_vote, 
          prop = "n"),
          method = 'rmarkdown', footnote = NA)
```

<!--html_preserve--><div class="container st-container">
<h3>Cross-Tabulation</h3>
<strong>Variables</strong>: pol_knowledge * likelihood_vote
  <br><strong>Data Frame</strong>: elect_2013
<table class="table table-bordered st-table st-table-bordered st-cross-table ">
<thead>
<tr>
<th></th>
<th colspan="6">likelihood_vote</th>
<th></th>
</tr>
<tr>
<td align="center">
<strong>pol_knowledge</strong>
</td>
<th align="center">1</th>
<th align="center">2</th>
<th align="center">3</th>
<th align="center">4</th>
<th align="center">5</th>
<th align="center">&lt;NA&gt;</th>
<th align="center">Total</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">
<strong>0</strong>
</td>
<td>
<span>51</span>
</td>
<td>
<span>78</span>
</td>
<td>
<span>48</span>
</td>
<td>
<span>99</span>
</td>
<td>
<span>130</span>
</td>
<td>
<span>4</span>
</td>
<td>
<span>410</span>
</td>
</tr>
<tr>
<td align="center">
<strong>1</strong>
</td>
<td>
<span>18</span>
</td>
<td>
<span>48</span>
</td>
<td>
<span>38</span>
</td>
<td>
<span>68</span>
</td>
<td>
<span>128</span>
</td>
<td>
<span>3</span>
</td>
<td>
<span>303</span>
</td>
</tr>
<tr>
<td align="center">
<strong>2</strong>
</td>
<td>
<span>13</span>
</td>
<td>
<span>41</span>
</td>
<td>
<span>36</span>
</td>
<td>
<span>106</span>
</td>
<td>
<span>182</span>
</td>
<td>
<span>2</span>
</td>
<td>
<span>380</span>
</td>
</tr>
<tr>
<td align="center">
<strong>3</strong>
</td>
<td>
<span>13</span>
</td>
<td>
<span>27</span>
</td>
<td>
<span>22</span>
</td>
<td>
<span>75</span>
</td>
<td>
<span>243</span>
</td>
<td>
<span>2</span>
</td>
<td>
<span>382</span>
</td>
</tr>
<tr>
<td align="center">
<strong>4</strong>
</td>
<td>
<span>9</span>
</td>
<td>
<span>25</span>
</td>
<td>
<span>29</span>
</td>
<td>
<span>79</span>
</td>
<td>
<span>258</span>
</td>
<td>
<span>3</span>
</td>
<td>
<span>403</span>
</td>
</tr>
<tr>
<td align="center">
<strong>5</strong>
</td>
<td>
<span>9</span>
</td>
<td>
<span>13</span>
</td>
<td>
<span>18</span>
</td>
<td>
<span>88</span>
</td>
<td>
<span>296</span>
</td>
<td>
<span>1</span>
</td>
<td>
<span>425</span>
</td>
</tr>
<tr>
<td align="center">
<strong>6</strong>
</td>
<td>
<span>4</span>
</td>
<td>
<span>16</span>
</td>
<td>
<span>15</span>
</td>
<td>
<span>60</span>
</td>
<td>
<span>279</span>
</td>
<td>
<span>2</span>
</td>
<td>
<span>376</span>
</td>
</tr>
<tr>
<td align="center">
<strong>7</strong>
</td>
<td>
<span>2</span>
</td>
<td>
<span>10</span>
</td>
<td>
<span>12</span>
</td>
<td>
<span>56</span>
</td>
<td>
<span>352</span>
</td>
<td>
<span>3</span>
</td>
<td>
<span>435</span>
</td>
</tr>
<tr>
<td align="center">
<strong>8</strong>
</td>
<td>
<span>6</span>
</td>
<td>
<span>7</span>
</td>
<td>
<span>9</span>
</td>
<td>
<span>46</span>
</td>
<td>
<span>315</span>
</td>
<td>
<span>4</span>
</td>
<td>
<span>387</span>
</td>
</tr>
<tr>
<td align="center">
<strong>9</strong>
</td>
<td>
<span>0</span>
</td>
<td>
<span>3</span>
</td>
<td>
<span>6</span>
</td>
<td>
<span>30</span>
</td>
<td>
<span>274</span>
</td>
<td>
<span>5</span>
</td>
<td>
<span>318</span>
</td>
</tr>
<tr>
<td align="center">
<strong>10</strong>
</td>
<td>
<span>1</span>
</td>
<td>
<span>1</span>
</td>
<td>
<span>3</span>
</td>
<td>
<span>14</span>
</td>
<td>
<span>117</span>
</td>
<td>
<span>0</span>
</td>
<td>
<span>136</span>
</td>
</tr>
<tr>
<td align="center">
<strong>Total</strong>
</td>
<td>
<span>126</span>
</td>
<td>
<span>269</span>
</td>
<td>
<span>236</span>
</td>
<td>
<span>721</span>
</td>
<td>
<span>2574</span>
</td>
<td>
<span>29</span>
</td>
<td>
<span>3955</span>
</td>
</tr>
</tbody>
</table>
</div><!--/html_preserve-->

As with the other summarytools functions, you can use various arguments to clean up the display of your table. Note that for some reason we use the argument 'useNA' rather than 'report.nas' to remove NAs from our table.


```r
    print(ctable(elect_2013$pol_knowledge, 
          elect_2013$likelihood_vote, 
          omit.headings = TRUE, 
          totals = FALSE, 
          useNA = "no",
          prop = "n"),
          method = 'rmarkdown', footnote = NA)
```

<!--html_preserve--><div class="container st-container">
<table class="table table-bordered st-table st-table-bordered st-cross-table ">
<thead>
<tr>
<th></th>
<th colspan="5">likelihood_vote</th>
</tr>
<tr>
<td align="center">
<strong>pol_knowledge</strong>
</td>
<th align="center">1</th>
<th align="center">2</th>
<th align="center">3</th>
<th align="center">4</th>
<th align="center">5</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">
<strong>0</strong>
</td>
<td>
<span>51</span>
</td>
<td>
<span>78</span>
</td>
<td>
<span>48</span>
</td>
<td>
<span>99</span>
</td>
<td>
<span>130</span>
</td>
</tr>
<tr>
<td align="center">
<strong>1</strong>
</td>
<td>
<span>18</span>
</td>
<td>
<span>48</span>
</td>
<td>
<span>38</span>
</td>
<td>
<span>68</span>
</td>
<td>
<span>128</span>
</td>
</tr>
<tr>
<td align="center">
<strong>2</strong>
</td>
<td>
<span>13</span>
</td>
<td>
<span>41</span>
</td>
<td>
<span>36</span>
</td>
<td>
<span>106</span>
</td>
<td>
<span>182</span>
</td>
</tr>
<tr>
<td align="center">
<strong>3</strong>
</td>
<td>
<span>13</span>
</td>
<td>
<span>27</span>
</td>
<td>
<span>22</span>
</td>
<td>
<span>75</span>
</td>
<td>
<span>243</span>
</td>
</tr>
<tr>
<td align="center">
<strong>4</strong>
</td>
<td>
<span>9</span>
</td>
<td>
<span>25</span>
</td>
<td>
<span>29</span>
</td>
<td>
<span>79</span>
</td>
<td>
<span>258</span>
</td>
</tr>
<tr>
<td align="center">
<strong>5</strong>
</td>
<td>
<span>9</span>
</td>
<td>
<span>13</span>
</td>
<td>
<span>18</span>
</td>
<td>
<span>88</span>
</td>
<td>
<span>296</span>
</td>
</tr>
<tr>
<td align="center">
<strong>6</strong>
</td>
<td>
<span>4</span>
</td>
<td>
<span>16</span>
</td>
<td>
<span>15</span>
</td>
<td>
<span>60</span>
</td>
<td>
<span>279</span>
</td>
</tr>
<tr>
<td align="center">
<strong>7</strong>
</td>
<td>
<span>2</span>
</td>
<td>
<span>10</span>
</td>
<td>
<span>12</span>
</td>
<td>
<span>56</span>
</td>
<td>
<span>352</span>
</td>
</tr>
<tr>
<td align="center">
<strong>8</strong>
</td>
<td>
<span>6</span>
</td>
<td>
<span>7</span>
</td>
<td>
<span>9</span>
</td>
<td>
<span>46</span>
</td>
<td>
<span>315</span>
</td>
</tr>
<tr>
<td align="center">
<strong>9</strong>
</td>
<td>
<span>0</span>
</td>
<td>
<span>3</span>
</td>
<td>
<span>6</span>
</td>
<td>
<span>30</span>
</td>
<td>
<span>274</span>
</td>
</tr>
<tr>
<td align="center">
<strong>10</strong>
</td>
<td>
<span>1</span>
</td>
<td>
<span>1</span>
</td>
<td>
<span>3</span>
</td>
<td>
<span>14</span>
</td>
<td>
<span>117</span>
</td>
</tr>
</tbody>
</table>
</div><!--/html_preserve-->

# 2. Comparison of means

We will learn about the basic ways to compare the difference in means of two groups - one where the groups are independent (e.g. height of men and women), and one where they are paired (e.g. height of the same people at age 15 and age 15.5 years).

Let's say we want to compare the political knowledge of men and women in our dataset. We want to ask if the mean for men, and the mean for women is different the command to test this is 't.test'.


```r
    t.test(elect_2013$pol_knowledge ~ elect_2013$female)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  elect_2013$pol_knowledge by elect_2013$female
## t = 11.64, df = 3838.6, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  0.8891745 1.2493867
## sample estimates:
## mean in group 0 mean in group 1 
##        5.328302        4.259021
```

In the console window you should see:


```r
# Welch Two Sample t-test  data:  elect_2013$pol_knowledge by elect_2013$female t = 11.64, df = 3838.6, p-value < 2.2e-16 alternative hypothesis: true difference in means is not equal to 0 95 percent confidence interval: 0.8891745 1.2493867 
#     sample estimates: 
#     mean in group 0 mean in group 1
#           5.328302        4.259021 
#     >
```

Now I know this looks like a mess, but it is actually not too difficult to understand. The fundamental rule I teach is that the first thing you do when you run a test is look at the p-value, and see if it is below 0.05. If it is not below 0.05, then there is generally not a need to interpret anything else because the test is not significant. [There is a complication to this instruction, because some statistical commands give multiple p-values - one for each variable, and one for the model overall - but we will deal with that later] So if we follow this rule of looking at the p-value first, What does it say? 

The p-value in this case is "p-value < 2.2e-16". What does that mean? it means the number 2.2 with 16 zeros in FRONT of it. i.e. p = 0.000000000000000022. Is that less than 0.05? Yes!

So what is the next step for intepreting this output? 

Let's look at the last three line. They say:


```r
# sample estimates: 
# mean in group 0 mean in group 1
#       5.328302        4.259021 
```
      
This is telling us that the mean of the group with value "0" is 5.33, and the mean for the group with value "1" is 4.26. But what is group 0 and 1? Well we need to look at our data. The means are measure in "pol_knowledge" units, and the variable for gender is 1 = female, and 0 = male. so this tells us that the mean political knowledge for men in our sample is 5.3, and for women is 4.3.

We could stop interpreting our data here, but there is another useful part of the output to interpret. Look at these two lines:


```r
#    95 percent confidence interval: 0.8891745 1.2493867
```

This tells us that the 'difference of means' between men and women has a 95% confidence interval of 0.89 to 1.25. This says that the TRUE difference between men and women - the population parameter - is with 95% certainty between 0.89 and 1.25. 

The second type of comparison of means we are going to run is the paired test. In a paired test the two variables to be measured are measured on the same units of analysis The reason we need a different test for this is because when the same unit of analysis is used for the two variables the two variables are dependent on each other - they are not independent samples - as so the statistical test changes to account for this.

In the next example, we are going to compare participants average score for 'following the election on TV' vs 'following the election in the newspaper'.


```r
t.test(elect_2013$election_tv, 
   elect_2013$election_newspaper, 
   paired = TRUE)
```

```
## 
## 	Paired t-test
## 
## data:  elect_2013$election_tv and elect_2013$election_newspaper
## t = -26.584, df = 3883, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.4600211 -0.3968275
## sample estimates:
## mean of the differences 
##              -0.4284243
```

This can be read in the same way as the previous t-test except that in this case the last line reports the difference in means, not the two means. 

Intuitively we know that this means people followed the election more in the newspaper than on TV, but we can check this, by just running two means() to double check we are right:


```r
mean(elect_2013$election_tv, na.rm = TRUE)
```

```
## [1] 2.007969
```

```r
mean(elect_2013$election_newspaper, na.rm = TRUE)
```

```
## [1] 2.433723
```

And you can see that what we thought was true is, with people having an average score of 2.01 for election_tv, and 2.43 for election_newspaper.

# 3. Correlation

Coorelation coefficents are some of the most widely used and reported statistics in academic papers. In this section we learn about how to obtain the most common types of correlation coefficients. We also create our own function for making very attractive correlation matricies.

We will be needing these two packages later, so make sure you have installed them, and also loaded them into this session of by calling them using the 'library' command.





















