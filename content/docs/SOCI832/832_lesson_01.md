+++
title = "Example Page 2"

date = 2018-09-09T00:00:00
# lastmod = 2018-09-09T00:00:00

draft = false  # Is this a draft? true/false
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.

# Add menu entry to sidebar.
linktitle = "Example SOCI832 2"
[menu.docs]
  parent = "Example Topic"
  weight = 2
+++



title: "Lesson 1: Revison of Fundamentals of Quantitative Social Science & an Introduction to R."
keywords: soci832
tags: 
sidebar: mydoc_sidebar
permalink: 832_lesson_01.html
summary: "This week's class two main objectives: first we simply want to review the fundamentals of quantitative and statistical analysis – the key points that should have been covered in any previous statistics and social science courses you've done before. This will help ensure we are all on the same page, and give us a common language to conduct the rest of the course in. Second, we want to install and start running analysis with the statistical package R. R is one of the most popular and powerful statistical packages available today, and one of the objectives of this course is to help you become proficient user of R."

Last updated: 19 Dec 2018

***Author:** Nicholas Harrigan*

### Concepts
 
#### Research Methods Revision Concepts
• positivist
• scientific methods
• applied social science
• Basic social science
• generalizable knowledge
• theories
• hypotheses
• variables
• units of analysis
• conceptualisation
• operationalisation
• valid measures
• reliable measures
• levels of measurement: categorical, binary, ordinal, continuous, interval, and ratio
• research topic
• research question
• puzzles
• time order
• correlation
• experimental studies
• randomly assignment
• law of large numbers
• observational studies
• control for the competing explanations
• dependent variables
• independent variables
• mediating variable
• moderating variable

#### Statistics Revision Concepts
• inferential statistics
• sample statistic
• population parameter
• random sample
• true randomness
• confidence interval
• significance test
• p-values
• coefficient
• standard error
• sample size
• normal distribution
• univariate statistics
• mean
• median
• standard deviation
• frequency
• minimum
• maximum
• quartiles
• quintiles
• histogram
• bivariate statistics
• correlation coefficients
• Pearson's correlation coefficient
• comparisons of means
• crosstabulations (crosstabs)
• scatterplot
• multivariate statistics
• linear regression
 
### 1. Introduction

Welcome to **SOCI832: Advanced Quantitative Methods!**

What you are reading now is the Reading Guide for Week 1. Each week that I (Nick Harrigan) am teaching, I will be providing a reading guide at least a couple of days before the class. This guide will walk you through the key concepts of the week.

One of the goals of the reading guide is to move some of the most straight forward, one-directional learning, out of the classroom, so that our class time can be more interactive. 

This week's class two main objectives: first we simply want to review the fundamentals of quantitative and statistical analysis – the key points that should have been covered in any previous statistics and social science courses you've done before. This will help ensure we are all on the same page, and give us a common language to conduct the rest of the course in. Second, we want to install and start running analysis with the statistical package R. R is one of the most popular and powerful statistical packages available today, and one of the objectives of this course is to help you become proficient user of R.

### 2. What do I need to do each week?

As you probably know from reading the unit guide (available here: <http://unitguides.mq.edu.au/unit_offerings/86075/unit_guide>), this class has only three assessment components:

* Attendance and weekly exercises (30%) – Due each week from Week 2 onwards (excluding weeks 1, 7, and 13).

* First presentation and report (20%) – Due in class Week 7

* Second presentation and report (50%) – Due in class Week 13

The weekly exercises will be contained at the end of these reading guides. The exercises are based on the topic of the previous week's class, so that, for example, the exercises due in week 2 are based on the material from week 1.

The goal of the exercises are (1) to give you practical experience using the techniques we learn; (2) to allow you to gradually work on your work for your first and second presentations and reports; and (3) to give you a chance to get feedback on your presentation and report work when we review your exercises in class.

For each week's class, there are three things to do:
1.  Complete the exercises due that week (based on last week's class materials)
2.  Read the reading guide for this week's class
3.  Read the readings for this week's class

**As students you will have to juggle competing priorities for your time, and my strong advice is to prioritise these three tasks in the order above: (1) prioritise the exercises (as they are assessable), then (2) the reading guide (since it is a good simple overview of the issues), and only if you have time do (3) the readings.**

In general the readings are long and detailed. It is important that you realise that in this class we are focusing on applying and using statistical models. You are not expected to fully understand some of the more complex maths (such as some of the matrix algebra). Instead you should focus on understanding the key ideas and main concepts, with a focus on being able to (1) choose appropriate statistical and analytical techniques for a problem; (2) be able to run such analysis (though you won't have to memorise commands – you will have books and google next to you when running commands and debugging them); and (3) to be able to interpret output of such analysis. 

### 3. Overview of Course

So where are we going this semester? The plan is to do two things in parallel: to give you an overview of the most widely used statistical techniques used in the social sciences today; and to give you an introduction and get you moderately competent in using one of the most widely used and most powerful statistical packages available: R. 

The two criteria I am using for what to include in this course are (1) what would an academic reviewer for a journal most likely expect you to know if you submitted one of these models for publication and (2) what do I wish someone taught me at graduate school. 

This week is a review of **fundamental concepts** and an **introduction to R**. We will cover a lot very superficially, but hopefully it will help ease us into the water.

In week two we will study **linear regression** in greater depth. These are the archetype for multi-variate models, and probably the most widely used model in the social sciences. Topics we will cover include choosing, running and interpreting models, testing model assumptions, and how to estimate robust standard errors.

In week three we will study **logistic regression** models – the classic model for binary outcome variables. These are important because many things – like marriage, pregnancy, and death – are binary in nature, and thus violate the basic assumptions of a linear regression. In this week we will also introduce the idea of a link function, generalised linear models, and cover one alternative to the logit model, known as probit. 

In week four we will focus on **ANOVA** – a method largely used by psychologists with experimental data. We will learn how to run and interpret these models. In addition, we will touch on **propensity matching** – a method for transforming observational (non-experimental) data so as to robustly control for having being selected into the treatment group. 

In week five, we move to studying **factor analysis** and **cluster analysis**. These types of analysis focus on the questions "What are the categories?" and "Which categories do variables (or observations) best fit?" These are fundamentally important techniques because they give a statistical method to identify and confirm many concepts which we then build larger theories on. We will review how to choose, run, and interpret models for exploratory factor analysis and cluster analysis.

In week six we study **path analysis** and **structural equation modelling**. These are methods used to study models with many variables and complex causal relationships. We will review how to choose, run, and interpret such models. 

In week seven you will deliver your **first presentation and report**. This will be a 10 minute presentation and 2,000 word report (with attached R code). It is a chance for your to apply some of the methods presented in the first six weeks. If you are thinking of doing a thesis, then this is a good chance to experiment with these methods. If you have an issue or topic you deeply care about (and can find a dataset for) then again this is a good opportunity to explore this. The instructions for this are in the unit guide here: <http://unitguides.mq.edu.au/unit_offerings/86075/unit_guide> 

In week eight we will introduce **social network analysis** (SNA). This is a method for studying relationship data. We will introduce the main packages in R used for SNA, learn how to construct, import, and visualise basic network data, and then learn about some of the main types of analysis, including centrality measures, and basic statistical modelling.

In weeks nine through 12, Dr Hangyoung Lee will teach the class. In week nine, he will cover a range **visualisation techniques** in R – something very important for presenting any statistical analysis to a wider audience. 

In week 10, he will review regression models for categorical and ordinal data – **multinomial and ordinal logistic regression**. These are fundamentally important for common data types, such as voting and political preference data.

In week 11, Dr Lee will review **count models** and **zero-inflated count models**. These are regression models that have a dependent variable that is the count of some event, such as the number of children a couple has, the number of holidays a person has, or the number of visits to a doctor. Such data is both discrete and can't have a negative value, requiring special models.

In week 12, Dr Lee will review **longitudinal and panel data**. These models are important because with multiple timepoints we are in a better position to identify causal relationships. However, such data violates many assumptions of normal regression, because the same units (e.g. person) appears multiple times (timepoints 1, 2, 3, etc.), and hence special models are needed. 

In week 13, you will deliver your **second presentation and report**. As with the first, this will be a 10 minute presentation and 2,000 word report (with attached R code). The difference between the first and second reports is that the second will also include: (1) multivariate analysis; (2) a visualisation in R; and (3) some form of substantial improvement or extension of the first project. This will be a chance to deeply explore your chosen topic, share it with the class, and get feedback from both Dr Lee and myself. 

### 4. A Review of Fundamental Concepts

#### 4.1 Introduction

As I review these key concepts, I'm going to err on the side of brevity – no one likes over-explanation. 

At the end of the readings I'll provide some references for those who need it. 

I'm also happy to review, discuss, and/or dedicate time to explaining any of the concepts that aren't clear. All you need to do is ask – either in class, or one-to-one (email, message, face-to-face before or after class, etc).

It is crucial that you do feel confident with these concepts, because they are the foundations of the rest of the course

#### 4.2 Review of fundamental concepts

Most quantitative social science is **positivist** in orientation: it aims to use **scientific methods** to explain and understand the world. There are broadly two types of social science: applied and basic.

**Applied social science** – done across a wide range of institutions from government departments, to corporate marketing departments, to non-government organisations – is generally done to help institutions or individuals make better **decisions** (e.g. opinion pollsters help politicians decide policies and marketing decisions). Such research can generate useful knowledge that is specific to an individual case – such as a single workplace. 

**Basic social science** – that done in universities and published in scholarly journals and books – aims at developing **generalizable knowledge**, which means knowledge which provides explanations that apply across more than the cases being studied. One of the main ways generalizable knowledge is articulated is in the form of theories. **Theories** are complex abstract explanations. Theories are generally based on both assumptions and evidence about actors, objects, events, and mechanisms.

Theories are tested by testing hypotheses. **Hypotheses** are testable statements about the nature of a variable (e.g. its mean), or the relationship between two or more variables (e.g. the correlation between two variables). 

**Variables** are a characteristic which takes different values across the units of analysis (e.g. age varies across survey respondents). 

**Units of analysis** are the entity being studied, and can be individuals (e.g. survey respondents), nations, or almost any other entity.

Variables exist at (at least) two levels: the conceptual and operational. 

**Conceptualisation** is the process of developing a clear definition of a variable (or set of variables in a theory) in the realm of ideas. This generally involved developing a clear definition, comprised of key elements of the definition (e.g. 'materialism' might be defined as (an individual's) (1) attachment, (2) valuing, and (3) focus on acquiring (4) physical objects of monetary or economic value).  

**Operationalisation** is the process of developing a clear measure of a variable in the physical world, so that one may put a number (or a label) on the value of the variable. 

Operationalisation involves finding measures which are (1) valid; and (2) reliable. **Valid measures** are those where the operationalisation accurately measures the conceptualisation of the variable. Valid measures tend to be those that come from recognised sources (e.g. scales published in academic articles), or which have strong evidence that they correlate with authoritative indicators (e.g. a correlation with an undisputable indicator). **Reliable measures** are those which give the same measure when applied to the same case multiple times. Reliable measures tend to be obtained through use of multiple measures (e.g. an index or scale with many questions) and fine-grained scales (e.g. a nine point scale rather than a three point scale). 

Variables can be measured using different **levels of measurement**. Some classic levels of measurement are: **categorical, binary, ordinal, continuous, interval,** and **ratio**.

As a researcher who needs to find a **research topic**, often the hardest thing to do is to find an interesting **research question**. One method of finding good research questions is to look for puzzles. **Puzzles** are comprised of a (1) a fact that is difficult to understand or explain in light of (2) current theory (e.g. if we have a theory – balance theory – which says that everyone sides with their friends and against their foes in conflict, why isn't the world divided into two warring camps).<sup>[1](#myfootnote1)</sup>

When developing a research question, a puzzle, or a theory the researcher needs to think about the causal relationship between variables. To demonstrate causality, at least three conditions need to be met: (1) **time order** (i.e. A happens before B), (2) **correlation** (e.g. A goes up, B goes up), and (3) **ruling out other explanations** (e.g. A and B weren't both caused by C). **The hardest of these three conditions to meet is (3) ruling out other explanations.** Why? Because other explanations have infinite possible pathways. There are two main ways we rule out other explanations in practice: (1) in **experimental studies**, we **randomly assign the cause**, which then rules out other explanations through the **law of large numbers** (random assignment ensures all characteristics of two groups are identical if the groups are large enough); or (2) in **observational studies**, we c**ontrol for the major competing theories** or explanations by including them in our models, measurements, and tests. 

Variables which are outcomes or effects are given the name **dependent variables**. Variables which are causes or controls are given the name **independent variables**. Variables which lie between a cause and an effect are called a **mediating variable**. Variables which interact with an independent variable to change how it effects a dependent variable are called a **moderating variable**. These are illustrated in Figure 1. Figure 2 gives a hypothetical example (which is made up) of depression and anxiety among working people. We can see that there is (1) a direct path from low wages to anxiety and depression – it is stressful to have no money; (2) an indirect path through credit card debt (mediating variable) – it is stressful to have credit card debits mounting; and (3) an interaction between children and low wages (moderating variable) – children can make low wages even more stressful because they require feeding, clothing, housing, etc.

<div style="text-align:center"><img src ="images/832_lesson_01_image_01.jpg" style="max-width:60%;" /></div>

##### **Figure 1: Causal diagram with four main types of variables.**

<div style="text-align:center"><img src ="images/832_lesson_01_image_02.jpg" style="max-width:60%;" /></div>

##### **Figure 2: A hypothetical causal diagram for a model of anxiety and depression among working persons.**

Most quantitative social science – i.e. social science that uses numbers to measure and characterise the world – uses **inferential statistics** to model their data and test their theories and hypotheses. At the core of inferential statistics is the idea that there is a characteristic (such as the mean number of beers drunk per week) which we are interested in measuring on population. The characteristic of the **population** is called a **parameter**. However, the population is too large to measure directly (e.g. the population of a country), so instead we need to 'infer' (hence the word 'inferential' statistics) this parameter. We infer the parameter by taking a **random sample** from the population. Random in this case means **true randomness** – all members of the population have equal chance of being in the sample. When we measure this characteristic (i.e. mean number of beers drunk per week) on the **sample**, we get a **statistic**. This **sample statistic** is our estimate of the **population parameter**.

Because a sample statistic is based on a random sample, it is not a perfect reflection of the population statistic. However, because a sample is random the sample statistic has a mathematical and probabilistic relationship with the population parameter. This probabilistic relationship is expressed in statistical modelling with several different measures, such as **confidence intervals**, **significance tests**, and **p-values**.

Most sample statistics in inferential statistics are expressed in terms of two numbers (1) a **coefficient**; and (2) a **standard error**. The coefficient represents the estimate of the population parameter (e.g. mean number of beers drunk per week in the population). The standard error is a measure of the uncertainty of this estimate. The standard error is a function of the variability of the sample and the sample size (for a mean, it is the **standard deviation** divided by the square root of the **sample size**). With most sample statistics, the major claim that we make from a model is that "There is a 95% chance that the population parameter is within +/- 1.96 standard errors of the coefficient." This number 1.96 comes from the fact that 95% of cases in a **normal distribution** lie within plus or minus 1.96 standard errors of the mean of the distribution. And for most practical situations, we can assume that 1.96 is 2, and, thus, that 95% of the time: **population parameter is in the range of sample coefficient +/- 2 x standard error**.

So, for example, we may take a sample of 1000 Australians and find that the mean number of beers drunk per week is 3, and the standard error of this mean is 1.4. Thus, from this we can say that there is a 95% chance that the population parameter lies between 0.2 and 5.8. Or more simply, the **95% confidence interval** is (0.2 – 5.8). 

Another way of expressing the uncertainty (or certainty) of a coefficient's estimate of the population parameter is a **significance test** and **p-value**. In this case, we ask "What is the percentage chance of having got this sample statistic (coefficient) if the true population parameter is zero?" We use the sample coefficient, and sample standard error, and ask is the sample coefficient more than 1.96 (our magic number) standard errors away from zero? If so, then we know **that the p-value (the calculated probability)** of the coefficient being zero is less than 5%.

When describing and modelling data, we tend to think of three main classes of statistics: univariate, bivariate, and multivariate statistics.

Univariate statistics summarise single variables. The main **univariate statistics** include **mean, median, standard deviation, frequency, minimum, maximum, quartiles** and **quintiles**. We can use graphical representations such as histograms to illustrate univariate statistics.

**Bivariate statistics** express the relationship between two variables. Two of the most important bivariate statistical measures are **correlation coefficients** (such as **Pearson's correlation coefficient**), and **comparisons of means**. We often also use **crosstabulations (crosstabs)** of two variables to illustrate such data. We can represent bivariate statistics with a wide range of graphical representations, the most common being the **scatterplot**.

**Multivariate statistics** model the relationship between three or more variables. Probably the canonical example of a multivariate statistics is the **linear regression model**, which models an outcome variable (y) as the linear product of two or more variables (e.g. university grade = hours of studying + ability to focus).

#### 4.3 What if I don't know this?

So what I've just summarised is assumed knowledge for this course. You don't need to be an expert in all those concepts, and we will revisit many of them in this course. However, if any of the concepts highlighted in bold in the previous section are completely new to you, I ask that you do some revision on your own in the first couple of weeks. In many cases Wikipedia will give you a good simple introduction. If you are looking for something more rigorous but still introductory, I recommend the following two books, which I've used to teach undergraduate research methods for the last ten years:

* Neuman, W. L. (2014). Social Research Methods: Qualitative and Quantitative Approaches. (7th Edition). Harlow, UK: Pearson.<sup>[2](#myfootnote2)</sup>
* Field, A., Miles, J., and Field, Z. (2012). Discovering statistics using R. Sage publications.<sup>[3](#myfootnote3)</sup> 

Neuman is comprehensive textbook for research methods from a sociological perspective. Field et al. is one of the most popular introductory statistics textbook in the world. It is written for psychology students, but it (1) is comprehensive and rigorous; (2) includes an introduction to relevant R commands; and (3) is full of lame yet funny jokes. 

Both are available as ebooks (Kindle) on Amazon (see footnotes to the references above). If they aren't in the library yet, they will be soon. And if anyone doesn't want to buy and can't find in the library, I have copies I can lend (email me: nicholas.harrigan@mq.edu.au). 

A very good alternative to Neuman and Field et al. is the required textbooks for SOC830:

* Vaus, David de (2014) Surveys in Social Research, 6th Edition, Allen&Unwin. <sup>[4](#myfootnote4)</sup> 
* Illowsky, Barbara and Susan Dean (2017) Introductory Statistics, OpenStax. (Available for free at <https://openstax.org/details/books/introductory-statistics> ) <sup>[5](#myfootnote5)</sup> 

### 5. Dataset for Weeks 1 & 2

#### 5.1 Introduction

Each week I will focusing the reading guide around the analysis of a dataset, and ideally this will be accompanied by a published academic article that uses the same dataset. Working on a dataset with a published academic article, is like participating in a dissection. We get to see the beautiful, well crafted, nicely presented paper – the undissected body – and we also see the messy real data and statistical analysis which underlies it all – the inner workings of the muscles, organs, and all the rest.

#### 5.2 The Article

This week and next we are focusing on dissecting the following article:

* Ian McAllister (2016) Internet use, political knowledge and youth electoral participation in Australia, Journal of Youth Studies, 19:9, 1220-1236, DOI: <10.1080/13676261.2016.1154936>
 
Ian McAllister is a Profession at the ANU, and one of the leading experts on electoral behaviour in Australia. You can read more about him at these websites. Note that Google Scholar says his articles have been cited over 18,000 times. 

  <https://scholar.google.com/citations?user=NvNmbP4AAAAJ&hl=en> 
  <https://researchers.anu.edu.au/researchers/mcallister-i>
  <https://en.wikipedia.org/wiki/Ian_McAllister_(political_scientist)> 

You can download this article via this link: <https://doi.org/10.1080/13676261.2016.1154936> (it will ask for your MQ login, and then click on the "PDF" button.

The paper deals with an important problem of democratic societies: the low level of political knowledge and political disengagement of young people. It asks whether internet use – something which has been heralded as way to reinvigorate political engagement amongst the young – actually does have a positive impact on political knowledge and engagement. 

We will read this article in more depth next week, but for the moment lets just skim the article like an academic. I think there are three places an academic looks when they skim a quantitative article like this: 
1.  **The abstract**: where you look for (i) the theory/ies being tested; (ii) the dataset; and (iii) the evidence (normally a statistic). 
2.  **The dataset**: This is on page 1224 under the heading "Data and method". This tells you where the data came from, the sample, size, and also the operationalisations of the key dependent and independent variables. In this case, the dataset is the Australian Election Survey (AES) 2013.
3.  **The main results table/s**: This is Tables 2 and 3 on pages 1229 and 1230. These are regression models, which we will discuss in more detail later.

See if you can make sense of the paper from these three parts (the abstract, dataset, and main results tables). You will probably have a lot of questions too. Write these down and bring them to class (if we don't answer them before the end of this reading guide).

#### 5.3 The dataset

##### **5.3.1 The Full Dataset from the AES (don't use this yet!)**

I picked this article because the dataset for this paper is publicly available. You can download any of the Australian Election Study datasets from this page: <http://australianelectionstudy.org/voter_studies.html>

If you have a look around this website, you will see there are other interesting datasets too, particularly the Australian Candidate Study (a survey of candidates for the House of Representatives and Senate). 

The dataset for the McAllister 2016 paper is actually the AES 2013 data. 

If you go to the website for the 2013 data you will see something like Screenshot 1: 

<div style="text-align:center"><img src ="images/832_lesson_01_image_03.png" style="max-width:60%;" /></div>
 
<div style="text-align:center"><b>Screenshot 1: The Australian Electoral Study website for downloading the 2013 AEC data</b></div><br>


Notice there are three files to download: 
1.  **Data (SPSS)**: This is the data file in SPSS format
2.  **Codebook**: This is the codebook for the dataset (the codebook describes all necessary information about the variables in the dataset, including the values of the variables, and their meanings. 
3.  **Questionnaire**: This is the actual questionnaire given to the participants in the study.
Feel free to download and have a look at these three files, particularly the codebook and questionnaire. 

##### **5.3.2 A simplified dataset for this class (use this when starting out!)**

When preparing for this class, I've been reviewing the SPSS data file provided for this dataset, and honestly I think it is a bit too complex and burdensome for the purposes of teaching this class – at least for simple demonstrations. The main issues are that (1) each variable is labelled by a question number (e.g Gender has the code 'h1') – which makes it hard to intuitively use (you need to keep referring back to the codebook); (2) there are some complex missing data codes; (3) SPSS format – with labels – can be a bit complex in R when using them for the first time (you need to use the package 'sjlabelled' with SPSS data). 
For these reasons, I've prepared a simplified an easier to use version of the AES 2013 data for us to use for the purposes of this week's exercises. This simplified dataset, and the codebook for it, can be downloaded here:

* Dataset for Weeks 1 + 2 – McAllister 2016 example: <https://mqsociology.github.io/learn-r/soci832/elect_2013.csv> (Link 1)
* Codebook for Weeks 1 +2 – McAllister 2016 example: <https://mqsociology.github.io/learn-r/soci832/codebook aes 2013.html> (Link 2)

#### 5.4 How to read the dataset + codebook

If you click on Link 1 (if it won't click, just cut and paste the URL into a browser), your browser will download a file called "elect_2013.csv". If you then open this file (which should be in your downloads folder if you can't find it), then it should automatically open in Microsoft Excel. You will see something like Screenshot 2.

<div style="text-align:center"><img src ="images/832_lesson_01_image_04.png" style="max-width:60%;" /></div>

<div style="text-align:center"><b>Screenshot 2: elect_2013.csv opened in Microsoft Excel</b></div><br>

Screenshot 2 shows what the inside of a classic social science dataset looks like. 

The columns are variables. Each column represents one question asked in the Australian Electoral Study survey. 

The rows are respondents. Each row represents one person who completed the Australian Electoral Study Survey.

If you scroll down, you will see that there are 3956 rows in the dataset, which represents the 3955 participants in the survey (there is one row for the 'headers' – the names of the columns (also called variables). 

If you scroll to the right you will see that there are about 46 columns, representing the 46 variables which I have extracted from the larger AEC 2013 dataset. These are the 46 variables that are relevant to the McAllister paper.

Before we move on, let me provide a few definitions that might help answer some questions you have:
* **What is a .csv file?** CSV stands for 'comma separated values'. CSV files are a very simple version of an Excel spreadsheet file. If you opened one of these files in a text editor, then you would find that the data is the contents of each cell, separated by a comma ','. CSV is one of the simplest ways to store data like this, hence you will come across it a lot.
* **What are the NA's in the data?** These represent 'missing data',  which means that the respondent did not answer the question. There are lots of different reasons why data might be missing – respondents might feel uncomfortable with the question, they might have accidentally skipped the question, or maybe it isn't relevant (e.g. you ask "Are you married?" and if someone isn't, then they skip the follow up questions about their partner). 
* **What is the first row without a column heading?** This is just a row index that R adds when it saves CSV data. Most of the time, this row can be ignored. 
* **What do all the numbers represent?** Great question. These are values which represent different answers to each question. For example, we have a variable called "Female", which captures gender. If a person was male, then they will have a 0 for the value of this variable, and if they are female, they will have a 1 for the value of this variable.
* **But how do I know what the numbers represent?** Another great question. This is what the codebook is for. If you haven't already, click on [Link 2 (or just click here)](https://mqsociology.github.io/learn-r/soci832/codebook%20aes%202013.html), which will take you to a webpage with all the variables listed. You should see something like Screenshot 3

<div style="text-align:center"><img src ="images/832_lesson_01_image_05.png" style="max-width:60%;" /></div>


<div style="text-align:center"><b>Screenshot 3: The webpage for the codebook for 'elect_2013' dataset.</b></div><br>

Screenshot 3 shows the codebook for the dataset 'elect_2013'. The codebook allows you to understand what the data in 'elect_2013.csv' actually means. 

To talk about datasets and codebooks, it is easier if we define some key terms. These key terms are identified with coloured boxes in Screenshot 4:

* **Variable**: A characteristics of units of analysis (cases) which varies across cases. This is the columns of the CSV file (the columns of Screenshot 2). For example, the variable 'female', which captures the characteristic gender that varies across participants who are surveyed.
* **Units of analysis** (also called '**cases**', '**participants**', or '**observations**'): These are the individual objects or events which have been observed, and which variables have been measured on. For example, in a survey, the units of analysis are each individual person who responds to the survey. A unit of analysis is identified with a brown coloured box in Screenshot 4. 
* **Values of a variable**: These are the (normally numeric) values which an individual variable can take. For example, the variable 'female' has two values in this dataset: 0 and 1. These values represent the two states which gender appears in our respondents: 0 is male, and 1 is female. The values of variables indicated in Screenshot 4 with the two purple boxes: the csv file has a value for each variable for each participant; the codebook shows all possible values for each variable.
* **Variable names**: Variable names are a (generally short) unbroken piece of text that users and the computer use to refer to a variable by. For example, 'female'. Variable names have conventions. In the case of R, they can't start with a number, and they can't include spaces. They can include characters of the alphabet, numbers, and '.' and '\_'. Variable names are case sensitive. So Female and female are different variables, as far as R is concerned. The variable names are indicated in Screenshot 4 with the green boxes.
* **Labels**: Labels are tags or attributes that can be attached to parts of a dataset, and then used by computer software to make models and diagrams more easy to read and more user friendly. Traditionally R does not support labels, while many other packages – such as SPSS – do support labels. This situation has changed in the last year, with the development of a new package called 'sjlabelled'. For the moment we aren't going to use labels when using R, but they have been included in this example, because I've used labels to provide very useful information in the codebook. I will include an appendix to this document which explains basic information on how to use labels in R (see Appendix 1: An introduction to labels in R).
* **Variable labels**: Variable labels are a label that is attached to a variable name. These allow for much longer text, with spaces and punctuation, to be attached to a variable name. In the case of this dataset, most of the variable labels are the question text from the AES 2013 study. Variable labels are indicated with a red box in Screenshot 4. 
* **Value labels**: Value labels are labels that allow you to attach a text label to each value of a variable. For example, for the variable 'female', we can attach the label 'male' to the value '0', and 'female' to the value '1'. Value labels are indicated with a blue box in Screenshot 4.

<div style="text-align:center"><img src ="images/832_lesson_01_image_06.png" style="max-width:60%;" /></div>
 
<div style="text-align:center"><b>Screenshot 4: Five key concepts identified in a dataset and a codebook.</b></div><br>
 
### 6. Installing R and R Studio

To run any statistical analysis on this dataset, we are going to have to choose a statistical package to use. 

#### 6.1 Why choose to do statistics in R?

A lot of the most basic statistical analysis can be done in Microsoft Excel, and for very simple things this will be your best option.

Another very popular statistical package is SPSS by IBM. This high popular package has the advantage of having a Graphical User Interface (GUI), which means you can run most commands through pointing and clicking with a mouse on windows, menus, and forms. 

However, for this course we are using the statistical package R. Why R? There are three main reasons. 

1) **Free and open source:** First, R is free and open source. In our context it means that we can run it from home, instead of having to be connected to your university wifi network, and you will be able to use R for the rest of your life, without having to pay thousands in annual licence fees. 

2) **Advanced models:** Second, there is a plethora of packages, available for free, that extends R's functionality. These include the most advanced techniques available. Screenshot 5 below shows the cost per year of SPSS for different levels of functionality. Note that, for example, to run many of the more advanced models we teach in this class, such as Structural Equation Modelling, the more expensive packages are needed. Other types of models, such as social network analysis, are just not available in SPSS or most other packages. 

<div style="text-align:center"><img src ="images/832_lesson_01_image_07.png" style="max-width:60%;" /></div>
 
<div style="text-align:center"><b>Screenshot 5: Cost of SPSS licences per year (26/7/2018). The premium version is required for Structural Equation Modelling, which we teach in this course.</b></div><br>

3) **Growing popularity:** Third, for the above two reasons, R is enjoying a large and increasing share of the market for statistical programs, so learning R will stand you in good stead for future social research. For example, see this article ( http://r4stats.com/articles/popularity/ ) which documents the growing popularity of R in recent years. The most important figures are 2d and 2e, which show the number of google scholar hits – basically scholarly usage – which shows that SPSS usage peaked in 2009, and R is rapidly increasing in popularity, and will likely become the most widely used statistical package in the next couple of year. 

<div style="text-align:center"><img src ="images/832_lesson_01_image_08.png" style="max-width:60%;" /></div>

<div style="text-align:center"><img src ="images/832_lesson_01_image_09.png" style="max-width:60%;" /></div>

<div style="text-align:center"><b>Screenshots 6 + 7: Scholarly articles using each major statistical package. Source: <http://r4stats.com/articles/popularity/></b></div><br>

#### 6.2 Installing R and RStudio

You can download R for Windows and Mac at the website <https://www.r-project.org/> 

You can download RStudio for Windows and Mac at the website <https://www.rstudio.com/> 

I have written a detailed walk through of the steps to install R and RStudio here: <https://mqsociology.github.io/learn-r/soci832/How_to_Install_R_and_RStudio.pdf> 
 
### 7. Running Basic Commands in R

#### 7.1 Entering RStudio for the first time

When entering RStudio for the first time, you will see a screen like this (without the green box):

<div style="text-align:center"><img src ="images/832_lesson_01_image_10.png" style="max-width:60%;" /></div>
 
The first thing to do is to open the script window (we will go into what the script window is for later). To do so, double left click on the area highlighted by green in the screenshot above. Once that is done, you should see something like this:

<div style="text-align:center"><img src ="images/832_lesson_01_image_11.png" style="max-width:60%;" /></div>
 
Once you see that, you can start entering commands into R

| The relationship between RStudio and R |
|:-----------------:|
| When you enter commands into the RStudio environment, they are actually being executed by R. RStudio simply presents a more friendly interface than vanilla R. <br> <br> Running the same command in RStudio and vanilla R will always produce the same result. |

#### 7.2 Entering commands – script files and consoles

There are two ways to input commands in R – the script file, and the console.
Script file

This is a text file that can be saved to your computer. As such, the commands you have written in the script file can be used across sessions. The contents of your script file are displayed in the script window, highlighted here in the green box. To open an empty script file, click on the icon of a blank sheet with a green circle (highlighted in the red box), and select "New Script".

<div style="text-align:center"><img src ="images/832_lesson_01_image_12.png" style="max-width:60%;" /></div>
 
To run a command, you can either:
1.  highlight the command and click "Run" at the top right of the script window. The location of "Run" is in the light blue box in the screenshot above.
2.  Highlight the command and Press Ctrl+Enter on your keyboard (in Windows) or Cmd+Enter (in a Mac).

To save your script file, click the save icon at the top left. The location of the save icon is in the orange box in the screenshot above.

To open a previous script file, click the open icon at the top left and navigate to your desired script file. The open icon is highlighted by the purple box. The script will then appear in the script window.

**Console**
You can directly type commands into the console and hit "Enter" to execute them. The console is highlighted by the black box above. The drawback is that once you quit RStudio, there is no record of what commands you used.

Whatever method you use, the results of your commands are displayed in the console.

| TIP 1: USE SCRIPT FILES (NOT THE COMMAND LINE) |
|:---------:|
| It is **always best practice to put all your commands in the script file** and run from there. <br> <br> I strongly recommend always writing commands in the script file first, and then running them by highlight and pressing the run shortcut (Ctrl+Enter, or Cmd+Enter). |

#### 7.3 Operations in R

**7.3.1 Simple operations in R**

We can do calculations in R by entering them as you would normally, as in a calculator.
For instance, you could calculate 1+1 by typing in and running the following piece of code.

    1+1

The result of doing so in RStudio is the following:

    > 1+1
    [1] 2
    > 

Here, the comman 1+1 was run, and the rest is the result of the command produced by R.

**7.3.2 Storing values in variables**

Frequently, we would like to store the result of our calculation to use later. We use the "<"- operator to store results in a variable.

**The <- operator**

The key to doing anything in R is the <- operator, which tells R to save the object, or the results of a command, on the right to the variable in the left.

For example, the code:

    a <- "Hello, world"

assigns the text "Hello, world" to the variable "a". Putting double quotation marks around text indicates that the text is a string, which means that mathematical operations cannot be performed on it.

The code:

    a <- 1+1

assigns the result of 1+1, that is 2, to the variable "a".
If you run the following code:

    a <- "Hello, world"
    a <- 1+1

a initially contains "Hello, world", but after the second line is run, "Hello, world" is overwritten by 2. When R performs the operation 1+1, the result is by default treated as a decimal number. In R this is known as a numeric data type. As a result, the variable a is now a numeric object.

The overwriting applies to repeated calculations of the same type as well, so if you have the commands:

    a <- 2+1
    a <- 1+1

The final value of a will be 1+1=2 (not 3 or 5).

To see what is in a variable, you can simply enter the variable's name as a command.
For example, if you want to see what's in variable a, you can run the following code:

    a

**Example**

The result of running the code

    a <- 1+1
    a

is the following:

    >   a <- 1+1
    >   a
    [1]  2
    >   

 
**7.3.3 Importing data**

To import data we are going to use a shortcut in RStudio. In the top right window of RStudio, click the button "Import Dataset", and then on the menu which appears click "From Text (base)". This is highlighted in the image below.

<div style="text-align:center"><img src ="images/832_lesson_01_image_13.png" style="max-width:60%;" /></div>

A window will appear, where you need to navigate to where you have saved "elect_2013.csv". Click on the file, and then selection "Open".

<div style="text-align:center"><img src ="images/832_lesson_01_image_14.png" style="max-width:60%;" /></div>

In the window which appears next, the default settings are fine EXCEPT, you need to select "Yes" next to "Heading". Then press "Import".  

<div style="text-align:center"><img src ="images/832_lesson_01_image_15.png" style="max-width:60%;" /></div>

When you press "Import", RStudio will run code to open the dataset. You will notice in RStudio three things happen (which can be seen in the image below):

3.  In the bottom left window (Console Window), the code will be run:
4.  In the top left window the dataset "elect_2013" will open and appear like a spreadsheet.
5.  In the top right window (Environment) the dataset will appear with the text "elect_2013    3955 obs. of 46 variables"

<div style="text-align:center"><img src ="images/832_lesson_01_image_16.png" style="max-width:60%;" /></div>

If you click on the white triangle in the blue circle in the top right "Environment" window, you will be able to see all the variables in the dataset "elect_2013".

<div style="text-align:center"><img src ="images/832_lesson_01_image_17.png" style="max-width:60%;" /></div>

**7.3.4 Data frames and variables**

The dataset we have just imported is held as type of data known in R as a 'data frame'.

We can access a variable from the data frame by using the syntax "dataframe$variable".

For example, we could get a summary of the variable age with the following function:

    > summary(elect_2013$age)
    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
    14.00   42.00   56.00   54.11   66.00  103.00     102 
    > 

This is quite informative. It tells us that the youngest person who did the survey was 14, the eldest was 103. The median age of respondents was 56, and that there were 102 respondents who didn't provide an answer for age (NA means missing data).

#### 7.4: Getting help

If you need to access the help files for any command, you can enter the following:

    ?<command name>

for example, if you needed help with the command print, you can enter:

    ?print

The help file will be displayed in the bottom left of the screen, in the box highlighted by orange below.

You can also search for any command in the search box in the top right corner of the help screen.

<div style="text-align:center"><img src ="images/832_lesson_01_image_18.jpg" style="max-width:60%;" /></div>
 
#### 7.5 Installing packages

One of the most important features of R is the large number of extra functionality that has been written by users across the world. This extra functionality is contained within packages (which is basically synonymous with the word 'library').

To run any function from a package, there are two main rules to remember:

1.  You need to install the package (using the 'install.packages()' command) onto any particular computer ONE TIME ONLY.
2.  You need to load the package (using the 'library()' command) each time you restart RStudio.

For example, say our dataset was in excel format (and not .csv as it currently is). The we would need the package 'readxl'. If we have never used 'readxl' before then first we need to install the package.

    install.packages("readxl")

If you run this command in RStudio, you should get a large amount of output that looks something like this: 

<div style="text-align:center"><img src ="images/832_lesson_01_image_19.jpg" style="max-width:60%;" /></div>

You will know when R has finished running your code, because in the console window the ">" character will appear. When I ran the command, the last few lines of output to the console window were: 

    package ‘cellranger’ successfully unpacked and MD5 sums checked
    package ‘Rcpp’ successfully unpacked and MD5 sums checked
    package ‘tibble’ successfully unpacked and MD5 sums checked
    package ‘readxl’ successfully unpacked and MD5 sums checked
    
    The downloaded binary packages are in
      C:\Users\nickh\AppData\Local\Temp\RtmpwXzCiK\downloaded_packages
    > 

Before you can run the package, you also need to load the package. To do this you use the 'library()' command.

    library(readxl)

Notice that the library command does not have any inverted commas, while the install packages command does. This is an annoying quirk of R which you need to be aware of.

#### 7.6 Commenting with #

In most programming languages there is a symbol to tell the program to ignore the rest of the line. In R the comment character is "#". 

This is useful for (1) putting comments in the code as a note to other users or your future self, and (2) for temporarily turning off a line of code. 

As an example of (1) you might write a few lines of code at the top of your R script file:

    # Week 1 Code for SOCI832
    # by Nicholas Harrigan
    # 26/7/2018

As an example of (2), you might put a # in front of the install.packages("readxl") command from the previous section and then try to run the whole line. 

    # install.packages("readxl")

Nothing will happen. You will just return to the ">" character in the console window.

    > #install.packages("readxl")
    > 

In general I think this is good practice: once you have installed a package, I suggest that you 'comment out' the code for that line, so it won't run again. However the code will be there if you ever need to run the code again on a different computer (such as if you give the code to a colleague). 

#### 7.7 Create a working directory

I suggest you create a folder somewhere in your computer which you will use as your main folder for doing R work in. For me that folder is "C:/G/2018, SOCI832/Datasets/AES 2013/", but you can choose whatever folder you like. Just save the file 'elect_2013.csv' to that folder.
You can tell R to use this as your main working directory with the command 'setwd()'

    setwd("C:/G/2018, SOCI832/Datasets/AES 2013/")

**7.7.1 Filepaths in R**

One thing to note in R is that the slashes between folders aren't the same as those in Windows. 
In R, you can use one of two conventions for separating directories:

1.  A single forward slash, i.e. "/" such as
setwd("C:/G/2018, SOCI832/Datasets/AES 2013/")
2.  A double back slash, i.e. "\\" such as
setwd("C:\\G\\2018, SOCI832\\Datasets\\AES 2013\\")

But you cannot use the traditional windows format of a single back slash, i.e. "\", such as

    > setwd("C:\G\2018, SOCI832\Datasets\AES 2013\")
    Error: '\G' is an unrecognized escape in character string starting ""C:\G"
    >

**7.7.2 Finding your filepath in Windows**

To set your working director, you need to find the file path for your file or folder. 

To find the file path right click on the file or folder in Windows Explorer. You should see the menu displayed below.

<div style="text-align:center"><img src ="images/832_lesson_01_image_20.png" style="max-width:60%;" /></div>

Click “Properties”

The following dialog will appear:

<div style="text-align:center"><img src ="images/832_lesson_01_image_21.png" style="max-width:60%;" /></div>

The location of the file will be reflected in the “Location” row, which is highlighted in red. You can highlight the whole location and right click to copy it.

When you copy this path back into R, remember to either: (1) add a second forward slash; or (2) change the forward slashes to back slashes. And also remember to include double quotation marks.

**7.7.3 Finding your filepath in Mac**

Navigate to your file in Finder.

<div style="text-align:center"><img src ="images/832_lesson_01_image_22.png" style="max-width:60%;" /></div>

Right-click the file. A menu will open up.

<div style="text-align:center"><img src ="images/832_lesson_01_image_23.png" style="max-width:60%;" /></div>

In the menu, click on "Get Info".

<div style="text-align:center"><img src ="images/832_lesson_01_image_24.png" style="max-width:60%;" /></div>

A dialog that looks like this will open up:

<div style="text-align:center"><img src ="images/832_lesson_01_image_25.png" style="max-width:60%;" /></div>
 
Highlight the text after "Where".

<div style="text-align:center"><img src ="images/832_lesson_01_image_26.png" style="max-width:60%;" /></div>
 
Right click in the highlighted area. In the menu that opens up, click on Copy.

<div style="text-align:center"><img src ="images/832_lesson_01_image_27.png" style="max-width:60%;" /></div>

When you copy this path back into R, remember to make sure between the folders there is either: (1) two forward slashes; or (2) one back slash. And also remember to include double quotation marks.

**7.7.4 Getting your Working Directory** 

If you ever want to know what your working directory is, then you can use the command 'getwd()'

    > getwd()
    [1] "C:/G/2018, SOCI832/Datasets/AES 2013"
    >

**7.7.5 Calling Files in your Working Directory**

To access any file in your working directory you can simply refer to it by its file name. 

For example, if you put the elect_2013.csv file in your working directory, and you want to import it into a data frame (which we will learn about next) called 'aes', then you can use the following command.

    aes <- read.csv("elect_2013.csv")


| TIP 2: WATCH OUT FOR QUOTATION MARKS |
|:---------:|
| If you copy over code that contains quotation marks directly from a website, and the code doesn’t work, delete the copied quotation marks and replace them within RStudio. <br> <br> Microsoft Word's quotation marks are not compatible with R. <br> <br> This is because in R, the quotes need to be straight quotes (such as ' and ") and not curly (or smart) quotes (such as ‘ ’ “ and ”). |


| TIP 3: CHEATSHEETS |
|:---------:|
| If you are ever looking for how to use RStudio or R, these are a few really helpful 'cheatsheets' <https://www.rstudio.com/resources/cheatsheets/> <br> <br> The two most useful cheatsheets are these: <br> Base R Cheatsheet: <http://github.com/rstudio/cheatsheets/raw/master/base-r.pdf> <br> RStudio Cheatsheet: <https://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf> |

#### 7.8 An introduction to functions

Most of the power of R is contained in commands that are called 'functions'.

Functions take one or more variables, process these variables, and produce an output. 

The conventional syntax for naming most functions in R is 

  1.  The name of the function
  2.  An open bracket
  3.  One or more variables or values being passed to the function
  4.  A close bracket

**Example 1:** For example, we might create a variable called z and put the value 100 into it. And then we run the function "sqrt()" on it. "sqrt()" computers the square root of the number in the brackets. 

    > z <- 100
    > sqrt(z)
    [1] 10
    > 

We can see that R returns the square root of 100, which is 10.

**Example 2:** We can do a more complex example with a vector. We can create a vector with the function "c()", and then we can calculate the sum with "sum()", the mean with "mean()", and the standard deviation with the function "sd()".

    > q <- c(1,2,3,4,5,6,7,8,9,10)
    > sum(q)
    [1] 55
    > mean(q)
    [1] 5.5
    > sd(q)
    [1] 3.02765


### 8. Readings for Week 1

#### 8.1 Textbooks

Unfortunately there isn't one textbook that covers all the material we want to cover in this course.

As much as possible, Dr Lee and myself are going to try to recommend readings from these three textbooks:

* Field, A., Miles, J., and Field, Z. (2012). Discovering statistics using R. Sage publications. <sup>[6](#myfootnote6)</sup> 
* Verzani, J. (2014). Using R for introductory statistics. CRC Press. <sup>[7](#myfootnote7)</sup> 
* Gelman, A., & Hill, J. (2006). Data analysis using regression and multilevel/hierarchical models. Cambridge university press. <sup>[8](#myfootnote8)</sup> 

All three should be (or will be soon) available at the Macquarie University Library. All three can be bought as ebooks (and as paperbacks) online. If you are short on cash and OK with breaching copyright, then all three can be found online for free as PDFs via a more or less simple Google search.

Field et al. is comprehensive and accessible. It is nearly 1000 pages long, and in full colour. Unfortunately it is written by a psychologist, so the examples tend towards psychological examples. 

Verzani is more focused on teaching R, and so the most complete of the three as an introduction to statistics in R. It is shorter than Field and covers a narrower range of statistical methods (e.g. it doesn't cover factor analysis or multilevel models).

Gelman and Hill is one of the most widely cited statistical textbooks in the world. However, it focuses on quite advanced statistics, and so is not very useful as an introduction, and misses a lot of material we cover in the early weeks.

#### 8.2 Readings for week 1

As readings for week 1, I recommend the either of the following (not both):
* Chapters 1, 2, and 3 from Verzani (2014). This covers an intro to R, univariate statistics, and bivariate statistics. 
* Chapters 3, 6, and 9 from Field, et al. (2012). This covers an intro to R, correlation, and comparison of means. 

These are quite long readings, but they cover both very basic things (like installing R and calculating a mean), and some more complex material. The main things I want you to get out of this is how to run basic univariate and bivariate analysis in R so that you can do the exercises due in week 2.
 
### 9. Exercises Due Week 2

**Exercise**

Put together four to six powerpoint slides where you present:

1.  A potential research question for your report due in week seven.
2.  A dataset you might analyse to answer this question
3.  Results of analysing this dataset with R using at least one univariate analysis (e.g. mean, standard deviation, minimum, maximum) and one bivariate analysis (e.g. correlation, comparison of means). 
4.  The main commands you used to run this analysis in R

Note that you are strongly encouraged to focus your research project this semester on a dataset and topic which is related to something of larger interest to you, such as your Masters or PhD thesis topic. It is fine for you to submit for this class analysis of your datasets for your masters or PhD, and use this class to progress your work for your thesis (though do check with your thesis supervisor to make sure you don't self-plagarize).

Note that the research question you pick for week 2 doesn't have to be the final one you present in weeks 7 or 13. You can change at a later stage. If you can't think of a good question or dataset, then pick something to practice on.

---

### Footnotes

<a name="myfootnote1">1</a>: Gustafsson, K., & Hagström, L. What is the point? Teaching graduate students how to construct political science research puzzles. European Political Science, 1-15.

<a name="myfootnote2">2</a>: Available as ebook for US$10 here: http://a.co/daz9a8j

<a name="myfootnote3">3</a>: Available as ebook for US$45 here: http://a.co/2jVI7VH

<a name="myfootnote4">4</a>: Available as ebook for US$25 here: http://a.co/aSj0o91

<a name="myfootnote5">5</a>: Available for free at https://openstax.org/details/books/introductory-statistics 

<a name="myfootnote6">6</a>: Available as ebook for US$45 here: http://a.co/2jVI7VH

<a name="myfootnote7">7</a>: Available as ebook for US$48 here: http://a.co/eXZ4BVJ 

<a name="myfootnote8">8</a>: Available as ebook for US$50 here: http://a.co/6I25HUG

