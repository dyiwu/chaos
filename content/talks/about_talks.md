+++
title = "About talks"
date = 2019-05-16T19:20:41+08:00
tags = ["reveal.js","hugo"]
categories = ["talk"]
toc = true
+++
Here are varying tech talks, presentations.
<!--more-->
## Front mater of slide deck
```
+++
title = "title of talk"
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

### Folder structure
The folder structure would look like as section presentations.

```
- content
  - about-talks # The about page of talks.
  - ted-talk
    - index.md # beginning of the ted talk presentation
    - body.md # appends to the ted talk presentation
    - conclusion.md # appends to the ted talk presentation
```

### Keyboard shortcuts

- <kbd>N</kbd>, <kbd>SPACE</kbd>:	Next slide
- <kbd>P</kbd>: Previous slide
- <kbd>←</kbd>, <kbd>H</kbd>: Navigate left
- <kbd>→</kbd>, <kbd>L</kbd>: Navigate right
- <kbd>↑</kbd>, <kbd>K</kbd>: Navigate up
- <kbd>↓</kbd>, <kbd>J</kbd>: Navigate down
- <kbd>Home</kbd>: First slide
- <kbd>End</kbd>: Last slide
- <kbd>B</kbd>, <kbd>.</kbd>: Pause (Blackout)
- <kbd>F</kbd>: Fullscreen
- <kbd>ESC</kbd>, <kbd>O</kbd>: Slide overview / Escape from full-screen
- <kbd>S</kbd>: Speaker notes view
- <kbd>?</kbd>: Show keyboard shortcuts
- <kbd>alt</kbd> + click: Zoom in. Repeat to zoom back out.

### Reference:

- [reveal-hugo theme @ gohugo](https://themes.gohugo.io/reveal-hugo/)
- [dzello/reveal-hugo @ github](https://github.com/dzello/reveal-hugo)
- [hakimel/reveal.js @ github](https://github.com/hakimel/reveal.js)

