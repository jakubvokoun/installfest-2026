#import "@preview/typslides:1.3.2": *

#show: typslides.with(
  ratio: "16-9",
  theme: "dusky",
  font-size: 20pt,
  link-style: "color",
  show-progress: true,
)

#front-slide(
  title: "O testování nejen serverů",
  subtitle: [aneb _„A opravdu to tam běží?“_],
  authors: "Jakub Vokoun",
  info: [InstallFest 2026],
)

#title-slide[
  `whoami`
]

#slide(title: "whoami")[
  - DevOps / infrastruktura
  - CI/CD pipelines, Ansible, Kubernetes
  - Liný DevOpsák, který automatizuje vše, co potká
]

#title-slide[
  Motivace
]

#slide(title: "Co chceme testovat?")[
  - #stress[Balíčky] - je balíček nainstalovaný, je správná verze nainstalovaná?
  - #stress[Služby] - běží, je povolená?
  - #stress[Soubory a konfigurace] - existuje soubor, má správná oprávnění/vlastníka?
  - #stress[Porty] - poslouchá _něco_ na portu?
  - #stress[Kontejnery] - běží _správná_ image?
]

#slide(title: "Kdy se to hodí?")[
  - #stress[Smoke testy] po provisioningu \
    #text(size: 15pt)[rychlá základní kontrola, že systém funguje po nasazení]
  - #stress[Regresní testy] _nejen_ při změně rolí \
    #text(size: 15pt)[ověření, že změna nezničila existující funkcionalitu]
  - #stress[Audit] stavu existujících serverů \
    #text(size: 15pt)[jednorázová kontrola skutečného stavu prostředí]
]

#title-slide[
  Přehled nástrojů
]

#slide(title: "Serverspec")[
  - Ruby, RSpec syntaxe
  - Nejstarší z trojice, velká komunita
  - Nutná instalace Ruby + gems
  - #link("https://serverspec.org")[serverspec.org]

  #grayed(text-size: 18pt)[
    ```ruby
    describe package('nginx') do
      it { should be_installed }
    end
    ```
  ]
]

#slide(title: "Goss")[
  - Go → #stress[single binary], snadné nasazení
  - YAML-based (+ `dgoss` pro kontejnery)
  - Rychlý, ideální pro smoke testy
  - Může běžet jako HTTP server s nativním healthcheck endpointem
  - Poslední vydání je z roku 2024
  - #link("https://github.com/goss-org/goss")[github.com/goss-org/goss]

  #grayed(text-size: 18pt)[
    ```yaml
    package:
      nginx:
        installed: true
    ```
  ]
]

#slide(title: "Testinfra")[
  - Python + pytest
  - Přirozené pro Ansible uživatele
  - Připojení přes SSH, Docker, Ansible, Paramiko…
  - Snadná integrace s pytest ekosystémem
  - #link("https://testinfra.readthedocs.io")[testinfra.readthedocs.io]

  #grayed(text-size: 18pt)[
    ```python
    def test_nginx(host):
        assert host.package("nginx").is_installed
    ```
  ]
]

#slide(title: "Srovnání")[
  #table(
    columns: (auto, 1fr, 1fr, 1fr),
    inset: 8pt,
    align: horizon,
    table.header([], [*Serverspec*], [*Goss*], [*Testinfra*]),
    [Jazyk], [Ruby], [YAML/Go], [Python],
    [Instalace], [gems], [single binary], [pip],
    [CI výstup],
    [JUnit],
    [JUnit/TAP#footnote[Test Anything Protocol: #link("https://en.wikipedia.org/wiki/Test_Anything_Protocol")]],
    [JUnit],

    [Kontejnery], [✓], [dgoss], [✓],
  )
]

#title-slide[
  Integrace s CI/CD
]

#slide(title: "Integrace s CI systémy")[
  - Všechny tři nástroje umí JUnit XML výstup
  - GitLab CI: `artifacts: reports: junit:`
  - Výsledky testů přímo v Merge Requestu
  #grayed(text-size: 18pt)[
    ```yaml
    test:
      script:
        - goss validate --format junit > results.xml
      artifacts:
        reports:
          junit: results.xml
    ```
  ]
]

#title-slide[
  Demo
]

#title-slide[
  Závěr
]

#slide(title: "Klíčové myšlenky")[
  - Testování infrastruktury není jen pro „velké firmy"
  - Stačí malý krok: jeden `goss.yaml`, jeden `pytest`

]

#focus-slide[
  Díky za pozornost! \
  \
  _Otázky?_
]
