#import "helpers.typ": *

#let company-position-first(position, company, location, language) = [
  #grid(
    columns: (1fr, auto),
    gutter: 0pt,
    inset: (y: 3pt),
    [#text(weight: "bold")[#company]], [#align(right)[#text(weight: "bold")[#location]]],
    [#translate(position.position, language)], [#align(right)[#date-range(position.start_date, position.end_date, language)]],
  )

  #render-bullets(translate(position.description, language), language)
  #v(0.5em)
]

#let company-position-rest(position, language) = [
  #grid(
    columns: (1fr, auto),
    gutter: 0pt,
    inset: (top: 0pt, bottom: 3pt),
    [#translate(position.position, language)], [#align(right)[#date-range(position.start_date, position.end_date, language)]],
  )

  #render-bullets(translate(position.description, language), language)
  #v(0.5em)
]

#let education-item(education, language) = [
  #grid(
    columns: (1fr, auto),
    gutter: 0pt,
    inset: (y: 3pt),
    [#text(weight: "bold")[#education.institution]], [#align(right)[#text(weight: "bold")[#education.location]]],
    [#translate(education.degree, language)], [#align(right)[#date-range(education.start_date, education.end_date, language)]],
  )

  #let details = education.at("details", default: none)
  #if details != none [
    #render-bullets(translate(details, language), language)
  ]

  #v(0.5em)
]
