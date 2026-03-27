#import "@preview/typslides:1.3.2": *

#show: typslides.with(
  ratio: "16-9",
  theme: "dusky",
)

#front-slide(
  title: "Moje prezentace",
  subtitle: [Podtitulek],
  authors: "Jan Novák",
  info: [InstallFest 2026],
)

#title-slide[
  Sekce
]

#slide(title: "Obsah slidu")[
  - Položka jedna
  - Položka dvě - #stress[důležitá věc]

  #grayed(text-size: 18pt)[
    ```typst
    // Ukázka kódu
    #let pozdrav = "Ahoj"
    #pozdrav, světe!
    ```
  ]
]

#focus-slide[
  Díky! \
  \
  _Otázky?_
]
