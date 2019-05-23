+++
title =  "{{ replace .TranslationBaseName "-" " " | title }}"
date = {{ .Date }}
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