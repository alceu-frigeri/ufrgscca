%%%==============================================================================
%% Copyright 2022 by Alceu Frigeri
%%
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status “maintained”.
%%
%% The Current Maintainer of this work is Alceu Frigeri
%%
%% This is version 1.0 (2022/09/01)
%%
%%
%% This work consists of the files
%%
%% ufrgscca.cls            main class (bundle)
%%
%% ufrgscca-abnt.sty       abnt page geometry, and chapter/sectioning/etc. settings
%% ufrgscca-core.sty       core macros (students related data, advisor, work title, etc.)
%% ufrgscca-cover.sty      cover pages macros
%% ufrgscca-lists.sty      New float environments (for code listing, for instance)
%% ufrgscca-gen.sty        a switch/case macro construct and
%%                         'macro factory', for instance to create commands used in the .def files.
%% ufrgscca-forms.sty      forms creation macros (course specific)
%% ufrgscca-coord.sty      student work coordenation related macros (course specific)
%% ufrgscca-ppc.sty        ppc specific macros (ppc stands for Course Pedagogic Project)
%% ufrgscca-curr.sty       curricula specific macros (as a set of semesters and class dependency lists)
%% ufrgscca-curr-tab.sty   curricula tabular macros (to display the curricula as tables)
%% ufrgscca-curr-graph.sty curricula graph macros (to display the curricula as a dependency graph)
%%
%% ufrgscca-en-base.def    locale, English, base def's (for babel)
%% ufrgscca-en-core.def    locale, English, for -core.sty
%% ufrgscca-en-forms.def   locale, English, for -forms.sty
%% ufrgscca-en-coord.def   locale, English, for -coord.sty
%%
%% ufrgscca-ptBR-base.def  locale, Portuguese, base def`s (for babel)
%% ufrgscca-ptBR-core.def  locale, Portuguese, for -core.sty
%% ufrgscca-ptBR-forms.def locale, Portuguese, for -forms.sty
%% ufrgscca-ptBR-coord.def locale, Portuguese, for -coord.sty
%%
%% README.md               quick introduction
%%
%% ufrgscca.tex            LaTeX documentation
%% ufrgscca.pdf            documentation in PDF form
%%
%% UFRGS stands for "Federal University of Rio Grande do Sul" in south Brazil
%% EE    stands for "Engineering School"
%% CCA   stands for "Control and Automation Engineering Course" (Portuguese acronym)
%%
%%%==============================================================================
\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\def\tc@tmp@packname{ufrgscca}
\def\tc@tmp@altpackname{ufrgscca}
\def\tc@tmp@packdesc{UFRGS/CCA  class}
\def\tc@tmp@packdate{2022/09/01}
\def\tc@tmp@packversion{1.0}
\let\@exp\expandafter
\@exp\edef\csname\tc@tmp@altpackname version\endcsname{\tc@tmp@packversion}
\@exp\@exp\@exp\ProvidesPackage\@exp\@exp\@exp{\@exp\tc@tmp@packname\@exp}\@exp[\tc@tmp@packdate\space v\tc@tmp@packversion\space\tc@tmp@packdesc]


\RequirePackage{etex}
\RequirePackage{etoolbox}
\RequirePackage{lmodern}%

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

%==============================================================================
% Declaração de opções
%==============================================================================
\DeclareKeys[tc]{
    tocdepth.usage = load,
	tocdepth.code = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},
    secdepth.usage = load,
	secdepth.code = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},

    english.usage = load,
    english.code = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}\OptionNotUsed},
    relnum.usage = load,
    relnum.code = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}\PassOptionsToPackage{\CurrentOption}{ufrgscca-lists}\OptionNotUsed},
    oneside.usage = load,
    oneside.code = {\AtEndOfClass{\@twosidefalse}\OptionNotUsed},
    strict-abnt.usage = load,
    strict-abnt.code = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},
    repeatfields.usage = load,
    repeatfields.code = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},
	chapternopagenum.usage = load,
	chapternopagenum.code = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},

    nomicrotype.usage = load,
    nomicrotype.code = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},

    showframes.usage = load,
    showframes.code = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},
    showlabes.usage = load,
    showlabes.code = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},

	xlists.usage = load,
    xlists.if = tc@xlists,
	xpacks.usage = load,
	xpacks.if = tc@xpacks,

	nolocal.usage = load,
	nolocal.if = tcif@nolocal,

    nofontwarning.usage = load,
    nofontwarning.if = @nofontwarning,

    report.usage = load,
    report.code = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-cover}},
    internship.usage = load,
	internship.code = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-cover}},

	texlive.usage = load,
	texlive.if = tcif@texlive,
	overleaf.usage = load,
	overleaf.if = tcif@overleaf,
	miktex.usage = load,
	miktex.if = tcif@miktex,

	dctools.usage = load,
	dctools.if = tcif@dctools,
}

\DeclareUnknownKeyHandler[tc]{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessKeyOptions[tc]\relax

\iftcif@dctools
    \LoadClass[12pt]{article}
\else
    \LoadClass[12pt,twoside,openright]{report}
\fi

%%%%%%%%%%%%%%%%%%%%%
%%% Packages Loading
%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{silence}%
\if@nofontwarning%
  \WarningFilter{latexfont}{Font shape}%
  \WarningFilter{latexfont}{Size substitutions with differences}%
  \WarningFilter{latexfont}{Some font shapes were not available}%
\fi%


\RequirePackage{ufrgscca-abnt}

\iftc@xlists\RequirePackage{ufrgscca-lists}\fi

\RequirePackage{ufrgscca-gen}
\RequirePackage{ufrgscca-cover}
\RequirePackage{ufrgscca-core}


\iftc@xpacks
    \RequirePackage{relsize}
    \RequirePackage{keyval,graphicx}
    \RequirePackage{mathtools}
    \RequirePackage{empheq}
    \RequirePackage{mathrsfs, amsfonts,amssymb}%
    \RequirePackage{amsthm}%
    \RequirePackage{extarrows}%
    \RequirePackage{mathfixs}%
    \RequirePackage{bigdelim}%
	\RequirePackage[american,siunitx,cuteinductors,smartlabels,arrowmos,EFvoltages,betterproportions]{circuitikz}%
	\usetikzlibrary{fit}%
	\usetikzlibrary{math}%
	\usetikzlibrary{calc}%
	\usetikzlibrary{shapes.geometric} %needed for the triangle%
	\usetikzlibrary{shapes.misc} %needed for the triangle%
	\usetikzlibrary{shapes.multipart}
	\usetikzlibrary{graphs}%
	\usetikzlibrary{3d}%
	\usetikzlibrary{positioning}%
	\usetikzlibrary{shadows}%
	\usetikzlibrary{babel}
    \RequirePackage{steinmetz}%
\fi


\WarningFilter{hyperref}{Option `pdftex' has already}

\RequirePackage[hidelinks,hypertexnames=false]{hyperref}%
%%
%% A few (hyperref related) commands
%%
\NewDocumentCommand{\autonameref}{O{, }mO{\space}}{\autoref{#2}#1\nameref{#2}#3}
\gdef\annexref#1{\hyperref[#1]{\defannexname\   \ref*{#1}}}
\NewDocumentCommand{\autoannexref}{O{, }mO{\space}}{\annexref{#2}#1\nameref{#2}#3}


\iftcif@english%
 \input{ufrgscca-en-core.def}%
\else%
 \input{ufrgscca-ptBR-core.def}%
\fi%


\iftcif@nolocal%
\else%
    \IfFileExists{local.tex}{\input{local.tex}}{}%
    \tccore@emptyfields%
\fi


