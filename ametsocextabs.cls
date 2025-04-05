%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name:       ametsocextabs LaTeX class
% Purpose:    Conform to the AMS extended abstract formatting guidelines
% Maintainer: Chris Slocum
% License:    BSD 3-Clause License
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[2025-03-08]
\ProvidesClass{ametsocextabs}[2025-04-05 AMS Extended Abstract Class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Document class options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@@ptsize{9pt}
\DeclareOption{9pt}{\def\@@ptsize{9pt}}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\newif\ifserif\seriffalse
\DeclareOption{serif}{\seriftrue}
\ProcessOptions\relax
\LoadClass[\@@ptsize, twocolumn, letterpaper]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Parse preamble input to get affiliation and papernumber
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\global\let\@affiliation\@empty
\global\let\@papernumber\@empty
\newcommand\aff[1]{\textsuperscript{#1}\,}
\def\affiliation#1{\gdef\@affiliation{#1}}
\def\papernumber#1{\gdef\@papernumber{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Page setup and layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup  using the geometry package
\RequirePackage[letterpaper]{geometry}
\newgeometry{
    margin=1truein,
    nohead,
    foot=0.5truein
}
% Set the column separator width to 0.25 inches.
\setlength{\columnsep}{.25in}
% set the paragraph spacing to 0
\renewcommand{\baselinestretch}{1.05}
\setlength{\parskip}{0pt}%
%Use the indent first package to ensure the first paragraph after each
%section is indented.
\RequirePackage{indentfirst}
\setlength{\parindent}{10pt}%

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   URL settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use times font in URLs
\RequirePackage{xurl}
\RequirePackage{bookmark}
\RequirePackage{hyperref}
\hypersetup{
    hidelinks,
    unicode,
    bookmarks = true,
    bookmarksopen = false,
    pdfpagemode=UseNone,
    pdfborder={0 0 0},
    pdfdisplaydoctitle,
    colorlinks,
    linkcolor={black},
    citecolor={black},
    urlcolor={black}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title and thanks layout and settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% building the title for the extended abstract

% Define correspondingauthor
\def\correspondingauthor#1{%
    \,\thanks{\noindent{{\itshape Corresponding author address}:}\ #1
}}

\newcommand\titletextbox[1]{%
      \parbox{.8\textwidth}{\centering \MakeUppercase{#1}}%
}
\newcommand\pgnumtextbox[1]{%
      \parbox{.1\textwidth}{#1}%
}

\def\@maketitle{%
    \null
    {\large\bfseries\pgnumtextbox{\@papernumber}\titletextbox{\@title}\pgnumtextbox{}\par}%
    \vskip 0.1em%
    \begin{center}%
    {\large
      \lineskip 0.2em%
          {\@author\par}%
          {\small\itshape\@affiliation\normalsize\par}%
    }%
    \end{center}%
    \par
    \vskip 0.5em%
  }

\def\and{\ \ \ {\sc and}\ \ \ }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Reference section settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{natbib}
% Citations should be of the form ``author year''  not ``author, year''
\bibpunct{(}{)}{;}{a}{}{,}
\newcommand*{\doi}[1]{doi:\href{https://dx.doi.org/\detokenize{#1}}{\detokenize{#1}}}
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
    {\normalsize\bf\uppercase}%the style, Large and boldface
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

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {6pt \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\it}}
\newcommand\statement{\@startsection{section}{1}{\z@}%
                                    {6pt \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\it}}
\def\datastatement{\statement*{Data availability statement.}}
\def\acknowledgments{\statement*{Acknowledgments.}}
\def\acknowledgment{\statement*{Acknowledgment.}}

\renewenvironment{appendix}[1][1]{
    \ifthenelse{\equal{#1}{1}}{
        \renewcommand\theequation{A\arabic{equation}}%
        \setcounter{equation}{0}% reset counter
        \setcounter{subsection}{0}% reset counter
        \begin{center}%
            \section*{\textnormal{APPENDIX}}%
        \end{center}
        
    }%
    {
        \renewcommand\theequation{{#1}\arabic{equation}}%
        \setcounter{equation}{0}% reset counter
        \setcounter{subsection}{0}% reset counter
        \begin{center}%
            \section*{\textnormal{APPENDIX {#1}}}%
        \end{center}
    }
}%

% Remove colon in \caption, AMS style is to have a period after the
% figure number
\long\def\@makecaption#1#2{%
% Create the proper style for the figure and table captions.
    \renewcommand{\figurename}{\textsc{Fig.}}
    \renewcommand{\tablename}{\textsc{Table}}
    \renewcommand{\thefigure}{\arabic{figure}.}
    \renewcommand{\thetable}{\arabic{table}.}
    \vskip\abovecaptionskip
    \sbox\@tempboxa{#1~~#2}%
    \ifdim \wd\@tempboxa >\hsize
        #1~~#2\par%
    \else
        \global \@minipagefalse
        \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
    \fi
\vskip\belowcaptionskip}
