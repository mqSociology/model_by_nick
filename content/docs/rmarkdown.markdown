---
title: R Markdown Page

date: 2018-09-09T00:00:00.000Z
lastmod: 2018-09-09T00:00:00.000Z

draft: false
toc: true
type: docs

linktitle: R Markdown Example
menu:
  docs:
    parent: Example Topic
    weight: 2
---

This page provides an example of using R Markdown.

## Code block


```r
x <- 1:10
y <- round(rnorm(10, x, 1), 2)
df <- data.frame(x, y)
df
```

```
##     x    y
## 1   1 1.84
## 2   2 1.54
## 3   3 3.79
## 4   4 3.56
## 5   5 6.64
## 6   6 7.68
## 7   7 7.56
## 8   8 6.95
## 9   9 7.95
## 10 10 7.65
```
