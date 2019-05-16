+++
title = "Template presentation"
date = 2019-05-16T19:20:41+08:00
tags = ["reveal.js","hugo"]
categories = ["talk"]
outputs = ["Reveal"]

[reveal_hugo]
theme = "night"
margin = 0.2

[reveal_hugo.templates.blue]
background = "#0011DD"
transition = "zoom"
+++

## Template Example

---

This presentation shows how to take advantage of reveal-hugo's slide template feature.

---

Slide templates let you specify groups of slide attributes in one place and reuse them throughout the presentation.

---

{{< slide template="blue" >}}

Here's an example of using a template called `blue`, defined in the front matter of this presentation's `_index.md` file.

---

The template can contain any valid slide customization params:

```toml
[reveal_hugo.templates.blue]
background = "#0011DD"
transition = "zoom"
```

---

Then add it to any slide using the slide shortcode:

```
{{</* slide template="gray" */>}}
```

{{< slide template="gray" >}}

Templates can be specified in `config.toml` as well, for reusability across multiple presentations.

```
[params.reveal_hugo.templates.grey]
background = "#424242"
transition = "convex"
```

---

## THE END
