% author: Tz-Huan Huang [http://www.csie.ntu.edu.tw/~tzhuan]
% version: 0.6

% ----------------------------------------------------------------------------
% "THE CHOCOLATE-WARE LICENSE":
% Tz-Huan Huang wrote this file. As long as you retain this notice you
% can do whatever you want with this stuff. If we meet some day, and you think
% this stuff is worth it, you can buy me a chocolate in return Tz-Huan Huang
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ntuthesis}[2013/04/23 Thesis template for National Taiwan University]

% Derived from book class
\DeclareRobustCommand{\@typeen}{Master}
\DeclareRobustCommand{\@typezh}{碩士}
\DeclareRobustCommand{\@classen}{Thesis}
\DeclareRobustCommand{\@classzh}{論文}
\DeclareOption{phd}{\gdef\@typeen{Doctoral}\gdef\@typezh{博士}\gdef\@classen{Dissertation}}
\DeclareOption{proposal}{\gdef\@typeen{Proposal for Doctoral}\gdef\@typezh{博士論文計畫提案書}\gdef\@classen{Dissertation}\gdef\@classzh{}}
\DeclareRobustCommand{\@setspacing}{\doublespacing}
\DeclareOption{singlespacing}{\gdef\@setspacing{\singlespacing}}
\DeclareOption{onehalfspacing}{\gdef\@setspacing{\onehalfspacing}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{book}

% Required packages
\RequirePackage[top=2.54cm,left=3.17cm,bottom=2.54cm,right=3.17cm]{geometry}
\RequirePackage{xeCJK}
\RequirePackage{setspace}
\RequirePackage[contents={}]{background}

% Declarations
\DeclareRobustCommand{\university}[2]{\gdef\@universityen{#1}\gdef\@universityzh{#2}}
\DeclareRobustCommand{\address}[2]{\gdef\@addressen{#1}\gdef\@addresszh{#2}}
\DeclareRobustCommand{\college}[2]{\gdef\@collegeen{#1}\gdef\@collegezh{#2}}
\DeclareRobustCommand{\institute}[2]{\gdef\@instituteen{#1}\gdef\@institutezh{#2}}
\DeclareRobustCommand{\title}[2]{\gdef\@titleen{#1}\gdef\@titlezh{#2}}
\DeclareRobustCommand{\author}[2]{\gdef\@authoren{#1}\gdef\@authorzh{#2}}
\DeclareRobustCommand{\studentid}[1]{\gdef\@studentid{#1}}
\DeclareRobustCommand{\advisor}[2]{\gdef\@advisoren{#1}\gdef\@advisorzh{#2}}
\DeclareRobustCommand{\coadvisor}[2]{\gdef\@coadvisoren{#1}\gdef\@coadvisorzh{#2}}
\DeclareRobustCommand{\defenseyear}[2]{\gdef\@yearen{#1}\gdef\@yearzh{#2}}
\DeclareRobustCommand{\defensemonth}[2]{\gdef\@monthen{#1}\gdef\@monthzh{#2}}
\DeclareRobustCommand{\defenseday}[1]{\gdef\@day{#1}}
\DeclareRobustCommand{\abstractname}[2]{\gdef\@abstractnameen{#1}\gdef\@abstractnamezh{#2}}
\DeclareRobustCommand{\acknowledgements}[2]{\gdef\@acknowledgementsen{#1}\gdef\@acknowledgementszh{#2}}
\DeclareRobustCommand{\doi}[1]{\gdef\@doi{#1}}
\DeclareRobustCommand{\keywords}[2]{\gdef\@keywordsen{#1}\gdef\@keywordszh{#2}}

\abstractname{Abstract}{摘要}
\acknowledgements{Acknowledgements}{誌謝}

\DeclareRobustCommand{\makeFirstPage}{
	\begin{titlepage}
		\begin{singlespace}
      \linespread{1.5}
      \newgeometry{
        a4paper,
        bottom=3cm,
        top=4cm,
      }
			\let\footnotesize\small \let\footnoterule\relax \setcounter{page}{0}
			\begin{center}
        \fontsize{28}{24}\selectfont \@universityzh\@institutezh \\
        \@typezh\@classzh
      \end{center}
    \end{singlespace}
  \end{titlepage}

}

\DeclareRobustCommand{\makecover}{
  \begin{titlepage}
    \begin{singlespace}
	\let\footnotesize\small \let\footnoterule\relax \setcounter{page}{0}
	\begin{center}
		\baselineskip 14.5pt \vspace*{0.1in}
		{\Large\bfseries\@titlezh\\[0.25in]\par } 
		{\Large\bfseries\@titleen\\[1in]\par } 
	\end{center}
	{\Large 研究生：\@authorzh} ~\hfill {\large Student: \@authoren}\\[0.1in]
	{\Large 指導教授：\@advisorzh} ~\hfill {\large Advisor: \@advisoren}\\[0.1in]
	{\Large\hspace*{1.2in}\@coadvisorzh} \hspace*{0.96in} {\large\hspace*{0.835in}\@coadvisoren\\}
  \vspace{\fill}
    \begin{center}
		{\Large\@universityzh\@collegezh\\[0.25in]\@institutezh\\[0.25in]\@typezh{}\@classzh\par}
    \vspace{\fill}
		{\large A Thesis\\Submitted to\\Institute of \@instituteen\\}
		{\large \@collegeen\\\@universityen\\}
		{\large in Partial Fulfillment of the Requirements\\for the Degree of\\Master in \@instituteen\\}
		% {\large  \\}
		{\large \@monthen, \@yearen \\}
		{\large \@addressen \\[0.25in]}
		      
    \end{center}
    \end{singlespace}
  \end{titlepage}
}

\DeclareRobustCommand{\insertdoi}{
  \backgroundsetup{
    contents={\@doi},
    color=black,
    angle=0,
    position={current page.south east},
    scale=0.8,
    opacity=1,
    hshift={-3.5cm},
    vshift={1.5cm}
  }
}

%  stolen from CJKfntef
%
%  myCJKfilltwosides environment:
%    Align CJK characters to fill two sides.
%
%  Usage:
%    \begin{myCJKfilltwosides}{width}
%      first line \\
%      second line \\
%      ... \\
%      last line
%    \end{myCJKfilltwosides}
%
\newif\ifmyCJK@fillbegin@
\global\myCJK@fillbegin@false
\newif\ifmyCJK@filltwosides@
\global\myCJK@filltwosides@false

\newenvironment{myCJKfilltwosides}[1]{
  \leavevmode
  \vbox\bgroup
    \global\myCJK@filltwosides@true
    \global\let\myCJK@filltwosidesSymbol \CJKsymbol

    \def\myCJK@ftscr{
      \egroup
      \global\myCJK@fillbegin@false
      \hbox to #1\bgroup
        \ignorespaces}

    \let\\ \myCJK@ftscr

    \def\CJKsymbol##1{
      \ifmyCJK@fillbegin@
        \hfill
        \myCJK@filltwosidesSymbol{##1}
      \else
        \myCJK@filltwosidesSymbol{##1}
        \global\myCJK@fillbegin@true
      \fi}

    \hbox to #1\bgroup
      \ignorespaces
 }{
  \egroup
  \egroup

  \global\let\CJKsymbol \myCJK@filltwosidesSymbol
  \global\myCJK@fillbegin@false
  \global\myCJK@filltwosides@false}


\DeclareRobustCommand{\CJKmove}[1]{\raisebox{.35em}{#1}}
\DeclareRobustCommand{\makespine}{
  \noindent\rotatebox{-90}{
    \CJKfamily{sidepagefont}
    \begin{tabular}{m{3.5cm}m{0.1cm}m{2cm}m{0.1cm}m{10cm}m{1cm}m{2.5cm}m{0.1cm}m{1.5cm}}
      \fontsize{8}{6}\selectfont
      \begin{myCJKfilltwosides}{3cm}\CJKmove{\@universityzh}\end{myCJKfilltwosides}\newline
      \begin{myCJKfilltwosides}{3cm}\CJKmove{\@institutezh}\end{myCJKfilltwosides} & &
      \CJKmove{\@typezh\@classzh} & &
      {\fontsize{14}{14}\selectfont\CJKmove{\@titlezh}} & &
      {\fontsize{14}{14}\selectfont\CJKmove{\@authorzh{} 撰}} & &
      \raisebox{-0.25em}{\rotatebox{90}{\@yearzh{}} \rotatebox{90}{\hspace{0.25em}\@monthzh{}}}
    \end{tabular}}
}

\newenvironment{quotationpage}[1]
  {\if@openright\cleardoublepage\else\clearpage\fi
  \titleformat{\chapter}[block]{\fontsize{18pt}{18}\bfseries}{}{1pt}{}
  \titlespacing{\chapter}{0pt}{6pt}{6pt}
   \chapter*{\centerline{#1}}
   \setchapleaders{\cftdotsep}
   \addcontentsline{toc}{chapter}{#1}
   %\quotation
   }
  {\endquotation}

\newenvironment{abstracten}{\begin{quotationpage}{\@abstractnameen}}{\end{quotationpage}}
\newenvironment{abstractzh}{\begin{quotationpage}{\@abstractnamezh}}{\end{quotationpage}}
\newenvironment{acknowledgementsen}{\begin{quotationpage}{\@acknowledgementsen}}{\end{quotationpage}}
\newenvironment{acknowledgementszh}{\begin{quotationpage}{\@acknowledgementszh}}{\end{quotationpage}}

\setcounter{tocdepth}{3}
\pagestyle{plain}
\@setspacing
