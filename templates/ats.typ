#import "../partials/helpers.typ": *
#import "../partials/components-ats.typ": *
#import "../partials/layout-ats.typ": *

#let render(data, language) = {
  setup-page([
    #align(center)[
      #header(data.person.first_name + " " + data.person.last_name, translate(data.person.title, language))
      
      #data.contact.address.street, #data.contact.address.postal_code #data.contact.address.city, #data.contact.address.country

      #link("mailto:" + data.contact.email) | #link("tel:" + data.contact.phone) | #link(data.contact.linkedin.url)[#remove-protocol(data.contact.linkedin.url)] | #link(data.contact.github.url)[#remove-protocol(data.contact.github.url)]
    ]
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
      #text(weight: "bold")[#translate(category.name, language)]
      #join-list(category.items)
      #v(0.1em)
    ]
  ])
}
