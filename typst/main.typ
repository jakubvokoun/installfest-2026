#import "@preview/typslides:1.3.2": *

#show: typslides.with(
  ratio: "16-9",
  theme: "dusky",
  font-size: 20pt,
  link-style: "color",
  show-progress: true,
)

#front-slide(
  title: "Rychlejší než LaTeX, hezčí než Word",
  subtitle: [aneb _„Sázení dokumentů bez bolení hlavy“_],
  authors: "Jakub Vokoun",
  info: [InstallFest 2026],
)

#title-slide[
  `whoami`
]

#slide(title: "whoami")[
  - DevOps / infrastruktura
  - CI/CD pipelines, Ansible, Kubernetes
  - Uživatel LaTeXu hledající rozumnější alternativu
]

#title-slide[
  Co je Typst?
]

#slide(title: "Co je Typst?")[
  - Moderní sázecí systém - open source, implementovaný v #stress[Rustu]
  - Síla LaTeXu + jednoduchost Markdownu
  - Dostupné varianty:
    - CLI: `typst compile`, `typst watch`
    - Webový editor: #link("https://typst.app")[typst.app]
  - #stress[Inkrementální kompilace] - výstup během milisekund#footnote[_"Typst compiles your document in milliseconds as you type."_ - #link("https://typst.app")[typst.app]]
]

#title-slide[
  Typst vs LaTeX
]

#slide(title: "Přednosti Typstu")[
  - Přehledná syntaxe - #stress[minimum zpětných lomítek]
  - Bez rozsáhlých distribucí typu TeX Live (v řádu gigabajtů)
  - Kompilace #stress[10–100× rychlejší] než LaTeX
  - Vestavěný skriptovací jazyk - proměnné, podmínky, cykly
  - Srozumitelné a přesné #stress[chybové hlášky]
]

#slide(title: "V čem má LaTeX (zatím) navrch")[
  - Rozsáhlý ekosystém a velké množství hotových šablon
  - Podpora vydavatelů a akademických institucí
  - Pokročilé typografické funkce (`microtype`, rozšířená práce s fonty)
  - Dlouhodobá stabilita - Typst je stále #stress[< 1.0]
]

#slide(title: "Srovnání")[
  #table(
    columns: (auto, 1fr, 1fr),
    inset: 8pt,
    align: horizon,
    table.header([], [*LaTeX*], [*Typst*]),
    [Instalace], [TeX Live (GB)], [single binary],
    [Kompilace], [sekundy], [milisekundy],
    [Syntaxe], [zpětná lomítka], [čistý kód],
    [Chyby], [kryptické], [srozumitelné],
    [Skriptování], [makra], [vestavěný jazyk],
    [Stabilita], [dekády], [< 1.0],
  )
]

#title-slide[
  Nástroje a prostředí
]

#slide(title: "Jazykový server (LSP)")[
  - #stress[`tinymist`] - implementace LSP pro Typst \
    #text(size: 15pt)[#link("https://github.com/Myriad-Dreamin/tinymist")[github.com/Myriad-Dreamin/tinymist]]
  - Automatické doplňování, nápověda, navigace na definice
  - Podpora editorů: Neovim, VS Code, Helix, Zed
]

#slide(title: "Další užitečné nástroje")[
  - #stress[`typstfmt`] - vestavěné formátování v tinymist \
    #text(size: 15pt)[#link("https://github.com/astrale-sharp/typstfmt")[github.com/astrale-sharp/typstfmt]]
  - #stress[`typst-preview`] - živý náhled dokumentu v editoru (integrováno do tinymist) \
    #text(size: 15pt)[#link("https://github.com/Enter-tainer/typst-preview")[github.com/Enter-tainer/typst-preview]]
  - #stress[`typst-test`] - testování šablon a výstupů \
    #text(size: 15pt)[#link("https://github.com/tingerrr/typst-test")[github.com/tingerrr/typst-test]]
]

#title-slide[
  Úvod do syntaxe
]

#slide(title: "Základní formátování")[
  - Nadpisy: `= Nadpis`, `== Podnadpis`
  - Tučné: `*tučné*`, kurzíva: `_kurzíva_`
  - Seznamy, číslované seznamy, odkazy, obrázky
  - Prefix `#` přepíná do #stress[kódového režimu]

  #grayed(text-size: 18pt)[
    ```typst
    = Nadpis první úrovně

    Toto je odstavec. *Tučný text* a _kurzíva_.

    - položka jedna
    - položka dvě
    ```
  ]
]

#slide(title: "Funkce a proměnné")[
  - `#let` - definice proměnné nebo funkce
  - `#set` - nastavení stylů (fonty, okraje, stránka)
  - `#show` - transformace a přizpůsobení prvků

  #grayed(text-size: 18pt)[
    ```typst
    #set page(paper: "a4", margin: 2cm)
    #set text(font: "Linux Libertine", size: 12pt)

    #let name = "Jakub"
    Zdraví Vás #name!
    ```
  ]
]

#title-slide[
  Balíčky
]

#slide(title: "Ekosystém balíčků")[
  - Centrální repozitář: `@preview/nazev:verze`
  - Instalace = jeden řádek s `#import`
  - Vybrané balíčky:
    - #stress[`typslides`] - prezentace (použito v této přednášce)
    - #stress[`polylux`] - prezentace (alternativa k Beameru)
    - #stress[`cetz`] - diagramy a grafika (obdoba TikZ)
    - #stress[`tablex`] - pokročilá práce s tabulkami
    - #stress[`charged-ieee`] - šablona pro IEEE publikace
    - #stress[`fontawesome`] - sada ikon
  - Přehled: #link("https://github.com/qjcg/awesome-typst")[github.com/qjcg/awesome-typst]
]

#title-slide[
  Demo
]

#slide(title: "Demo 1: Životopis (CV)")[
  - Tvorba CV od základu pomocí `#set page` a `#set text`
  - `#grid` a `#table` pro dvousloupcové rozložení
  - Opakující se bloky definované přes `#let`
  - Výsledek: profesionální CV na #stress[několik desítek řádků]
]

#slide(title: "Demo 2: Prezentace")[
  - Balíček #stress[`typslides`] - slidy přímo v Typstu
  - Základní struktura: `#import`, `#front-slide`, `#slide`
  - Výběr motivu, titulní snímek, postupné odkrývání
  - Živé sledování změn: `typst watch`
  - Export do PDF

  #grayed(text-size: 18pt)[
    Tato přednáška je sama o sobě ukázkou Typstu.
  ]
]

#slide(title: "Demo 3: Dynamické načítání dat")[
  - Nativní podpora: `#csv()`, `#json()`, `#yaml()`
  - Žádné externí skripty ani preprocessory

  #grayed(text-size: 18pt)[
    ```typst
    #let data = csv("uzivatele.csv")

    #table(
      columns: 3,
      [*Jméno*], [*Email*], [*Role*],
      ..data.flatten()
    )
    ```
  ]
]

#title-slide[
  Závěr
]

#slide(title: "Užitečné odkazy")[
  - Dokumentace: #link("https://typst.app/docs")[typst.app/docs]
  - Pro LaTeX uživatele: #link("https://typst.app/docs/guides/for-latex-users/")[typst.app/docs/guides/for-latex-users/]
  - Příklady: #link("https://sitandr.github.io/typst-examples-book/book/")[sitandr.github.io/typst-examples-book]
  - CeTZ: #link("https://cetz-package.github.io")[cetz-package.github.io]
]

#focus-slide[
  Díky za pozornost! \
  \
  _Otázky?_
]
