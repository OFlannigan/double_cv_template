#let translate(value, language) = {
  if type(value) == dictionary {
    if value.keys().contains(language) {
      value.at(language)
    } else {
      value.at(value.keys().first())
    }
  } else {
    value
  }
}

#let labels = (
  de: (
    experience: "Berufserfahrung",
    education: "Ausbildung",
    skills: "Skills",
    languages: "Sprachen",
    contact: "Kontakt",
    present: "Heute",
    certification: "Zertifizierungen",
    final_grade: "Abschlussnote",
    current_grade: "Aktuelle Note",
    volunteering: "Ehrenamtliches Engagement",
    interests: "Interessen",
  ),
  en: (
    experience: "Work Experience",
    education: "Education",
    skills: "Skills",
    languages: "Languages",
    contact: "Contact",
    present: "Present",
    certification: "Certifications",
    final_grade: "Final Grade",
    current_grade: "Current Grade",
    volunteering: "Volunteering",
    interests: "Interests",
  ),
)

#let label(key, language) = labels.at(language).at(key)

#let format-date(date, language) = {
  if date == none {
    label("present", language)
  } else {
    let parts = date.split("-")
    let year = parts.at(0)
    let month = parts.at(1, default: "")

    if language == "de" {
      if month != "" { month + "/" + year } else { year }
    } else {
      let months = (
        "01": "Jan",
        "02": "Feb",
        "03": "Mar",
        "04": "Apr",
        "05": "May",
        "06": "Jun",
        "07": "Jul",
        "08": "Aug",
        "09": "Sep",
        "10": "Oct",
        "11": "Nov",
        "12": "Dec",
      )
      if month != "" { months.at(month) + " " + year } else { year }
    }
  }
}

#let date-range(start, end, language) = format-date(start, language) + " – " + format-date(end, language)

#let remove-protocol(url) = {
  if url.starts-with("https://") {
    url.slice(8)
  } else if url.starts-with("http://") {
    url.slice(7)
  } else {
    url
  }
}

#let join-list(list, separator: ", ") = (
  list.map(x => if type(x) == dictionary { x.at("name", default: x) } else { x }).join(separator)
)

#let render-bullets(items, language) = {
  for item in items {
    [- #translate(item, language)]
  }
}

#let sort-by-date(list) = list.sorted(key: x => x.start_date).rev()

#let build-contact-items(contact, icons) = {
  let items = ()
  if contact.at("email", default: none) != none {
    items.push(icons.email)
    items.push([#link("mailto:" + contact.email)])
  }
  if contact.at("phone", default: none) != none {
    items.push(icons.phone)
    items.push([#link("tel:" + contact.phone)])
  }
  if contact.at("website", default: none) != none {
    items.push(icons.website)
    items.push([#link(contact.website)[#remove-protocol(contact.website)]])
  }
  if contact.linkedin.at("url", default: none) != none {
    items.push(icons.linkedin)
    items.push([#link(contact.linkedin.url)[#contact.linkedin.display_text]])
  }
  if contact.github.at("url", default: none) != none {
    items.push(icons.github)
    items.push([#link(contact.github.url)[#contact.github.display_text]])
  }
  if contact.address.at("street", default: none) != none {
    items.push(icons.address)
    items.push([#contact.address.street])
  }
  if contact.address.at("postal_code", default: none) != none {
    items.push([])
    items.push([#contact.address.postal_code #contact.address.city])
  }
  if contact.address.at("country", default: none) != none {
    items.push([])
    items.push([#contact.address.country])
  }
  items
}

#let build-contact-links(contact) = {
  let links = ()
  if contact.at("email", default: none) != none {
    links.push([#link("mailto:" + contact.email)])
  }
  if contact.at("phone", default: none) != none {
    links.push([#link("tel:" + contact.phone)])
  }
  if contact.at("website", default: none) != none {
    links.push([#link(contact.website)[#remove-protocol(contact.website)]])
  }
  if contact.linkedin.at("url", default: none) != none {
    links.push([#link(contact.linkedin.url)[#remove-protocol(contact.linkedin.url)]])
  }
  if contact.github.at("url", default: none) != none {
    links.push([#link(contact.github.url)[#remove-protocol(contact.github.url)]])
  }
  links.join([ | ])
}
