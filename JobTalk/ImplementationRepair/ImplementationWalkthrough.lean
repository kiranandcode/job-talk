import LeanTeX

#latex_slide [fragile] do
  latex![|
  \begin{center}
  \color{black}
    \begin{tikzpicture}[overlay, remember picture, highlight/.style={fill=primary1!20}]
      % \draw<2>[highlight]
      % ($(pic cs:describeimpl1s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl1e) + (0.125, -0.125)$);      

      % \draw<3>[highlight]
      % ($(pic cs:describeimpl2s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl2e) + (0.125, -0.125)$);      

      % \draw<4>[highlight]
      % ($(pic cs:describeimpl3s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl3e) + (0.125, -0.125)$);      

      % \draw<5>[highlight]
      % ($(pic cs:describeimpl4s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl4e) + (0.125, -0.125)$);      

      % \draw<6>[highlight]
      % ($(pic cs:describeimpl5s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl5e) + (0.125, -0.125)$);      

      % \draw<7>[highlight]
      % ($(pic cs:describeimpl6s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl6e) + (0.125, -0.125)$);      

      % \draw<8>[highlight]
      % ($(pic cs:describeimpl7s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl7e) + (0.125, -0.125)$);      

      % \draw<9>[highlight]
      % ($(pic cs:describeimpl8s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl8e) + (0.125, -0.125)$);      
    \end{tikzpicture}
    \begin{minipage}[p]{0.5\linewidth}
\begin{minted}[escapeinside=@@]{ocaml}
let to_array s =
  @\tikzmark{describeimpl1s}@match s () with@\tikzmark{describeimpl1e}@
  | @\tikzmark{describeimpl2s}@Nil -> @\tikzmark{describeimpl2.1s}@[||]@\tikzmark{describeimpl2e}@
  | @\tikzmark{describeimpl3s}@Cons (h, _) ->@\tikzmark{describeimpl3e}@
    @\tikzmark{describeimpl4s}@let sz = length s in@\tikzmark{describeimpl4e}@
    @\tikzmark{describeimpl5s}@let a = make sz h in@\tikzmark{describeimpl5e}@
    @\tikzmark{describeimpl6s}@iteri (fun i vl -> 

       @\tikzmark{describeimpl7s}@a.(i) <- vl@\tikzmark{describeimpl7e}@

    ) s;                            @\tikzmark{describeimpl6e}@
    @\tikzmark{describeimpl8s}@a@\tikzmark{describeimpl8e}@                             @\tikzmark{describeimplstop}@
\end{minted}
    \end{minipage}    
\begin{tikzpicture}[overlay, remember picture, hide/.style={fill=white,draw=none}]
  \draw<1>[hide]
      ($(pic cs:describeimpl1s) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  
  \draw<2>[hide]
      ($(pic cs:describeimpl2s) + (-1.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  
  
  \draw<3-4>[hide]
      ($(pic cs:describeimpl3s) + (-1.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  
  \draw<3>[hide]
      ($(pic cs:describeimpl2.1s) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  

  \draw<5>[hide]
      ($(pic cs:describeimpl4s) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  

  \draw<6>[hide]
      ($(pic cs:describeimpl5s) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  

  \draw<7>[hide]
      ($(pic cs:describeimpl6s) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  

  \draw<8>[hide]
      ($(pic cs:describeimpl8s) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  

  \draw<9>[hide]
      ($(pic cs:describeimplstop) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  


\end{tikzpicture}
  \end{center}
  |]


#latex_slide  do
  latex![|
  \begin{center}
    \begin{tikzpicture}[overlay]
      \node<1> at (0.0, 1.0) {\fontsize{20}{18}\selectfont{Let's write a verified program!}};
      \node<2> at (0.0, 1.0) {\fontsize{20}{18}\selectfont{Let's write a \textbf{verified} program!}};
      % \node<2> at (0.0, -1.0) {\fontsize{20}{20}\selectfont{$\{ \text{lseg}(x,S) \} \quad \texttt{listfree}(x) \quad \{ \text{emp}\}$}};
      \node at (0.0, -1.0) {\fontsize{20}{18}\selectfont{\textbf{Q:} Convert a sequence to an array.}};
    \end{tikzpicture}
  \end{center}
  |]

#latex_slide do
  latex![|
  \begin{center}
    \begin{tikzpicture}[overlay, remember picture]
      \node<1-> at (0.0, 2.0) {\fontsize{20}{18}\selectfont{\textbf{Q:} Convert a sequence to an array.}};

      \draw<3>[fill=ACMPurple!10, rounded corners,draw=none]
      ($(pic cs:sintro-s1-start) + (0.0, -0.25)$) rectangle ($(pic cs:sintro-s1-end) + (0.0, 0.5)$);

      \coordinate (pre1);
      \node<2-> at (0.0, -1.0) (pre1) {\color{ACMDarkBlue}${\Large{ \forall s ~ \lst,
             {\{s \pts \marked{sintro-s1}{\texttt{Seq} ~ \lst}\}}  }}$};
      \node<2->[below=0.4em of pre1] (pre2) {${\Large{ (\mcode{to\_array} ~ s) }}$};
      \node<2->[below=0.4em of pre2] (pre3) {\color{ACMDarkBlue}${\Large{ {\exists a, 
              \set{a \pts {\mcode{Array} ~ \lst}}} }}$};

    \end{tikzpicture}
  \end{center}
  |]

#latex_slide do
  latex![|
  \begin{center}
    \begin{tikzpicture}[overlay, remember picture]
      \node<1-> at (0.0, 2.0) {\fontsize{20}{18}\selectfont{\textbf{Q:} Convert a sequence to an array.}};

      % \draw<1-2>[fill=ACMPurple!10, rounded corners,draw=none]
      % ($(pic cs:sintro-p2-s1-start) + (0.0, -0.25)$) rectangle ($(pic cs:sintro-p2-s1-end) + (0.0, 0.5)$);

      % \node<2>[text width=5em, align=center] at
      % ($(pic cs:sintro-p2-s1-start) + (0.75, 1.25)$) {\textit{finite} and\\ \textit{effect-free}};

      \draw<2-3>[fill=ACMPurple!10, rounded corners,draw=none]
      ($(pic cs:sintro-s2-start) + (0.0, -0.25)$) rectangle ($(pic cs:sintro-s2-end) + (0.0, 0.5)$);

      \node<3> at
      ($(pic cs:sintro-s2-start) + (0.95, -0.75)$) {``\mintinline{ocaml}{a}'' \textbf{points-to} an array};


      \coordinate (pre1);
      \node<1-> at (0.0, -1.0) (pre1) {\color{ACMDarkBlue}${\Large{ \forall s ~ \lst,
             {\{\marked{sintro-s2}{s \pts \marked{sintro-p2-s1}{\texttt{Seq} ~ \lst}}\}}  }}$};
      \node<1->[below=0.4em of pre1] (pre2) {${\Large{ (\mcode{to\_array} ~ s) }}$};
      \node<1->[below=0.4em of pre2] (pre3) {\color{ACMDarkBlue}${\Large{ {\exists a, 
              \set{\marked{sintro-s2}{a \pts {\mcode{Array} ~ \lst}}}} }}$};

      \node<4>[text width=8.0em, align=center] at (3.5, -3.5) {\Large{Let's write some proofs!}};

    \end{tikzpicture}
  \end{center}
|]

#latex_slide [fragile] do
  latex![|
  \begin{center}
   \color{black}
    \begin{minipage}[p]{0.5\linewidth}
\begin{minted}[escapeinside=@@]{ocaml}
let to_array s =
  match s () with 
  | Nil -> [| "[| |]" |]
  | Cons (h, _) ->
    let sz = length s in
    let a = make sz h in
    iteri (fun i vl -> 

       a.(i) <- vl

    ) s;
    a
\end{minted}
    \end{minipage}
    \begin{tikzpicture}[overlay, remember picture]
      \node<2-> at (1.0,0.0) {\includegraphics[width=0.0725\linewidth]{coq-logo.png}};
      \node<2->[text width=8em, align=center] at (1.0,-2.0) {\color{ACMDarkBlue!80!black}{Using CFML2\\verification library}};
      \node<2-> at (1.0, -3.5) {Charguéraud (2023)};
    \end{tikzpicture}
  \end{center}
|]

#latex_slide [fragile] do
   latex![|
   \color{black}
  \begin{center}
    \begin{tikzpicture}[overlay, remember picture]
      % let to_array
      \draw<2>[highlight]
      ($(pic cs:steppers1start) + (-0.125, 0.5)$) rectangle
      ($(pic cs:steppers1end) + (0.125, -0.25)$)
      ;
      \draw<2>[highlight]
      ($(pic cs:stepperproofs1start) + (-0.125, 0.5)$) rectangle
      ($(pic cs:stepperproofs1end) + (0.125, -0.25)$)
      ;

      % match
      \draw<3>[highlight]
      ($(pic cs:steppers2start) + (-0.125, 0.5)$) rectangle
      ($(pic cs:steppers2end) + (0.125, -0.25)$)
      ;
      \draw<3>[highlight]
      ($(pic cs:stepperproofs2start) + (-0.125, 0.5)$) rectangle
      ($(pic cs:stepperproofs2end) + (0.125, -0.25)$)
      ;

      % function application
      \draw<5,10>[highlight]
      ($(pic cs:steppers5start) + (-0.125, 0.5)$) rectangle
      ($(pic cs:steppers5end) + (0.125, -0.25)$)
      ;
      \draw<5,10>[highlight]
      ($(pic cs:stepperproofs5start) + (-0.125, 0.5)$) rectangle
      ($(pic cs:stepperproofs5end) + (0.125, -0.25)$)
      ;

      % ALLOC
      \draw<6>[highlight]
      ($(pic cs:steppers6start) + (-0.125, 0.5)$) rectangle
      ($(pic cs:steppers6end) + (0.125, -0.25)$)
      ;
      \draw<6>[highlight]
      ($(pic cs:stepperproofs6start) + (-0.125, 0.5)$) rectangle
      ($(pic cs:stepperproofs6end) + (0.125, -0.25)$)
      ;

      % iteri
      \draw<7,12>[highlight]
      ($(pic cs:steppers7start) + (-0.125, 0.5)$) rectangle
      ($(pic cs:steppers7end) + (0.125, -0.25)$)
      ;
      \draw<7,12>[highlight]
      ($(pic cs:stepperproofs7start) + (-0.125, 0.5)$) rectangle
      ($(pic cs:stepperproofs7end) + (4.125, -0.25)$)
      ;


      \draw<8>[highlight]
      ($(pic cs:steppers8start) + (-0.125, 0.5)$) rectangle
      ($(pic cs:steppers8end) + (0.125, -0.25)$)
      ;
      \draw<8>[highlight]
      ($(pic cs:stepperproofs8start) + (-0.125, 0.5)$) rectangle
      ($(pic cs:stepperproofs8end) + (4.125, -0.25)$)
      ;

      \draw<13,15>[highlight]
      ($(pic cs:invarianthighlights) + (-0.125, 0.5)$) rectangle
      ($(pic cs:invarianthighlighte) + (0.125, -0.25)$)
      ;

      \draw<14>[highlight, fill=ACMDarkBlue!10]
      ($(pic cs:stepperproofstparams) + (-0.125, 0.5)$) rectangle
      ($(pic cs:stepperproofstparame) + (0.125, -0.25)$)
      ;

      \node<14> at
      ($(pic cs:stepperproofstparams) + (1.25, 1.75)$) (prefix) {\fontsize{18}{18}\selectfont{\color{ACMDarkBlue!80}\textit{prefix}}};

      \path[->,>=stealth, line width=0.5mm, draw=ACMDarkBlue!80]<14> 
        (prefix) to[in=100, out=200] ($(pic cs:stepperproofstparams) + (0.125, 0.5)$);



    \end{tikzpicture}
    \begin{minipage}[p]{0.5\linewidth}
\begin{minted}[escapeinside=@@]{ocaml}
@\tikzmark{steppers1start}@let to_array s =@\tikzmark{steppers1end}@
  @\tikzmark{steppers2start}@match s () with @\tikzmark{steppers2end}@
  @\tikzmark{steppers3start}@| Nil -> @\tikzmark{steppers4p1start}@[ |  | ]@\tikzmark{steppers4p1end}@@\tikzmark{steppers3end}@
  @\tikzmark{steppers4start}@| Cons (h, _) ->@\tikzmark{steppers4end}@
    @\tikzmark{steppers5start}@let sz = length s in@\tikzmark{steppers5end}@
    @\tikzmark{steppers6start}@let a = make sz h in@\tikzmark{steppers6end}@
    @\tikzmark{steppers7start}@iteri (fun i vl -> 

       a.(i) <- vl

    ) s;                    @\tikzmark{steppers7end}@
    @\tikzmark{steppers8start}@a@\tikzmark{steppers8end}@
\end{minted}
    \end{minipage}
    \begin{minipage}[p]{0.35\linewidth}
\vspace{-1.25em}
\begingroup
\addtolength\jot{-3pt}
\begin{align*}
&\tikzmark{stepperproofs1start}\texttt{xcf}. \tikzmark{stepperproofs1end}\\[0.0125em]
&\tikzmark{stepperproofs2start}\texttt{xapp};\texttt{case} ~ \lst ~ \texttt{as} ~ [ | ~h ~\tl]\tikzmark{stepperproofs2end} \\
&\tikzmark{stepperproofs3start}\quad \!- ~ \texttt{xvalemptyarr}.\tikzmark{stepperproofs3end} \\
&\quad\tikzmark{stepperproofs4start} - ~ \tikzmark{stepperproofs4end}\\[0.05em]
&\quad\tikzmark{stepperproofs5start} ~ ~ \texttt{xapp}. \tikzmark{stepperproofs5end} \\
&\quad\tikzmark{stepperproofs6start} ~ ~ \texttt{xalloc}. \tikzmark{stepperproofs6end}\\
&\quad\tikzmark{stepperproofs7start} ~ ~ \texttt{xapp}~(\texttt{iteri\_spec} ~(\lambda \tikzmark{stepperproofstparams}t\tikzmark{stepperproofstparame} \rightarrow  \\
&\quad ~ ~~~ a \pts \texttt{Array} ~ ( \\
&\quad ~ ~~~~         \tikzmark{invarianthighlights}t ~ +\!\!+ ~ drop ~(length ~ t) ~ \\
&\quad ~ ~~~~~~~                      (make ~(length ~\lst)~ h))\tikzmark{invarianthighlighte}  \\
&\quad ~ ~  ). ~~~~~~ \tikzmark{stepperproofs7end}\\
&\quad \tikzmark{stepperproofs8start}\texttt{xval}.\tikzmark{stepperproofs8end}
\end{align*}
\endgroup
    \end{minipage}
    \begin{tikzpicture}[overlay, remember picture,hide/.style={fill=white,draw=none}]
      \draw<16-19>[hide,fill opacity=0.85]
      ($(pic cs:steppers1start) + (0.0, 1.25)$) rectangle
      ($(pic cs:stepperproofs8end) + (4.0, -0.25)$);

      \node<16-19>[rounded corners, fill=white, draw=primary1]
      at (-6,2.0) {\fontsize{14}{14}\selectfont{$a \pts \text{Array}($}\fontsize{14}{14}\selectfont{$t +\!\!+ drop ~(length ~ t)~ (make ~(length ~\lst)~ h)$}\fontsize{14}{14}\selectfont{$)$}};


      \node<17-19>[fill=white, draw=none, dashed] at ($(-6,-1.0) + (-6.0,0.0)$) (arraylabel) {\fontsize{20}{20}\selectfont{$a$}};
      \draw<17-19>[draw=black, line width=0.5mm, >=stealth, ->] (arraylabel) --  ($(-6,-1.0) + (-4.125,0.0)$);

      \draw<19-19>[draw=black, dashed, fill=ACMDarkBlue!5, line width=0.5mm]
      ($(-6,-1.0) + (-4.0,0.5)$) rectangle ++(4.0,-1.0) ;
      \draw<18-19>[draw=black, fill=ACMDarkBlue!10, line width=0.5mm]
      ($(-6,-1.0) + (-4.0,0.5)$) rectangle ++(3.0,-1.0) ;
      \draw<17-19>[draw=black, line width=0.5mm, fill=none]
      ($(-6,-1.0) + (-4.0,0.5)$) rectangle ($(-6,-1.0) + (4.0,-0.5)$) ;

      \node<18-19> at ($(-6,-1.0) + (-2.5,0.0)$) {\fontsize{18}{18}\selectfont{$t$}};

      \draw<21-21>[hide,fill opacity=0.5]
      ($(pic cs:steppers1start) + (0.0, 1.25)$) rectangle
      ($(pic cs:stepperproofs8end) + (4.0, -0.25)$);

      \node<21-21>[fill=ACMBlue!30,rounded corners] at (-6.0, 0.0) {\fontsize{30}{30}\selectfont{Qed.}};

    \end{tikzpicture}
  \end{center}
  |]
