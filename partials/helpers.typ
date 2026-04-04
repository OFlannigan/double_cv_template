#let t(value, lang) = {
  if type(value) == dictionary {
    if value.keys().contains(lang) {
      value.at(lang)
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

#let label(key, lang) = labels.at(lang).at(key)

#let format-date(date, lang) = {
  if date == none {
    label("present", lang)
  } else {
    let parts = date.split("-")
    let y = parts.at(0)
    let m = parts.at(1, default: "")

    if lang == "de" {
      if m != "" { m + "/" + y } else { y }
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
      if m != "" { months.at(m) + " " + y } else { y }
    }
  }
}

#let date-range(start, end, lang) = format-date(start, lang) + " – " + format-date(end, lang)

#let join-list(list, sep: ", ") = (
  list.map(x => if type(x) == dictionary { x.at("name", default: x) } else { x }).join(sep)
)

#let render-bullets(items, lang) = {
  for i in items {
    [- #t(i, lang)]
  }
}

#let sort-by-date(list) = list.sorted(key: x => x.start_date).rev()
