import LeanTeX
import JobTalk.ImplementationRepair.Outline

@[presentation]
def outline2 := mkOutlineSlide 2

#latex_slide["fragile"] "Pragmatic Concerns" do
  latex![|
  \begin{enumerate}
  \item Is \textsc{Sisyphus} effective at repairing proofs?
  \item Does \textsc{Sisyphus} repair proofs in reasonable time?
  \end{enumerate}
  |]

#latex_slide["fragile"] "Benchmark Programs" do
  latex![|
  \begin{itemize}
    \itemsep2em
  \item 14 OCaml programs and their changes
  \item 10 from real-world OCaml codebases
  \item ...such as \texttt{containers} or Jane Street's \texttt{core}
  \end{itemize}
  \color{black}
  \begin{center}
    \begin{tikzpicture}[overlay]
      \node <2-> at (5.0,6.0) {\includegraphics[width=0.25\linewidth]{containers-stars.png}};
      \node <3-> at (5.0,4.5) {\includegraphics[width=0.25\linewidth]{janestreet-stars.png}};
    \end{tikzpicture}
  \end{center}
  |]

#latex_slide["fragile"] "Benchmark Programs" do
  latex![|
  \color{black}
  \begin{center}
    \vspace{-0em}
\scalebox{0.7}{\color{black}\arrayrulecolor{black}    \begin{tabular}[t]{lcc}
      \toprule
      {Example} & {Data Structure} & {Refactoring} \\ 
      \midrule
      Seq to array & Array, Seq & IterOrd, DataStr \\
      $\text{Make rev list}^\dag$ & Ref & Mutable/Pure \\
      $\text{Tree to array}^\dag$ & Array, Tree & IterOrd, DataStr \\
      % \midrule       
      Array exists & Array & Mutable/Pure \\
      Array find mapi & Array, Ref & Pure/Mutable \\
      Array is sorted & Array & Pure/Mutable \\
      Array findi & Array & Pure/Mutable \\
      Array of rev list & Array & DataStr \\
      Array foldi & Array & Pure/Mutable \\
      Array partition & Array & DataStr \\
      % \midrule
      $\text{Stack filter}^\ddag$ & Stack & DataStr \\
      $\text{Stack reverse}^\ddag$ & Stack & DataStr \\
      $\text{Sll partition}^\ddag$ & SLL & Mutable/Pure, IterOrd \\
      $\text{Sll of array}^\ddag$ & Array, SLL & IterOrd \\
      \bottomrule
    \end{tabular}
}
\end{center}
\begin{center}
  \begin{tikzpicture}[overlay]
\draw<2->[fill=white, fill opacity=0.9, draw=none] (-4.0, 6.250) rectangle (5.0, -8.0);
\node<3->[rounded corners, fill=red!30, draw=none] at (-1.0,5.5) {\fontsize{18}{18}\selectfont{Array}};
\node<4->[rounded corners, fill=red!30, draw=none] at (-3.0,4.0) {\fontsize{18}{18}\selectfont{Seq}};
\node<5->[rounded corners, fill=red!30, draw=none] at (4.0,6.0) {\fontsize{18}{18}\selectfont{Stack}};
\node<6->[rounded corners, fill=red!30, draw=none] at (5.0,4.5) {\fontsize{18}{18}\selectfont{SLL}};
\node<7->[rounded corners, fill=red!30, draw=none] at (-4.0,5.5) {\fontsize{18}{18}\selectfont{Tree}};
\node<8->[rounded corners, fill=red!30, draw=none] at (1.0,4.5) {\fontsize{18}{18}\selectfont{Queue}};


\node<10->[rounded corners, fill=blue!30, draw=none] at (-1.0,2.25) {\fontsize{18}{18}\selectfont{Iteration Order}};
\node<11->[rounded corners, fill=blue!30, draw=none] at (-3.0,0.5) {\fontsize{18}{18}\selectfont{Pure to Mutable}};
\node<12->[rounded corners, fill=blue!30, draw=none] at (4.0,0.25) {\fontsize{18}{18}\selectfont{Mutable to Pure}};
\node<13->[rounded corners, fill=blue!30, draw=none] at (5.0,2.5) {\fontsize{18}{18}\selectfont{Data Structure}};

  \end{tikzpicture}
\end{center}
  |]

#latex_slide "\\textbf{RQ1}: Effectiveness of Proof Repair" do
  latex![|
  \color{black}
  \begin{center}
    \begin{tikzpicture}[overlay]
      \draw<2>[fill=ACMBlue!20,rounded corners,draw=none] (-1.5,0.7145) rectangle  (0.5,-5.15);
      \draw<3>[fill=ACMBlue!20,rounded corners,draw=none] (0.65,0.7145) rectangle  (2.15,-5.15);
      \draw<4>[fill=ACMBlue!20,rounded corners,draw=none] (2.25,0.7145) rectangle  (3.75,-5.15);

      % \draw<2>[fill=ACMBlue!20,rounded corners,draw=none]
      % (3.0,1.0) rectangle  (4.625,-5.145);
    \end{tikzpicture}
    \vspace{-2em}

    \scalebox{0.7}{
\begin{tabular}{lccc}
\toprule
  Name
  & {\centering\begin{tabular}{c}\# Admits /\\\# Obligations \end{tabular}}
  & Time (old) 
  & {Time (new)} \\
\midrule
Seq to array         &  3 / 5 & 2hrs  & 17m        \\
Make rev list        &  0 / 2 & 10m    & -         \\
Tree to array        &  2 / 4 & 5hrs    & 18m       \\
% \midrule
Array exists        &  2 / 4 & 30m    & 12m        \\
Array find mapi      &  2 / 5 & 1.5hrs  & 12m        \\
Array is sorted     &  2 / 5 & 4hrs    & 2m         \\
Array findi          &  3 / 7 & 1.5hrs  & 9m         \\
Array of rev list   &  2 / 3 & 1hr     & 3m         \\
Array foldi         &  0 / 1 & 15m    & -         \\
Array partition    &  3 / 3 & 2.5hrs  & 5m         \\
% \midrule
Stack filter  &  3 / 3 & 1.5hrs  & 11m        \\
Stack reverse  &  1 / 1 & 2hrs    & 30s        \\
SLL partition  &  0 / 2 & 2hrs    & -         \\
SLL of array   &  0 / 1 & 2hrs    & -         \\
\bottomrule
\end{tabular}
    }    
  \end{center}
  |]

#latex_preamble[| \newcommand{\tenms}{$\leq 10\mathit{ms}$} |]

#latex_slide "\\textbf{RQ2}: Efficiency of Proof Repair" do
  latex![|
\vspace{0em}
\color{black}
  \begin{center}
    \begin{tikzpicture}[scale=1]
      \begin{axis}[
        ybar,
        xtick=data,
        % xmin=0.0,
        % xmax=3.5,
        draw=black,
        xticklabels={Seq to array, Make rev list, Tree to array, Array exists, Array find mapi, Array is sorted, Array findi, Array of rev list, Array foldi, Array partition, Stack filter, Stack reverse, Sll partition, Sll of array},
        ymajorgrids=true,
        % bar width=1cm, 
        xtick align=inside,
        ylabel={Time taken (s)},
        x tick label style={font=\footnotesize, rotate=40, anchor=east},
        width=0.95\textwidth,
        height=0.7\textheight,
        ]
        \addplot table [x expr=\coordindex, y index=1, col sep=comma] {data/time-spent.csv};
        % \addplot[dashed, red,update limits=false,] coordinates { (-1,120) (0.5,120) };
        \draw [red,dashed] ({rel axis cs:0,0}|-{0,120})
        --
        ({rel axis cs:1,0}|-{10,120}) node [pos=0.33, above] {2 mins};

      \end{axis}
    \end{tikzpicture}    
  \end{center}
  |]

#latex_slide "\\textbf{RQ2}: Efficiency of Proof Repair" do
  latex![|
  \color{black}
  \begin{center}
    \begin{tikzpicture}[overlay]
      % \draw<2>[fill=ACMBlue!20,rounded corners,draw=none]
      % (3.5,1.0) rectangle  (4.85,-5.3);
      \draw<2>[fill=ACMBlue!20,rounded corners,draw=none]
      (-5.0,-2.85) rectangle  (4.95,-3.2);

      \draw<2>[fill=ACMBlue!20,rounded corners,draw=none]
      (-5.0,-4.25) rectangle  (4.95,-4.6);


      \draw<3>[fill=ACMBlue!20,rounded corners,draw=none]
      (0.75,0.45) rectangle  (1.95,-5.3);

      % \draw<3>[fill=ACMBlue!20,rounded corners,draw=none]
      % (-0.25,0.5) rectangle  (0.75,-5.145);
      % \draw<3>[fill=ACMBlue!20,rounded corners,draw=none]
      % (3.0,1.0) rectangle  (4.625,-5.145);

    \end{tikzpicture}


    \vspace{-4em}
    \scalebox{0.7}{
\begin{tabular}[t]{lccccccc}
       \toprule
       \multirow{ 2}{*}{Example} & \multicolumn{4}{c}{Time (s)} & \multirow{2}{*}{Total (s)} \\ 
        \cmidrule(lr){2-5}
               & Generation & Extraction & Testing & Remaining &  \\
      \midrule
       seq\_to\_array & 28.57 & 1.95  & 20.36 & 5.28  & 58  \\
       make\_rev\_list  & \tenms  & 3.36   & \tenms & 11.95 & 15  \\
       tree\_to\_array  & 6.75  & 1.95  & 2.98 & 13.32 & 25  \\
       % \midrule
       array\_exists & \tenms  & 3.30   & \tenms & 13.23 & 17  \\
       array\_find\_mapi & \tenms  & 2.13   & \tenms & 13.95 & 17  \\
       array\_is\_sorted & \tenms  & 2.04   & \tenms & 15.38 & 18  \\
       array\_findi & \tenms  & 2.13   & \tenms & 19.07 & 22  \\
       array\_of\_rev\_list & 1.72  & 2.82  & 0.96 & 15.62 & 21  \\
       array\_foldi & \tenms  & 488.89 & \tenms & 15.00 & 504 \\
       array\_partition & 3.51  & 69.73  & 2.62 & 17.53 & 95  \\
       % \midrule
       stack\_filter  & \tenms  & 81.88  & \tenms & 21.53 & 104 \\
       stack\_reverse  & \tenms & 88.42  & \tenms & 16.94 & 105 \\
       sll\_partition  & \tenms  & 426.62 & \tenms & 16.43 & 443 \\
       sll\_of\_array  & 0.02  & 55.98  & 0.01 & 13.33 & 69 \\
    \bottomrule
    \end{tabular}
    }
  \end{center}
 |]

