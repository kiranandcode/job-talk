import LeanTeX
import JobTalk.ImplementationRepair.Challenges

@[presentation]
def challengesSlide2 := mkChallengesSlide 1

#latex_preamble[|
\newcommand{\lst}{\mathit{\ell}}
\newcommand{\pts}{\mapsto}
\newcommand{\acc}{\mathit{acc}}
\newcommand{\tl}{\mathit{tl}}
% \newcommand{\hd}{\mathit{hd}}
|]

#latex_slide "Choosing an Invariant" do

#latex_slide [fragile] "Choosing an Invariant" do
  latex![|
  \color{black}
  \begin{center}
      \begin{minipage}[p]{0.45\linewidth}
\vspace{-10em}
        \fontsize{4}{4}\selectfont{
\begin{minted}[fontsize=\fontsize{8}{8}\selectfont,escapeinside=@@]{coq}
...
xlet idx.
@\tikzmark{gencanxapps}@xapp (fold_left_spec idx rest
(fun acc t => 
  @\tikzmark{gencanholes}@(??)@\tikzmark{gencanholee}@  )).                     @\tikzmark{gencanxappe}@
...
\end{minted}
        }
      \end{minipage}
  \end{center}
  |]


#latex_slide [fragile] "Choosing an Invariant" do
   latex![|
  \color{black}
  \begin{center}
    \begin{tikzpicture}[overlay, remember picture]

      \draw<2-3>[fill=primary3!10, fill opacity=0.4, rounded corners=2pt, draw=none]
      ($(pic cs:gencanxapps) + (-0.125, -0.75)$) rectangle ($(pic cs:gencanxappe) + (0.125, 0.8)$);
      \draw<4->[fill=primary3!10, fill opacity=0.4, rounded corners=2pt, draw=none]
      ($(pic cs:gencanxapps) + (-0.125, -0.75)$) rectangle ($(pic cs:gencanxappe) + (-0.25, 0.8)$);


      \draw<2->[fill=primary3!80!black, fill opacity=0.2, rounded corners=2pt, draw=none]
      ($(pic cs:gencanholes) + (-0.07125, -0.2)$) rectangle ($(pic cs:gencanholee) + (0.125, 0.35)$);

      \draw<9->[fill=ACMDarkBlue!60, rounded corners=2pt, draw=none]
      ($(pic cs:gencantparams) + (-0.125, -0.125)$) rectangle ($(pic cs:gencantparame) + (0.125, 0.35)$);

    \end{tikzpicture}
      \begin{minipage}[p]{0.45\linewidth}
\vspace{-10em}
        \fontsize{4}{4}\selectfont{
\begin{minted}[fontsize=\fontsize{8}{8}\selectfont,escapeinside=@@]{coq}
...
xlet idx.
@\tikzmark{gencanxapps}@xapp (fold_left_spec idx rest
(fun acc @\tikzmark{gencantparams}@t@\tikzmark{gencantparame}@ => 
  @\tikzmark{gencanholes}@(??)@\tikzmark{gencanholee}@  )).                     @\tikzmark{gencanxappe}@
...
\end{minted}
        }
      \end{minipage}

\begin{tikzpicture}[overlay, remember picture]
\node (newinv1) at (-4.0, -1.0) {
\begin{minipage}{0.48\linewidth}
\begin{minted}[escapeinside=@@,fontsize=\footnotesize]{ocaml}
(fun acc t => a @$\pts$@
   @$\texttt{Array}$@ (repeat (acc + 1) init ++
          drop (acc + 1) @$\lst$@))
\end{minted}
\end{minipage}
};

      \node (newinv2) at (4.0, -1.0) {
   \begin{minipage}{0.48\linewidth}
\begin{minted}[escapeinside=@@,fontsize=\footnotesize]{ocaml}
(fun acc t => a @$\pts$@
   @$\texttt{Array}$@ ([] ++ drop 0
    (repeat (length t) init)))
\end{minted}
    \end{minipage}};
      \draw<3->[draw=ACMDarkBlue!80, dashed, line width=0.5mm, >=stealth, ->]
      (newinv1) -- ($(pic cs:gencanxapps) + (1.25, -0.75)$);
      \draw<4->[draw=ACMDarkBlue!80, dashed, line width=0.5mm, >=stealth, ->]
      ($(newinv2) + (-2.25,0.85)$) -- ($(pic cs:gencanxapps) + (3.25, -0.75)$);
      \node<5-10> at ($(pic cs:gencanxapps) + (2.25, -1.5)$) {\color{ACMDarkBlue!80!black}\fontsize{14}{14}\selectfont{\textbf{Which one?}}};

      \node<6-7> at ($(newinv2) + (0.0, 3.0)$) {\color{ACMDarkBlue!80!black}\fontsize{12}{12}\selectfont{Validate using SMT?}};
      \node<7>[rotate=10] at ($(newinv2) + (0.0, 2.0)$) {\color{red!80!black}\fontsize{12}{12}\selectfont{\textbf{Too slow!}}};
      \node<8-9> at ($(newinv2) + (0.0, 3.0)$) {\color{ACMDarkBlue!80!black}\fontsize{10}{10}\selectfont{{If only we could \textit{test}...}}};
      % \node<9-10> at ($(newinv2) + (0.5, 2.0)$) {\color{ACMDarkBlue!80!black}\fontsize{10}{10}\selectfont{\ie \textit{dynamically} check if maintained.}};

      \node<9->[text width=10em, align=center] (deponlogic) at ($(newinv2) + (1.0, 4.0)$) {\fontsize{12}{12}\selectfont{Depends on\\logical parameters!}};
      \path<9->[draw=black, >=stealth, <-, line width=0.5mm]
      ($(pic cs:gencantparams) + (0.25, 0.45)$) to[in=165, out=25] (deponlogic);

      \draw<10>[draw=none, rounded corners=2pt, fill=white, fill opacity=0.8, line width=0.5mm]
      ($(-6.0,2.0)$) rectangle ++(12.0,-4.0) ;

      \draw<10>[draw=black, dashed, fill=ACMBlue!20!white, line width=0.5mm]
      ($(-4.0,1.0)$) rectangle ++(6.0,-1.0) ;
      \draw<10>[draw=black, fill=none, line width=0.5mm]  ($(-4.0,1.0)$) rectangle ++(8.0,-1.0) ;
      \node<10>[draw=none, fill=none, line width=0.5mm]  at ($(-4.0,1.0) + (3.0,-0.5)$) {\fontsize{20}{20}\selectfont{$t$}};


    \end{tikzpicture}
  \end{center}
|]


#latex_slide [fragile] "Choosing an Invariant" do
  latex![|
  \color{black}
  \begin{center}
    \begin{tikzpicture}[overlay, remember picture]

      \draw<2->[fill=primary3!10, rounded corners=2pt, draw=none]
      ($(pic cs:gencanzoomfoldfoldlefts) + (-0.07125, -0.2)$) rectangle ($(pic cs:gencanzoomfoldfoldlefte) + (0.125, 0.35)$);

    \end{tikzpicture}
      \begin{minipage}[p]{0.45\linewidth}
\vspace{-10em}
        \fontsize{4}{4}\selectfont{
\begin{minted}[fontsize=\fontsize{8}{8}\selectfont,escapeinside=@@]{coq}
...
xlet idx.
@\tikzmark{gencanzoomfoldxapps}@xapp (@\tikzmark{gencanzoomfoldfoldlefts}@fold_left_spec@\tikzmark{gencanzoomfoldfoldlefte}@ idx rest
(fun acc t => 
  @\tikzmark{gencanzoomfoldholes}@(??)@\tikzmark{gencanzoomfoldholee}@  )).                     @\tikzmark{gencanzoomfoldxappe}@
...
\end{minted}
        }
      \end{minipage}
  \end{center}
  |]


#latex_slide [fragile] "Verified Fold Left" do
 latex![|
  \color{black}
  \begin{tikzpicture}[remember picture, overlay, highlight/.style={fill=primary1, draw=none, fill opacity=0.25}]
    \draw<2>[highlight] ($(pic cs:tcis0s) + (0.0, 0.35)$) rectangle ($(pic cs:tcis0e) + (0.0, -0.15)$);

    \draw<10>[highlight] ($(pic cs:tcis1s) + (-0.125, 0.35)$) rectangle ($(pic cs:tcis1e) + (0.125, -0.15)$);
    \draw<10>[highlight] ($(pic cs:tcis2s) + (-0.125, 0.35)$) rectangle ($(pic cs:tcis2e) + (0.125, -0.15)$);
    \draw<10>[highlight] ($(pic cs:tcis3s) + (-0.125, 0.35)$) rectangle ($(pic cs:tcis3e) + (0.125, -0.15)$);
    \draw<10>[highlight] ($(pic cs:tcis4s) + (-0.125, 0.35)$) rectangle ($(pic cs:tcis4e) + (0.125, -0.15)$);
    \draw<10>[highlight] ($(pic cs:tcis5s) + (-0.125, 0.35)$) rectangle ($(pic cs:tcis5e) + (0.125, -0.15)$);

  \end{tikzpicture}
  \begin{center}
\vspace{-2em}
    \begin{minipage}[p]{0.45\linewidth}
\begin{minted}[escapeinside=@@]{coq}
let fold_left f acc ls @\tikzmark{tcis0s}{\color{ACMDarkBlue}$t$}\tikzmark{tcis0e}@ @\tikzmark{tcis0Is}{\color{ACMDarkBlue}$I$}\tikzmark{tcis0Ie}@ =
  @\tikzmark{tcis1s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc \!\quad\! t\}$}\tikzmark{tcis1e}@
  match ls with
  | [] ->
    @\tikzmark{tcis2s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc \!\quad\! t\}$}\tikzmark{tcis2e}@
    acc
  | h :: tl ->
    @\tikzmark{tcis3s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc \!\quad\! t\}$}\tikzmark{tcis3e}@   
    let acc' = f acc h in
    @\tikzmark{tcis4s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc' \!\quad\! (t +\!\!+ [h])\}$}\tikzmark{tcis4e}@
    fold_left f acc' tl
    @\tikzmark{tcis5s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc'' \!\quad\! (t +\!\!+ [h] +\!\!+ \tl)\}$}\tikzmark{tcis5e}@
\end{minted}
    \end{minipage}
  \end{center}
  \begin{tikzpicture}[remember picture, overlay, highlight/.style={fill=primary1, draw=none, fill opacity=0.25}]
    % \node<2-3>[fill=white,draw=none,rotate=-5] at ($(pic cs:tcis1s) + (7.5, 0.35)$) {\color{ACMDarkBlue!80}{\fontsize{14}{14}\selectfont{\textit{No mention of $t$}}}};
    % \node<3>[fill=white,draw=none] at ($(pic cs:tcis1s) + (7.5, -1.0)$) {{\fontsize{14}{14}\selectfont{\textit{..but consider the proof!}}}};

    \draw<1-2>[fill=white,draw=none] ($(pic cs:tcis0s) + (0.0, 0.35)$) rectangle ($(pic cs:tcis0e) + (0.0, -0.15)$);
    \node<2>[highlight, text opacity=1.0,draw=none] at ($(pic cs:tcis0s) + (0.1, 0.2)$) {\color{ACMDarkBlue}\fontsize{20}{20}\selectfont{$t$}};
    \draw<1-2>[fill=white,draw=none] ($(pic cs:tcis0Is) + (0.0, 0.35)$) rectangle ($(pic cs:tcis0Ie) + (0.0, -0.15)$);
    % \draw<1-2>[fill=white,draw=none] ($(pic cs:tcis6s) + (0.0, 0.35)$) rectangle ($(pic cs:tcis6e) + (0.0, -0.15)$);
    % \draw<1-2>[fill=white,draw=none] ($(pic cs:tcis6Is) + (0.0, 0.35)$) rectangle ($(pic cs:tcis6Ie) + (0.0, -0.15)$);

    \draw<1-3>[fill=white,draw=none] ($(pic cs:tcis1s) + (0.0, 0.35)$) rectangle ($(pic cs:tcis1e) + (0.0, -0.15)$);
    \draw<1-4>[fill=white,draw=none] ($(pic cs:tcis2s) + (0.0, 0.35)$) rectangle ($(pic cs:tcis2e) + (0.0, -0.15)$);
    \draw<1-5>[fill=white,draw=none] ($(pic cs:tcis3s) + (0.0, 0.35)$) rectangle ($(pic cs:tcis3e) + (0.0, -0.15)$);
    \draw<1-6>[fill=white,draw=none] ($(pic cs:tcis4s) + (0.0, 0.35)$) rectangle ($(pic cs:tcis4e) + (0.0, -0.15)$);
    \draw<1-7>[fill=white,draw=none] ($(pic cs:tcis5s) + (0.0, 0.35)$) rectangle ($(pic cs:tcis5e) + (0.0, -0.15)$);
    \draw<9>[line width=0.5mm, decorate,decoration={brace,amplitude=5pt}]
      ($(10.0, 6.0)$) -- ($(10.0, 1.0)$)
      node[midway, right, xshift=1em, text width=10em, align=center] {Describes \textbf{exactly} how $I$ is maintained};
    \draw<10>[fill=none,draw=none] (0,0) -- (0,0);
    % \node<10>[rotate=-5] at ($(12.5, 1.5)$) {\color{ACMDarkBlue}{\fontsize{12}{12}\selectfont{\textbf{Proof-Driven Testing}}}};

  \end{tikzpicture}
  |]

#latex_slide [fragile] "Verified Fold Left"  do
  latex![|
  \color{black}
  \begin{tikzpicture}[remember picture, overlay, highlight/.style={fill=primary1, draw=none, fill opacity=0.25}]
    % \draw<2>[highlight] ($(pic cs:tcis0s) + (0.0, 0.35)$) rectangle ($(pic cs:tcis0e) + (0.0, -0.15)$);
    \draw<1->[highlight] ($(pic cs:ilyaassert1s) + (-0.125, 0.35)$) rectangle ($(pic cs:ilyaassert1e) + (0.125, -0.15)$);
    \draw<1->[highlight] ($(pic cs:ilyaassert2s) + (-0.125, 0.35)$) rectangle ($(pic cs:ilyaassert2e) + (0.125, -0.15)$);
    \draw<1->[highlight] ($(pic cs:ilyaassert3s) + (-0.125, 0.35)$) rectangle ($(pic cs:ilyaassert3e) + (0.125, -0.15)$);
    \draw<1->[highlight] ($(pic cs:ilyaassert4s) + (-0.125, 0.35)$) rectangle ($(pic cs:ilyaassert4e) + (0.125, -0.15)$);
    \draw<1->[highlight] ($(pic cs:ilyaassert5s) + (-0.125, 0.35)$) rectangle ($(pic cs:ilyaassert5e) + (0.125, -0.15)$);
  \end{tikzpicture}
  \begin{center}
\vspace{-2em}
    \begin{minipage}[p]{0.45\linewidth}
\begin{minted}[escapeinside=@@]{coq}
let fold_left f acc ls @ {\color{ACMDarkBlue}$t$} @ @ {\color{ACMDarkBlue}$I$} @ =
  @\tikzmark{ilyaassert1s}@assert @\color{ACMDarkBlue}{$\{I \!\quad\! \acc \!\quad\! t\}$}@@\tikzmark{ilyaassert1e}@
  match ls with
  | [] ->
    @\tikzmark{ilyaassert2s}@assert @\color{ACMDarkBlue}{$\{I \!\quad\! \acc \!\quad\! t\}$}@@\tikzmark{ilyaassert2e}@
    acc
  | h :: tl ->
    @\tikzmark{ilyaassert3s}@assert @\color{ACMDarkBlue}{$\{I \!\quad\! \acc \!\quad\! t\}$}@@\tikzmark{ilyaassert3e}@
    let acc' = f acc h in
    @\tikzmark{ilyaassert4s}@assert @\color{ACMDarkBlue}{$\{I \!\quad\! \acc' \!\quad\! (t +\!\!+ [h])\}$}@@\tikzmark{ilyaassert4e}@
    fold_left f acc' tl
    @\tikzmark{ilyaassert5s}@assert @\color{ACMDarkBlue}{$\{I \!\quad\! \acc'' \!\quad\! (t +\!\!+ [h] +\!\!+ \tl)\}$}@@\tikzmark{ilyaassert5e}@
\end{minted}
    \end{minipage}
  \begin{tikzpicture}[remember picture, overlay]
    % \node<2-3>[fill=white,draw=none,rotate=-5] at ($(pic cs:tcis1s) + (7.5, 0.35)$) {\color{ACMDarkBlue!80}{\fontsize{14}{14}\selectfont{\textit{No mention of $t$}}}};
    % \node<3>[fill=white,draw=none] at ($(pic cs:tcis1s) + (7.5, -1.0)$) {{\fontsize{14}{14}\selectfont{\textit{..but consider the proof!}}}};

    % \draw<1->[line width=0.5mm, decorate,decoration={brace,amplitude=5pt}]
    %   ($(10.0, 6.0)$) -- ($(10.0, 1.0)$)
    %   node[midway, right, xshift=1em, text width=10em, align=center] {Describes \textbf{exactly} how $I$ is maintained};

    % \node<2>[rotate=-5] at ($(12.5, 1.5)$) {\color{ACMDarkBlue}{\fontsize{12}{12}\selectfont{\textbf{Proof-Driven Testing}}}};


    \draw<2>[fill=white, fill opacity=0.9, draw=none, rounded corners=2pt]  ($(-3.0, 0.0) + (-5.0, -3.0)$) rectangle ($(-3.0, 0.0) + (5.0, 3.0)$);


    \node<2>[fill=white, fill opacity=0.9, draw=none, rounded corners=2pt] at ($(-3.0, 0.0)$) {\color{ACMDarkBlue}{\fontsize{34}{34}\selectfont{\textbf{Proof-Driven Testing}}}};

  \end{tikzpicture}
  \end{center}
  |]

#latex_slide ["fragile"] "Proof-Driven Testing" do
   latex![|
   \color{black}
  \begin{center}
    \begin{tikzpicture}[overlay, remember picture]
      \node<+> at (0.0, 0.0) {\fontsize{13}{13}\selectfont{$\texttt{fold\_left\_spec}$}};

      \draw<.(2)>[fill=primary1!20,rounded corners=2pt, draw=none] (1.1250, 0.5) rectangle (3.15, -0.5);
      \node<.(2)-.(4)> at (-0.5, 1.75) {\fontsize{13}{13}\selectfont{\color{ACMDarkBlue}{\textit{Instantiate with concrete arguments..}}}};

      \draw<.(3)-.(4)>[fill=primary1!20,rounded corners=2pt, draw=none] (0.7, 0.5) rectangle (1.125, -0.5);
      % \draw<.(3)-.(4)>[fill=primary1!20,rounded corners=2pt, draw=none] (2.625, 0.5) rectangle (3.625, -0.5);
      \node<.(4)> at (0.5, -1.75) {\fontsize{13}{13}\selectfont{\color{ACMDarkBlue}{\textit{...with existentials for proof arguments}}}};


      \node<+-.(5)> at (0.0, 0.0) {\fontsize{13}{13}\selectfont{$\texttt{fold\_left\_spec} ~~ ?I ~~ f ~~ 2 ~~ [2;1]$}};
      \node<+(4)-> at (0.0, 2.0) {\fontsize{13}{13}\selectfont{$\texttt{fold\_left\_spec} ~~ ?I ~~ f ~~ 2 ~~ [2;1]$}};

      \draw<.(5)>[line width=0.5mm, draw=black,>=stealth,->] (0.0, 1.75) -- (0.0, 0.3);
      \node<+(4)>[fill=white] at (0.0, 1.0) {\fontsize{13}{13}\selectfont{\textbf{reduce proof term}}};

      % \draw<.(6)>[line width=0.5mm, draw=black,>=stealth,->] (0.0, -0.25) -- (0.0, -1.75);
      % \node<.(6)>[fill=white] at (0.0, -1.0) {\fontsize{13}{13}\selectfont{\textbf{custom proof extraction}}};

      % \node<+(4)-.(6)>[fill=white] at (0.0, 0.0) {\fontsize{13}{13}\selectfont{\mintinline{coq}{(* ...reduced proof term... *)}}};
    \end{tikzpicture}
  \end{center}
  |]

#latex_slide [fragile] "Proof-Driven Testing" do
  latex![|
  \color{black}
  \begin{center}
\vspace{-2em}
\fontsize{10}{10}\selectfont{
  \begin{minipage}[p]{0.45\linewidth}
\begin{minted}[fontsize=\fontsize{10}{10}\selectfont,escapeinside=@@]{coq}
let fold_left f acc ls @\tikzmark{tcisunused10s}{\color{ACMDarkBlue}$t$}\tikzmark{tcisunused10e}@ =
  @\tikzmark{tcisunused11s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc \!\quad\! t\}$}\tikzmark{tcisunused11e}@
  match ls with
  | [] ->
    @\tikzmark{tcisunused12s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc \!\quad\! t\}$}\tikzmark{tcisunused12e}@
    acc
  | h :: tl ->
    @\tikzmark{tcisunused13s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc \!\quad\! t\}$}\tikzmark{tcisunused13e}@   
    let acc' = f acc h in
    @\tikzmark{tcisunused14s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc' \!\quad\! (t +\!\!+ [h])\}$}\tikzmark{tcisunused14e}@
    fold_left f acc' tl
    @\tikzmark{tcisunused15s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc'' \!\quad\! (t +\!\!+ [h] +\!\!+ \tl)\}$}\tikzmark{tcisunused15e}@
\end{minted}
    \end{minipage}}
  \end{center}
  |]

#latex_slide[fragile] "Proof-Driven Testing" do
  latex![|
  \color{black}
  \begin{center}
\vspace{-2em}
\fontsize{10}{10}\selectfont{\begin{minipage}[p]{0.45\linewidth}
\begin{minted}[fontsize=\fontsize{10}{10}\selectfont,escapeinside=@@]{coq}
let fold_left f acc ls @\tikzmark{tcisunused20s}{\color{ACMDarkBlue}$t$}\tikzmark{tcisunused20e}@ =
  @\tikzmark{tcisunused21s}\color{ACMDarkBlue}{$\{I \!\quad\!{\color{red} 2 }\!\quad\! {\color{red}[]}\}$}\tikzmark{tcisunused21e}@
  match ls with
  | [] ->
    @\tikzmark{tcisunused22s}\color{ACMDarkBlue}{$\{I \!\quad\! {\color{red}2} \!\quad\! {\color{red}[]}\}$}\tikzmark{tcisunused22e}@
    acc
  | 2 :: [1] ->
    @\tikzmark{tcisunused23s}\color{ACMDarkBlue}{$\{I \!\quad\! {\color{red}2} \!\quad\! {\color{red}[]}\}$}\tikzmark{tcisunused23e}@   
    let acc' = f 2 2 in
    @\tikzmark{tcisunused24s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc' \!\quad\! {\color{red}[2]}\}$}\tikzmark{tcisunused24e}@
    fold_left f acc' tl
    @\tikzmark{tcisunused25s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc'' \!\quad\! {\color{red}[2,1]}\}$}\tikzmark{tcisunused25e}@
\end{minted}
    \end{minipage}}
  \end{center}
  |]

#latex_slide[fragile] "Proof-Driven Testing" do
  latex![|
  \color{black}
  \begin{center}
    \begin{tikzpicture}[overlay, remember picture]
      \node<1-> at (0.0, 2.0) {\fontsize{13}{13}\selectfont{$\texttt{fold\_left\_spec} ~~ ?I ~~ f ~~ 2 ~~ [2;1]$}};

      \draw<1->[line width=0.5mm, draw=black,>=stealth,->] (0.0, 1.75) -- (0.0, 0.3);
      \node<1->[fill=white] at (0.0, 1.0) {\fontsize{13}{13}\selectfont{\textbf{reduce proof term}}};
      \node<1->[fill=white] at (0.0, 0.0) {\fontsize{13}{13}\selectfont{\mintinline{coq}{(* ...reduced proof term... *)}}};


      \draw<2->[line width=0.5mm, draw=black,>=stealth,->] (0.0, -0.25) -- (0.0, -1.75);
      \node<2->[fill=white] at (0.0, -1.0) {\fontsize{13}{13}\selectfont{\textbf{custom proof extraction}}};

    \end{tikzpicture}
  \end{center}
  |]

#latex_slide[fragile] "Proof-Driven Testing" do
  latex![|
  \color{black}
  \begin{center}
\vspace{-2em}
\fontsize{10}{10}\selectfont{\begin{minipage}[p]{0.45\linewidth}
\begin{minted}[fontsize=\fontsize{10}{10}\selectfont,escapeinside=@@]{coq}
let fold_left f acc ls =
  @\tikzmark{tcisunused31s}\color{ACMDarkBlue}{$\{I \!\quad\!{\color{red} 2 }\!\quad\! {\color{red}[]}\}$}\tikzmark{tcisunused31e}@
  match ls with
  | [] ->
    @\tikzmark{tcisunused32s}\color{ACMDarkBlue}{$\{I \!\quad\! {\color{red}2} \!\quad\! {\color{red}[]}\}$}\tikzmark{tcisunused32e}@
    acc
  | 2 :: [1] ->
    @\tikzmark{tcisunused33s}\color{ACMDarkBlue}{$\{I \!\quad\! {\color{red}2} \!\quad\! {\color{red}[]}\}$}\tikzmark{tcisunused33e}@   
    let acc' = f 2 2 in
    @\tikzmark{tcisunused34s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc' \!\quad\! {\color{red}[2]}\}$}\tikzmark{tcisunused34e}@
    fold_left f acc' tl
    @\tikzmark{tcisunused35s}\color{ACMDarkBlue}{$\{I \!\quad\! \acc'' \!\quad\! {\color{red}[2,1]}\}$}\tikzmark{tcisunused35e}@
\end{minted}
    \end{minipage}}
  \end{center}
  |]

#latex_slide[fragile] "Proof-Driven Testing" do
  latex![|
  \color{black}
  \begin{center}
    \begin{tikzpicture}[overlay, remember picture]

      \draw<2>[line width=0.5mm, decorate,decoration={brace,amplitude=5pt}]
      ($(pic cs:testfunstart) + (0.25, 0.5)$) -- ($(pic cs:testfunend) + (0.25, -0.0)$)
      node[midway, right, xshift=1em, text width=10em, align=center] {Simulates concrete run of \mintinline{ocaml}{List.fold_left}};

      \node<3-4> at (-0.5, 1.0)
      {\fontsize{13}{13}\selectfont{\color{ACMDarkBlue}\textit{
          Instantiate $I$ with embedding of candidate invariant...
        }}};

      \node<4> at (0.5, -4.0)
      {\fontsize{13}{13}\selectfont{\color{ACMDarkBlue}\textit{
          ...prune candidate if assertion raised.
        }}};

    \end{tikzpicture}

    \begin{minipage}[p]{0.45\linewidth}
\begin{minted}[escapeinside=@@]{ocaml}
assert (@$I$@ len []);    @\tikzmark{testfunstart}@
let acc = f len 2 in
assert (@$I$@ acc [2]);
let acc = f acc 1 in
assert (@$I$@ acc [2; 1]);
()                    @\tikzmark{testfunend}@
\end{minted}
      \end{minipage}
    \end{center}
  |]

#latex_preamble[|\newcommand{\cxmark}{\ding{55}}|]


#latex_slide [fragile] "Testing Candidate Invariants" do
  latex![|
  \color{black}
  \begin{center}
    \begin{tikzpicture}[overlay, remember picture]

      % \draw<2->[fill=primary3!10, rounded corners=2pt, draw=none]
      % ($(pic cs:gencanxapps) + (-0.125, -0.75)$) rectangle ($(pic cs:gencanxappe) + (0.125, 0.8)$);
      % \draw<10-11>[fill=ACMDarkBlue!60, rounded corners=2pt, draw=none]
      % ($(pic cs:gencantparams) + (-0.125, -0.125)$) rectangle ($(pic cs:gencantparame) + (0.125, 0.35)$);

    \end{tikzpicture}
      \begin{minipage}[p]{0.45\linewidth}
\vspace{-10em}
        \fontsize{4}{4}\selectfont{
\begin{minted}[fontsize=\fontsize{8}{8}\selectfont,escapeinside=@@]{coq}
...
xlet idx.
@\tikzmark{gencanxapps}@xapp (fold_left_spec idx rest
(fun acc @\tikzmark{gencantparams}@t@\tikzmark{gencantparame}@ => 
 (??))).                     @\tikzmark{gencanxappe}@
...
\end{minted}
        }
      \end{minipage}

\begin{tikzpicture}[overlay, remember picture]
\node (newinv1) at (-4.0, -1.0) {
\begin{minipage}{0.48\linewidth}
\begin{minted}[escapeinside=@@,fontsize=\footnotesize]{ocaml}
(fun acc t => a @$\pts$@
   @$\texttt{Array}$@ (repeat (acc + 1) init ++
          drop (acc + 1) @$\lst$@))
\end{minted}
\end{minipage}
};

      \node (newinv2) at (4.0, -1.0) {
   \begin{minipage}{0.48\linewidth}
\begin{minted}[escapeinside=@@,fontsize=\footnotesize]{ocaml}
(fun acc t => a @$\pts$@
   @$\texttt{Array}$@ ([] ++ drop 0
    (repeat (length t) init)))
\end{minted}
    \end{minipage}};
      \draw<1->[draw=ACMDarkBlue!80, dashed, line width=0.5mm, >=stealth, ->]
      (newinv1) -- ($(pic cs:gencanxapps) + (1.25, -0.75)$);
      \draw<1->[draw=ACMDarkBlue!80, dashed, line width=0.5mm, >=stealth, ->]
      ($(newinv2) + (-2.25,0.85)$) -- ($(pic cs:gencanxapps) + (3.25, -0.75)$);
      \node<2-> at ($(newinv1) + (-2.25,0.85)$) {\color{ACMGreen!80!black}{\fontsize{40}{40}\selectfont{$\checkmark$}}};
      \node<3-> at ($(newinv2) + (-2.25,0.85)$) {\color{ACMRed!80!black}{\fontsize{40}{40}\selectfont{\cxmark}}};
    \end{tikzpicture}
  \end{center}
  |]
