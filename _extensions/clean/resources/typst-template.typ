// All of the code in this file is MIT licensed, but some parts are by different authors.
// If the authors is not Gleb Ebert, copyright notices are included at the beginning and end of a code snippet

// MIT License

// Copyright (c) 2024 Gleb Ebert

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// start: Copyright (c) 2024 Christopher T. Kenny
#let to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(to-string).join("")
  } else if content.has("body") {
    to-string(content.body)
  } else if content == [ ] {
    " "
  }
}
// end: Copyright (c) 2024 Christopher T. Kenny

#let orcid_svg = bytes(
  "<?xml version=\"1.0\" encoding=\"utf-8\"?>
  <!-- Generator: Adobe Illustrator 19.1.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
  <svg version=\"1.1\" id=\"Layer_1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\"
    viewBox=\"0 0 256 256\" style=\"enable-background:new 0 0 256 256;\" xml:space=\"preserve\">
  <style type=\"text/css\">
    .st0{fill:#A6CE39;}
    .st1{fill:#FFFFFF;}
  </style>
  <path class=\"st0\" d=\"M256,128c0,70.7-57.3,128-128,128C57.3,256,0,198.7,0,128C0,57.3,57.3,0,128,0C198.7,0,256,57.3,256,128z\"/>
  <g>
    <path class=\"st1\" d=\"M86.3,186.2H70.9V79.1h15.4v48.4V186.2z\"/>
    <path class=\"st1\" d=\"M108.9,79.1h41.6c39.6,0,57,28.3,57,53.6c0,27.5-21.5,53.6-56.8,53.6h-41.8V79.1z M124.3,172.4h24.5
      c34.9,0,42.9-26.5,42.9-39.7c0-21.5-13.7-39.7-43.7-39.7h-23.7V172.4z\"/>
    <path class=\"st1\" d=\"M88.7,56.8c0,5.5-4.5,10.1-10.1,10.1c-5.6,0-10.1-4.6-10.1-10.1c0-5.6,4.5-10.1,10.1-10.1
      C84.2,46.7,88.7,51.3,88.7,56.8z\"/>
  </g>
  </svg>"
)

#let clean(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  date-in-header: true,
  abstract: none,
  cols: 1,
  margin: (x: 30mm, top: 25mm, bottom: 30mm),
  paper: "a4",
  lang: "en",
  region: "UK",
  font: (),
  fontsize: 11pt,
  monofont: (),
  lineheight: 1.7,
  linkcolor: rgb(31, 78, 182),
  sectionnumbering: "1.1.1",
  toc: false,
  doc,
) = {
  // set line height parameters
  // https://github.com/typst/typst/issues/106#issuecomment-2041051807
  let leading = lineheight * 1em - 1em
  let top-edge = 0.7em
  let bottom-edge = -0.3em

  // set header
  let header = none
  if date-in-header {
    header = date
  }

  set page(
    paper: paper,
    margin: margin,
    numbering: "1",
    header: align(right)[
      #set text(fontsize - 1pt)
      #header
    ]
  )
  set par(
    leading: leading,
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
  show raw.where(block: true): set par(leading: calc.max(0em, leading - 0.2em))
  show raw: set text(font: monofont)
  show figure: set block(breakable: true)

  // start: Copyright (c) 2024 Christopher T. Kenny
  // from: https://github.com/christopherkenny/ctk-article/.
  show figure.caption: it => [
    #v(-0.75em)
    #align(left)[
      #block(inset: 1em)[
        #text(
          size: fontsize - 1pt,
          // fill: rgb(65, 65, 65)
        )[
          #text(
            weight: "bold",
          )[
            #it.supplement
            #context it.counter.display(it.numbering)#it.separator
          ]
          #it.body
        ]
      ]
    ]
  ]

  let list_authors = if authors == none {
    none
  } else if authors.len() == 2 {
    authors.map(author => author.name).join(" and ")
  } else if authors.len() < 5 {
    authors.map(author => author.name).join(", ", last: ", and ")
  } else {
    authors.first().name + " et al."
  }
  // end: Copyright (c) 2024 Christopher T. Kenny

  set document(
    title: title,
    author: to-string(list_authors),
    date: auto
  )

  if title != none {
    align(center)[
      #block(inset: 1em)[
        #text(weight: "bold", size: 1.8em)[#title]
        #if subtitle != none {
          v(0em)
          text(subtitle, weight: "semibold", size: 1.25em)
        }
        #if date != none and not date-in-header {
          v(0em)
          date
        }
      ]
    ]

    if authors != none {
      for i in range(authors.len()) {
        let author = authors.at(i)
        if i == 0 [
          #text(weight: "semibold", author.name)
        ] else [
          #text(weight: "semibold", linebreak() + author.name)
        ]
        if "orcid" in author [
          #link("https://orcid.org/" + author.orcid)[
            #box(
              height: 8pt,
              baseline: 0.75pt,
              outset: (y: 1pt),
              image(orcid_svg)
            )
          ]
        ]
        if "email" in author {
          if type(author.email) == str [
            #link("mailto:" + author.email)
          ] else [
            #author.email
          ]
        }
        let author_affiliation = ()
        if "department" in author and author.department != none [
          #author_affiliation.push(author.department)
        ]
        if "university" in author and author.university != none [
          #author_affiliation.push(author.university)
        ]
        if "location" in author and author.location != [] [
          #author_affiliation.push(author.location)
        ]
        author_affiliation.join(", ")
      }
    }

    if abstract != none {
      block(inset: 2em)[
      #text(weight: "medium")[Abstract]
      #h(0.5em)
      #text(top-edge: top-edge, bottom-edge: bottom-edge)[#abstract]
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

  set text(
    top-edge: top-edge,
    bottom-edge: bottom-edge
  )

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
