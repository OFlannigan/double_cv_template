#import "../partials/helpers.typ": *
#import "../partials/components.typ": *
#import "../partials/layout-ats.typ": *

#let render(data, language) = {
  setup-page([
    #align(center)[
      #header(data.person.first_name + " " + data.person.last_name, translate(data.person.title, language))

      #block(breakable: false)[
        #data.contact.address.street,
        #data.contact.address.postal_code #data.contact.address.city,
        #data.contact.address.country
      ]

      #block(breakable: false)[
        #build-contact-links(data.contact)
      ]
    ]

    #if data.keys().contains("experience") [
      #main-section(label("experience", language))
      #for company in data.experience [
        #let sorted_positions = company.positions.sorted(key: p => p.start_date).rev()
        #for (index, position) in sorted_positions.enumerate() [
          #if index == 0 [
            #company-position-first(position, company, language)
          ] else [
            #company-position-rest(position, language)
          ]
        ]
      ]
    ]

    #if data.keys().contains("education") [
      #main-section(label("education", language))
      #for education in sort-by-date(data.education) [
        #education-item(education, language)
      ]
    ]

    #if data.keys().contains("volunteering") [
      #main-section(label("volunteering", language))
      #for item in sort-by-date(data.volunteering) [
        #volunteering-item(item, language)
      ]
    ]

    #if data.keys().contains("skills") [
      #main-section(label("skills", language))
      #for category in data.skills.categories [
        #block(breakable: false)[
          #text(weight: "bold")[#translate(category.name, language)]
          #join-list(category.items)
          #v(0.1em)
        ]
      ]
      #v(0.5em)
    ]

    #if data.keys().contains("certifications") [
      #main-section(label("certification", language))
      #for certificate in data.certifications [
        #block(breakable: false)[
          #text(weight: "bold")[#translate(certificate.name, language)]\
          #text[#translate(certificate.issuer, language) - #format-date(certificate.date, language)]
          #v(0.1em)
        ]
      ]
      #v(0.5em)
    ]

    #if data.keys().contains("languages") [
      #main-section(label("languages", language))
      #for lang in data.languages [
        #block(breakable: false)[
          #text(weight: "bold")[#translate(lang.name, language)]
          #text[#translate(lang.level, language)]
          #v(0.1em)
        ]
      ]
      #v(0.5em)
    ]

    #if data.keys().contains("interests") [
      #main-section(label("interests", language))
      #block(breakable: false)[
        #join-list(data.interests.map(i => translate(i, language)))
      ]
      #v(0.5em)
    ]
  ])
}
