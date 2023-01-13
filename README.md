ufrgscca
==========
This bundled is aimed at undergraduate students'
final work/report (tcc) at UFRGS/EE closely following ABNT rules

ABNT stands for Brazilian Association for Technical Norms, </br>
UFRGS for Federal University of Rio Grande do Sul, </br>
EE for Engineering School.

For more details, see the documentation,
[ufrgscca.pdf](http://mirrors.ctan.org/macros/latex/contrib/ufrgscca/doc/ufrgscca.pdf)

--------------

## Requirements
* a fairly recent LaTeX distribution as recent as 2022/06/01
(with the new in kernel *\ProcessKeyOptions* and *\NewDocumentCommand*)

## Installation
The stable version is available at [CTAN](https://ctan.org/pkg/ufrgscca).

## Usage
### Stable version
Just place, for example
```latex
  \usepackage[xlists,xpacks]{ufrgscca}
```

in the preamble and compile away.

Be aware that options might change between versions,
so you have to check them manually.

## More Information and documentation
More Information can be found in the documentation; you can find a  "bleeding edge" version
at [the github page](http://github.com/alceu-frigeri/ufrgscca)

## Contacting Author

For bug reports and enhacement suggestions, the preferred way is to use
[the project's issue page](https://github.com/alceu-frigeri/ufrgscca/issues).
Please be ready to provide an example code showing the bug, if any.

Please do not use the issue page for generic help on how to use the package.

* git: https://github.com/alceu-frigeri/ufrgscca

-------------
Copyright 2022 by Alceu Frigeri

 This work may be distributed and/or modified under the
 conditions of

 * The [LaTeX Project Public License](http://www.latex-project.org/lppl.txt), version 1.3c (or later), and/or
 * The [GNU Affero General Public License](https://www.gnu.org/licenses/agpl-3.0.html), version 3 (or later)

This work has the LPPL maintenance status *maintained*.

The Current Maintainer of this work is Alceu Frigeri

-------------
## This work consist of the files


* ufrgscca.cls
    - main class (bundle)

* ufrgscca-abnt.sty
    - abnt page geometry, and chapter/sectioning/etc. settings
* ufrgscca-core.sty
    - core macros (students related data, advisor, work title, etc.)
* ufrgscca-cover.sty
    - cover pages macros
* ufrgscca-lists.sty
    - New float environments (for code listing, for instance)
* ufrgscca-gen.sty
    - a switch/case macro construct and
      'macro factory', for instance to create commands used in the .def files.
* ufrgscca-forms.sty
    - forms creation macros (course specific)
* ufrgscca-coord.sty
    - student work coordenation related macros (course specific)
* ufrgscca-ppc.sty
    - ppc specific macros (ppc stands for Course Pedagogic Project)
* ufrgscca-curr.sty
    - curricula specific macros (as a set of semesters and class dependency lists)
* ufrgscca-curr-tab.sty
    - curricula tabular macros (to display the curricula as tables)
* ufrgscca-curr-graph.sty
    - curricula graph macros (to display the curricula as a dependency graph)

* ufrgscca-en-base.def
    - locale, English, base def's (for babel)
* ufrgscca-en-core.def
    - locale, English, for -core.sty
* ufrgscca-en-forms.def
    - locale, English, for -forms.sty
* ufrgscca-en-coord.def
    - locale, English, for -coord.sty

* ufrgscca-ptBR-base.def
    - locale, Portuguese, base def's (for babel)
* ufrgscca-ptBR-core.def
    - locale, Portuguese, for -core.sty
* ufrgscca-ptBR-forms.def
    - locale, Portuguese, for -forms.sty
* ufrgscca-ptBR-coord.def
    - locale, Portuguese, for -coord.sty

* README.md  (this file)
    - quick introduction

* ufrgscca.tex
    - pakcage/bundle documentation
* ufrgscca.pdf
    - documentation in PDF format

-------------

## Changelog
* Version 1.0.6 (this)
    - added a package option: nonrequired (ref. internship, see documentation)
    - documentation update

* Version 1.0.5
    - added a package option: yearsonly
    - added some forms (internship related, see documentation)
    - added some coord related reports (see documentation)
    - documentation update

* Version 1.0.4
    - added some package options: pretextontoc and timesroman
    - changed default included elements in the Table of Contents (related to the new options, see documentation)

* Version 1.0.3
    - ufrgscca-cover typo correction

* Version 1.0.2
    - ufrgscca-coord code cleanup
    - documentation cleanup (typos)
    - adding class hooks (in case an emergency workaround is needed)

* Version 1.0.1
    - readme file cleanup (switch to markdown)
    - text files CRLF / LF 'corrected' (hopefully)
	- copyright cleanup

* Version 1.0
    - Initial release  by CTAN.

