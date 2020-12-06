# SimpleSim

  <!-- badges: start -->
  [![Travis build status](https://travis-ci.com/feji3769/SimpleSim.svg?branch=master)](https://travis-ci.com/feji3769/SimpleSim)
  
[![codecov](https://codecov.io/gh/feji3769/SimpleSim/branch/main/graph/badge.svg?token=M7OCZNJ28T)](https://codecov.io/gh/feji3769/SimpleSim)
  <!-- badges: end -->
## Introduction
This library contains functions for simulating data. The goal is to have fast and intuitive functions. 

## The Interface

All the functions are named 'Sim[Dataset]', so for example to simulate blobs you just use SimBlobs(10). 

## Types of Data
SimpleSim can generate the following data:

1. Blobs [1].
2. Friedman 1 [2].
3. Friedman 2 [2].
4. Friedman 3 [2].
5. 1D mixture of Gaussians. 
6. Polynomial change point model. 
7. S curve [3]
8. Swiss Roll [4]



# References
[1] I. Guyon, "Design of experiments for the NIPS 2003 variable
           selection benchmark", 2003.
           
           
[2] T. Hastie, R. Tibshirani and J. Friedman, "Elements of Statistical
           Learning Ed. 2", Springer, 2009.           


[3] S. Marsland, "Machine Learning: An Algorithmic Perspective",
           Chapter 10, 2009.
           http://seat.massey.ac.nz/personal/s.r.marsland/Code/10/lle.py
           
           
[4] http://people.cs.uchicago.edu/~dinoj/manifold/swissroll.html



