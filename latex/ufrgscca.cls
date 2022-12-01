%%%==============================================================================
%% Copyright 2022 by Alceu Frigeri
%%
%% This work may be distributed and/or modified under the conditions of
%%
%% * The [LaTeX Project Public License](http://www.latex-project.org/lppl.txt),
%%   version 1.3c (or later), and/or
%% * The [GNU Affero General Public License](https://www.gnu.org/licenses/agpl-3.0.html),
%%   version 3 (or later)
%%
%% This work has the LPPL maintenance status *maintained*.
%%
%% The Current Maintainer of this work is Alceu Frigeri
%%
%% This is version 1.0.3 (2022/12/01)
%%
%% The list of files that compose this work can be found in the README.md file at
%% https://ctan.org/pkg/ufrgscca
%%
%%%==============================================================================
%% UFRGS stands for "Federal University of Rio Grande do Sul" in south Brazil
%% EE    stands for "Engineering School"
%% CCA   stands for "Control and Automation Engineering Course" (Portuguese acronym)
%%%==============================================================================
\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\def\tc@tmp@packname{ufrgscca}
\def\tc@tmp@altpackname{ufrgscca}
\def\tc@tmp@packdesc{UFRGS/CCA  class}
\def\tc@tmp@packdate{2022/12/01}
\def\tc@tmp@packversion{1.0.3}
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

\iftcif@miktex
% \def\BabelCaseHack{}
 \ifcsdef{miktexHack}{\miktexHack}{}
\fi

\iftcif@overleaf
 \ifcsdef{overleafHack}{\overleafHack}{}
\fi

\iftcif@texlive
 \ifcsdef{texliveHack}{\texliveHack}{}
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


