#let minimal(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  cols: 1,
  margin: (x: 30mm, top: 25mm, bottom: 30mm),
  paper: "a4",
  lang: "en",
  region: "UK",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  toc: false,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: "1",
  )
  set par(
    justify: true
  )
  set text(
    lang: lang,
    region: region,
    font: font,
    size: fontsize,
    hyphenate: true
  )
  set heading(numbering: sectionnumbering)
  set table(
    inset: 6pt,
    stroke: none
  )
  show link: set text(fill: rgb(31, 78, 182))
  show figure: set block(breakable: true)

  if title != none {
    align(center)[
      #text(weight: "bold", size: 1.5em)[#title]
    ]

    if subtitle != none {
      align(center)[
        #text(weight: "bold", size: 1.25em)[#subtitle]
      ]
    }

    if authors != none {
      let list_authors = ()
      for author in authors {
        list_authors.push(author.name)
      }
      list_authors = list_authors.join(", ", last: " and ")
      align(center)[#list_authors]
    }

    if date != none {
      align(center)[#date]
    }

    if abstract != none {
      block(inset: 2em)[
      #text(weight: "semibold")[Abstract] #h(1em) #abstract
      ]
    }

    if toc {
      block(above: 0em, below: 2em)[
      #outline(
        title: auto,
        depth: none
      );
      ]
    }

    v(0.25em)
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
