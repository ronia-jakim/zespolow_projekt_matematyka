#set par(
  justify: true,
  leading: 3mm,
)

#set page(
  paper: "a4",
  margin: (x: 2cm, y: 3cm),
)

#let title = [
  Modelowanie horyzontów zdarzeń czarnych dziur przy użyciu metryki Schwarzschilda: Rozwiązania analityczne i numeryczne
  ]

#set document(
  title: "#title",
  author: ("Aleksandra Niedziela", "Weronika Jakimowicz"),
  //date: datetime(year: 2023, month: )
)

#set heading(
  numbering: "1.1.1."
)
 
#show heading: it => {
  it.body
  v(1em)
}

#import "@preview/cetz:0.1.2"

#import "@preview/ctheorems:1.1.0": *
#show: thmrules

#let definition = thmbox("definition", "Definicja", fill: rgb("#eeffee"))

#align(center, text(17pt)[
  *#title*
])

#grid(
  columns: (1fr, 1fr),
  align(center, text(14pt)[
    Aleksandra Niedziela 
  ]),
  align(center, text(14pt)[
    Weronika Jakimowicz 
  ])
)

#pagebreak()
 
#outline()

#pagebreak(
  weak: true
)
 
= Wstęp

#include "01_czarne_dziury.typ"

#include "02_rozmaitosci_definicja.typ"

= Szybki kurs geometrii

#include "03_zakrzywiona_przestrzen.typ"

#include"04_wyliczenie_rownan_koneksja.typ"

= Matematyczna podróż do czarnej dziury

#include "05_christoffel.typ"

= Wyniki symulacji

#include"05_jakie_algorytmy.typ"

#bibliography(
  "literatura.bib",
  title: "Bibliografia", 
  full: true
)
