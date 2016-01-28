\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{WHUthesis}
  [2011/03/15 v0.1j WHUthesis
   document class]
\newif\ifWHUT@typeinfo \WHUT@typeinfotrue   % ����һ������\WHUT@typeinfo�������øò���Ϊtrue
\newif\ifWHUT@dvips \WHUT@dvipsfalse        % ����һ������\WHUT@dvipsfalse�������øò���Ϊfalse
% ---------------------------------------------------------------
% ����˵��
\DeclareOption{notypeinfo}{\WHUT@typeinfofalse}
\DeclareOption{dvips}{\WHUT@dvipstrue} % dvips
\DeclareOption{dvipdfm}{\WHUT@dvipsfalse} %
\DeclareOption{pdftex}{\WHUT@dvipsfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
% ----------------------------------------------------------------
% ������Ҫ��class
\LoadClass[CJK,cs4size,a4paper,fancyhdr,fntef,oneside]{ctexbook}[2005/11/25]
% ----------------------------------------------------------------
% ������Ҫ��packages
\RequirePackage{ifpdf} %% check pdfTeX mode
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,cmap} %% math packages
\RequirePackage{multirow}
\RequirePackage{graphicx}%% graphics packages
\RequirePackage[sort&compress,square,comma,numbers]{natbib}%% sort and compress citations
%% packages and settings depend on PDF mode
\ifpdf   % We're running pdfTeX in PDF mode
  \RequirePackage[pdftex]{hyperref}
  \DeclareGraphicsExtensions{.pdf}
\else    % We're not running pdfTeX, or running pdfTeX in DVI mode
  \ifWHUT@dvips
    \RequirePackage[dvips]{hyperref}
    \RequirePackage{psfrag}
    \AtBeginDvi{\special{pdf:tounicode GBK-EUC-UCS2}} % GBK -> Unicode
  \else
    \RequirePackage[dvipdfm]{hyperref}
  \fi
  \DeclareGraphicsExtensions{.eps,.ps}
\fi
% -------------------------------------------------------------------
\hypersetup{CJKbookmarks,%
       bookmarksnumbered,%
              colorlinks,%
               linkcolor=blue,%
               citecolor=blue,%
              plainpages=false,%
            pdfstartview=FitH}
\AtEndOfPackage{\makeatletter\input{WHUthesis.cfg}\makeatother}
% --------------------------------------------------------------------
% ����ͼ�ͱ���Caption�ĸ�ʽ
\CTEXsetup[name={,},number={\arabic{chapter}}]{chapter}
\CTEXoptions[captiondelimiter={:~}]
\def\CTEX@figurename{\kaishu\zihao{5}ͼ}
\def\CTEX@tablename{\kaishu\zihao{5}��}
% --------------------------------------------------------------------
% ҳ������
%\oddsidemargin 1 true cm          %��߱߾��С
%\if@twoside                         %���˫���ӡ��ż��ҳ�߾�����
%  \evensidemargin 0 true cm
%\else
%  \evensidemargin 1 true cm
%\fi
%\textheight 21 true cm              % �ı�����߶�
%\textwidth 14.5 true cm             % �ı��������
%\headheight 0pt                     % ҳü�߶�
%\footskip 40pt
%\parskip 0.5ex plus 0.25ex minus 0.25ex
\RequirePackage[top=3truecm,bottom=3.5truecm,left=3truecm,right=3truecm]{geometry}
\footskip 30pt
\headheight 0pt
\headsep 30pt
\topmargin 0pt
\oddsidemargin 0.5 true cm
\if@twoside                         %���˫���ӡ��ż��ҳ�߾�����
  \evensidemargin 0 true cm
\else
  \evensidemargin 0.5 true cm
\fi
\renewcommand\baselinestretch{1.38}
% ����½ڵĽ���ҳ��������ҳ�����¼�һҳ
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{plain}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\def\cleardoublepagecover{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\renewcommand{\floatpagefraction}{0.80} % ����ҳ���ϸ�������ռ�õ���Сҳ�����
% ---------------------------------------------------------------------------------
% -------------------------------------------------------------------------------
% ���߰���Ķ���
\newcommand\WHUTspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\newcommand\todaybig{\CTEXdigits{\yearbig}{\the\year}\yearbig �� \CTEXnumber{\monthbig}{\the\month}\monthbig ��}
\newcommand\todayold{\CTEXoptions[today=old]\today}
\newcommand\bodyformat{\linespread{1.4}\selectfont\songti\zihao{-4}}
% -------------------------------------------------------------------------
\def\WHUT@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\WHUTfiledate{#1}%
  \def\WHUTfileversion{#2}%
  \def\WHUTfileinfo{#3}}%
\expandafter\ifx\csname ver@WHUthesis.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_WHUthesis.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@WHUthesis.cls\endcsname}
\fi
\expandafter\WHUT@getfileinfo\reserved@a\relax? ? \relax\relax
% -------------------------------------------------------------------------
\def\WHUT@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\WHUTunderline{\@ifnextchar[\WHUT@underline\CTEXunderline}
% -------------------------------------------------------------------------
% �������ĵĻ�����Ϣ�����࣬�ܼ���UDC�����кţ����⣬���ߵȵ�
\newcommand\classification[1]{\def\WHUT@value@classification{#1}}   % �����
\newcommand\confidential[1]{\def\WHUT@value@confidential{#1}}       % �ܼ�
\newcommand\UDC[1]{\def\WHUT@value@UDC{#1}}                         % UDC
\newcommand\serialnumber[1]{\def\WHUT@value@serialnumber{#1}}       % ���
\renewcommand\title[2][\WHUT@value@title]{%                         % ���±��⣨����д��
  \def\WHUT@value@title{#2}
  \def\WHUT@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\WHUT@value@author{#1}}                 % ����
\newcommand\institute[1]{\def\WHUT@value@institute{#1}}             % ���ߵ�λ
\newcommand\advisor[1]{\def\WHUT@value@advisor{#1}}                 % ָ����ʦ
\newcommand\advisortitle[1]{\def\WHUT@value@advisortitle{#1}}       % ָ����ʦ��ְ��
\newcommand\advisorinstitute[1]{\def\WHUT@value@advisorinstitute{#1}}% ָ����ʦ��λ
\newcommand\major[1]{\def\WHUT@value@major{#1}}                     % רҵ
\newcommand\field[1]{\def\WHUT@value@field{#1}}                     % �о�����
\newcommand\defenddate[1]{\def\WHUT@value@defenddate{#1}}           % �������
\newcommand\degree[1]{\def\WHUT@value@degree{#1}}                   % ����ѧλ����
% -------------------------------------------------------------------------------------------
% ���ĵ�Ӣ�İ���Ϣ
\newcommand\englishtitle[1]{\def\WHUT@value@englishtitle{#1}}       % Ӣ�ı���
\newcommand\englishauthor[1]{\def\WHUT@value@englishauthor{#1}}     % ����Ӣ����
\newcommand\englishadvisor[1]{\def\WHUT@value@englishadvisor{#1}}   % ��ʦ��Ӣ����
\newcommand\englishinstitute[1]{\def\WHUT@value@englishinstitute{#1}} % ��ʦ��λ��Ӣ������
\newcommand\englishdate[1]{\def\WHUT@value@englishdate{#1}}         % �������Ӣ��
\newcommand\englishdegree[1]{\def\WHUT@value@englishdegree{#1}}     % ����ѧλ����
\newcommand\englishmajor[1]{\def\WHUT@value@englishmajor{#1}}       % רҵӢ��
% -------------------------------------------------------------------------------------------
% ���ķ���
\renewcommand\maketitle{%
  \pdfbookmark[0]{\WHUT@value@title}{title}
  \cleardoublepagecover
  \thispagestyle{empty}
  \begin{center}
% -------------------------------------------------------------------------------------------
    %\vskip 25mm
    \def\topformat{\fangsong\zihao{-4}}
    \makebox[3.5em][s]{\topformat\WHUT@label@classification}~\WHUTunderline[80pt]{\topformat\WHUT@value@classification}\hfill
    \makebox[3.5em][s]{\topformat\WHUT@label@confidential}~\WHUTunderline[80pt]{\topformat\WHUT@value@confidential}\\
    \makebox[3.5em][s]{\topformat\WHUT@label@UDC}~\WHUTunderline[80pt]{\topformat\WHUT@value@UDC}\hfill
    \makebox[3.5em][s]{\topformat\WHUT@label@serialnumber}~\WHUTunderline[80pt]{\topformat\WHUT@value@serialnumber}
% -------------------------------------------------------------------------------------------
    \vskip 20mm
    \def\institueformat{\songti\zihao{2}}
    \makebox[14em][s]{\institueformat\WHUT@value@school}\\
    \vskip 1em
    \makebox[22em][s]{\institueformat\WHUT@value@degree\WHUT@label@thesis}
% -------------------------------------------------------------------------------------------
    \vskip 25mm
    \def\titleformat{\large\kaishu\zihao{1}}
    {\linespread{1}\selectfont\titleformat\WHUT@value@title}
    \vfill
    \linespread{2}\selectfont
    \def\inforformat{\songti\zihao{4}}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.2}
    \begin{tabular}{ll}%
        \makebox[12em][s]{\inforformat\WHUT@label@author}~��&\hspace{0.5em} {\inforformat\WHUT@value@author}%
        \\
        \makebox[12em][s]{\inforformat\WHUT@label@advisor}~��&\hspace{.5em} {\inforformat\WHUT@value@advisor\quad\WHUT@value@advisortitle}%
        \\
        %%***���Ҫ���븱��ʦ�������Ͳ�Ҫע������Ĳ���
        %%& \hspace{.5em} {\inforformat\WHUT@value@coadvisor\quad\WHUT@value@coadvisortitle}%
        %%\\
        \makebox[12em][s]{\inforformat\WHUT@label@major}~��&\hspace{.5em} {\inforformat\WHUT@value@major}%
        \\
        \makebox[12em][s]{\inforformat\WHUT@label@field}~��&\hspace{.5em} {\inforformat\WHUT@value@field}%
    \end{tabular}%
    \vskip 25mm
    \def\bottomformat{\heiti\zihao{3}}
    \makebox[\textwidth][c]{\bottomformat\WHUT@value@defenddate}%
    \vskip 10mm%
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifWHUT@typeinfo
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Typeset by \LaTeXe{} at \CTEX@todayold \\
        With package \texttt{WHUthesis} \WHUTfileversion{} of C\TeX{}.ORG
      \end{footnotesize}
    \fi
    \cleardoublepagecover
    \thispagestyle{empty}
  \fi
}
%---------------------------------------------------------------------------
% Ӣ�ķ���
\newcommand\makeenglishtitle{%
  \cleardoublepagecover
  \thispagestyle{empty}
  \begin{center}
    \vspace*{20pt}
      \sf\zihao{-1} \WHUT@value@englishtitle
    \vskip \stretch{1}
      \bf\zihao{4} \WHUT@value@englishauthor
    \vskip \stretch{1}
      \normalfont\zihao{4} \WHUT@label@englishadvisor
    \vskip 3pt
      \normalfont\zihao{4} \WHUT@value@englishadvisor
    \vskip \stretch{1}
      \includegraphics[width=.25\textwidth]{figures/whu_logo.pdf}
    \vskip \stretch{1}
      \normalfont\normalsize \WHUT@value@englishinstitute
    \vskip 30pt
      \normalfont\normalsize \WHUT@value@englishdate
    \vskip 20pt
      \it\normalsize \WHUT@label@englishstatement
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepagecover
    \thispagestyle{empty}
  \fi
}

% ---------------------------------------------------------------------
%% ֣������ҳ
%%
\newcommand\makeclaim{
  \chapter*{\WHUT@value@claimtitle}
  \vskip 15mm
  \linespread{2}\selectfont\songti\zihao{-4}\WHUT@value@claim
  \vskip 20mm
  \linespread{1.4}\selectfont%�����о�Ӧ������Ϊ1.4
  \hfill\WHUT@value@claimsign
  \vskip 1em
  \hfill\WHUT@value@claimdate
  \thispagestyle{empty}
  \cleardoublepagecover
}
% --------------------------------------------------------------------
%% ѧλ����ʹ����Ȩ��
%%
\newcommand\makeauth{
\chapter*{\WHUT@value@authtitle}
  \vskip 15mm
  \linespread{2}\selectfont\songti\zihao{-4}\WHUT@value@auth
  \thispagestyle{empty}
  \cleardoublepagecover
}
% ---------------------------------------------------------------
%% ���µ�
\newenvironment{novelty}{
  \chapter*{\WHUT@value@noveltitle}
  \thispagestyle{empty}
}{\thispagestyle{empty}
  \cleardoublepagecover
  \pagenumbering{Roman}
  \setcounter{page}{1}}

%% ҳüҳ������
\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[C]{\songti\zihao{5}{~\thepage~}}
}

\pagestyle{fancy}
    \fancyhf{}
    \fancyfoot[C]{\songti\zihao{5}{~\thepage~}}
    \renewcommand{\headrulewidth}{0pt}%
%% ժҪ����
% ����ժҪ
\newenvironment{abstract}
  {\Nchapter{\WHUT@label@abstract}
   \pagenumbering{Roman}
   \setcounter{page}{1}}
  {}
\newcommand\keywords[1]{%
  \vspace{2ex}\noindent{\heiti \WHUT@label@keywords} #1}
% Ӣ��ժҪ
\newenvironment{englishabstract}
  {\Nchapter{\WHUT@label@englishabstract}}
  {}
\newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf \WHUT@label@englishkeywords} #1}
% ����Ŀ¼
%\renewcommand\tableofcontents{%
%    \if@twocolumn
%      \@restonecoltrue\onecolumn
%    \else
%      \@restonecolfalse
%    \fi
%    \Nchapter{\contentsname}%
%    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
%    \@starttoc{toc}%
%    \if@restonecol\twocolumn\fi
%    }
%\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

\newcommand\Nchapter[1]{%
  \if@mainmatter%
    \@mainmatterfalse%
    \chapter{#1}%
    \@mainmattertrue%
  \else
    \chapter{#1}%
  \fi}
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1
       \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}
       \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 0.1ex \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
%% �ο���������
\renewenvironment{thebibliography}[1]
     {\Nchapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \small
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
%  ��������
\newenvironment{publications}[1]
     {\Nchapter{\WHUT@label@publications}%
      \@mkboth{\MakeUppercase\WHUT@label@publications}
              {\MakeUppercase\WHUT@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%d
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}
%% ����ҳ������
\newenvironment{resume}
  {\Nchapter{\WHUT@label@resume}}
  {}
\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
  {\endlist}
\newenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
  {\endlist}

%% ��л����
\renewenvironment{thanks}
  {\Nchapter{\WHUT@label@thanks}}
  {}
\setcounter{secnumdepth}{4}
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\endinput
%%
%% End of file `WHUthesis.cls'.