---
layout: post
title: Einsum Autodiff
---
# Einsum Autodiff

## Definition of Einsum

`einsum` is defined as
$$
O_{\vec o} = \sum\limits_{(\vec a \cup \vec b \cup \vec c \ldots) \backslash \vec o }A_{\vec a}B_{\vec b}C_{\vec c} \ldots,
$$

where $\vec a = a_1, a_2\dots$ are labels that appear in tensor $A$, $\vec a\cup \vec b$ means the union of two sets of labels, $\vec a\backslash \vec b$ means setdiff between two sets of labels. The above sumation runs over all indices that does not appear in output tensor $O$.

## Autodiff

Given $\overline O$, In order to to obtain $\overline B \equiv \partial \mathcal{L}/\partial B$, consider the the diff rule
$$
\begin{align}
\delta \mathcal{L} &= \sum\limits_{\vec o} \overline O_{\vec o} \delta O_{\vec o} \\
&=\sum\limits_{\vec o\cup\vec a \cup \vec b\cup \vec c \ldots} \overline O_{\vec o}A_{\vec a}\delta B_{\vec b}C_{\vec c} \ldots
\end{align}
$$
Here, we have used the (partial) differential equation
$$
\delta O_{\vec o} = \sum\limits_{(\vec a \cup \vec b \cup \vec c \ldots) \backslash \vec o }A_{\vec a}\delta B_{\vec b}C_{\vec c} \ldots
$$
Then we define
$$
\overline B_{\vec b} = \sum\limits_{(\vec a \cup \vec b \cup \vec c \ldots) \backslash \vec b }A_{\vec a}\overline O_{\vec o}C_{\vec c} \ldots,
$$
We can readily verify
$$
\delta \mathcal{L} = \sum\limits_{\vec b} \overline B_{\vec b} \delta B_{\vec b}
$$
This backward rule is exactly an einsum that exchange output tensor $O$ and input tensor $B$.

In conclusion, the `index magic` of exchanging indices as backward rule holds for einsum.



Thank [Andreas Peter](https://github.com/under-Peter) for helpful discussion.