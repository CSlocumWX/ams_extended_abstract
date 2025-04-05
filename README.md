# AMS Extended Abstract LaTeX Class

This repository contains a LaTeX class for creating an extended
abstract that follows the [American Meteorological Society's instructions
for formatting](https://www.ametsoc.org/ams/index.cfm/meetings-events/abstract-author-and-presenter-information/abstract-author-instructions/extended-abstract-instructions/).

*Note:* This class is not supported or endorsed by the AMS. Users are responsible to ensuring any PDF generated with this class adheres to any of AMS's current extended abstract instructions and guidelines.

## About AMS Extended Abstracts
AMS extended abstracts are an optional submission associated with presentations. AMS encourages using the extended abstract as it allows presenters to convey more information. These abstracts are submitted through the presenter's corner of the AMS conference website and typically have a deadline after the meeting unless used as a component in a student presentation award.

AMS extended abstracts have the following guidelines:
* Submission file sizes cannot exceed 10 MB
* Units should be in International System of Units (SI units) (see [AMS Math Formula, Units, Time](https://www.ametsoc.org/ams/publications/author-information/formatting-and-manuscript-components/mathematical-formulas-units-and-time-and-date/) page)

This template follows the other rules for page layout and text font (note that by default math is in a sans-serif typeface).

## The Template
Users of the AMS manuscript LaTeX template will feel at home. This template uses a number of the same settings, except where those settings deviate from the AMS extended abstract guidelines.

### Style optional arguments for the document class
The AMS extended abstract formatting guidelines are relatively
rigid. However, you can pick between 9pt and 10pt font.

* **9pt, 10pt** - AMS allows the font size of the main text to be within 9&ndash;10 pts.
* **serif** - Puts mathematical formulas into a serifed typeface.
* **blue** -  `blue` makes the text for URLs and references dark blue rather than black. By default, all URLs and references are displayed in black.

### Example LaTeX template
Below is example LaTeX using the template. This example is similar
to what is in the `./template.tex` file.
```latex
\documentclass[9pt]{ametsocextabs}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enter your paper's/talk's title
\title{Paper title}
% Your paper number is the <session number>.<paper number>
\papernumber{J1A.1}
\author{John Doe,\aff{a}\correspondingauthor{John Doe, Street Address, City, AB ZIP code;
        e-mail: \href{mailto:}{John.Doe@affiliation.domain}},
        and Jane Doe,\aff{b}
}
\affiliation{\aff{a}{Affiliation},
             \aff{b}{Affiliation}}

\begin{document}
% This creates the title and corresponding author information.
% This should not have to change.
\maketitle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   PLACE TEXT OF EXTENDED ABSTRACT HERE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section{Introduction}
Add your text here. You can use cite as with the AMS manuscript LaTeX
template \citep[e.g.,][]{Eliassen1951}.

% You can also use \subsection and \subsubsection

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\datastatement
Add data availibility statement here.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\acknowledgments
Add acknowledgments here.

\bibliographystyle{ametsocV6}
\bibliography{references}
\end{document}
```

### Bibliography Style
This LaTeX template includes and uses the [AMS reference and citation format](https://www.ametsoc.org/ams/index.cfm/publications/authors/journal-and-bams-authors/formatting-and-manuscript-components/references/)
reference section style. This means that your existing
`.bib` file will work here without needing changes.

While the AMS extended abstract format requires citations
to use AMS style, the style can be changed.
To change, `ametsocV6` in the
`\bibliographystyle{}` command can be swapped for any user specified
`.bst` file if a different reference and in-text citation format is
preferred (note that this would not adhere to the AMS extended
abstract formatting guidelines).

## Using DocumentMetadata
The recent updates by the LaTeX Project have allowed
LaTeX engine generated PDF files to adhere to PDF
standard formats like PDF/A, PDF/UA, and PDF/X.
Because of these recent changes, please use [TeX Live 2025](https://tug.org/texlive/) or newer.
For the best results, consider compiling with LuaLaTeX to create standard compliant PDFs, especially the UA-2 standard.
Note that these options do not guarantee compliance with the standards. So, you must manually check the output.
Also, some LaTeX packages do not work with DocumentMetadata and cause errors.
See the comments at the top of the template for additional information.
