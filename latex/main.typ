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
  numbering: "1.1."
)
 
#show heading: it => {
  it.body
  v(1em)
}

#import "@preview/cetz:0.1.2"

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

#include "historia_o_czasteczce.typ"
