# Příprava dema — detailní instrukce

## Prostředí

### Instalace Typstu

```bash
# Linux (curl)
curl -fsSL https://typst.community/typst-install/install.sh | sh

# Arch Linux
pacman -S typst

# macOS
brew install typst

# Cargo (všechny platformy)
cargo install typst-cli
```

Ověření instalace:
```bash
typst --version
```

### Nix shell (volitelné)

`demo/shell.nix`:
```nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.typst
    pkgs.tinymist
    pkgs.just
  ];
}
```

Spuštění z adresáře `demo/`: `nix-shell`

---

## Struktura repozitáře

```
.
└── demo/
    ├── justfile
    ├── shell.nix
    ├── cv/
    │   └── cv.typ
    ├── data/
    │   ├── data.typ
    │   └── uzivatele.csv
    └── slides/
        └── slides.typ
```

---

## justfile

Spouštění z adresáře `demo/`:

```just
# List available tasks
default:
    @just --list

# Compile all demos
all: cv data slides

# Compile CV demo
cv:
    typst compile cv/cv.typ cv/cv.pdf
    xdg-open cv/cv.pdf

# Compile data demo
data:
    typst compile data/data.typ data/data.pdf
    xdg-open data/data.pdf

# Compile slides demo
slides:
    typst compile slides/slides.typ slides/slides.pdf
    xdg-open slides/slides.pdf

# Watch CV demo (live preview)
watch-cv:
    typst watch cv/cv.typ cv/cv.pdf

# Watch data demo (live preview)
watch-data:
    typst watch data/data.typ data/data.pdf

# Watch slides demo (live preview)
watch-slides:
    typst watch slides/slides.typ slides/slides.pdf

# Remove all generated PDFs
clean:
    rm -f **/*.pdf
```

---

## Demo 1: Životopis (CV)

`demo/cv/cv.typ` — dokument má dvě strany: jednoduchá a stylizovaná verze:
```typst
// ========================================
// Strana 1: Jednoduchá verze
// ========================================

#set page(paper: "a4", margin: (top: 2cm, bottom: 2cm, left: 2.5cm, right: 2.5cm))
#set text(font: "Liberation Sans", size: 11pt, lang: "cs")
#set par(justify: true)

#show heading.where(level: 1): it => [
  #set text(size: 18pt, weight: "bold")
  #it.body
  #line(length: 100%, stroke: 0.5pt)
]

#show heading.where(level: 2): it => [
  #set text(size: 13pt, weight: "bold")
  #v(0.3em)
  #it.body
]

#let entry(role, company, period, details) = [
  #grid(
    columns: (1fr, auto),
    [*#role* — #company],
    [#text(style: "italic")[#period]],
  )
  #details
  #v(0.5em)
]

= Jan Novák

// ... kontaktní informace, zkušenosti, vzdělání, dovednosti ...

// ========================================
// Strana 2: Stylizovaná verze
// ========================================

#pagebreak()
#set page(paper: "a4", margin: (top: 0cm, bottom: 2cm, left: 0cm, right: 0cm))

#let accent = rgb("#2563eb")
#let bg-header = rgb("#1e3a5f")

#let tag(t) = box(
  fill: rgb("#dbeafe"),
  inset: (x: 6pt, y: 3pt),
  radius: 3pt,
  text(size: 9pt, fill: accent)[#t],
)

#block(width: 100%, fill: bg-header, inset: (x: 2.5cm, y: 1.5cm))[
  #text(size: 26pt, weight: "bold", fill: white)[Jan Novák]
  #v(0.3em)
  #text(size: 12pt, fill: rgb("#93c5fd"))[Senior DevOps Engineer]
  // ... kontaktní grid ...
]

#block(width: 100%, inset: (x: 2.5cm, top: 1.5cm, bottom: 0cm))[
  // ... sekce s barevnými nadpisy, tagy pro dovednosti ...
]
```

Spuštění z adresáře `demo/`:
```bash
just cv
# nebo živý náhled:
just watch-cv
```

---

## Demo 2: Prezentace

`demo/slides/slides.typ`:
```typst
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
  - Položka dvě — #stress[důležitá věc]

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
```

Spuštění z adresáře `demo/`:
```bash
just slides
# nebo živý náhled:
just watch-slides
```

> Tato přednáška je sama o sobě ukázkou Typstu — viz `main.typ` v kořeni repozitáře.

---

## Demo 3: Dynamické načítání dat

`demo/data/uzivatele.csv`:
```csv
Jméno,Email,Role
Jan Novák,jan@example.com,Admin
Marie Svobodová,marie@example.com,Developer
Petr Černý,petr@example.com,DevOps
```

`demo/data/data.typ` — dokument má dvě strany: jednoduchá a stylizovaná verze:
```typst
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
  - *#row.at(0)* (#row.at(2)) — #link("mailto:" + row.at(1))[#row.at(1)]
]

// ========================================
// Strana 2: Stylizovaná verze
// ========================================

#pagebreak()

#let accent = rgb("#2563eb")
#let row-alt = rgb("#f1f5f9")

#let badge(role) = box(/* barevné odznaky podle role */)

= Přehled uživatelů

#table(
  columns: (1fr, 1.5fr, auto),
  fill: (_, row) => if row == 0 { accent } else if calc.odd(row) { row-alt } else { white },
  // ... záhlaví s bílým textem, řádky se střídajícím pozadím ...
  ..data.slice(1).map(row => (
    [*#row.at(0)*],
    link("mailto:" + row.at(1))[#row.at(1)],
    badge(row.at(2)),
  )).flatten(),
)

#v(2em)

= Generovaný seznam

#for row in users.slice(1) [
  #box(width: 100%, fill: row-alt, radius: 4pt, inset: (x: 10pt, y: 6pt))[
    #grid(columns: (1fr, auto), [*#row.at(0)* — ...], [#badge(row.at(2))])
  ]
  #v(0.4em)
]
```

Spuštění z adresáře `demo/`:
```bash
just data
```

---

## Užitečné příkazy

```bash
# Kompilace do PDF
typst compile dokument.typ

# Živý náhled (překompiluje při každé změně)
typst watch dokument.typ

# Živý náhled s výstupem do jiného souboru
typst watch vstup.typ vystup.pdf

# Kontrola verze
typst --version

# Nápověda
typst help
typst help compile
```

---

## Balíčky — instalace

Balíčky se načítají přímo v dokumentu pomocí `#import`. Při první kompilaci se automaticky stáhnou do lokální cache (`~/.cache/typst/packages/`).

```typst
// Načtení balíčku ze vzdáleného repozitáře
#import "@preview/typslides:1.3.2": *
#import "@preview/cetz:0.3.4": canvas, draw

// Načtení lokálního souboru
#import "muj-styl.typ": *
```

Přehled dostupných balíčků: https://typst.app/universe/
