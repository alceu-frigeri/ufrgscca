%%%==============================================================================
%% Copyright 2022-present by Alceu Frigeri
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
%% This is version {2.4} {2024/02/19}
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


\ProvidesExplClass
    {ufrgscca}
    {2024/02/19}
    {2.4}
    {UFRGS/CCA class}


%%%%%%%
%%%
%%% Just an attempt of having my packages info in a regular way
%%% Idea being: { <pck-name> / pkg info } for each and all.
%%%
%%%%%%%
\keys_define:nn { ufrgscca / pkg info}
  {
     name        .code:n = {ufrgscca} ,
     prefix      .code:n = {ufrgscca} ,
     date        .code:n = {2024/02/19},
     version     .code:n = {2.4} ,
     description .code:n = {UFRGS/CCA~a~report~based~class~bundle}
  }
\cs_if_exist:NF \PkgInfo 
  {
    \NewDocumentCommand \PkgInfo {mm} { \keys_set:nn {#1 / pkg info}{#2} } 
    \NewDocumentCommand \PkgDescription {m} 
      { \noindent Package~ \textbf{\PkgInfo{#1}{name}}~Version:~\PkgInfo{#1}{version}~ -~ \PkgInfo{#1}{date}\par \emph{\PkgInfo{#1}{description}}~\par } 
  }  
%%%%%%%
%%% End of cut-n-paste
%%%%%%%





\RequirePackage{etex}
\RequirePackage{etoolbox}
\RequirePackage{starray}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% TODO: to be decided, where to leave that !! 
%%%       general purpose _propeties !!
%%% 
%%%%%%%%%%%%%%%%%%%%%%

\prop_new:N \l__ufrgscca_terms_prop
  
\NewDocumentCommand{\SetHeadings}{m}
  {
    \prop_put_from_keyval:Nn \l__ufrgscca_terms_prop {#1}
  }

  %%
  %% No protection, so it can be used in a fully expandable context (like \MakeUppercase)
\cs_new:Npn \UseHeading #1 
  { \prop_item:Nn \l__ufrgscca_terms_prop {#1} }


%\prop_new:N \l__ufrgscca_terms_prop

\NewDocumentCommand{\SetTerms}{+m}
  {
    \prop_put_from_keyval:Nn \l__ufrgscca_terms_prop {#1} 
  } 
  
  %%
  %% No protection, so it can be used in a fully expandable context (like \MakeUppercase)
\cs_new:Npn \UseTerm #1 
  { \prop_item:Nn \l__ufrgscca_terms_prop {#1} }

\cs_new_protected:Npn \TermCase #1#2#3
  {
    \prop_if_in:NnTF \l__ufrgscca_terms_prop {#1} {#2} {#3}
  } 

%\prop_new:N \l__ufrgscca_labels_prop



\NewDocumentCommand{\SetLabels}{m}
  {
    \prop_put_from_keyval:Nn \l__ufrgscca_terms_prop {#1} 
  }

  %%
  %% No protection, so it can be used in a fully expandable context (like \MakeUppercase)
\cs_new:Npn \UseLabel #1 
  { \prop_item:Nn \l__ufrgscca_terms_prop {#1} }


\prop_new:N \l__ufrgscca_const_prop

\NewDocumentCommand{\SetConsts}{m}
  {
    \prop_put_from_keyval:Nn \l__ufrgscca_const_prop {#1}
  }

\cs_generate_variant:Nn \prop_put:Nnn {Nee}
\NewDocumentCommand{\eSetConst}{mm}
  {
    \prop_put:Nee \l__ufrgscca_const_prop {#1}{#2}
  }



\cs_generate_variant:Nn \prop_item:Nn {Ne}

  %%
  %% No protection, so it can be used in a fully expandable context (like \MakeUppercase)
\cs_new:Npn \UseConst #1 
  { \prop_item:Ne \l__ufrgscca_const_prop {#1} }


\bool_new:N \l__ufrgscca_repeatfields_bool
\bool_new:N \l__ufrgscca_timesroman_bool
\bool_new:N \l__ufrgscca_nolocal_bool

%==============================================================================
% Declaração de opções
%==============================================================================
\keys_define:nn { ufrgscca }
  {
    tocdepth        .usage:n    = load,
	tocdepth        .code:n     = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},
    secdepth        .usage:n    = load,
	secdepth        .code:n     = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},

%    english        .usage:n     = load,
%    english        .code:n      = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}\OptionNotUsed},

		english       .usage:n          = load ,
		english       .bool_set:N       = \l__ufrgscca_english_bool ,
    
    relnum         .usage:n     = load,
    relnum         .code:n      = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}\PassOptionsToPackage{\CurrentOption}{ufrgscca-lists}\OptionNotUsed},

    pretextontoc   .usage:n     = load,
    pretextontoc   .code:n      = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},
	timesroman     .usage:n     = load,
    timesroman     .bool_set:N  = \l__ufrgscca_timesroman_bool,
    yearsonly      .usage:n     = load,
    yearsonly      .code:n      = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},

    oneside        .usage:n     = load,
    oneside        .code:n      = {\AtEndOfClass{\@twosidefalse}\OptionNotUsed},
    strict-abnt    .usage:n     = load,
    strict-abnt    .code:n      = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},
    repeatfields   .usage:n     = load,
    repeatfields   .code:n      = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},
	chapternopagenum .usage:n   = load,
	chapternopagenum .code:n    = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},

    nomicrotype    .usage:n     = load,
    nomicrotype    .code:n      = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},

    showframes     .usage:n     = load,
    showframes     .code:n      = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},
    showlabes      .usage:n     = load,
    showlabes      .code:n      = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-abnt}},

	xlists         .usage:n     = load,
    xlists         .bool_set:N  = \l__ufrgscca_xlists_bool,
	xpacks         .usage:n     = load,
	xpacks         .bool_set:N  = \l__ufrgscca_xpacks_bool,

	nolocal        .usage:n     = load,
	nolocal        .bool_set:N  = \l__ufrgscca_nolocal_bool,

    nofontwarning  .usage:n     = load,
    nofontwarning  .bool_set:N  = \l__ufrgscca_nofontwarning_bool,

    report        .usage:n      = load,
    report        .code:n       = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-cover}},
    internship    .usage:n      = load,
	internship    .code:n       = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-cover}},
    nonrequired   .usage:n      = load,
    nonrequired   .code:n       = {\PassOptionsToPackage{\CurrentOption}{ufrgscca-cover}},

	texlive       .usage:n      = load,
	texlive       .bool_set:N   = \l__ufrgscca_texlive_bool,
	overleaf      .usage:n      = load,
	overleaf      .bool_set:N   = \l__ufrgscca_overleaf_bool,
	miktex        .usage:n      = load,
	miktex        .bool_set:N   = \l__ufrgscca_miktex_bool,

	article       .usage:n      = load,
	article       .bool_set:N   = \l__ufrgscca_article_bool,

	nogeometry    .usage:n      = load,
	nogeometry    .bool_set:N   = \l__ufrgscca_nogeometry_bool,

    oldrenews     .usage:n      = load,
	oldrenews     .bool_set:N   = \l__ufrgscca_oldrenews_bool,

    unknown       .code:n       = {\PassOptionsToClass{\CurrentOption}{report}},
  }
\ProcessKeyOptions[ufrgscca]\relax



\bool_if:NTF \l__ufrgscca_timesroman_bool
  {
    \bool_if:NTF \l__ufrgscca_english_bool
      {
        \RequirePackage[brazilian,english]{babel}% babel has to be loaded BEFORE newtx*
      }
      {
        \RequirePackage[english,brazilian]{babel}% babel has to be loaded BEFORE newtx*
      }
    \RequirePackage{mathptmx}
    \PackageWarning{ufrgscca}{(obsolete) package mathptmx loaded. It loads a free 'implementantion/interpletation' of the proprietary Times Roman (by Adobe) and Times New Roman (by Microsoft)}
    \PackageWarning{ufrgscca}{package microtype is suppressed, resulting in a subpar layout. Again, the “Roman” font used isn't a true Times Roman nor Times New Roman}
  }
  {
    \RequirePackage{lmodern}%
  }
\bool_if:NTF \l__ufrgscca_article_bool
  {
    \LoadClass[12pt]{article}
  }
  {
    \LoadClass[12pt,twoside,openright]{report}
  }

\bool_if:NT \l__ufrgscca_miktex_bool
  {
    \ifcsdef{miktexHack}{\miktexHack}{}
  }
\bool_if:NT \l__ufrgscca_overleaf_bool
  {
    \ifcsdef{overleafHack}{\overleafHack}{}
  }
\bool_if:NT \l__ufrgscca_texlive_bool
  {
    \ifcsdef{texliveHack}{\texliveHack}{}
  }


%%%%%%%%%%%%%%%%%%%%%
%%% Packages Loading
%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{silence}%

\bool_if:NT \l__ufrgscca_nofontwarning_bool
  {
  \WarningFilter{latexfont}{Font shape}%
  \WarningFilter{latexfont}{Size substitutions with differences}%
  \WarningFilter{latexfont}{Some font shapes were not available}%
  }


\RequirePackage{ufrgscca-abnt}

\bool_if:NT \l__ufrgscca_xlists_bool
  {
    \RequirePackage{ufrgscca-lists}
  }


\RequirePackage{ufrgscca-cover}
\RequirePackage{ufrgscca-core}


\bool_if:NT \l__ufrgscca_xpacks_bool
  {
  \ExplSyntaxOff
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
    \ExplSyntaxOn
  }





\WarningFilter{hyperref}{Option `pdftex' has already}

\RequirePackage[hidelinks,hypertexnames=false]{hyperref}

%%
%% A few (hyperref related) commands
%%
\NewDocumentCommand{\autonameref}{O{,\space}mO{}}{\autoref{#2}#1\nameref{#2}#3}
\gdef\annexref#1{\hyperref[#1]{\defannexname\   \ref*{#1}}}
\NewDocumentCommand{\autoannexref}{O{,~ }mO{}}{\annexref{#2}#1\nameref{#2}#3}


\NewActivity{course} % yeah, CCA as an activity...
\NewActivity{tccI}
\NewActivity{tccII}
\NewActivity{internship}
\NewActivity{internship-opt}



\ExplSyntaxOff
    \input{ufrgscca-terms-ptBR.tex}
    \input{ufrgscca-cover-ptBR.tex}
\ExplSyntaxOn


\bool_if:NT \l__ufrgscca_english_bool
  {
    \AtBeginDocument{\input{ufrgscca-terms-en.tex}}
  }


\bool_if:NF \l__ufrgscca_nolocal_bool
  {
    \ExplSyntaxOff
      \IfFileExists{local.tex}
        { \AtBeginDocument{ \input{local.tex} } }
        {}%
    \ExplSyntaxOn
  }




