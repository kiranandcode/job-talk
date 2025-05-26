import LeanTeX

#latex_slide [fragile] do
  latex![|\centering|]
  with steps [s1,s2,s3] do
    tikz ["every node/.style={font=\\fontsize{20}{20}\\selectfont}"] do
      node<s1> "Let's write a program!"
      node<s2> latex![|Let's write a \textit{verified} program!|]
      node<s3> at (0.0, 1.0) latex![|Let's write a \textit{verified} program!|]
      node<s3> at (0.0, -1.0) latex![|\textbf{Q}: Convert a sequence to an array.|]

#latex_preamble [|\tikzset{
 highlight/.style={fill=primary1!80, fill opacity=0.25, inner sep=1em, draw=none}
}|]

#latex_slide[fragile] do
  latex![|
  \begin{center}
    \color{black}
    \begin{tikzpicture}[overlay, remember picture, seqlist/.style={rounded corners=2pt, draw=primary1, fill=primary1!30, minimum width=3.5em, minimum height=2.5em}]
      \node<1-> at (0.0, 2.0) {\fontsize{20}{18}\selectfont{\color{black}OCaml's \mintinline{ocaml}{'a Seq.t} datatype}};

      \draw<2>[highlight] ($(pic cs:sintroseqstart) + (0.0,-0.25)$) rectangle ($(pic cs:sintroseqend) + (0.0,0.5)$);

      \node<2> at ($(pic cs:sintroseqstart) + (1.75,-0.75)$) {A \textit{thunked} tail};

      \pgfmathsetmacro{\nodesxinit}{-5.0}
      \pgfmathsetmacro{\nodesypos}{-3.75}
      \pgfmathsetmacro{\maxnodes}{2}
      \foreach \x in {1,...,\maxnodes} {
        \pgfmathtruncatemacro{\xpos}{\nodesxinit + (\x * 2.5)};
        \node<3->[seqlist] (n\x) at (\xpos, \nodesypos)
        {\fontsize{20}{20}\selectfont{\x}};
      }
      \pgfmathtruncatemacro{\xnilpos}{\nodesxinit + ((\maxnodes + 1) * 2.5)};

      \node<3->[seqlist] (nfinal) at (\xnilpos, \nodesypos) {\fontsize{20}{20}\selectfont{Nil}};
      \draw<3->[bend right=2.0em,>=stealth,->] (n1) -- (n2);
      \draw<3->[bend right,>=stealth,->] (n2) -- (nfinal);

      \node<4-> at (0.0, -5.25) {\mintinline{ocaml}{fun () -> Cons (1, fun () -> Cons (2, fun () -> Nil))}};

    \end{tikzpicture}
\color{black}
\begin{minted}[escapeinside=@@]{ocaml}
type 'a t    = unit -> 'a node
and  'a node = Nil
             | Cons of 'a * @\tikzmark{sintroseqstart}@(unit -> 'a node)@\tikzmark{sintroseqend}@
\end{minted}
  \end{center}
|]

#latex_slide [fragile] do
  latex![|
  \begin{center}
    \begin{tikzpicture}[overlay]
      % \node<2> at (0.0, 0.0) {\fontsize{20}{18}\selectfont{Let's write a \textbf{verified} program!}};
      \node at (0.0, 1.0) {\fontsize{20}{18}\selectfont{Let's write a verified program!}};
      % \node<2> at (0.0, -1.0) {\fontsize{20}{20}\selectfont{$\{ \text{lseg}(x,S) \} \quad \texttt{listfree}(x) \quad \{ \text{emp}\}$}};
      \node at (0.0, -1.0) {\fontsize{20}{18}\selectfont{\textbf{Q:} Convert a sequence to an array.}};
      \node<2>[text width=8.0em, align=center, rotate=-15] at (3.5, -3.5) {\Large{Let's write some code!}};

    \end{tikzpicture}
  \end{center}
  |]



