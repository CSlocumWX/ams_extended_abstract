## American Meteorological Society Extended Abstract LaTeX Template

This repository contains a LaTeX class for creating an extended
abstract that follows the [American Meteorological Society's instructions
for formatting](https://www.ametsoc.org/ams/index.cfm/meetings-events/abstract-author-and-presenter-information/abstract-author-instructions/extended-abstract-instructions/).

This LaTeX template includes and uses the [AMS reference and citation format](https://www.ametsoc.org/ams/index.cfm/publications/authors/journal-and-bams-authors/formatting-and-manuscript-components/references/)
reference section style. To change, `ametsocV6` in the
`\bibliographystyle{}` command can be swapped for any user specified
`.bst` file if a different reference and in-text citation format is
preferred (note that this would not adhere to the AMS extended
abstract formatting guidelines).

### Style optional arguments for the document class
The AMS extended abstract formatting guidelines are relatively
rigid. However, you can pick between 9pt and 10pt font.

* **9pt, 10pt** - AMS allows the font size of the main text to be within 9-10 pts.

### Example LaTeX template
Below is example LaTeX using the template. This example is similar
to what is in the `./template.tex` file.
```latex
\documentclass[9pt]{amsextabs}
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

### Using DocumentMetadata
Consider compiling with lualatex to create standard compliant PDFs, especially the UA-2 standard.