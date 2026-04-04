#let theme = (
  primary: rgb("#2E86C1"),
  text: rgb("#000000"),
  muted: rgb("#555555"),
)

#let setup-page(content) = {
  set page(
    margin: 1cm,
    paper: "a4",
  )

  set text(
    font: "Helvetica Neue",
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

#let sidebar-block(title, content) = [
  #text(weight: "bold", size: 12pt)[#title]
  #v(0.1em)
  #content
  #v(1em)
]

#let main-section(title) = [
  #text(weight: "bold", size: 12pt)[#title]
  #v(0.5em)
]

#let two-column(left, right) = {
  grid(
    columns: (1fr, 2fr),
    gutter: 1cm,
    left, right,
  )
}
