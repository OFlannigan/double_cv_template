#import "../partials/helpers.typ": *
#import "../partials/components.typ": *
#import "../partials/layout.typ": *
#import "../lib.typ": *

#let render(data, language) = {
  setup-page([
    #set page(
      background: place(
        top + left,
        grid(
          columns: (1fr, 2fr),
          rows: (1fr,),
          rect(width: 100%, height: 100%, fill: rgb("#239dad50"), stroke: none),
          rect(width: 100%, height: 100%, fill: rgb("#FF0000"), stroke: none),
        ),
      ),
    )

    #let sidebar = [
      #box(clip: true, radius: 2.5cm, width: 5cm, height: 5cm, image(
        "../data/octo.png",
        height: 5cm,
      ))

      #sidebar-block(label("contact", language), [
        #grid(
          columns: (1fr, 8fr),
          inset: (y: 2pt),
          align: (left + horizon, left + horizon),
          [#email-icon], [#link("mailto:" + data.contact.email)],
          [#phone-icon], [#link("tel:" + data.contact.phone)],
          [#linkedin-icon], [#link(data.contact.linkedin.url)[#data.contact.linkedin.display_text]],
          [#github-icon], [#link(data.contact.github.url)[#data.contact.github.display_text]],
          [#address-icon], [#data.contact.address.street],
          [], [#data.contact.address.postal_code #data.contact.address.city],
          [], [#data.contact.address.country],
        )
      ])

      #sidebar-block(label("skills", language), [
        #for cat in data.skills.categories [
          #text(weight: "bold")[#translate(cat.name, language)]
          #join-list(cat.items)
          #v(0.1em)
        ]
      ])

      #sidebar-block(label("certification", language), [
        #for certificate in data.certifications [
          #text(weight: "bold")[#translate(certificate.name, language)]\
          #text[#translate(certificate.issuer, language)]
          #text(size: 10pt)[#format-date(certificate.date, language)]
          #v(0.1em)
        ]
      ])

      #sidebar-block(label("languages", language), [
        #for language in data.languages [
          #text(weight: "bold")[#translate(language.name, language)]
          #text[#translate(language.level, language)]
          #v(0.1em)
        ]
      ])
    ]

    #let main = [
      #header(data.person.first_name + " " + data.person.last_name, translate(data.person.title, language))

      #main-section(label("experience", language))
      #for job in sort-by-date(data.experience) [
        #experience-item(job, language)
      ]

      #main-section(label("education", language))
      #for education in sort-by-date(data.education) [
        #education-item(education, language)
      ]
    ]

    #two-column(sidebar, main)
  ])
}
