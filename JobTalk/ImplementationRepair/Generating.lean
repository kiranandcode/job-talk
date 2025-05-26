import LeanTeX
import JobTalk.ImplementationRepair.Challenges

@[presentation]
def challengesSlide1 := mkChallengesSlide 0

#latex_slide ["fragile"] do
   latex![|\centering|]
   with steps [question, question_answer] do
     tikz ["overlay", "remember picture"] do
       node<question> at (0,0) latex![|\fontsize{20}{18}\selectfont{How to generate invariants?}|]
       node<question_answer> at (0,1.0) latex![|\fontsize{20}{18}\selectfont{How to generate invariants?}|]
       node<question_answer> at (0,-1.0) latex![|\fontsize{20}{18}\selectfont{\color{primary1!20!ACMDarkBlue}Use the old program and proofs!}|]


#latex_slide ["fragile"] "Generating Candidate Invariants" do
   latex![|
   \color{black}
    \begin{center}
      \begin{minipage}{0.4\linewidth}
        \vspace{-3em}
        \fontsize{6}{12}\selectfont{
\begin{minted}[escapeinside=@@]{ocaml}
let to_array l = 
   match l () with 
   | Nil         -> [| "[| |]" |]
   | Cons (x, _) ->
       let len = length' l in
       let a = make len x in
       iteri 
         (fun i x -> a.(i) <- x)
         l;                     
        a
\end{minted}
        }    
      \end{minipage}
      \begin{minipage}{0.4\linewidth}
        \vspace{-3em}
        \fontsize{6}{8}\selectfont{
\begin{minted}[escapeinside=@@]{ocaml}
let to_array l =
  let sz, ls =
    fold (fun (i, acc) x -> 
           (i + 1, x :: acc))
      (0, []) l in             
   match ls with
     | [] -> [| "[| |]" |]
     | init::rest ->
       let a = make sz init in
       let idx = sz - 2 in
       let _ =
         List.fold_left
           (fun i x -> a.(i) <- x; i - 1)
           idx rest in                     
        a
\end{minted}
        }
      \end{minipage}
    \end{center}
    \begin{center}
     \vspace{-5em}
      \begin{tikzpicture}[overlay, remember picture]
        % \draw<2>[fill=white, fill opacity=0.5, draw=black, rounded corners]
        % (-7.5, 5.0) rectangle (7.5, -1.0);

      \node<2-> at (-4.5, 3.25) {\color{ACMDarkBlue}{\fontsize{14}{14}\selectfont{\textit{Programs are different-}}}};
      \node<3> at (4.5, -2.25) {\color{ACMDarkBlue}{\fontsize{14}{14}\selectfont{\textit{-but have similarities.}}}};

      \end{tikzpicture}
    \end{center}
   |]
  

#latex_slide["fragile"] "Generating Candidate Invariants" do
  latex![|
  \color{black}
  \begin{tikzpicture}[overlay, remember picture,
    orange/.style={fill=orange!50, fill opacity=0.5, draw=none, rounded corners},
    purple/.style={fill=purple!50, fill opacity=0.5, draw=none, rounded corners},
    green/.style={fill=green!50, fill opacity=0.5, draw=none, rounded corners},
    red/.style={fill=red!50, fill opacity=0.5, draw=none, rounded corners},
    blue/.style={fill=blue!50, fill opacity=0.5, draw=none, rounded corners}
    ]
      \draw<3->[orange] ($(pic cs:slide40rightp1) + (0.0, -0.125)$) rectangle ($(pic cs:slide40rightp1end) + (0.0, 0.25)$);
      \draw<2->[orange] ($(pic cs:slide40leftp2) + (0.0, -0.125)$) rectangle ($(pic cs:slide40leftp2end) + (0.0, 0.25)$);

      \draw<5->[purple] ($(pic cs:slide40rightp2) + (0.0, -0.125)$) rectangle ($(pic cs:slide40rightp2end) + (0.0, 0.25)$);
      \draw<4->[purple] ($(pic cs:slide40leftp1) + (0.0, -0.125)$) rectangle ($(pic cs:slide40leftp1end) + (0.0, 0.25)$);

      \draw<7->[green] ($(pic cs:slide40rightp3) + (0.0, -0.125)$) rectangle ($(pic cs:slide40rightp3end) + (0.0, 0.25)$);
      \draw<6->[green] ($(pic cs:slide40leftp3) + (0.0, -0.125)$) rectangle ($(pic cs:slide40leftp3end) + (0.0, 0.25)$);

      \draw<9->[red] ($(pic cs:slide40rightp4) + (0.0, 0.25)$) rectangle ($(pic cs:slide40rightp4end) + (0.0, -0.125)$);
      \draw<8->[red] ($(pic cs:slide40leftp4) + (0.0, 0.25)$) rectangle ($(pic cs:slide40leftp4end) + (0.0, -0.125)$);

      \draw<11->[blue] ($(pic cs:slide40rightp5) + (0.0, -0.125)$) rectangle ($(pic cs:slide40rightp5end) + (0.0, 0.25)$);
      \draw<10->[blue] ($(pic cs:slide40leftp5) + (0.0, -0.125)$) rectangle ($(pic cs:slide40leftp5end) + (0.0, 0.25)$);

      \path<12->[draw=red, >=stealth, dashed, <->,line width=0.5mm]
      ($(pic cs:slide40leftp4end) + (0.0, 0.45)$) to[in=225, out=45]
       coordinate[midway] (comb) 
      ($(pic cs:slide40rightp4) + (0.0, -0.45)$);

    \end{tikzpicture}

    \begin{center}
      \begin{minipage}{0.4\linewidth}
        \vspace{-4em}
        \fontsize{6}{12}\selectfont{
\begin{minted}[escapeinside=@@]{ocaml}
let to_array l = 
   match l () with 
   @\tikzmark{slide40leftp1}@| Nil         -> [| "[| |]" |]@\tikzmark{slide40leftp1end}@
   | Cons (x, _) ->
       @\tikzmark{slide40leftp2}@let len = length' l in@\tikzmark{slide40leftp2end}@
       @\tikzmark{slide40leftp3}@let a = make len x in@\tikzmark{slide40leftp3end}@
       @\tikzmark{slide40leftp4}@iteri 
         (fun i x -> a.(i) <- x)
         l;                     @\tikzmark{slide40leftp4end}@
       @\tikzmark{slide40leftp5}@ a @\tikzmark{slide40leftp5end}@
\end{minted}
        }    
      \end{minipage}
      \begin{minipage}{0.4\linewidth}
        \vspace{-4em}
        \fontsize{6}{8}\selectfont{
\begin{minted}[escapeinside=@@]{ocaml}
let to_array l =
  @\tikzmark{slide40rightp1}@let sz, ls =@\tikzmark{slide40rightp1end}@
    fold (fun (i, acc) x -> 
           (i + 1, x :: acc))
      (0, []) l in             
   match ls with
     @\tikzmark{slide40rightp2}@| [] -> [| "[| |]" |]@\tikzmark{slide40rightp2end}@
     | init::rest ->
       @\tikzmark{slide40rightp3}@let a = make sz init in@\tikzmark{slide40rightp3end}@
       let idx = sz - 2 in
       @\tikzmark{slide40rightp4}@let _ =
         List.fold_left
           (fun i x -> a.(i) <- x; i - 1)
           idx rest in                    @\tikzmark{slide40rightp4end}@ 
       @\tikzmark{slide40rightp5}@ a @\tikzmark{slide40rightp5end}@
\end{minted}
        }
      \end{minipage}  
    \end{center}
    \begin{center}
     \vspace{-3em}
      \begin{tikzpicture}[overlay, remember picture]
      \path<12->[draw=none]
      ($(pic cs:slide40leftp4end) + (0.0, 0.45)$) to[in=225, out=45]
       coordinate[midway] (combpos) 
      ($(pic cs:slide40rightp4) + (0.0, -0.45)$);

      \node<13->[color=red,fill=white!50, rounded corners] at ($(combpos) + (-0.3, 1.05)$)
      {\fontsize{11}{10}\selectfont{Similar behaviour...}};
      \node<14->[color=red, fill=white!50, rounded corners] at ($(combpos) + (0., -1.25)$) {\fontsize{11}{10}\selectfont{..similar invariants?}};



        \draw<15->[fill opacity=0.9, fill=white, draw=none]
        (-10,-20) rectangle (10,20);
        \node<15-> at (0,4.0) {\fontsize{16}{16}\selectfont{\textbf{Q}: How to discover these similarities automatically?}};
        \node<16-> at (0,2.0) {\fontsize{16}{16}\selectfont{\textbf{A}: Instrumentation based dynamic analysis }};
        \node<17-> at (0,0.0) {\fontsize{16}{16}\selectfont{Identify ``similar'' program points through traces.}};

        % \node<15-> at (0,-0.5) {\fontsize{14}{14}\selectfont{Use invariants from old proof to synthesise invariants for new one.}};
      \end{tikzpicture}
    \end{center}
  |]


