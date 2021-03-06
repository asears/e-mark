Gamifying Agile Estimation
========================================================
title: "Estimation and Planning Poker"
author: Andrew Sears, Senior Solutions Consultant, T4G Limited
date: February 27, 2017
autosize: true
css:styles/estimation.css
font-import: http://fonts.googleapis.com/css?family=Risque
font-family: 'Helvetica'


A few of my agile influences
========================================================
Gino Marckx, Agile Trainer, co-founder, Toronto Agile Software Development Community

![Gino](https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/5/005/020/2a0/1787607.jpg)

*"I have facilitated collaborative origami for over 1,000 pairs and only 2 have succeeded in completing it back to back."*  

*"Agile is just common sense brought back to software engineering."*

***
Michael Sahota, co-founder, Toronto Agile Software Development Community  
![Michael](http://www.torontoagilecommunity.org/download/attachments/13107247/2014%20Michael%20Profile-300pix.JPG?version=1&modificationDate=1412890237293&api=v2&effects=border-simple,blur-border)

*"All of us need to work together to support you getting what you want."*



Agile Influencers
========================================================
Dr. Jeff Sutherland, co-creator of Scrum 

![Jeff](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Jeff_Sutherland.JPG/200px-Jeff_Sutherland.JPG)

*"Embrace the unknown! That's where learning lies! If you're too afraid to learn, you will never get any better."*
***
Ken Schwaber, co-creator of Scrum

![Ken](http://www.scrumguides.org/images/ken_schwaber.png)

*“Those who play games and keep practicing may become very good at playing the games.”*


What's a Backlog?
========================================================
type: prompt
incremental: true

* An ordered, prioritized list of value-adding product backlog items (PBIs)
* Work to be completed, what will be delivered
* Most valuable *customer* items will be on top


What's a Product Backlog Item?
========================================================
type: alert
incremental: true

* A child of a Feature that lives under an Epic umbrella
* Use case, epic, User Story, bug, chore, group of preferably small tasks
* When it enters the Backlog, it may be large, risky, ugly and unmanageable
* Split smelly, unmanageable and risky PBIs up to reduce risk and improve estimations  
* When it is committed to a sprint iteration it should be tidy, well-defined and manageable

<center>Definition of Ready: Described, Business Valued, Estimated, Ordered</center>


What's an Estimate?
========================================================
* The relative effort or cost it will take to complete the PBI 
* Effort to get to a team's Definition of Done within the sprint
* As the unknowns and risks creep in, your estimates will be higher
* Estimate are based on instinct, past experiences and perhaps numerology
* Use Planning Poker to reduce outside influences on estimates

<center><img src="http://astronlogia.com/wp-content/uploads/2009/01/Numerology-of-India.jpg" alt="numerology" width="25%" height="25%"></center>
*<center>Sometimes it can take days to get four hours of work done.</center>*
*<center>80% of effects come from 20% of causes and 80% of results come from 20% of effort.</center>*


Fibonacci Sequence
========================================================
class: small-code

The Fibonacci Sequence is the series of numbers.
The next number is found by adding up the two numbers before it.



```r
> library(UsingR)
> library(numbers)
> n<-20
> s <- seq(1:n)
> fib <- as.integer(sapply(s, fibonacci))  
> x1<- ifelse(seq(1:n)%%2 ==1, fib, 0)
> y1<- ifelse(seq(1:n)%%2 ==0, fib, 0)
> x2 <-ifelse(seq(1:n)%%4==1, x1,-x1)
> y2 <-ifelse(seq(1:n)%%4==2, y1,-y1)
> x <- ifelse(x2 >0, log(x2), ifelse(x2<0, -log(-x2),0))
> y <- ifelse(y2 >0, log(y2), ifelse(y2<0, -log(-y2),0))
> plot(x,y)
> lines(x,y, col="red")  
```

![plot of chunk unnamed-chunk-1](estimation-figure/unnamed-chunk-1-1.png)

[Spiral Graph Creation](https://rpubs.com/hchan88888/99118)


Estimating Effort
========================================================

* Shirt Sizes
    + 1-XS, 3-S, 8-M, 20-L, 40-XL, 100-XXL

* Fibonacci Extended 
    + 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144
  
* **Fibonacci Original**
    + 1, 2, 3, 5, 8, 13, 20, 40, 100  
*Recommended by Ken Schwaber, father of scrum*
  
* **Doubling**
    + 1, 2, 4, 8, 16, 32, 64  
*Recommended for Business Value Estimation*

* Thrown (Five Fingers)  
    + 1, 2, 3, 4, 5

***
![shirts](http://agileupgrade.com/wp-content/uploads/2015/02/T-shirt-size-point-ratio.png)

Other valid answers
========================================================
<img src="https://c1.staticflickr.com/6/5217/5471047557_4dc13f5376.jpg" alt="unsure" width="20%" height="20%">

*"I have absolutely no idea whatsoever.  I have questions about this."

![Infinity](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Infinite.svg/200px-Infinite.svg.png)

*"The effort for this task is infinite."

<img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRqUm3mvrF3uDIzZRJ338FKs4iG-8sbatxJA91RFuDNfuEWbv43kqoOsgI" alt="timeout">

*"Let's discuss this one over a drink."


Estimating Business Value
========================================================
* Product Owner estimates Business Value

* Use Doubling  
    + 1, 2, 4, 8, 16, 32, 64

* Prioritize The Backlog by ROI    


<font size="48px">
*$\LARGE ROI  = \frac{Business Value}{Effort}$* 
</font> 




Gamifying Estimates with Planning Poker
========================================================
1. Start an Estimation Session for a Backlog or Iteration
2. Team discusses each PBI, ensures Definition of Ready
    + Description  
    + Acceptance Criteria  
    + Enough information to task it   
3. For safety and accountability, all team members estimate together
    + Don't show your hand
    + Reduces influences on estimates
4. Review the estimates  
    + Elaborate items if estimates differ greatly  
    + Discuss and learn other team members activities
    + Identify potential blockers and risks
5. Commit consensus estimate


RMarkdown Presentation Tools
========================================================

In the course of this presentation, I found some limitations with RStudio's Presentation format around sizing slides and working with a different markdown format.  

Javascript-based presentation frameworks play better with standard markdown.

* revealjs
* ioslides
* slidy
* beamer

```
library(devtools)
install_github('slidify','ramnathv')
install_github('slidifyLibraries','ramnathv') 
library('slidify')
author('estimation')
```

Resources
========================================================
[Arguments Against Estimation](https://pragprog.com/magazines/2013-02/estimation-is-evil)

[LEGO&reg; SERIOUS PLAY&reg;](https://www.lego.com/en-us/seriousplay)

[To Re-Estimate or Not, That is the Question](https://www.mountaingoatsoftware.com/blog/to-re-estimate-or-not-that-is-the-question)

[Scrum at 21](https://kenschwaber.wordpress.com/2017/01/12/scrum-21/)

[SSW - Do you estimate all tasks at the start of the sprint?](https://rules.ssw.com.au/do-you-estimate-all-tasks-at-the-start-of-the-sprint)

[SSW - Do you know how to size user stories effectively?](https://rules.ssw.com.au/estimating-do-you-know-how-to-size-user-stories-effectively)

[SSW - Do you estimate business value?](https://rules.ssw.com.au/do-you-estimate-business-value)

[RStudio Cheat Sheets](https://www.rstudio.com/resources/cheatsheets/)

[Authoring R Presentations](https://support.rstudio.com/hc/en-us/articles/200486468-Authoring-R-Presentations)

[Algorithmic optimization method for effort estimation](https://link.springer.com/article/10.1134/S0361768816030087)



