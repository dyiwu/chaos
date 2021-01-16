---
title: "pdf tools usage"
date: 2021-01-16T22:00:53:00+08:00
lastmod: 2021-01-16T22:01:30+08:00
draft: false
tags: ["pdf", "tool"]
categories: ["tech"]
---
pdf tools usage
<!--more--> 
## PDF
### Merge files
Merge multiple pdf files as single one.
```bash
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=finished.pdf page1.pdf page2.pdf
```
