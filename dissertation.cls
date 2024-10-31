\NeedsTeXFormat{LaTeX2e}[2023/11/01]
\ProvidesClass{dissertation}[2024/10/22 PhD Dissertation class]

%% Options
\newif\if@print
\DeclareOption{print}{\@printtrue}    %% print - Whether to include marks and apply colors and settings for printing
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

%% Class: book
\LoadClass[
  10pt                      %% default font size
]{book}


%%%%%%%%%%%%
%% Colors %%
%%%%%%%%%%%%

%% Driver-independent color extensions (https://ctan.org/pkg/xcolor)
\RequirePackage[
  dvipsnames,               %% load the `dvipsnames` set of predefined colors
  table,                    %% support coloring table rows, columns, and cells
]{xcolor}

%% Brand colors
\definecolor{brand-darkgray}{cmyk}{0.67,0.59,0.53,0.33}
\definecolor{brand-lightgray}{cmyk}{0.14,0.11,0.10,0.00}
\definecolor{brand-main}{cmyk}{0.02,0.29,0.99,0.00}

%% Title colors
\colorlet{title-fg}{black}
\colorlet{subtitle-fg}{black}
\colorlet{part-fg}{brand-main}
\colorlet{chapter-fg}{brand-main}
\colorlet{section-fg}{black}
\colorlet{subsection-fg}{black}
\colorlet{subsubsection-fg}{black}

%% Header colors
\colorlet{header-fg}{brand-darkgray}
\colorlet{header-line-fg}{brand-darkgray}

%% Colors for the thumb indices
\colorlet{thumb-bg}{brand-main}
\colorlet{thumb-fg}{brand-darkgray}

%% Background color for code listings
\colorlet{listings-bg}{brand-lightgray}
\colorlet{listings-number-fg}{brand-main}



%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Language and Encoding %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Accept different input encodings (https://ctan.org/pkg/inputenc)
\RequirePackage[
  utf8                      % Unicode UTF-8 encoding support
]{inputenc}
%% Standard package for selecting font encodings (https://ctan.org/pkg/fontenc)
\RequirePackage[
  T1                        % https://tex.stackexchange.com/a/677/108670
]{fontenc}
%% Multilingual support (https://ctan.org/pkg/babel)
\RequirePackage[
  main=USenglish,
  dutch,
]{babel}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (Math) Symbols and Typesetting %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% AMS mathematical facilities (https://ctan.org/pkg/amsmath)
\RequirePackage{amsmath}  % Must be loaded BEFORE cleveref
%% Typesetting theorems (https://ctan.org/pkg/amsthm)
\RequirePackage{amsthm}
%% Fonts from the American Mathematical Society (https://ctan.org/pkg/amsfonts)
\RequirePackage{amssymb}
%% Mathematical tools to use with amsmath (https://ctan.org/pkg/mathtools)
\RequirePackage{mathtools}
%% Unicode mathematics support (https://ctan.org/pkg/unicode-math)
\RequirePackage{unicode-math}


%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fonts & Typesetting %%
%%%%%%%%%%%%%%%%%%%%%%%%%

%% Advanced font selection (https://ctan.org/pkg/fontspec)
\RequirePackage{fontspec}
\setmainfont{LibertinusSerif}[
  Extension       = .otf,
  UprightFont     = *-Regular,
  BoldFont        = *-Bold,
  ItalicFont      = *-Italic,
  BoldItalicFont  = *-BoldItalic,
  Ligatures       = TeX,
]
\setsansfont{LibertinusSans}[
  Extension       = .otf,
  UprightFont     = *-Regular,
  BoldFont        = *-Bold,
  ItalicFont      = *-Italic,
  Ligatures       = TeX,
]
\setmonofont{JetBrainsMono}[
  Path            = ./fonts/jetbrainsmono/,
  Extension       = .otf,
  UprightFont     = *-Regular,
  BoldFont        = *-Bold,
  ItalicFont      = *-Italic,
  BoldItalicFont  = *-BoldItalic,
  Ligatures       = TeX,
  Contextuals     = Alternate,
  Scale           = 0.85,
]
\setmathfont{LibertinusMath-Regular.otf}[
  Scale           = MatchLowercase,
]

\def\titlefont{\rmfamily}
\def\titleshape{}
\def\titlestyle{\titlefont\titleshape}
\def\headerstyle{\titlestyle}

%% Verbatim with URL-sensitive line breaks (https://www.ctan.org/pkg/url)
\RequirePackage{url}
\renewcommand*{\UrlFont}{\ttfamily\relax}  %% Set URL font

\clubpenalty=1000
\widowpenalty=1000

%% Subliminal refinements towards typographical perfection (https://ctan.org/pkg/microtype)
\RequirePackage{microtype}

%% Set space between lines (https://ctan.org/pkg/setspace)
\RequirePackage[onehalfspacing]{setspace}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography & References %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Sophisticated bibliographies (https://ctan.org/pkg/biblatex)
\RequirePackage[
  natbib=true,          %% support natbib commands \citep, \citet
  backend=biber,        %% use biber as the backend
  % style=numeric,        %% citation style
  style=authoryear,     %% citation style
  sorting=nyt,          %% sorting order: name, year, title
  maxbibnames=999       %% display up to 999 author names (no `et. al.`) in the bibliography section
]{biblatex}


%%%%%%%%%%%%%%%%%
%% Page Layout %%
%%%%%%%%%%%%%%%%%

%% Set the paper size to 170 by 240 mm, approximately halfway between A4 and A5.
\if@print
  %% Flexible and complete interface to document dimensions (https://ctan.org/pkg/geometry)
  \RequirePackage[
    papersize={173mm,246mm},  %% paper size, with bleed for printing
    layoutsize={167mm,240mm},
    layoutoffset={3mm,11mm},
    bindingoffset={3mm},
    textwidth={127.4818mm},
    hscale=0.75,              %% We decrease the margins slightly from the default (scale = 0.7).
    vscale=0.8,
    xetex,                    %% driver
  ]{geometry}
\else
  %% Flexible and complete interface to document dimensions (https://ctan.org/pkg/geometry)
  \RequirePackage[
    papersize={170mm,240mm},  %% paper size
    layoutoffset={0mm,7mm},
    textwidth={127.4818mm},
    hscale=0.75,              %% We decrease the margins slightly from the default (scale = 0.7).
    vscale=0.8,
    xetex,                    %% driver
  ]{geometry}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Titles, Headers, and Table of Contents %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Select alternative section titles (https://ctan.org/pkg/titlesec)
\RequirePackage[noindentafter]{titlesec}
%% Alternative headings for toc/lof/lot (https://ctan.org/pkg/titletoc)
\RequirePackage{titletoc}


%% Redefine the title command to accept an optional subtitle.
\renewcommand*\title[2][]{%
  \def\@subtitle{#1}%
  \def\@title{#2}%
  %% Add the title to the PDF meta data:
  \hypersetup{pdftitle=#2}%
}

%% Redefine the author command to accept a first and last name,
%% and to add the full name to the PDF meta data.
\renewcommand*\author[2]{%
  \def\@firstname{#1}%
  \def\@lastname{#2}%
  \hypersetup{pdfauthor=#1\ #2}%
}

%% Remove the header and page number on empty pages.
\def\cleardoublepage{%
  \clearpage%
  \if@twoside%
    \ifodd\c@page%
    \else%
      \thispagestyle{empty}%
      \vspace*{\fill}%
      \newpage%
    \fi%
  \fi%
}


%%%%%%%%%%%%%%%%%%%%%%%%
%% Links & References %%
%%%%%%%%%%%%%%%%%%%%%%%%

%% Extensive support for hypertext (https://ctan.org/pkg/hyperref)
\RequirePackage[
  xetex,
  bookmarks=false,
  hidelinks,
]{hyperref}
\hypersetup{
    colorlinks = false
}

%% Intelligent cross-referencing (https://ctan.org/pkg/cleveref)
\RequirePackage{cleveref}   %% Load AFTER hyperref



%%%%%%%%%%%%%%%%%%%
%% Code Listings %%
%%%%%%%%%%%%%%%%%%%

%% Typeset source code listings (https://ctan.org/pkg/listings)
\RequirePackage{listings}

\lstset{%
  backgroundcolor=\color{listings-bg},  %% background color
  numbers=left,                         %% where to put the line-numbers; possible values are (none, left, right)
  numbersep=5pt,                        %% how far the line-numbers are from the code
  showspaces=false,                     %% show spaces everywhere adding particular underscores; it
  stepnumber=1,                         %% the step between two line-numbers. If it's 1, each line will be numbered
  numberstyle=\tiny\color{listings-number-fg},
  breaklines        = true,
  breakatwhitespace = true,
  breakindent       = 2ex,
  escapechar        = *,
  basicstyle=\scriptsize\ttfamily,
  columns = flexible,                   %% prevent glue form being inserted between characters
}

%% Allow ligatures in verbatim environments
\renewcommand*\verbatim@nolig@list{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tables, Figures, Lists %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Publication quality tables (https://ctan.org/pkg/booktabs)
\RequirePackage{booktabs}

%% Control layout of itemize, enumerate, description (https://ctan.org/pkg/enumitem)
\RequirePackage{enumitem}


%%%%%%%%%%%%%%%
%% Footnotes %%
%%%%%%%%%%%%%%%

%% A range of footnote options (https://ctan.org/pkg/footmisc)
\RequirePackage[
  flushmargin,
  hang
]{footmisc}


%%%%%%%%%%%%%%
%% Graphics %%
%%%%%%%%%%%%%%

%% Create PostScript and PDF graphics (https://www.ctan.org/pkg/pgf)
\RequirePackage{tikz}
%% For calculating the coordinates of the thumb indices.
\usetikzlibrary{calc}


%%%%%%%%%%%%%%%%
%% Crop Marks %%
%%%%%%%%%%%%%%%%

\if@print%
  \newcommand*\cropmarks{%
    \ifodd\c@page%
      \begin{tikzpicture}[remember picture,overlay]
        \draw ($(current page.north east)+(0mm,-3mm)$) -- ($(current page.north east)+(-2mm,-3mm)$);
        \draw ($(current page.north east)+(-3mm,0mm)$) -- ($(current page.north east)+(-3mm,-2mm)$);
        \draw ($(current page.south east)+(0mm,3mm)$) -- ($(current page.south east)+(-2mm,3mm)$);
        \draw ($(current page.south east)+(-3mm,0mm)$) -- ($(current page.south east)+(-3mm,2mm)$);
      \end{tikzpicture}%
    \else%
      \begin{tikzpicture}[remember picture,overlay]
        \draw ($(current page.north west)+(0mm,-3mm)$) -- ($(current page.north west)+(2mm,-3mm)$);
        \draw ($(current page.north west)+(3mm,0mm)$) -- ($(current page.north west)+(3mm,-2mm)$);
        \draw ($(current page.south west)+(0mm,3mm)$) -- ($(current page.south west)+(2mm,3mm)$);
        \draw ($(current page.south west)+(3mm,0mm)$) -- ($(current page.south west)+(3mm,2mm)$);
      \end{tikzpicture}%
    \fi%
  }
\else
  \newcommand*\cropmarks{}
\fi%


%%%%%%%%%%%%%%%%%%%
%% Thumb Indices %%
%%%%%%%%%%%%%%%%%%%

%% Thumb indices consist of white text on a rectangular colored background.
%% The font-size is 75% of the size of thumb height.
\newif\ifthumb
\newlength\thumbheight
\setlength\thumbheight{24pt}
\newlength\thumbedge
\setlength\thumbedge{4pt}
\newlength\thumbhspace
\setlength\thumbhspace{36pt}
\newlength\thumbvspace
\setlength\thumbvspace{2\thumbheight}

\newlength\thumbwidth
\setlength\thumbwidth{36pt}
\newlength\thumbspacing
\setlength\thumbspacing{2\thumbheight}

%% The lthumb command prints the current chapter number in a thumb index on the left (even) page.
\newcommand*\lthumb{%
  \ifthumb%
    \begin{tikzpicture}[remember picture,overlay]
      \coordinate (top margin) at (0pt,1in+\topmargin+\headheight+\headsep);
      \coordinate (left margin) at (1.1in+\evensidemargin,0pt);
      %% Calculate the corners of the thumb index based on the current chapter number.
      \coordinate (top left) at ($(current page.north west)-(top margin)-(0pt,\value{chapter}\thumbvspace-\thumbvspace)$);
      \coordinate (bottom right) at ($(top left)+(left margin)-(\thumbhspace,\thumbheight)$);
      %% Shift the left edge to prevent the rounded corner from showing.
      \coordinate (top left) at ($(top left)-(\thumbedge,0pt)$);
      %% Draw the thumb index.
      \fill[fill=thumb-bg,rounded corners=\thumbedge](top left) rectangle (bottom right);
      %% Print the chapter number at the center right in the thumb index.
      \coordinate (center right) at ($(bottom right)+(0pt,0.5\thumbheight)$);
      \node at (center right)[anchor=east,inner sep=2\thumbedge]{
        \titlefont\bfseries\color{thumb-fg}
        \fontsize{0.75\thumbheight}{0.75\thumbheight}\selectfont
        \thechapter
      };
    \end{tikzpicture}%
  \fi%
}

%% The rthumb draws a thumb index on the right (odd) page.
\newcommand*\rthumb{%
  \ifthumb%
    \begin{tikzpicture}[remember picture,overlay]
      \coordinate (top margin) at (0pt,1in+\topmargin+\headheight+\headsep);
      \coordinate (right margin) at (1.1in+\evensidemargin,0pt);
      %% Calculate the corners of the thumb index based on the current chapter number.
      \coordinate (top right) at ($(current page.north east)-(top margin)-(0pt,\value{chapter}\thumbvspace-\thumbvspace)$);
      \coordinate (bottom left) at ($(top right)-(right margin)-(-\thumbhspace,\thumbheight)$);
      %% Shift the left right to prevent the rounded corner from showing.
      \coordinate (top right) at ($(top right)+(\thumbedge,0pt)$);
      %% Draw the thumb index.
      \fill[fill=thumb-bg,rounded corners=\thumbedge](top right) rectangle (bottom left);
      %% Print the chapter number at the center right in the thumb index.
      \coordinate (center left) at ($(bottom left)+(0pt,0.5\thumbheight)$);
      \node at (center left)[anchor=west,inner sep=2\thumbedge]{
        \titlefont\bfseries\color{thumb-fg}
        \fontsize{0.75\thumbheight}{0.75\thumbheight}\selectfont
        \thechapter
      };
    \end{tikzpicture}%
  \fi%
}


%%%%%%%%%%%%%%%%
%% Page Style %%
%%%%%%%%%%%%%%%%

%% Extensive control of page headers and footers (https://ctan.org/pkg/fancyhdr)
\RequirePackage{fancyhdr}

%% Page style for empty pages
\fancypagestyle{empty}{%
  \fancyhf{}
  \renewcommand*\headrulewidth{0pt}
  \renewcommand*\footrulewidth{0pt}
  \fancyhead{\cropmarks}
}

%% Page style for title pages
\fancypagestyle{plain}{%
  \fancyhf{}
  \renewcommand*\footrulewidth{0pt}
  \fancyhead{\cropmarks}
  \fancyhead[LE]{\cropmarks\lthumb\titlefont\color{header-fg}\thepage}
  \fancyhead[RO]{\cropmarks\rthumb\titlefont\color{header-fg}\thepage}
}

%% Fancy style for the main matter
\fancypagestyle{mainmatter}{%
  \fancyhf{}
  %% Page numbers on the top left and top right.
  \fancyhead[LE]{\cropmarks\lthumb\fontsize{8.5pt}{8.5pt}\titlefont\color{header-fg}\thepage}
  \fancyhead[RO]{\cropmarks\rthumb\fontsize{8.5pt}{8.5pt}\titlefont\color{header-fg}\thepage}
  %% Chapter name on the left (even) page.
  \fancyhead[RE]{\fontsize{8.5pt}{8.5pt}\titlefont\titleshape\color{header-fg}\nouppercase{\leftmark}}
  %% Section name on the right (odd) page.
  \fancyhead[LO]{\fontsize{8.5pt}{8.5pt}\titlefont\titleshape\color{header-fg}\nouppercase{\rightmark}}
}

%% The mainmatter style is default for normal pages.
\pagestyle{mainmatter}

%% Print the current chapter and section at the top of the page.
\renewcommand*\chaptermark[1]{\markboth{\color{header-fg}\thechapter\ #1}{}}
\renewcommand*\sectionmark[1]{\markright{\color{header-fg}\thesection\ #1}}

%% The setheader command can be used to print the title of unnumbered chapters in the page header.
\newcommand*\setheader[1]{\markboth{\color{header-fg}#1}{\color{header-fg}#1}}

%% Change the headrule command (from fancyhdr.sty) to draw the line below the header in the title color.
\renewcommand*\headrule{%
  \if@fancyplain%
    \let\headrulewidth\plainheadrulewidth%
  \fi%
  {\color{header-line-fg}\hrule\@height\headrulewidth\@width\headwidth}%
  \vskip-\headrulewidth%
}

%% Draw the line above a footnote in the title color as well.
\renewcommand*\footnoterule{%
  \vspace*{-3pt}%
  {\color{header-line-fg}\hrule width 0.5\textwidth height 0.4pt}%
  \vspace*{2.6pt}%
}

%% A part title starts with a huge bold number, flushed to the right, followed by the part name on the next line.
\titleformat{\part}[display]
  {\flushright\titlestyle}
  {\fontsize{96pt}{96pt}\selectfont\bfseries\thepart}
  {0pt}
  {\Huge\color{part-fg}}
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, the part name is preceded by an empty line,
%% printed in bold, and not followed by a line of dots.
\dottedcontents{part}[0em]{\vspace{\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Chapter titles have the same layout as parts.
\titleformat{\chapter}[display]
  {\flushright\titlestyle}
  {\fontsize{84pt}{84pt}\selectfont\bfseries\thechapter}
  {0pt}
  {\Huge\color{chapter-fg}}
\titlespacing{\chapter}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, a chapter is similar to a part,
%% except that it is preceded by half an empty line.
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Section titles start with the number in bold, followed by the name.
\titleformat{\section}
  {\Large\bfseries\headerstyle}
  {\thesection\ }
  {0pt}
  {\color{section-fg}}
%% Sections are preceded by an empty line.
\titlespacing{\section}{0pt}{\baselineskip}{0pt}
%% In the table of contents, section names are followed by a line of dots.
\dottedcontents{section}[3.8em]{\titlefont}{2.3em}{8pt}

%% Subsection titles have the same layout as section titles, except in a smaller font.
\titleformat{\subsection}
  {\large\bfseries\headerstyle}
  {\thesubsection\ }
  {0pt}
  {\color{subsection-fg}}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\dottedcontents{subsection}[7em]{\titlefont}{3.2em}{8pt}

%% Subsubsections have the same font and color as sections and subsections,
%% but are not preceded by a number.
\titleformat{\subsubsection}
  {\bfseries\headerstyle}
  {}
  {0pt}
  {\color{subsubsection-fg}}
%% Subsubsections are preceded by an empty line and do not appear in the table of contents.
\titlespacing{\subsubsection}{0pt}{\bigskipamount}{0pt}

%% Color the bullets of the itemize environment and make the symbol of the third
%% level a diamond instead of an asterisk.
\renewcommand*\labelitemi{\color{black}\textbullet}
\renewcommand*\labelitemii{\color{black}--}
\renewcommand*\labelitemiii{\color{black}$\diamond$}
\renewcommand*\labelitemiv{\color{black}\textperiodcentered}

\newcommand\printtitle{%
  %% Extra whitespace at the top.
  \vspace*{2\bigskipamount}

  %% Print the title.
  {\color{title-fg}\titlestyle\bfseries\LARGE\@title}

  %% Print the optional subtitle.
  \ifx\@subtitle\undefined\else
    \bigskip
    {\color{subtitle-fg}\titlefont\titleshape\Large\@subtitle}
  \fi
}

%% The dedication is vertically centered on a separate page and flushed to the right.
\newcommand\dedication[1]{%
  \thispagestyle{empty}%
  \vspace*{\fill}%
  \begin{flushright}%
    #1%
  \end{flushright}%
  \vspace*{\fill}%
  \cleardoublepage%
}

%% Define an unnumbered footnote command.
\def\blfootnote{\xdef\@thefnmark{}\@footnotetext}

%% The authors environment is used to display the authors of a chapter on the title page.
%% This is only necessary if multiple people contributed significantly to the chapter.
\newcommand*\authors[1]{%
  \begin{center}%
    {\Large\bfseries #1}%
  \end{center}%
  \vspace{2\baselineskip}%
}

%% The epigraph environment can be used to to add a quote to the title page of a chapter.
\newcommand\epigraph[3][2\baselineskip]{%
  \begin{flushright}%
    {\rmfamily\itshape #2}%
    \vskip 0.5\baselineskip%
    #3%
  \end{flushright}%
  \vspace{#1}%
}

%% The abstract environment is used for the abstract of a chapter.
\newenvironment{abstract}{%
  \list{}{\leftmargin\rightmargin}%
  \item%
  \relax%
  \rmfamily\itshape%
}{%
  \endlist%
}

