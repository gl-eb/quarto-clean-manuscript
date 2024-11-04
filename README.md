# Clean Manuscript

This template was designed for long-form text documents.
While I use it in an academic context, it should be versatile enough for anyone to use.
I tried to follow established typographic principles (e.g. in terms of line length and height) to enhance readability.
Personal taste also played a big role, so feel free to fork this repository and tweak the template.

## Installing

```bash
quarto use template gl-eb/quarto-clean-manuscript
```

This will install the extension and create an example qmd file that you can use as a starting place for your document.

## Using

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

You can learn more about controlling the appearance of HTML output here: <https://quarto.org/docs/output-formats/html-basics.html>

## Resources

The HTML format uses Adobe's Source family of fonts, which are bundled with the extension.
They are licensed under the [SIL Open Font License](https://openfontlicense.org/open-font-license-official-text/).

- [Source Serif](https://adobe-fonts.github.io/source-serif/) for body text
- [Source Sans](https://adobe-fonts.github.io/source-sans/) for tables
- [Source Code Pro](https://adobe-fonts.github.io/source-code-pro/) for source code

The docx format uses the Charter font, which comes preinstalled with macOS.
You can download it from Matthew Butterick's excellent [Practical Typography website](https://practicaltypography.com/charter.html)

The eLife and Science [citation style language](https://citationstyles.org/.) styles also come bundled with this extention.
Their are licenses under the [Creative Commons Attribution-ShareAlike 3.0 Unported license](https://creativecommons.org/licenses/by-sa/3.0/).
These two styles are author-date and numeric styles respectively.

## Example

Here is the source code for a minimal sample document: [template.qmd](template.qmd).
A rendered html of the example can be found [here](http://www.gl-eb.me/quarto-clean-manuscript/), where you can also download the same document as Typst-rendered PDF and docx.
