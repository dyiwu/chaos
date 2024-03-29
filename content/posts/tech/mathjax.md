+++
title = "MathJax"
date = 2019-03-29T07:14:22+08:00
draft = false
summary = "MathJax, a JavaScript engine to display mathematics equations in browsers."
# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["web", "markdown"]
categories = ["tech"]

math = true

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
[image]
  # Caption (optional)
  caption = ""

  # Focal point (optional)
  # Options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
  focal_point = ""

+++
MathJax, a JavaScript engine to display mathematics equations in browsers.
It can translate expressions written in AsciiMath, LaTeX or MathML.

Enable global LaTeX math rendering by set ```math = true``` in ```config/_default/params.toml```.  
Enable per page basis LaTex math rendering by set ```math = true ``` in ```front matter``` of desired page.

Example 1:  
```
一元二次方程式 $\(ax^2 + bx + c = 0\)$ 的兩個根為：  

$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}$$
```
>一元二次方程式 $\(ax^2 + bx + c = 0\)$ 的兩個根為：  
>
>$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}$$

Example 2:  
```
This is inline: $\mathbf{y} = \mathbf{X}\boldsymbol\beta + \boldsymbol\varepsilon$
```
>This is inline: $\mathbf{y} = \mathbf{X}\boldsymbol\beta + \boldsymbol\varepsilon$

Example 3:  
```
$$\left [ – \frac{\hbar^2}{2 m} \frac{\partial^2}{\partial x^2} + V \right ] \Psi = i \hbar \frac{\partial}{\partial t} \Psi$$
```
>$$\left [ – \frac{\hbar^2}{2 m} \frac{\partial^2}{\partial x^2} + V \right ] \Psi = i \hbar \frac{\partial}{\partial t} \Psi$$

<small>
Reference:  

- [MathJax with HUGO](https://gohugo.io/content-management/formats/#mathjax-with-hugo)
- [MathJax Documentation](https://docs.mathjax.org/en/latest/)
- [Setting MathJax with Hugo](https://divadnojnarg.github.io/blog/mathjax/)
- [在Hugo中使用MathJax](http://note.qidong.name/2018/03/hugo-mathjax/)
