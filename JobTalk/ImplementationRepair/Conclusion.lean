import LeanTeX

#latex_slide "To Take Away" do
  latex![|
  \begin{center}
    \begin{tikzpicture}[overlay]
      \node[anchor=west] at (-6.5,0.125) {\fontsize{13}{13}\selectfont{\textit{Mostly Automated Proof Repair for Verified Libraries (PLDI'23)}}};
    \node<2->[fill=primary1!80!ACMDarkBlue, align=center, text width=10em] at (5.5, 2.0) {\color{white}\fontsize{10}{10}\selectfont{\textbf{\textit{ACM SIGPLAN\\Distinguished Paper}}}};
    \end{tikzpicture}
  \end{center}
  \vspace{-1em}
  \begin{enumerate}
  \item Building blocks for {\fontsize{14}{14}\selectfont \textit{new proof}} found in {\fontsize{14}{14}\selectfont \textit{old proof}} 

  \item {\fontsize{14}{14}\selectfont\textit{Picking}} a correct invariant is hard!

    % \fontsize{14}{14}\selectfont{\textbf{PDT}: technique to \textit{efficiently} test invariants.}

  \item {A new take on Curry-Howard: {\fontsize{14}{14}\selectfont{\textit{\textit{Proof-Driven Testing}}}}}

\vspace{1em}

\end{enumerate}
  |]
