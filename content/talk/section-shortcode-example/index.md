+++
title =  "Section shortcode usage"
date = 2019-05-20T15:30:03+08:00
tags = ["reveal.js","hugo"]
categories = ["talk","tech"]

outputs = ["Reveal"]
layout = "bundle"

[reveal_hugo]
theme = "moon"
highlight_theme = "solarized-dark"
slide_number = "c/t"
transition = "zoom"
+++
{{% section %}}

## Vertical slide 1-1

---

## Vertical slide 1-2

---

## Vertical slide 1-3

{{% /section %}}

---

Transition slide between section 1 and 2

---

{{% section %}}

## Vertical slide 2-1

---

## Vertical slide 2-2

---

## Vertical slide 2-3

{{% /section %}}

---

Transition slide between section 2 and 3

---

{{% section %}}

## Vertical slide 3-1

---

## Vertical slide 3-2

---

## Vertical slide 3-3

{{% /section %}}
