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
    [*#role* - #company], [#text(style: "italic")[#period]],
  )
  #details
  #v(0.5em)
]

= Jan Novák

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    jan.novak\@example.com \
    +420 123 456 789
  ],
  [
    github.com/jannovak \
    linkedin.com/in/jannovak
  ],
)

#v(1em)

== Pracovní zkušenosti

#entry(
  "Senior DevOps Engineer",
  "Firma s.r.o.",
  "2021 – dosud",
)[
  - Správa Kubernetes clusterů (GKE, on-premise)
  - Budování CI/CD pipelines (GitLab CI, ArgoCD)
  - Ansible automatizace pro 200+ serverů
]

#entry(
  "Systémový administrátor",
  "Jiná Firma a.s.",
  "2018 – 2021",
)[
  - Správa linuxových serverů (Debian, RHEL)
  - Migrace on-premise infrastruktury do cloudu
]

== Vzdělání

#entry(
  "Bc. Informatika",
  "ČVUT FIT",
  "2014 – 2018",
)[]

== Dovednosti

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    *Nástroje:* Kubernetes, Ansible, Terraform \
    *Cloud:* GCP, AWS \
    *Monitoring:* Prometheus, Grafana
  ],
  [
    *Jazyky:* Python, Go, Bash \
    *CI/CD:* GitLab CI, GitHub Actions \
    *Sazba:* Typst, LaTeX
  ],
)

// ========================================
// Strana 2: Stylizovaná verze
// ========================================

#pagebreak()
#set page(paper: "a4", margin: (top: 0cm, bottom: 2cm, left: 0cm, right: 0cm))

#let accent = rgb("#2563eb")
#let subtle = rgb("#64748b")
#let bg-header = rgb("#1e3a5f")

#show heading.where(level: 2): it => [
  #v(0.6em)
  #set text(size: 11pt, weight: "bold", fill: accent)
  #upper(it.body)
  #v(0.1em)
  #line(length: 100%, stroke: 0.5pt + accent)
  #v(0.3em)
]

#let entry2(role, company, period, details) = [
  #grid(
    columns: (1fr, auto),
    [*#role* #h(0.4em) #text(fill: subtle)[#company]], [#text(style: "italic", fill: subtle)[#period]],
  )
  #details
  #v(0.4em)
]

#let tag(t) = box(
  fill: rgb("#dbeafe"),
  inset: (x: 6pt, y: 3pt),
  radius: 3pt,
  text(size: 9pt, fill: accent)[#t],
)

#block(
  width: 100%,
  fill: bg-header,
  inset: (x: 2.5cm, y: 1.5cm),
)[
  #text(size: 26pt, weight: "bold", fill: white)[Jan Novák]
  #v(0.3em)
  #text(size: 12pt, fill: rgb("#93c5fd"))[Senior DevOps Engineer]
  #v(0.8em)
  #set text(size: 10pt, fill: rgb("#cbd5e1"))
  #grid(
    columns: (auto, auto, auto, auto),
    column-gutter: 1.5em,
    [jan.novak\@example.com], [+420 123 456 789], [github.com/jannovak], [linkedin.com/in/jannovak],
  )
]

#block(
  width: 100%,
  inset: (x: 2.5cm, top: 1.5cm, bottom: 0cm),
)[

  == Pracovní zkušenosti

  #entry2(
    "Senior DevOps Engineer",
    "Firma s.r.o.",
    "2021 – dosud",
  )[
    - Správa Kubernetes clusterů (GKE, on-premise)
    - Budování CI/CD pipelines (GitLab CI, ArgoCD)
    - Ansible automatizace pro 200+ serverů
  ]

  #entry2(
    "Systémový administrátor",
    "Jiná Firma a.s.",
    "2018 – 2021",
  )[
    - Správa linuxových serverů (Debian, RHEL)
    - Migrace on-premise infrastruktury do cloudu
  ]

  == Vzdělání

  #entry2(
    "Bc. Informatika",
    "ČVUT FIT",
    "2014 – 2018",
  )[]

  == Dovednosti

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      *Nástroje* \
      #v(0.3em)
      #tag[Kubernetes] #tag[Ansible] #tag[Terraform]
      #v(0.5em)
      *Cloud & Monitoring* \
      #v(0.3em)
      #tag[GCP] #tag[AWS] #tag[Prometheus] #tag[Grafana]
    ],
    [
      *Jazyky* \
      #v(0.3em)
      #tag[Python] #tag[Go] #tag[Bash]
      #v(0.5em)
      *CI/CD & Sazba* \
      #v(0.3em)
      #tag[GitLab CI] #tag[GitHub Actions] #tag[Typst]
    ],
  )

]
