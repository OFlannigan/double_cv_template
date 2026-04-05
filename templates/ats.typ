#import "../partials/helpers.typ": *
#import "../partials/components.typ": *
#import "../partials/layout-ats.typ": *

#let render(data, language) = {
  setup-page([
    #align(center)[
      #header(data.person.first_name + " " + data.person.last_name, translate(data.person.title, language))

      #data.contact.address.street, #data.contact.address.postal_code #data.contact.address.city, #data.contact.address.country

      #link("mailto:" + data.contact.email) | #link("tel:" + data.contact.phone) | #link(data.contact.linkedin.url)[#remove-protocol(data.contact.linkedin.url)] | #link(data.contact.github.url)[#remove-protocol(data.contact.github.url)]
    ]
    #block(breakable: false)[
      #main-section(label("experience", language))
      #for company in data.experience [
        #let sorted_positions = company.positions.sorted(key: p => p.start_date).rev()
        #for (index, position) in sorted_positions.enumerate() [
          #if index == 0 [
            #company-position-first(position, company.company, company.location, language)
          ] else [
            #company-position-rest(position, language)
          ]
        ]
      ]
    ]

    #block(breakable: false)[
      #main-section(label("education", language))
      #for education in sort-by-date(data.education) [
        #education-item(education, language)
      ]
    ]

    #block(breakable: false)[
      #main-section(label("skills", language))
      #for category in data.skills.categories [
        #block(breakable: false)[
          #text(weight: "bold")[#translate(category.name, language)]
          #join-list(category.items)
          #v(0.1em)
        ]
      ]
    ]

    #block(breakable: false)[
      #main-section(label("certification", language))
      #for certificate in data.certifications [
        #block(breakable: false)[
          #text(weight: "bold")[#translate(certificate.name, language)]\
          #text[#translate(certificate.issuer, language) - #format-date(certificate.date, language)]
          #v(0.1em)
        ]
      ]
    ]

    #block(breakable: false)[
      #main-section(label("languages", language))
      #for lang in data.languages [
        #block(breakable: false)[
          #text(weight: "bold")[#translate(lang.name, language)]
          #text[#translate(lang.level, language)]
          #v(0.1em)
        ]
      ]
    ]
  ])
}
