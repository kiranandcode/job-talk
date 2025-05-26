import LeanTeX
import JobTalk.ImplementationRepair.Outline

@[presentation]
def outline1 := mkOutlineSlide 1

#latex_slide [fragile] do
   latex![|
  \begin{center}
   \color{black}
    \begin{tikzpicture}[overlay]
      \node<1-> at (-1.0, 3.0) {\fontsize{18}{18}\selectfont{New Program:}};
      % \node<2-4> at (6.0, -2.5)
      % {\color{ACMDarkBlue}{\fontsize{14}{14}\selectfont{\textit{How to generate a proof script?}}}};
      % \node<3-4> at (0.0, -4.0)
      % {{\fontsize{12}{12}\selectfont{\textbf{Obs:} proofs are syntax-directed}}};
    \end{tikzpicture}
    \begin{minipage}[p]{0.45\linewidth}
\vspace{4em}
\begin{minted}[fontsize=\scriptsize]{ocaml}
let to_array s =

  let sz, ls = fold_left 
    (fun (i, acc) x -> 
      (i+1, x::acc))
    (0, []) l in
  match ls with 
  | [] -> [| "[||]" |]
  | init :: rest ->
    let a = make sz init in
    let idx = sz - 2 in
    List.fold_left 
     (fun i vl -> 
       a.(i)<-vl; i-1) 
     idx rest;
    a
\end{minted}
\end{minipage}

    \begin{tikzpicture}[overlay, remember picture]
      \draw<2-3>[fill=white,draw=none,fill opacity=0.8] (-6.5,7.5) rectangle (6.5,-1);
      \node<2-3>[rounded corners, fill=white] at (0.0, 4.0)
      {\color{ACMDarkBlue}{\fontsize{16}{16}\selectfont{\textbf{How to generate a proof script?}}}};
      \node<3>[fill=white, rounded corners] at (0.0, 2.0)
      {{\fontsize{14}{14}\selectfont{\textbf{Observation:} proofs are syntax-directed}}};
    \end{tikzpicture}
  \end{center}
   |]

#latex_slide [fragile] do
  latex![|
  \begin{center}
  \color{black}
    \begin{tikzpicture}[overlay]
    \end{tikzpicture}
    \begin{minipage}[p]{0.45\linewidth}
\vspace{2em}
\begin{minted}[fontsize=\scriptsize]{ocaml}
let to_array s =
  let sz, ls = fold_left 
    (fun (i, acc) x -> 
      (i+1, x::acc))
    (0, []) l in
  match ls with 
  | [] -> [| "[||]" |]
  | init :: rest ->
    let a = make sz init in
    let idx = sz - 2 in
    List.fold_left 
     (fun i vl -> 
       a.(i)<-vl; i-1) 
     idx rest;
    a
\end{minted}
\end{minipage}

    \begin{tikzpicture}[overlay, remember picture]
    \end{tikzpicture}
  \end{center}
  |]

#latex_slide ["fragile"] do
   latex![|
   \color{black}
  \begin{tikzpicture}[overlay, remember picture,
    left/.style={fill=primary2!60!white, fill opacity=0.5, draw=none, rounded corners}]
      \draw<2-4>[left] ($(pic cs:slide31leftp1) + (0.0, -0.125)$) rectangle ($(pic cs:slide31leftp1end) + (0.0, 0.25)$);
      \draw<5-6>[left] ($(pic cs:slide31leftp2) + (0.0, 0.25)$) rectangle ($(pic cs:slide31leftp2end) + (0.0, -0.125)$);


      \draw<7-8>[left] ($(pic cs:slide31leftp3) + (0.0, -0.125)$) rectangle ($(pic cs:slide31leftp3end) + (0.0, 0.25)$);
      \draw<9-10>[left] ($(pic cs:slide31leftp4) + (0.0, -0.125)$) rectangle ($(pic cs:slide31leftp4end) + (0.0, 0.25)$);
      \draw<11-12>[left] ($(pic cs:slide31leftp5) + (0.0, -0.125)$) rectangle ($(pic cs:slide31leftp5end) + (0.0, 0.25)$);
      \draw<13-14>[left] ($(pic cs:slide31leftp6) + (0.0, -0.125)$) rectangle ($(pic cs:slide31leftp6end) + (0.0, 0.25)$);

      \draw<15-16>[left] ($(pic cs:slide31leftp7) + (0.0, -0.125)$) rectangle ($(pic cs:slide31leftp7end) + (0.0, 0.25)$);
      \draw<17-18>[left] ($(pic cs:slide31leftp8) + (0.0, 0.25)$) rectangle ($(pic cs:slide31leftp8end) + (0.0, -0.125)$);
      \draw<19>[left] ($(pic cs:slide31leftp9) + (0.0, -0.125)$) rectangle ($(pic cs:slide31leftp9end) + (0.0, 0.25)$);

      \draw<21->[left] ($(pic cs:slide31holes) + (0.0, -0.125)$) rectangle ($(pic cs:slide31holee) + (0.0, 0.25)$);
  \end{tikzpicture}
    \begin{minipage}{0.45\linewidth}
      \fontsize{6}{12}\selectfont{
\begin{minted}[escapeinside=@@,fontsize=\scriptsize]{ocaml}
@\tikzmark{slide31leftp1}@let to_array s =@\tikzmark{slide31leftp1end}@
  let sz, ls =
    @\tikzmark{slide31leftp2}@fold (fun (i, acc) x -> 
           (i + 1, x :: acc))
      (0, []) s in           @\tikzmark{slide31leftp2end}@
   @\tikzmark{slide31leftp3}@match ls with@\tikzmark{slide31leftp3end}@
     @\tikzmark{slide31leftp4}@| [] -> [| "[||]" |]@\tikzmark{slide31leftp4end}@
     @\tikzmark{slide31leftp5}@| init::rest ->@\tikzmark{slide31leftp5end}@
       @\tikzmark{slide31leftp6}@let a = make sz init in@\tikzmark{slide31leftp6end}@
       @\tikzmark{slide31leftp7}@let idx = sz - 2 in@\tikzmark{slide31leftp7end}@
       @\tikzmark{slide31leftp8}@List.fold_left
         (fun i x -> 
           a.(i)<-x; i-1)
         idx rest in        @\tikzmark{slide31leftp8end}@
       @\tikzmark{slide31leftp9}@a@\tikzmark{slide31leftp9end}@
\end{minted}
      }
    \end{minipage}
    \begin{minipage}{0.4\linewidth}
\vspace{0.50em}
      \fontsize{8}{10}\selectfont{
\begin{minted}[escapeinside=@@]{coq}
@\tikzmark{slide31rightp1}@xcf.@\tikzmark{slide31rightp1end}@

@\tikzmark{slide31rightp2}@xapp (...).@\tikzmark{slide31rightp2end}@

@\tikzmark{slide31rightp3}@case l as [ | init rest].@\tikzmark{slide31rightp3end}@
  @\tikzmark{slide31rightp4}@- xmatch 0. xvalemptyarr.@\tikzmark{slide31rightp4end}@
  @\tikzmark{slide31rightp5}@- xmatch 1.@\tikzmark{slide31rightp5end}@
    @\tikzmark{slide31rightp6}@xalloc a data Hdata.@\tikzmark{slide31rightp6end}@
    @\tikzmark{slide31rightp7}@xlet idx.@\tikzmark{slide31rightp7end}@
    @\tikzmark{slide31rightp8}@xapp (fold_left_spec idx rest
    (fun acc t => 
     @\tikzmark{slide31holes}@(??)@\tikzmark{slide31holee}@)).                        @\tikzmark{slide31rightp8end}@

    @\tikzmark{slide31rightp9}@xvals.@\tikzmark{slide31rightp9end}@
\end{minted}
      }
    \end{minipage}
    \begin{tikzpicture}[remember picture, overlay, tipex/.style={fill=white, rounded corners, draw=none}]
      \draw<-2>[tipex] ($(pic cs:slide31rightp1) + (0.0, -0.125)$) rectangle ($(pic cs:slide31rightp1end) + (0.0, 0.25)$);

      \draw<-5>[tipex] ($(pic cs:slide31rightp2) + (0.0, -0.125)$) rectangle ($(pic cs:slide31rightp2end) + (0.0, 0.25)$);
      \draw<-5>[tipex] ($(pic cs:slide31rightp2.5) + (0.0, -0.125)$) rectangle ($(pic cs:slide31rightp2.5end) + (0.0, 0.25)$);

      \draw<-7>[tipex] ($(pic cs:slide31rightp3) + (0.0, -0.125)$) rectangle ($(pic cs:slide31rightp3end) + (0.0, 0.25)$);
      \draw<-9>[tipex] ($(pic cs:slide31rightp4) + (0.0, -0.125)$) rectangle ($(pic cs:slide31rightp4end) + (0.0, 0.25)$);
      \draw<-11>[tipex] ($(pic cs:slide31rightp5) + (0.0, -0.125)$) rectangle ($(pic cs:slide31rightp5end) + (0.0, 0.25)$);
      \draw<-13>[tipex] ($(pic cs:slide31rightp6) + (0.0, -0.125)$) rectangle ($(pic cs:slide31rightp6end) + (0.0, 0.25)$);
      \draw<-15>[tipex] ($(pic cs:slide31rightp7) + (0.0, -0.125)$) rectangle ($(pic cs:slide31rightp7end) + (0.0, 0.25)$);
      \draw<-17>[tipex] ($(pic cs:slide31rightp8) + (0.0, 0.25)$) rectangle ($(pic cs:slide31rightp8end) + (0.0, -0.125)$);
      \draw<-18>[tipex] ($(pic cs:slide31rightp9) + (0.0, -0.125)$) rectangle ($(pic cs:slide31rightp9end) + (0.0, 0.25)$);

    \end{tikzpicture}

    \begin{center}
      \begin{tikzpicture}[overlay, remember picture]
        \draw<22->[fill=white,fill opacity=0.5,draw=none] (-7.5, 6.0) rectangle (7.5, -2.0);
        \node<22->[rounded corners, fill=white, draw=primary1] at (0.0, 2.0)
        {\color{ACMDarkBlue}{\fontsize{20}{20}\selectfont{\textbf{How to fill in holes?}}}};
      \end{tikzpicture}
    \end{center}
|]
