%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name:       ametsocextabs LaTeX class
% Purpose:    Conform to the AMS extended abstract formatting guidelines
% Maintainer: Chris Slocum
% License:    BSD 3-Clause License
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[2025-11-01]
\ProvidesClass{ametsocextabs}[2026-03-22 v2.0 AMS Extended Abstract Class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Document class options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Child package specific options
\newif\ifserif\seriffalse
\DeclareOption{serif}{\seriftrue}
\newif\ifblue \bluefalse
\DeclareOption{blue}{\bluetrue}
% Invalid options to pass to parent class, article
\DeclareOption{onecolumn}{%
   \ClassWarningNoLine{ametsocextabs}{Option `onecolumn' is not a valid option.}}
\DeclareOption{12pt}{%
   \ClassWarningNoLine{ametsocextabs}{Option `12pt' is not a valid option.}}
% Pass options to parent class, article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[letterpaper, 9pt, oneside, twocolumn, final]{article}
%
% Programatic extensions
%
\RequirePackage{iftex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Parse preamble input to get affiliation and papernumber
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\global\let\theaffiliation\empty
\global\let\thepapernumber\empty
\newcommand{\aff}[1]{{\normalfont\textsuperscript{#1}}\,}
\newcommand{\affiliation}[1]{\gdef\theaffiliation{#1}}
\newcommand{\papernumber}[1]{\gdef\thepapernumber{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Page setup and layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup  using the geometry package
\RequirePackage[letterpaper]{geometry}
\newgeometry{%
    margin=1truein,
    nohead,
    foot=0.5truein,
}
% Set the column separator width to 0.25 inches.
\setlength{\columnsep}{0.25truein}
% set the paragraph spacing to 0
\renewcommand{\baselinestretch}{1.05}
\setlength{\parskip}{0pt}%
%Use the indent first package to ensure the first paragraph after each
%section is indented.
\RequirePackage{indentfirst}
\setlength{\parindent}{10pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Font settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% class font
\RequirePackage[T1]{fontenc}
\RequirePackage{tgheros}
\renewcommand{\familydefault}{\sfdefault}
\renewcommand\large{\@setfontsize\large{10pt}{10pt}}
% font colors
\RequirePackage{xcolor}
% Provide the amsmath, fonts, symbol, and boldface math packages
\RequirePackage{amsmath,amsfonts,amssymb,bm}
% Fonts for math
\ifserif
    \RequirePackage{newtxmath}
\else
    \RequirePackage{sansmath}
    \sansmath
\fi
% Set page numbers
\pagestyle{plain}
% Corrected labels to roman numbers for lists
\renewcommand{\labelenumi}{\roman{enumi}.}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Misc packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if then options
\RequirePackage{ifthen}
% graphics package
\RequirePackage{graphicx}
% ORCID link package
\RequirePackage{orcidlink}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   URL settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use times font in URLs
\RequirePackage{xurl}
% Change the url command font family to document font family (san serif)
\urlstyle{same}
\RequirePackage{hyperref}
\ifblue
    \hypersetup{%
        hidelinks,
        unicode,
        breaklinks,
        bookmarks = true,
        bookmarksopen = false,
        pdfpagemode = UseNone,
        pdfborder = {0 0 0},
        pdfdisplaydoctitle,
        colorlinks = true,
        allcolors = blue,
    }
\else
    \hypersetup{%
        hidelinks,
        unicode,
        breaklinks,
        bookmarks = true,
        bookmarksopen = false,
        pdfpagemode = UseNone,
        pdfborder = {0 0 0},
        pdfdisplaydoctitle,
        colorlinks = false,
        allcolors = black,
    }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title and thanks layout and settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% building the title for the extended abstract

% Define correspondingauthor
\newcommand{\correspondingauthor}[1]{%
    \,\thanks{\noindent{{\itshape Corresponding author address}:}\ #1
}}

\newcommand{\titletextbox}[1]{%
      \parbox{.8\textwidth}{\centering \MakeUppercase{#1}}%
}
\newcommand{\pgnumtextbox}[1]{%
      \parbox{.1\textwidth}{#1}%
}

\renewcommand{\@maketitle}{%
    \null
    {\large\bfseries\pgnumtextbox{\thepapernumber}\titletextbox{\@title}\pgnumtextbox{}\par}%
    \vskip 0.1em%
    \begin{center}%
    {\large
      \lineskip 0.2em%
          {\@author\par}%
          {\small\itshape\theaffiliation\normalsize\par}%
    }%
    \end{center}%
    \par
    \vskip 0.5em%
  }

\renewcommand{\and}{\ \ \ {\sc and}\ \ \ }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Reference section settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{natbib}
% Citations should be of the form ``author year''  not ``author, year''
\setcitestyle{aysep={}}  % Remove comma between author and year
\newcommand*{\doi}[1]{\href{https://doi.org/\detokenize{#1}}{https://doi.org/\detokenize{#1}}}
\setlength{\bibsep}{0.25\baselineskip}
% Center the References section title
\renewcommand{\refname}{\begin{center}\normalfont{\bf REFERENCES}\end{center}\par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Section header settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{4}
%
% Article's default is to provide arabic numerals for everything.
% Change the formatting of section and lower to follow AMS style.
\renewcommand{\@seccntformat}[1]{{\csname the#1\endcsname}.~~}%1

%section definitions
\renewcommand{\section}{%
\renewcommand{\@seccntformat}[1]{
    {\csname the##1\endcsname}.~~}%1
    \@startsection
    {section}%
    {1}% 1 is the level for subsection
    {0mm}% NO indent, starts immediately
    {-\baselineskip}% skips 1 baseline after end of previous subsection
    {0.5\baselineskip}% half baseline and the first paragraph starts
    {\normalsize\bf\MakeUppercase}%the style, Large and boldface
}
\renewcommand{\thesection}{\arabic{section}} % numbers

% subsection definitions
\renewcommand{\subsection}{%
\renewcommand{\@seccntformat}[1]{
    {\csname the##1\endcsname}.~~}%1
    \@startsection
    {subsection}%
    {2}% 2 is the level for subsection
    {0mm}% NO indent, starts immediately
    {-\baselineskip}% skips 1 baseline after end of previous subsection
    {0.5\baselineskip}% half baseline and the first paragraph starts
    {\normalfont\bf\itshape}%the style, all italics
}
\renewcommand{\thesubsection}{\arabic{subsection}} % letters

% subsubsection definitions
\renewcommand{\subsubsection}{%
\renewcommand{\@seccntformat}[1]{
    {\csname the##1\endcsname})~~}%1
    \@startsection
    {subsubsection}%
    {3}% 3 is the level for subsubsection
    {5mm}% Indent subsubsections
    {-\baselineskip}% skips 1 baseline after end of previous subsubsection
    {0.5\baselineskip}% half baseline and the first paragraph starts
    {\normalfont\normalsize\sc}%
}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}

\numberwithin{subsection}{section}

\newcommand{\statement}{\@startsection{section}{1}{\z@}%
                                    {6pt \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\itshape}}
\newcommand{\acknowledgments}{
    \statement*{Acknowledgments.}
    \addcontentsline{toc}{section}{\protect\numberline{}Acknowledgments}}
\newcommand{\acknowledgment}{\acknowledgments}
\newcommand{\datastatement}{
    \statement*{Data availability statement.}
    \addcontentsline{toc}{section}{\protect\numberline{}Data availability statement}}
\newcommand{\disclaimer}{
    \statement*{Disclaimer.}
    \addcontentsline{toc}{section}{\protect\numberline{}Disclaimer}}

\renewenvironment{appendix}[1][1]{%
    \ifthenelse{\equal{#1}{1}}{%
        \renewcommand\theequation{A\arabic{equation}}%
        \setcounter{equation}{0}% reset counter
        \setcounter{subsection}{0}% reset counter
        \begin{center}%
            \section*{\textnormal{APPENDIX}}%
        \end{center}

    }
    {%
        \renewcommand\theequation{{#1}\arabic{equation}}%
        \setcounter{equation}{0}% reset counter
        \setcounter{subsection}{0}% reset counter
        \begin{center}%
            \section*{\textnormal{APPENDIX {#1}}}%
        \end{center}
    }
}%

\newcommand{\appendixtitle}[1]{{\centering\bf #1\vskip6pt}}

% Create the proper style for the figure and table captions.
\renewcommand{\figurename}{% Change label to Fig. and small caps
    {\sc Fig.}}
\renewcommand{\tablename}{% Make Table small caps
    {\sc Table}}
