#let theme = (
  primary: rgb("#2E86C1"),
  text: rgb("#000000"),
  muted: rgb("#555555"),
)

#let setup-page(content, font: "Libertinus Serif") = {
  set page(
    margin: 1cm,
    paper: "a4",
  )

  set text(
    font: font,
    size: 10pt,
    fill: theme.text,
  )

  content
}

#let header(name, title) = [
  #text(size: 18pt, weight: "bold")[#name] \
  #text(size: 11pt, fill: theme.muted)[#title]
  #v(1em)
]

#let main-section(title) = [
  #text(weight: "bold", size: 12pt)[#title]
  #line(length: 100%)
  #v(0.5em)
]
