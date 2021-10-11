---
layout: default
title: Research
permalink: /research
--- 

##  <center> Neural network theory and algorithms

A neural network is a structurally simple parametric family with powerful representation capabilities in which an input propagates through a network  of  parallel matrix multiplications and activation units.
The aim is to find (learn, train) a neural network  \\(L(x) \\) which approximates the target function \\( f(x)\\), given noisy data \\(y_i=f(x_i)+\epsilon_i\\), \\(i=1,\dots, K\\).  \\( f\\) can be  an image classifier, solution to a PDE, a specific parameter associated with a model, etc. Some challenges that arise are

* Neural network  architectures are typically selected by trial and error,  and often it is not clear beforehand how many layers and nodes should be taken in the network;

* Models  lack  interpretabilty, in particular it is not clear what the weights \\(\\{a_j,b_j,c_j\\}_{j=1}^m\\) represent;

* The training process is computationally expensive and there is not a good initialization method for the training;

* There are many stability issues, both during the training process (sensitivity to initialization) and post training (sensitive to adversarial attacks), and many others.

To better understand and address some of these questions, in this effort we investigate shallow neural networks, which are better suited for mathematical analysis. 
A shallow neural network is a function of the form 
\\[    L(x) = \sum_{j=1}^m c_j \, \sigma(a_j \cdot x + b_j),
\\]



where \\(x\in\mathbb{R^d}\\) is the input variable, \\(a_j\in \mathbb{R}^d\\) are the weights, \\(b_j\in\mathbb{R}\\) are the biases,  \\(c_j\in \mathbb{R}\\) are the output weights, and \\(\sigma:\mathbb{R}\to\mathbb{R}\\) is the activation function of the network.
We consider the ReLU (rectified linear unit) activation, given by \\(\sigma(z) = \max\{z,0\}\\), which is the conventional choice of activation in most modern architectures. 
<img style="float: right;" width="400" height="220" src="{{site.baseurl}}/assets/nnpic.png">


Due to the Universal Approximation Theorem, any continuous function can be uniformly approximated by a shallow neural network on any compact set. However, the approximating network can be very wide, with a large number of nodes. The challenge we addressed in our work in [(Pieper, Petrosyan, 2021)](https://arxiv.org/abs/2004.11515) and [(Petrosyan, Dereventsov, Webster, 2020)](https://arxiv.org/abs/1910.02743)  was finding  network that is of small size and which approximates the target function on a given set. Previously, a convex penalization method was proposed in [(Bengio, et al, 2005)](https://proceedings.neurips.cc/paper/2005/file/0fc170ecbb8ff1afb2c6de48ea5343e7-Paper.pdf),
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
 
## <center> Joint sparse recovery

## <center> Dynamical sampling
		


