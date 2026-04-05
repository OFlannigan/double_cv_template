#let theme = (
  primary: rgb("#2E86C1"),
  text: rgb("#000000"),
)

#let setup-page(content) = {
  set page(
    margin: 1cm,
    paper: "a4",
    numbering: "1 / 1"
  )

  set text(
    font: "Libertinus Serif",
    size: 10pt,
    fill: theme.text,
  )

  content
}

#let header(name, title) = [
  #text(size: 24pt, weight: "bold")[#name] \
  #text(size: 12pt, weight: "bold")[#title]

]

#let main-section(title) = [
  #text(weight: "bold", size: 12pt)[#title]
  #line(length: 100%)
  #v(0.5em)
]
