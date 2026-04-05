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
  ),
  en: (
    experience: "Work Experience",
    education: "Education",
    skills: "Skills",
    languages: "Languages",
    contact: "Contact",
    present: "Present",
    certification: "Certifications",
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

#let join-list(list, separator: ", ") = (
  list.map(x => if type(x) == dictionary { x.at("name", default: x) } else { x }).join(separator)
)

#let render-bullets(items, language) = {
  for item in items {
    [- #translate(item, language)]
  }
}

#let sort-by-date(list) = list.sorted(key: x => x.start_date).rev()
