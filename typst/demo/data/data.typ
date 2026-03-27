// ========================================
// Strana 1: Jednoduchá verze
// ========================================

#set page(paper: "a4", margin: 2cm)
#set text(font: "Liberation Sans", size: 11pt, lang: "cs")

= Přehled uživatelů

#let data = csv("uzivatele.csv")

#table(
  columns: 3,
  inset: 8pt,
  align: horizon,
  table.header([*Jméno*], [*Email*], [*Role*]),
  ..data.slice(1).flatten(),
)

#v(2em)

= Generovaný seznam

#let users = csv("uzivatele.csv")

#for row in users.slice(1) [
  - *#row.at(0)* (#row.at(2)) - #link("mailto:" + row.at(1))[#row.at(1)]
]

// ========================================
// Strana 2: Stylizovaná verze
// ========================================

#pagebreak()

#let accent = rgb("#2563eb")
#let row-alt = rgb("#f1f5f9")

#show heading.where(level: 1): it => [
  #set text(size: 15pt, weight: "bold", fill: accent)
  #it.body
  #v(0.1em)
  #line(length: 100%, stroke: 1pt + accent)
  #v(0.5em)
]

#let role-color(role) = {
  if role == "Admin" { rgb("#fef3c7") } else if role == "DevOps" { rgb("#dbeafe") } else { rgb("#dcfce7") }
}
#let role-text(role) = {
  if role == "Admin" { rgb("#92400e") } else if role == "DevOps" { rgb("#1d4ed8") } else { rgb("#166534") }
}
#let badge(role) = box(
  fill: role-color(role),
  inset: (x: 6pt, y: 3pt),
  radius: 3pt,
  text(size: 9pt, weight: "bold", fill: role-text(role))[#role],
)

= Přehled uživatelů

#table(
  columns: (1fr, 1.5fr, auto),
  inset: 10pt,
  align: (left, left, center),
  fill: (_, row) => if row == 0 { accent } else if calc.odd(row) { row-alt } else { white },
  table.header(
    text(fill: white, weight: "bold")[Jméno],
    text(fill: white, weight: "bold")[Email],
    text(fill: white, weight: "bold")[Role],
  ),
  ..data
    .slice(1)
    .map(row => (
      [*#row.at(0)*],
      link("mailto:" + row.at(1))[#row.at(1)],
      badge(row.at(2)),
    ))
    .flatten(),
)

#v(2em)

= Generovaný seznam

#for row in users.slice(1) [
  #box(
    width: 100%,
    inset: (x: 10pt, y: 6pt),
    radius: 4pt,
    fill: row-alt,
  )[
    #grid(
      columns: (1fr, auto),
      [*#row.at(0)* - #link("mailto:" + row.at(1))[#row.at(1)]], [#badge(row.at(2))],
    )
  ]
  #v(0.4em)
]
