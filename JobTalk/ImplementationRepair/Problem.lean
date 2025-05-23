import LeanTeX


#latex_slide [fragile] do
  latex![|
  \begin{center}
    \begin{tikzpicture}[overlay]
      \node<1-2> at (0.0, 1.0) {\fontsize{20}{18}\selectfont{Let's write a \textbf{verified} program!}};
      \node<2> at (0.0, -1.0) {\fontsize{16}{18}\selectfont{\textbf{Conclusion: }}};
      \node<2> at (0.0, -2.0) {\fontsize{20}{18}\selectfont{Writing verified code is hard}};
      \node<3> at (0.0, 0.0) {\fontsize{20}{18}\selectfont{Writing verified code is hard}};
      \node<4> at (0.0, 0.0) {\fontsize{20}{18}\selectfont{Writing verified code is hard...}};
    \end{tikzpicture}
  \end{center}
  |]

#latex_slide [fragile] do
   latex![|
  \begin{center}
    \begin{tikzpicture}[overlay]
      \node<1-> at (0.0, 1.5) {\fontsize{20}{18}\selectfont{A problem arises...}};
      \node <2> at (0.0,-0.5) {\includegraphics[width=0.5\linewidth]{containers-stars.png}};
      \node<3> at (0.0, -1.5) {\includegraphics[width=0.85\linewidth]{to_array_change}};
    \end{tikzpicture}
  \end{center}
   |]

#latex_slide [fragile] do
  latex![|
  \begin{center}
  \color{black}
    \begin{tikzpicture}[overlay, remember picture]
      \node at (-3.5, 1.0) {\fontsize{18}{18}\selectfont{Old}};
      \node at (1.5, 1.0) {\fontsize{18}{18}\selectfont{New}};

      \draw<2>[highlight] ($(pic cs:oldprogramhighlights) + (-0.125, 0.3)$) rectangle
      ($(pic cs:oldprogramhighlighte)+ (0.125, -0.15)$);

      \draw<3-4>[highlight] ($(pic cs:oldlens) + (-0.125, 0.3)$) rectangle
      ($(pic cs:oldlene)+ (0.125, -0.15)$);
      
      \draw<4>[highlight] ($(pic cs:olditers) + (-0.125, 0.3)$) rectangle
      ($(pic cs:olditere)+ (0.125, -0.15)$);

      \draw<6-7>[highlight] ($(pic cs:newaccs) + (-0.125, 0.3)$) rectangle
      ($(pic cs:newacce)+ (0.125, -0.15)$);

      \draw<7>[highlight] ($(pic cs:newiters) + (-0.125, 0.3)$) rectangle
      ($(pic cs:newitere)+ (0.125, -0.15)$);

    \end{tikzpicture}

    \begin{minipage}[p]{0.45\linewidth}
\vspace{-4.25em}
\begin{minted}[fontsize=\scriptsize,escapeinside=@@]{ocaml}
@\tikzmark{oldprogramhighlights}@let to_array s =
  match s () with 
  | Nil -> [|"[||]"|]
  | Cons (h, _) ->
    let sz = @\tikzmark{oldlens}@length s@\tikzmark{oldlene}@ in
    let a = make sz h in
    @\tikzmark{olditers}@iteri (fun i vl -> 
       a.(i) <- vl
    ) s;                 @\tikzmark{olditere}@
    a                                 @\tikzmark{oldprogramhighlighte}@
\end{minted}
    \end{minipage}
    \begin{minipage}[p]{0.45\linewidth}
\begin{minted}[fontsize=\scriptsize,escapeinside=@@]{ocaml}
let to_array s =
  @\tikzmark{newaccs}@let sz, ls = fold_left 
    (fun (i, acc) x -> 
      (i+1, x::acc))
    (0, []) l in              @\tikzmark{newacce}@
  match ls with 
  | [] -> [|"[||]"|]
  | init :: rest ->
    let a = make sz init in
    let idx = len - 2 in
    @\tikzmark{newiters}@List.fold_left 
     (fun i vl -> 
       a.(i)<-vl; i-1) 
     idx rest;        @\tikzmark{newitere}@
    a
\end{minted}
    \end{minipage}
  \end{center}
  |]

#latex_slide [fragile] do
  latex![|
  \begin{center}
  \color{black}
    \begin{tikzpicture}[overlay]
      \node at (-3.5, 1.0) {\fontsize{18}{18}\selectfont{Old}};
      \node at (1.5, 1.0) {\fontsize{18}{18}\selectfont{New}};

      \node<2-> at (-1.5, -5.75) {\color{ACMDarkBlue}{\fontsize{14}{14}\selectfont{\textit{Completely different implementation...}}}};
      \node<3> at (2.5, -6.5) {\color{ACMDarkBlue}{\fontsize{14}{14}\selectfont{\textit{...proof must be redone.}}}};
    \end{tikzpicture}

    \begin{minipage}[p]{0.45\linewidth}
\vspace{-4.25em}
\begin{minted}[escapeinside=@@,fontsize=\scriptsize]{ocaml}
let to_array s =
  match s () with 
  | Nil -> [|"[| |]"|]
  | Cons (h, _) ->
    let sz = length s in
    let a = make sz h in
    iteri (fun i vl -> 
       a.(i) <- vl
    ) s;
    a
\end{minted}
    \end{minipage}
    \begin{minipage}[p]{0.45\linewidth}
\begin{minted}[fontsize=\scriptsize]{ocaml}
let to_array s =
  let sz, ls = fold_left 
    (fun (i, acc) x -> 
      (i+1, x::acc))
    (0, []) l in
  match ls with 
  | [] -> [|"[| |]"|]
  | init :: rest ->
    let a = make sz init in
    let idx = len - 2 in
    List.fold_left 
     (fun i vl -> 
       a.(i)<-vl; i-1) 
     idx rest;
    a
\end{minted}
    \end{minipage}
  \end{center}
  |]

#latex_slide [fragile] do
  latex![|
  \begin{center}
    \begin{tikzpicture}[overlay]
      \node<1-> at (0.0, 0.0) {\fontsize{20}{18}\selectfont{Writing verified code is hard...}};

      \draw<2->[line width=1.0mm, draw=ACMRed] (-4.65, 0.25) -- ($(-4.65, 0.25) + (2.3, -0.4)$);
      \node<2->[rotate=5] at (-3.35, 0.65) {\color{ACMDarkBlue}{\fontsize{20}{18}\selectfont{Maintaining}}};

      \node<3-4> at (0.0, -2.0) {\color{ACMDarkBlue!80!black}{\fontsize{20}{18}\selectfont{\textbf{Proof Repair}}}};
      \node<4> at (3.0, -4.0) {{\fontsize{18}{18}\selectfont{{Ringer (2021)}}}};

      \node<5-> at (0.0, -2.0) {\color{ACMDarkBlue}{\fontsize{20}{18}\selectfont{\textit{...can we make it easier?}}}};

      \node<6->[rotate=-5] at (3.5, -3.5) {\color{ACMDarkBlue}{\fontsize{40}{18}\selectfont{Yes!}}};


    \end{tikzpicture}
  \end{center}
  |]

