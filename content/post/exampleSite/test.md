---
title: "test JS Sequence Diagrams"
date: 2015-03-04T21:57:45+08:00
draft: false
categories: ["example-site"]

sequenceDiagrams: 
  enable: true
  options: "{theme: 'hand'}"
---

## Usage

```sequence
Andrew->China: Says Hello
Note right of China: China thinks\nabout it
China-->Andrew: How are you?
Andrew->>China: I am good thanks!
```

## Examples


```sequence
Title: Here is a title
A->B: Normal line
B-->C: Dashed line
C->>D: Open arrow
D-->>A: Dashed open arrow
```

---

```sequence
# Example of a comment.
Note left of A: Note to the\n left of A
Note right of A: Note to the\n right of A
Note over A: Note over A
Note over A,B: Note over both A and B
```

