// Typst custom formats typically consist of a 'typst-template.typ' (which is
// the source code for a typst template) and a 'typst-show.typ' which calls the
// template's function (forwarding Pandoc metadata values as required)

#show: doc => clean(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(by-author)$
  authors: (
$for(by-author)$
$if(it.name.literal)$
(
  name: [$it.name.literal$],
  last: [$it.name.family$],
  $if(it.affiliations/first)$
    $for(it.affiliations/first)$
      department: $if(it.department)$[$it.department$]$else$none$endif$,
      university: $if(it.name)$[$it.name$]$else$none$endif$,
      location: [$if(it.city)$$it.city$$if(it.country)$, $endif$$endif$$if(it.country)$$it.country$$endif$],
    $endfor$
  $endif$
  $if(it.email)$
    email: [$it.email$],
  $endif$
  $if(it.orcid)$
    orcid: "$it.orcid$"
  $endif$
),
$endif$
$endfor$
    ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
$if(abstract)$
  abstract: [$abstract$],
$endif$
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$endif$
$if(papersize)$
  paper: "$papersize$",
$endif$
$if(mainfont)$
  font: ("$mainfont$",),
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$endif$
$if(monofont)$
  monofont: ("$monofont$",),
$endif$
$if(lineheight)$
  lineheight: $lineheight$,
$endif$
$if(linkcolor)$
  linkcolor: "$linkcolor$",
$endif$
$if(section-numbering)$
  sectionnumbering: "$section-numbering$",
$endif$
$if(toc)$
  toc: $toc$,
$endif$
  cols: $if(columns)$$columns$$else$1$endif$,
  doc,
)
