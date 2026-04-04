#import "../partials/helpers.typ": *
#import "../partials/components.typ": *
#import "../partials/layout.typ": *
#import "../lib.typ": *

#let render(data, lang) = {
  setup-page([
    #set page(
      background: place(
        top + left,
        grid(
          columns: (1fr, 2fr),
          rows: (1fr,),
          rect(width: 100%, height: 100%, fill: rgb("#239dad50"), stroke: none),
          rect(width: 100%, height: 100%, fill: rgb("#FF0000"), stroke: none),
        )
      )
    )
  #let sidebar = [
    #block(width: 100%)[
      #align(left)[
        #image("../data/octo.png", width: 90%)
      ]
    ]

    #sidebar-block(label("contact", lang), [
      #grid(columns: (1fr, 8fr), inset: (y: 2pt), align: (left + horizon, left + horizon),
      [#email-icon], [#link("mailto:" + data.contact.email)],
      [#phone-icon],[#link("tel:" + data.contact.phone)],
      [#linkedin-icon], [#link(data.contact.linkedin.url)[#data.contact.linkedin.display_text]],
      [#github-icon], [#link(data.contact.github.url)[#data.contact.github.display_text]],
      [#address-icon], [#data.contact.address.street],
      [], [#data.contact.address.postal_code #data.contact.address.city],
      [], [#data.contact.address.country])
    ])

    #sidebar-block(label("skills", lang), [
      #for cat in data.skills.categories [
        #text(weight: "bold")[#t(cat.name, lang)]
        #join-list(cat.items)
        #v(0.1em)
      ]
    ])

    #sidebar-block(label("certification", lang), [
      #for certificate in data.certifications [
        #text(weight: "bold")[#t(certificate.name, lang)]\
        #text[#t(certificate.issuer, lang)]
        #text(size: 10pt)[#format-date(certificate.date, lang)]
        #v(0.1em)
      ]
    ])

    #sidebar-block(label("languages", lang), [
      #for language in data.languages [
        #text(weight: "bold")[#t(language.name, lang)]
        #text[#t(language.level, lang)]
        #v(0.1em)
      ]
    ])
  ]

  #let main = [
    #header(data.person.first_name + " " + data.person.last_name, t(data.person.title, lang))

    #main-section(label("experience", lang))
    #for job in sort-by-date(data.experience) [
      #experience-item(job, lang)
    ]

    #main-section(label("education", lang))
    #for edu in data.education [
      #education-item(edu, lang)
    ]
  ]

  #two-column(sidebar, main)
  ])
}