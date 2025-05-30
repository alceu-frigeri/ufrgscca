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
* a fairly recent LaTeX distribution as recent as 2023/11/01
(with the new in kernel *\ProcessKeyOptions* and *\NewDocumentCommand* and *\prop_new_linked:*)

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
Copyright 2022-present by Alceu Frigeri

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
* ufrgscca-forms.sty
    - forms creation macros (course specific)
* ufrgscca-coord.sty
    - student work coordenation related macros (course specific)
* ufrgscca-ppc.sty
    - ppc specific macros (ppc stands for Course Pedagogic Project)
* ufrgscca-curr.sty
    - curricula specific macros (as a set of semesters and class dependency lists)

* ufrgscca-base-en.def
    - locale, English, base def's (for babel)
* ufrgscca-base-ptBR.def
    - locale, Portuguese, base def's (for babel)
* ufrgscca-terms-ptBR.tex
    - locale, many defaults
* ufrgscca-terms-en.tex
    - locale, many defaults
* ufrgscca-cover-ptBR.tex
    - locale, defaults, for -cover.sty
* ufrgscca-forms.tex
    - locale, defaults, for -forms.sty

* README.md  (this file)
    - quick introduction

* ufrgscca.tex 
    - pakcage/bundle documentation
* ufrgscca.pdf
    - documentation in PDF format

-------------


## Changelog
* Version 2.11 (this) 
    - some minor forms' text adjustments (ufrgscca-forms).

* Version 2.10
    - added a package option, noxtrbookmarks, to package ufrgscca-forms (see manual).

* Version 2.9
    - fixing the use of \pdfbookmark after the last hyperref/kernel update (which broke the \MakeForms command).

* Version 2.8
    - code speedup thanks to 'linked' property lists. Code now relies on a more recent l3kernel.

* Version 2.7
    - fixing issue https://github.com/alceu-frigeri/ufrgscca/issues/1
    - removing all V-expansion of property/sequence lists to avoid further issues with l3kernel 
      issues: https://github.com/alceu-frigeri/starray/issues/6, https://github.com/latex3/latex3/issues/1460 and https://github.com/latex3/latex3/issues/1466
    - Remarks: code is operational but needs further cleanup!

* Version 2.6
    - Added other's case (student fate) for record keeping.
    - Report adjustments (other's case).

* Version 2.5
    - Added PDF bookmarks to each and every Form/Report page.
    - Added \studentReviewerSetCase (see manual)
    - Some reports fine tuning.

* Version 2.4/2.4a
    - a few typos (including [l3kernel prop check](https://github.com/latex3/latex3/issues/1460))
    - extended \studentfate possible values (see documentation).
    - \makeforms code cleanup. switching to \prop_get:NnNTF instead of \prop_item:Nn
    - reports: some info adjustment

* Version 2.3
    - adjustments to report's cover
    - added two student's list related commands \studentaddtolist and \sortstudentlist (-coord)
    - some code clean up

* Version 2.2
    - fixed the reports table broken by last update :/
    - added an option to sort student's list (-coord) by presentation's date
    - further code clean up

* Version 2.1
    - A few typos corrected
    - better error handling
    - a bit of code clean up (private macro/functions only)
    - added a few \...prof commands (-coord auxiliary ones)

* Version 2.0 
    - fully rewritten as Expl3 class/packages
    - documentation
    - (a few) commands changed (mostly auxiliary/background ones)
    - some class options added and removed (see documentation)

* Version 1.12
    - forms adjustments
    - documentation typo
    - expl3 initial preparation

* Version 1.11
    - added many forms (TCC-I/II related, see documentation)
    - documentation describing the new options.

* Version 1.10
    - documentation review: typos and formating
	- added options 'article' and 'nogeometry' (see documentation)

* Version 1.9 
    - changing the version system to a more reasonable x.y 
    - fine tuning the List of Figures/Tables spacing (in case of relnum==false) 

* Version 1.0.8
    - fixed another counter bug (related to relnum option)

* Version 1.0.7
    - fixed a counter bug when mixing annex with appendix environments

* Version 1.0.6
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

