---
layout: default
title: Research
permalink: /research
--- 

##  <center> Neural network theory and algorithms

A neural network is a structurally simple parametric family with powerful representation capabilities in which an input propagates through a network  of  parallel matrix multiplications and activation units.
The aim is to find (learn, train) a neural network  \\(L(x) \\) which approximates the target function \\( f(x)\\), given noisy data \\(y_i=f(x_i)+\epsilon_i\\), \\(i=1,\dots, K\\).  \\( f\\) can be  an image classifier, solution to a PDE, a specific parameter associated with a model, etc. 
We investigate shallow neural networks, which are better suited for mathematical analysis:
\\[    L(x) = \sum_{j=1}^m c_j \, \sigma(a_j \cdot x + b_j),
\\]
where   \\(\sigma:\mathbb{R}\to\mathbb{R}\\) is the ReLU activation function.
<img style="float: right;" width="400" height="220" src="{{site.baseurl}}/assets/nnpic.png">


The challenge we addressed in our work in [(Pieper, Petrosyan, 2021)](https://arxiv.org/abs/2004.11515) and [(Petrosyan, Dereventsov, Webster, 2020)](https://arxiv.org/abs/1910.02743)  was finding  network that is of small size and which approximates the target function on a given set. Previously, a convex penalization method was proposed in [(Bengio, et al, 2005)](https://proceedings.neurips.cc/paper/2005/file/0fc170ecbb8ff1afb2c6de48ea5343e7-Paper.pdf),
\\[
\min_{c_n \in \mathbb{R},\;  \|a_n\|^2+|b_n|^2 = 1}\;  \frac{1}{2K}\sum_{i=1}^K|L(x_i)-y_i|^2+\alpha  \sum_{n=1}^N|c_n|.
\\]
However, as we demonstrate in our work, this method is not effective at removing redundant or ineffective nodes but in fact it encourages them. To fix this, we propose
\\[ \min_{ N\geq 0,\; c_n \in \mathbb{R},\;  \|a_n\|^2+|b_n|^2 = 1}\;\;  \frac{1}{2K}\sum_{i=1}^K|L(x_i)-y_i|^2+\alpha \sum_{n=1}^N\phi(|c_n|)\\]
where \\(\phi:\mathbb{R}\_{\geq 0}\to \mathbb{R}\_{\geq 0}\\) is a non-decreasing and sub-additive function. It turns out finding a global solution of this problem is NP-hard, however we showed that all local minima are very well behaved and  easy to find.  In particular, we proved that 

* Under certain conditions on \\(\phi\\), all the local minima of the loss function are attainable even when data is very (infinitely) large, which is a surprising result given that the network size  \\(N\\) is maintained as a free optimization variable.
 * Any local solution \\(L(x)\\) has small reconstruction inaccuracy; 
   \\[\frac{1}{2K}\sum_{i=1}^K|L(x_i)-y_i|^2\leq c_f\alpha +\frac{1}{2K}\sum_{i=1}^K|\epsilon_i|^2\\]
    where the constant \\(c_f\\) depends only on the function \\(f\\). In other words, fidelity is not sacrificed for the sake of sparsity. 
 
 <center>
 	<figure>
<img   width="700" height="300" src="{{site.baseurl}}/assets/comparison.png">
<figcaption align = "center"><b>Fig.1 - Comparison of solutions</b></figcaption>
</figure>
</center>

Figure 1 compares solutions   for \\(f(x) = \cos(10(10^{-3}+x^2)^{1/8})\\)
  with different convex and noncovex \\(\phi\\): We choose \\(\alpha = 10^{-4}\\), \\({x_i}\\)
  by 5000 uniformly distributed points on the interval \\([-1,1]\\), \\(y_i = f(x_i)+
  \epsilon_i\\) perturbed by white
  noise with std.\ dev.\ \\(0.05\\).
  * Top: outer weights \\(c_n\\) over the knot points \\( -b_n/a_n\\).
  * Bottom: Noisy data \\(y_i = f(x_i) + \epsilon_i\\) (blue), optimal
  network \\(L(x)\\) (black), and knot points of the corresponding linear spline
  (orange).}
 
## <center> Multiple measurement vector problem


We proposed a reconstruction algorithm that outperforms the  state of the art
 method  currently in use for joint sparse recovery.  
The joint sparse recovery or the Multiple Measurement Vector (MMV) problem can be formulated as follows: we want to solve a matrix equation of the form
\\[AX=Y.\\]
The goal is to  recover the unknown \\(X\in\mathbb{R}^{N\times K}\\), for given \\(A\in \mathbb{R}^{M\times N}\\) and \\() Y\in \mathbb{R}^{M\times K}\\),   under the assumption  that  \\(X \\) is an \\(s\\)-row sparse matrix, i.e. at most \\(s\\) rows of \\(X\\) are different from zero. One expects that a large  number  \\(K\\) of unknown jointly sparse vectors  will result in reduction of \\(M\\) which corresponds to the number of linear measurements done on the vectors. 

The convex \\(\ell_{2,1}\\) norm optimization method is commonly used for solving the joint sparse recovery problem.
However, this method suffers from rank-blindness issues  [(Davies, Eldar, 2010)](https://arxiv.org/abs/1004.4529), that is, it fails to take advantage of the rank of the s-row sparse  matrix: real life data is typically of  maximum rank. Several rank-aware methods have been proposed [(Lee, Bresler, Junge, 2012)](https://arxiv.org/abs/1004.3071) but none of them is based on a functional optimization. Our method is the first. 

In  [(Petrosyan, Tran, Webster, 2018)](https://arxiv.org/abs/1811.08778), utilizing the rank of the output data matrix we reduced the problem to a full column rank case.  We offered a new  method for recovery of jointly sparse vectors in the form of  a (non-convex)  optimization problem 
\\[\arg\min\_{Z\in \mathbb{R}^{N\times r},\; \mathbb{R}ank(Z)=r}\|Z(Z^TZ)^{-\frac{1}{2}}\|\_{2,1}\text{  s.t.  } AZ=V.\\]


Our newest contribution is the new algorithmic method for solving this non-convex problem.
<figure>
	<center>
<img   height="200" src="{{site.baseurl}}/assets/comparisonmmv.png">
<figcaption align = "center"><b>Fig.2 - Comparison of convex and non-convex methods</b></figcaption>
</center>
</figure>
Numerical experiments demonstrate the superior performance of this method against the convex \\( \ell_{2,1} \\) minimization. Figure 2 compares median reconstruction inaccuracy for our method against \\(\ell_{2,1}\\) norm minimization. We generated 22 random  matrices \\(A_i\\) of size \\(80\times 300\\),  and \\(22\\) random matrices of sparsity \\(s=30\\) with added random noise to the measurements. For each \\(A_i\\), we considered the first \\(k\\) rows for \\(k=38,40,42,\dots,80\\), and found the matrix \\(X\\) using our method and the convex method. The figure clearly demonstrates that our method has more accuracy and hence requires smaller number of measurements for recovery. 


## <center> Dynamical sampling
		

The classical sampling problem is to reconstruct a signal from its linear measurements or samples.  For such inverse problems to be solvable, the target signal  must be known to belong to a certain class, typically involving some form of regularity or   structural property (e.g. band-limited or sparse). Moreover, the sampling set must be chosen appropriately, with high enough density at important locations. If the target signal is some  quantity that is spread out in a large area, having such densely positioned measurement devices may not be feasible. For example, it is not practical to position measuring stations very close to each other if we want to obtain a detailed air pollution map in an area.
 However, it often happens that the scarceness of the sampling locations can be compensated for by involving dynamics. When the target function is the initial state of a physical process (e.g.,  air pollution), we can repeatedly sample its values at the same sampling locations as time progresses, and try to recover the function from the combination of these spatio-temporal samples. This new way of sampling, which we call dynamical sampling, differs from standard sampling since it is not only the function that is sampled but also its various states at different times.

One of the main problem in dynamical sampling is to find relations between the dynamical system and the sampling locations to obtain stable and robust reconstruction of the initial state of the system. We investigated these and other related questions and gave answers in many important and general cases when the forcing term in the dynamical system is linear. In particular, we were able to find and fully characterize the connection between sampling locations and the spectral properties of the operator governing the linear dynamics of the system. When the operator is normal, by employing techniques from frame theory and operator theory,  We showed that the existence of “measuring devices” for which any signal can be stably recovered from the measurement data imposes rather strong conditions on the operator. More specifically, the operator’s spectrum should lie entirely inside a unit disk on the complex plane and the part of the spectral measure that is on the unit circle must be absolutely continuous with respect to the arc length measure on the circle. These results were further extended to more general operators and we proved that the stable recovery property is inherently connected to the spectral properties of the evolution operator. 


Additionally, we considered the case when measuring devices are allowed to take measurements continuously in time, which in real life scenario means taking samples at very high time resolution.  Surprisingly enough, as one of our main results in this setting, we discovered that in terms of reconstruction properties, as long as the resolution is high enough, the reconstruction properties will not be affected. Or in other words, there is no need to take too many snapshots of the system in time after some threshold is met; the collected data is enough to fully recover the unknown initial state. We constructed several interesting counterexamples showing that if some of our assumptions are dropped, the conclusions made in the theorems will fail to hold.  		



