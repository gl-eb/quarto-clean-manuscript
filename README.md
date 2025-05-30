# Clean Manuscript

This template was designed for long-form text documents.
The three formats (html, typst, docx) were not designed to be as close to each other visually as possible.
Their design was informed by practical decisions and according to the capabilities of the respective file types.
The Typst template is based on my own [minimal doc template](https://github.com/gl-eb/minimal-doc) and uses code written by Christopher T. Kenny for his own [ctk-article template](https://github.com/christopherkenny/ctk-article/).
While I use it in an academic context, it should be versatile enough for anyone to use.
I tried to follow established typographic principles (e.g. in terms of line length and height) to enhance readability.
Nevertheless, it is fairly opinionated and does not provide easy customization through YAML options.
Feel free to fork this repository and tweak the template (while complying with the [MIT license](LICENSE)).

## Installation

The following command will install the extension and create an example qmd file that you can use as a starting place for your document.

```bash
quarto use template gl-eb/quarto-clean-manuscript
```

Should you want to install the extension in an already existing Quarto project, use the following command:

```bash
quarto add gl-eb/quarto-clean-manuscript
```

## Usage

```yaml
---
title: Your Document Title
author: Name
date: last-modified
format:
  clean-html: default
  clean-typst: default
  clean-docx: default
---
```

None of the formats were designed to be easily customizable.
Should you want to do so anyways, refer to the following files:

- The style of the `clean-html` format is determined by custom stylesheets and fonts
- The `clean-docx` format is contained within a reference document [reference.docx](_extensions/clean/resources/reference.docx)
- The `clean-typst` format is controlled from the [typst-show.typ](_extensions/clean/resources/typst-show.typ), [typst-template.typ](_extensions/clean/resources/typst-template.typ), and [biblio.typ](_extensions/clean/resources/biblio.typ) files

You can also try using Quarto's YAML options, but your mileage may vary since some design choices are hard coded.
Refer to the [HTML](https://quarto.org/docs/output-formats/html-basics.html), [Typst](https://quarto.org/docs/output-formats/typst.html), and [MS Word / docx](https://quarto.org/docs/output-formats/ms-word.html) guides.

## Resources

The HTML format uses Adobe's Source family of fonts, which are bundled with the extension.
They are licensed under the [SIL Open Font License](https://openfontlicense.org/open-font-license-official-text/).

- [Source Serif](https://adobe-fonts.github.io/source-serif/) for body text
- [Source Sans](https://adobe-fonts.github.io/source-sans/) for tables
- [Source Code Pro](https://adobe-fonts.github.io/source-code-pro/) for source code

The docx format uses the Charter font, which comes preinstalled with macOS.
You can download it from Matthew Butterick's excellent [Practical Typography website](https://practicaltypography.com/charter.html)

The eLife and Science [citation style language](https://citationstyles.org/.) styles also come bundled with this extension.
Their are licenses under the [Creative Commons Attribution-ShareAlike 3.0 Unported license](https://creativecommons.org/licenses/by-sa/3.0/).
These two styles are author-date and numeric styles respectively.

## Example

Here is the source code for a minimal sample document: [template.qmd](template.qmd).
A rendered html of the example can be found [here](http://www.gl-eb.me/quarto-clean-manuscript/), where you can also download the same document as Typst-rendered PDF and docx.
