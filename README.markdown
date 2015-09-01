---
layout: post
title:  "ROC Analysis Tool based on DeLong's Method"
date:   2015-8-31
categories: update
---

### Introduction

This is a ROC analysis tool based on DeLong's method, implemented by [Xu Sun](http://pamixsun.github.io/).

To analysis your own data, you should firstly move your experiment results, saved as a **.mat** file in certain format, into the same dirrectory of the source codes of this tool. Then run the **DeLongUserInterface** function, and you will see you file is listed in the "Selected File" pop-up menu. Next, select your file and click the "Update Data" button below, several ROC curves will then be drawn according to you data. Now chose the two ratings that you would like to analysis in "Rating 1" and "Rating 2" and push the "Analysis" button, you will finally gain the statistical results. Note that all these results are calculated by DeLong's formulas with the fast implementation given by Sun and Xu.

If the color of the text in the push button is red, that means the results shown in the interface is not consistent with the options you chose in the pop-up menu. To fix this problem, all you need to do is just to click the correponding button.

The variables saved in the **.mat** file are *spsizes* and *ratings*:

- *spsizes* is a *2 * 1* vector, which represent the sizes of two samples, namely, *X* and *Y*. For ease of later reference, let *m*, *n* denote these two values.
- *ratings* is a *K * N* matrix, where each row represents the ratings of one experiments. Note that *N* must be equal to the sum of *m* and *n*, and its first *m* elements is the ratings corresponding to *X*, while the last *n* corresponding to *Y*.


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


