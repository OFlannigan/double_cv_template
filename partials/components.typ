#import "helpers.typ": *

#let section(title, language) = [
  #v(1em)
  #text(weight: "bold", size: 12pt)[#label(title, language)]
  #line(length: 100%)
]

#let experience-item(job, language) = [
  #text(weight: "bold")[#translate(job.position, language), #job.company]
  #text(size: 10pt)[#date-range(job.start_date, job.end_date, language)]

  #render-bullets(translate(job.description, language), language)
  #v(0.5em)
]

#let education-item(education, language) = [
  #text(weight: "bold")[#translate(education.degree, language), #education.institution]
  #text(size: 10pt)[#date-range(education.start_date, education.end_date, language)]
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
