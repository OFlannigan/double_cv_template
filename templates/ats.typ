#import "../partials/helpers.typ": *
#import "../partials/components.typ": *
#import "../partials/layout.typ": *

#let render(data, language) = {
  setup-page([
    #header(data.person.first_name + " " + data.person.last_name, translate(data.person.title, language))

    #data.contact.phone | #data.contact.email

    #main-section(label("experience", language))
    #for job in sort-by-date(data.experience) [
      #experience-item(job, language)
    ]

    #main-section(label("education", language))
    #for education in sort-by-date(data.education) [
      #education-item(education, language)
    ]

    #main-section(label("skills", language))
    #for category in data.skills.categories [
      #text(weight: "bold")[#category.name:]
      #join-list(category.items)
      #v(0.5em)
    ]
  ])
}
