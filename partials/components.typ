#import "helpers.typ": *

#let company-position-first(position, company, language) = {
  block(breakable: false)[
    #grid(
      columns: (1fr, auto),
      gutter: 0pt,
      inset: (y: 3pt),
      [#text(weight: "bold")[
        #if company.at("website", default: none) != none [
          #link(company.website)[#company.company]
        ] else [
          #company.company
        ]
      ]], [#align(right)[#text(weight: "bold")[#company.location]]],
      [#translate(position.position, language)],
      [#align(right)[#date-range(position.start_date, position.end_date, language)]],
    )
    #v(-0.6em)
    #render-bullets(translate(position.description, language), language)
    #v(0.5em)
  ]
}

#let company-position-rest(position, language) = {
  block(breakable: false)[
    #grid(
      columns: (1fr, auto),
      gutter: 0pt,
      inset: (top: 0pt, bottom: 3pt),
      [#translate(position.position, language)],
      [#align(right)[#date-range(position.start_date, position.end_date, language)]],
    )
    #v(-0.6em)
    #render-bullets(translate(position.description, language), language)
    #v(0.5em)
  ]
}

#let education-item(education, language) = {
  block(breakable: false)[
    #grid(
      columns: (1fr, auto),
      gutter: 0pt,
      inset: (y: 3pt),
      [#text(weight: "bold")[
        #if education.at("website", default: none) != none [
          #link(education.website)[#education.institution]
        ] else [
          #education.institution
        ]
      ]], [#align(right)[#text(weight: "bold")[#education.location]]],
      [#translate(education.degree, language)],
      [#align(right)[#date-range(education.start_date, education.end_date, language)]],
    )
    #v(-0.8em)
    #let grade = education.at("grade", default: none)
    #if grade != none [
      #if education.end_date != none [
        #text[#label("final_grade", language): #education.grade]
      ] else [
        #text[#label("current_grade", language): #education.grade]
      ]
    ]

    #let details = education.at("details", default: none)
    #if details != none [
      #render-bullets(translate(details, language), language)
    ]

    #v(0.5em)
  ]
}

#let volunteering-item(item, language) = {
  block(breakable: false)[
    #grid(
      columns: (1fr, auto),
      gutter: 0pt,
      inset: (y: 3pt),
      [#text(weight: "bold")[
        #if item.at("website", default: none) != none [
          #link(item.website)[#item.organization]
        ] else [
          #item.organization
        ]
      ]],
      [#align(right)[#text(weight: "bold")[#item.location]]],

      [#translate(item.role, language)], [#align(right)[#date-range(item.start_date, item.end_date, language)]],
    )
    #v(-0.8em)
    #let description = item.at("description", default: none)
    #if description != none [
      #render-bullets(translate(description, language), language)
    ]
    #v(0.5em)
  ]
}
