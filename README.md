# PhD Thesis
[![Build](https://github.com/Virtlink/phd-thesis-template/actions/workflows/paper.yml/badge.svg)](https://github.com/Virtlink/phd-thesis-template/actions)
[![License](https://img.shields.io/github/license/Virtlink/phd-thesis-template)](https://github.com/Virtlink/phd-thesis-template/blob/main/LICENSE)
[![Artifact](https://img.shields.io/badge/artifact-latest-brightgreen)](https://nightly.link/Virtlink/phd-thesis-template/workflows/build/main/paper.zip)

This is my PhD Thesis Template for LaTeX.  It is designed to work with XeLaTeX.



## Getting Started
How to get started using this template.

### GitHub
In GitHub, click the _Use this template_ button to clone this repository and get started.

### Git
Otherwise, use Git to create a repository locally, based on this template:

```shell
mkdir my-latex-paper/
cd my-latex-paper/
git init
git remote add upstream https://github.com/Virtlink/phd-thesis-template.git
git fetch upstream
git merge upstream/main
```


## Usage
To use LaTeX on your system, you need an installation of [MikTeX](https://miktex.org/) on Windows, [TexLive](https://www.tug.org/texlive/) on Linux, or [MacTex](https://www.tug.org/mactex/) on MacOS.


### VS Code/VSCodium
When working in [VSCodium](https://vscodium.com/) or VS Code, install the [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop/) extension. When saving a LaTeX file, the project will rebuild automatically. Refer to the extension's documentation for more information on its usage and configuration.

### Overleaf
Just import the Git repository into Overleaf and change the compiler to `XeLaTeX`.

### Command-Line
From a terminal, invoke the Makefile's default target to build the project:

```shell
make
```

To watch the directory for changes and rebuild the paper automatically, invoke:

```shell
make watch
```



## Bibliography
There are various tools to manage the bibliography in your paper.

### Researchr
If you have a bibliography at [Researchr](https://researchr.org/), adjust the `RESEARCHR` variable in the `Makefile` to have the name of the bibliography. To update the Bibtex file from Researchr, invoke:

```shell
make bib
```

The bibliography file is named `researchr.bib`. Include it in the paper using:

```latex
\bibliography{researchr}
```

### Zotero
In Zotero, install the [Better BibTeX](https://retorque.re/zotero-better-bibtex/) extension, see their website for instructions. Then, from Zotero's _File_ menu, choose _Export Library_ or right-click and collection and choose _Export Collection_. Set the following:

- Format: `Better BibLaTeX`
- Keep updated: `yes`

Specify where the resulting `.bib` file should be stored in this project. We recommend using the `zotero.bib` filename. Include it in the paper using:

```latex
\bibliography{zotero}
```


### Mendeley
You can export references from Mendeley using [this guide](https://www.mendeley.com/guides/mendeley-reference-manager/08.-exporting-references).



## Style
The style is inspired by:

- [Daniel A. A. Pelsmaeker - LaTeX Paper Template](https://github.com/Virtlink/latex-paper-template/)
- [Gabriel Konat - PhD Thesis](https://github.com/Gohla/dissertation)
- [Moritz Beller - PhD Thesis Template](https://github.com/Inventitech/phd-thesis-template)
- [K.P. Hart - PhD Thesis Template](https://www.overleaf.com/latex/templates/tud-dissertation/tcddkjggskqx)
- [TU Delft - PhD Thesis Template](https://web.archive.org/web/20211206142058/https://www.tudelft.nl/en/tu-delft-corporate-design/downloads/)


## Fonts
The style uses the following fonts:

- Libertinus Serif
- Libertinus Math
- JetBrains Mono

To list the fonts in your generated PDF, invoke `pdffonts` (e.g., from the [Poppler brew formula](https://formulae.brew.sh/formula/poppler)):

```shell
pdffonts dissertation.pdf
```


## License
[![License: CC0-1.0](https://licensebuttons.net/p/zero/1.0/88x31.png)](http://creativecommons.org/publicdomain/zero/1.0/)
To the extent possible under law, Daniel A. A. Pelsmaeker has waived all copyright and related or neighboring rights to the LaTeX PhD Thesis Template repository. Feel free to use this as you see fit, no attribution required.
