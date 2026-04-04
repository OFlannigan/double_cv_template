#import "helpers.typ": *

#let section(title, lang) = [
  #v(1em)
  #text(weight: "bold", size: 12pt)[#label(title, lang)]
  #line(length: 100%)
]

#let experience-item(job, lang) = [
  #text(weight: "bold")[#t(job.position, lang), #job.company]
  #text(size: 10pt)[#date-range(job.start_date, job.end_date, lang)]

  #render-bullets(t(job.description, lang), lang)
  #v(0.5em)
]

#let education-item(edu, lang) = [
  #text(weight: "bold")[#t(edu.degree, lang), #edu.institution]
  #text(size: 10pt)[#date-range(edu.start_date, edu.end_date, lang)]

  #let details = edu.at("details", default: none)
  #if details != none [
    #render-bullets(t(details, lang), lang)
  ]

  #v(0.5em)
]