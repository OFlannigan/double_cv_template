#import "../partials/helpers.typ": *
#import "../partials/components.typ": *
#import "../partials/layout.typ": *

#let render(data, lang) = {
  setup-page([
  #header(data.person.first_name + " " + data.person.last_name, t(data.person.title, lang))

  #data.contact.phone | #data.contact.email

  #main-section(label("experience", lang))
  #for job in sort-by-date(data.experience) [
    #experience-item(job, lang)
  ]

  #main-section(label("education", lang))
  #for edu in data.education [
    #education-item(edu, lang)
  ]

  #main-section(label("skills", lang))
  #for cat in data.skills.categories [
    #text(weight: "bold")[#cat.name:]
    #join-list(cat.items)
    #v(0.5em)
  ]
  ])
}