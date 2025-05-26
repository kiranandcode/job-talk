import LeanTeX

#latex_slide ["fragile"] do
   latex![|
     \color{black}
  \begin{tikzpicture}[overlay, remember picture,
    orange/.style={fill=orange!50, fill opacity=0.5, draw=none, rounded corners=2pt},
    purple/.style={fill=purple!50, fill opacity=0.5, draw=none, rounded corners=2pt},
    green/.style={fill=green!50, fill opacity=0.5, draw=none, rounded corners=2pt},
    red/.style={fill=red!50, fill opacity=0.5, draw=none, rounded corners=2pt},
    blue/.style={fill=blue!50, fill opacity=0.5, draw=none, rounded corners=2pt}
    ]
      \draw<3>[blue] ($(pic cs:slide44rightp1) + (-0.125, -0.125)$) rectangle ($(pic cs:slide44rightp1end) + (0.125, 0.25)$);
      \draw<3>[blue] ($(pic cs:slide44leftp1) + (-0.125, -0.125)$) rectangle ($(pic cs:slide44leftp1end) + (0.125, 0.25)$);

      \draw<8-9>[blue] ($(pic cs:slide44leftp2) + (-0.125, -0.125)$) rectangle ($(pic cs:slide44leftp2end) + (0.125, 0.25)$);


      \draw<4>[orange] ($(pic cs:slide44leftstep1s) + (0.0, -0.125)$) rectangle ($(pic cs:slide44leftstep1e) + (0.0, 0.25)$);
      \draw<5>[orange] ($(pic cs:slide44leftstep2s) + (0.0, -0.125)$) rectangle ($(pic cs:slide44leftstep2e) + (0.0, 0.25)$);
      \draw<6>[orange] ($(pic cs:slide44leftstep3s) + (0.0, -0.125)$) rectangle ($(pic cs:slide44leftstep3e) + (0.0, 0.25)$);

      \draw<11-12>[blue] ($(pic cs:slide44leftp3) + (-0.125, -0.125)$) rectangle ($(pic cs:slide44leftp3end) + (0.125, 0.25)$);

      \draw<14>[orange] ($(pic cs:slide44leftstep4s) + (0.0, -0.75)$) rectangle ($(pic cs:slide44leftstep4e) + (0.0, 0.85)$);
      \draw<16>[blue] ($(pic cs:slide44leftp4) + (-0.125, -0.125)$) rectangle ($(pic cs:slide44leftp4end) + (0.125, 0.25)$);

      \draw<18>[orange] ($(pic cs:slide44rightstep1s) + (0.0, -0.75)$) rectangle ($(pic cs:slide44rightstep1e) + (0.0, 0.85)$);
      \draw<19-20>[blue] ($(pic cs:slide44rightp2) + (-0.125, -0.125)$) rectangle ($(pic cs:slide44rightp2end) + (0.125, 0.25)$);

      \draw<22-23>[blue] ($(pic cs:slide44rightp3) + (-0.125, -0.125)$) rectangle ($(pic cs:slide44rightp3end) + (0.125, 0.25)$);

      \draw<25-26>[blue] ($(pic cs:slide44rightp4) + (-0.125, -0.125)$) rectangle ($(pic cs:slide44rightp4end) + (0.125, 0.25)$);


      \draw<28->[purple] ($(pic cs:slide44leftstep3s) + (0.0, -0.125)$) rectangle ($(pic cs:slide44leftstep3e) + (0.0, 0.25)$);
      \draw<28->[purple] ($(pic cs:slide44rightstep1s) + (0.0, -0.75)$) rectangle ($(pic cs:slide44rightstep1e) + (0.0, 0.85)$);

      \draw<29->[orange] ($(pic cs:slide44rightstep3s) + (0.0, -0.75)$) rectangle ($(pic cs:slide44rightstep3e) + (0.0, 0.85)$);
      \draw<29->[orange] ($(pic cs:slide44leftstep4s) + (0.0, -0.75)$) rectangle ($(pic cs:slide44leftstep4e) + (0.0, 0.85)$);

      \draw<30->[green] ($(pic cs:slide44leftstep5s) + (0.0, -0.125)$) rectangle ($(pic cs:slide44leftstep5e) + (0.0, 0.25)$);
      \draw<30->[green] ($(pic cs:slide44rightstep2s) + (0.0, -0.125)$) rectangle ($(pic cs:slide44rightstep2e) + (0.0, 0.25)$);

      % \draw<7->[green] ($(pic cs:slide40rightp3) + (0.0, -0.125)$) rectangle ($(pic cs:slide40rightp3end) + (0.0, 0.25)$);
      % \draw<6->[green] ($(pic cs:slide40leftp3) + (0.0, -0.125)$) rectangle ($(pic cs:slide40leftp3end) + (0.0, 0.25)$);

      % \draw<9->[red] ($(pic cs:slide40rightp4) + (0.0, 0.25)$) rectangle ($(pic cs:slide40rightp4end) + (0.0, -0.125)$);
      % \draw<8->[red] ($(pic cs:slide40leftp4) + (0.0, 0.25)$) rectangle ($(pic cs:slide40leftp4end) + (0.0, -0.125)$);

      % \draw<11->[blue] ($(pic cs:slide40rightp5) + (0.0, -0.125)$) rectangle ($(pic cs:slide40rightp5end) + (0.0, 0.25)$);
      % \draw<10->[blue] ($(pic cs:slide40leftp5) + (0.0, -0.125)$) rectangle ($(pic cs:slide40leftp5end) + (0.0, 0.25)$);

    \end{tikzpicture}

    \begin{center}
      \begin{minipage}{0.4\linewidth}
        \vspace{-4.0em}
        \fontsize{7}{8}\selectfont{
\begin{minted}[escapeinside=@@]{ocaml}
let to_array @\tikzmark{slide44leftp1}@l@\tikzmark{slide44leftp1end}@ = 

   @\tikzmark{slide44leftstep1s}@match l () with@\tikzmark{slide44leftstep1e}@ 

   | Nil         -> [| "[| |]" |]

   @\tikzmark{slide44leftstep2s}@| Cons (x, _) ->@\tikzmark{slide44leftstep2e}@

       @\tikzmark{slide44leftstep3s}@let @\tikzmark{slide44leftp2}@len@\tikzmark{slide44leftp2end}@ = length' l in@\tikzmark{slide44leftstep3e}@

       @\tikzmark{slide44leftstep5s}@let @\tikzmark{slide44leftp3}@a@\tikzmark{slide44leftp3end}@ = make len x in@\tikzmark{slide44leftstep5e}@

       @\tikzmark{slide44leftstep4s}@iteri 
         (fun i x -> a.(i) <- x)
         l;                     @\tikzmark{slide44leftstep4e}@

       @\tikzmark{slide44leftp4}@a@\tikzmark{slide44leftp4end}@
\end{minted}
        }    
      \end{minipage}
      \begin{minipage}{0.4\linewidth}
        \vspace{0em}
        \fontsize{7}{8}\selectfont{
\begin{minted}[escapeinside=@@]{ocaml}
let to_array @\tikzmark{slide44rightp1}@l@\tikzmark{slide44rightp1end}@ =

  let @\tikzmark{slide44rightp2}@sz@\tikzmark{slide44rightp2end}@, ls =
    @\tikzmark{slide44rightstep1s}@fold (fun (i, acc) x -> 
           (i + 1, x :: acc))
      (0, []) l in             @\tikzmark{slide44rightstep1e}@

   match ls with

     | [] -> [| "[| |]" |]

     | init::rest ->

       @\tikzmark{slide44rightstep2s}@let @\tikzmark{slide44rightp3}@a@\tikzmark{slide44rightp3end}@ = make sz init in@\tikzmark{slide44rightstep2e}@

       let idx = sz - 2 in

       let _ =
         @\tikzmark{slide44rightstep3s}@List.fold_left
           (fun i x -> a.(i) <- x; i - 1)
           idx rest in                     @\tikzmark{slide44rightstep3e}@

       @\tikzmark{slide44rightp4}@a@\tikzmark{slide44rightp4end}@

\end{minted}
        }
      \end{minipage}  
    \end{center}
    \begin{center}
     \vspace{-4em}
     \begin{tikzpicture}[overlay, remember picture, pts/.style={draw=primary1,>=stealth,->, line width=0.5mm}]
        \node<2->[fill=white, draw=primary1, line width=0.5mm, rounded corners=2pt] (inputlist) at (0.,6.75)  {\fontsize{10}{10}\selectfont{$~~\text{Seq.of\_list} ~ [1; 2; 3]~~$}};
        \path<3>[pts,bend left=10] (inputlist) to ($(pic cs:slide44rightp1) + (0.0, 0.25)$);
        \path<3>[pts, bend right=10] (inputlist) to ($(pic cs:slide44leftp1) + (0.0, 0.25)$);

        \node<9->[fill=white, draw=primary1, line width=0.5mm, rounded corners=2pt] (lenleft) at ($(pic cs:slide44leftp2) + (-2.125,0.25)$)
        {\fontsize{10}{10}\selectfont{$3$}};

        \path<9>[pts,bend left=10] (lenleft) to ($(pic cs:slide44leftp2) + (0.0, 0.25)$);

        \node<12->[fill=white, draw=primary1, line width=0.5mm, rounded corners=2pt] (arrleft) at ($(pic cs:slide44leftp3) + (-2.125,-0.25)$)
        {\fontsize{10}{10}\selectfont{$[1;1;1]$}};
        \path<12>[pts,bend left=10] (arrleft) to ($(pic cs:slide44leftp3) + (0.0, 0.25)$);

        \node<16->[fill=white, draw=primary1, line width=0.5mm, rounded corners=2pt] (arrfinalleft) at ($(pic cs:slide44leftp4) + (-2.125,-0.25)$)
        {\fontsize{10}{10}\selectfont{$[1;2;3]$}};
        \path<16>[pts,bend left=10] (arrfinalleft) to ($(pic cs:slide44leftp4) + (0.0, 0.25)$);

        \node<20->[fill=white, draw=primary1, line width=0.5mm, rounded corners=2pt] (lenright) at ($(pic cs:slide44rightp2) + (4.25,0.25)$)
        {\fontsize{10}{10}\selectfont{$3$}};
        \path<20>[pts,bend right=10] (lenright) to ($(pic cs:slide44rightp2) + (0.0, 0.25)$);

        \node<23->[fill=white, draw=primary1, line width=0.5mm, rounded corners=2pt] (arrright) at ($(pic cs:slide44rightp3) + (4.25,0.25)$)
        {\fontsize{10}{10}\selectfont{$[3;3;3]$}};
        \path<23>[pts,bend right=10] (arrright) to ($(pic cs:slide44rightp3) + (0.0, 0.25)$);

        \node<26->[fill=white, draw=primary1, line width=0.5mm, rounded corners=2pt] (arrfinalright) at ($(pic cs:slide44rightp4) + (4.25,2.0)$)
        {\fontsize{10}{10}\selectfont{$[1;2;3]$}};
        \path<26>[pts,bend right=10] (arrfinalright) to ($(pic cs:slide44rightp4) + (0.0, 0.25)$);


        \draw<31->[fill opacity=0.85, fill=white, draw=none] (-10,-20) rectangle (10,20);
        \node<31-> at (0,6.0) {\fontsize{16}{16}\selectfont{\textbf{Q}: How to discover these similarities automatically?}};
        \node<31-> at (0,4.0) {\fontsize{16}{16}\selectfont{\textbf{A}: Instrumentation based dynamic analysis }};
        \node<31-> at (0,2.0) {\fontsize{16}{16}\selectfont{Identify ``similar'' program points through traces.}};
        \node<32-> at (0,0.0) {\fontsize{14}{14}\selectfont{Use invariants from old proof to synthesise invariants for new one.}};
      \end{tikzpicture}
    \end{center}
   |]

#latex_slide ["fragile"] do
  latex![|
  \color{black}
  \begin{center}
    \begin{tikzpicture}[overlay, remember picture]
      \node (oldinv1) at (0., 2.0)
        {\fontsize{12}{12}\selectfont{$a \pts \texttt{Array}(t +\!\!+ drop ~(length ~ t)~ (make ~(length ~\lst)~ h))$}};
      \node at ($(oldinv1) + (-4.0, 0.75)$)
        {\color{primary1!80!black}\fontsize{12}{12}\selectfont{Old Invariant:}};

      \node<2-> at ($(newinv1) + (-1.5, 2.0)$)
        {\color{primary1!80!black}\fontsize{12}{12}\selectfont{New Invariant:}};

      \node<3-> at ($(newinv1) + (-0.5, -1.25)$)
        {\fontsize{16}{20}\selectfont{(1)}};
      \node<5-> at ($(newinv2) + (-0.5, -1.25)$)
        {\fontsize{16}{20}\selectfont{(n)}};


      
\node (newinv1) at (-4.0, -2.0) {
\begin{minipage}{0.48\linewidth}
\begin{minted}[escapeinside=@@,fontsize=\footnotesize]{ocaml}
(fun acc t => a @$\pts$@
   @$\texttt{Array}$@ (repeat (acc + 1) init ++
          drop (acc + 1) @$\lst$@))
\end{minted}
\end{minipage}
};

     \node<4-> at (0.0, -2.0) {\fontsize{18}{18}\selectfont{$\dots$}};

      \node (newinv2) at (4.0, -2.0) {
   \begin{minipage}{0.48\linewidth}
\begin{minted}[escapeinside=@@,fontsize=\footnotesize]{ocaml}
(fun acc t => a @$\pts$@
   @$\texttt{Array}$@ ([] ++ drop 0
    (repeat (length t) init)))
\end{minted}
    \end{minipage}};

      \draw<-2>[fill=white,draw=none] ($(newinv1) + (-3.5, -1.0)$) rectangle ++(6.0, 2.0);
      \draw<-4>[fill=white,draw=none] ($(newinv2) + (-3.5, -1.0)$) rectangle ++(6.0, 2.0);


      % \draw<2->[>=stealth,->,line width=0.5mm, draw=primary1] (oldinv1) -- (newinv1);
      % \draw<4-5>[>=stealth,->,line width=0.5mm, draw=primary1] (oldinv1) -- (newinv2);



    \end{tikzpicture}
  \end{center}
  |]
