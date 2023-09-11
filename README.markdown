---
layout: post
title:  "ROC Analysis Tool based on DeLong's Method"
date:   2015-8-31
categories: update
---

### Introduction

This is a ROC analysis tool based on DeLong's method, implemented by [Xu Sun](http://pamixsun.github.io/).

To analyze your own data, you should first move your experiment results, saved as a **.mat** file in the required format, into the same directory as the source code for this tool. Then run the **DeLongUserInterface** function, and you will see your file listed in the "Selected File" popup menu. Next, select your file and click the "Update Data" button below - several ROC curves will be drawn based on your data. Now choose the two ratings you would like to analyze under "Rating 1" and "Rating 2", and click the "Analysis" button. Finally, you will obtain the statistical results. Note that all results are calculated using DeLong's formulas, implemented efficiently as described by Sun and Xu.

If the text color of a push button is red, it indicates that the results shown in the interface are inconsistent with the options chosen in the popup menu. To fix this, simply click on the corresponding button again. The text color will turn back to black, indicating that the results now match your selected options. This provides a quick visual check to ensure the analysis reflects your choices.

The variables saved in the **.mat** file are *spsizes* and *ratings*:

- *spsizes* is a *2 x 1* vector representing the sizes of the two samples X and Y. For ease of reference, let m and n denote these two values.
- *ratings* is a *K x N* matrix, where each row represents the ratings from one experiment. Note that N must equal the sum of m and n. The first *m* elements correspond to ratings for *X*, while the last *n* elements correspond to ratings for *Y*. 


![plot of chunk DeLongUI-image-1](images/delong/image_1.png)
 
![plot of chunk DeLongUI-image-2](images/delong/image_2.png) 


### Citation Request

Anyway, I hope that this tool could be helpful for researchers who using AUC in their work.

If you publish material based on these codes, then, please refer to [our paper](http://ieeexplore.ieee.org/xpl/articleDetails.jsp?reload=true&tp=&arnumber=6851192):

    X. Sun, W. Xu, Fast implementation of DeLong's algorithm for comparing the areas under correlated receiver operating characteristic curves, IEEE Signal Processing Letters 21 (11) (2014) 1389-1393.

Here is a BiBTeX citation as well:

    @article{sun2014fast,
      title={Fast Implementation of DeLong's Algorithm for Comparing the Areas Under Correlated Receiver Operating Characteristic Curves},
      author={Xu Sun and Weichao Xu},
      journal={IEEE Signal Processing Letters},
      volume={21},
      number={11},
      pages={1389-1393},
      year={2014},
      publisher={IEEE}
    }


