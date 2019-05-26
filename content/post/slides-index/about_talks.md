+++
title = "About Slides"
date = 2019-05-26T08:02:41+08:00
tags = ["reveal.js","hugo"]
categories = ["slide"]
toc = true
+++
Things about the presentation slides.
<!--more-->
## Front mater of slide deck
```golang
+++
title =  "{{ replace .TranslationBaseName "-" " " | title }}"
date = {{ .Date }}
tags = ["reveal.js","hugo"]
categories = ["slide"]

outputs = ["Reveal"]
layout = "bundle"

[reveal_hugo]
theme = "moon"
highlight_theme = "solarized-dark"
slide_number = "c/t"
transition = "zoom"
+++
```

## Folder structure
The folder structure would look like as section presentations. Additional content files can be placed in the section and will be added to the presentation in the order of their **weight** in front matter also, such  
`weigt = 10`

```
- content
  - slide
    - slide-for-my-talk
      - index.md # beginning slide of this presentation
      - body.md # appends to this presentation
      - conclusion.md # appends again
      - picture.jpg  # picture used in slide
```

## Keyboard shortcuts

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

## Reference:

- [reveal-hugo theme @ gohugo](https://themes.gohugo.io/reveal-hugo/)
- [dzello/reveal-hugo @ github](https://github.com/dzello/reveal-hugo)
- [hakimel/reveal.js @ github](https://github.com/hakimel/reveal.js)

