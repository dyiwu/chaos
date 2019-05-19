+++
title = "About talks"
date = 2019-05-16T19:20:41+08:00
tags = ["reveal.js","hugo"]
categories = ["talk"]
# outputs = ["Reveal"]

# [reveal_hugo]
# theme = "moon"
# highlight_theme = "solarized-dark"
# slide_number = true
# transition = "zoom"
+++
Here are tech talks, presentations etc.
<!--more-->
front mater
```
+++
title = "talks"
date = 2019-05-16T19:20:41+08:00
tags = ["reveal.js","hugo"]
categories = ["talk"]
outputs = ["Reveal"]
layout = "bundle"

[reveal_hugo]
theme = "moon"
highlight_theme = "solarized-dark"
slide_number = true
transition = "zoom"
+++
```

The folder structure would look like with one root presentation and one section presentation.
```
- content
  - home # special section for appending to root presentation
    - body.md # appends to the root presentation
    - conclusion.md # appends to the root presentation
  - _index.md # beginning of the root presentation
- ted-talk
    - _index.md # beginning of the ted talk presentation
    - body.md # appends to the ted talk presentation
    - conclusion.md # appends to the ted talk presentation
```
Reference:

- [reveal-hugo theme @ gohugo](https://themes.gohugo.io/reveal-hugo/)
- [dzello/reveal-hugo @ github](https://github.com/dzello/reveal-hugo)
