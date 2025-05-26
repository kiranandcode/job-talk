import LeanTeX

#latex_slide["fragile"] do
  latex![|
\centering
  \begin{center}
\begin{tikzpicture}[
  every node/.style={rounded corners, line width=0.2mm, font=\fontsize{7}{7}\selectfont},
  every path/.style={>=latex},
  action/.style={draw,line width=0.5mm,->,draw=ired},
  title/.style={},
  component/.style={minimum width=10.0em, minimum height=1.3em},
  user-provided/.style={fill=white,draw=black},
  sis-generated/.style={fill=igreen!60,draw=black},
  sis-component/.style={fill=ipurple!80,draw=black},
  proof/.style={fill=iblue!60, draw=none},
  sis-internal-light/.style={fill=ilgray!100, draw=none},
  sis-internal-deep/.style={fill=idgray!40, draw=none},
  overlay
  ]

  % OLD PROOF
  % =====================================
  \node (oldproof) at (-4.9, 1.9) [title] { Old Proof };
  \node (oldspec) [user-provided, below=0.75 of oldproof.north,component] { Specification };
  \node (oldskeleton) [user-provided, below=0.75 of oldspec.north,component] { Skeleton };
  \node (oldinvariants) [user-provided, below=0.75 of oldskeleton.north,component] { Invariants };
  \node (oldobligations) [draw=none, fill=none, below=0.75 of oldinvariants.north,component] { };

  \begin{scope}[on background layer={}]
  \node[proof, inner sep=5, fit={(oldspec) (oldskeleton) (oldinvariants) }] {};
  \end{scope}

  % OLD & NEW PROGRAMS
  % =====================================
  \node (newprogram) [user-provided, below=1.0 of oldobligations.north, component] { New Program };
  \node (oldprogram) [user-provided, below=0.75 of newprogram.north, component] { Old Program };

  % NEW PROOF
  % =====================================
  \node (newproof) [title, right = 8.5 of oldproof.east] {New Proof};

  \node (newspec) [user-provided, below=0.75 of newproof.north,component] { Specification };
  \node (newskeleton) [sis-generated, below=0.75 of newspec.north,component] { Skeleton };
  \node (newinvariants) [sis-generated, below=0.75 of newskeleton.north,component] { Invariants };
  \node (newobligations) [sis-generated, dashed, below=0.75 of newinvariants.north,component] { Obligations };

  \begin{scope}[on background layer={}]
  \node[proof, inner sep=5, fit={(newspec) (newskeleton) (newinvariants) (newobligations)}] {};
  \end{scope}

  % SISYPHUS
  % =====================================
  \path (oldskeleton) -- node (sisskelgen) [sis-component,component] {Skeleton Generation} (newskeleton);

  \node (sisyphus) [title] at (sisskelgen|-oldproof) {\fontsize{18}{18}\selectfont{\textsc{Sisyphus}}};
  \node (sisyphusbottom) [draw=none,fill=none,above =0.3 of sisskelgen] {};

  % \node (sisalign) [sis-component, component, below=1.0  of sisskelgen.north] {Alignment};
  \node (sisgen) [sis-component, component, below=1.0 of sisskelgen.north] {Invariant Synthesis};
  \node (sistest) [sis-component, component, below=0.9 of sisgen.north] {Invariant Testing};


  \begin{scope}[on background layer={}]
  \node[sis-internal-light, inner sep=10, fit={(sisyphusbottom) (sisskelgen)  (sisgen) (sistest)}] {};
  % \node[sis-internal-deep, inner sep=5, fit={(sistest)}] {};
  \end{scope}


  \begin{scope}[on background layer={}]


  \node<2>[draw=ACMPurple!80, line width=0.5mm, dashed, inner sep=8, fit={(oldproof) (oldspec) (oldskeleton) (oldinvariants) (oldobligations) (newprogram) (oldprogram)}] (inputs) {};
   \node<2>[below=0.125 of inputs.south,fill=none, draw=none] {\fontsize{14}{16}\selectfont{\color{ACMPurple!80!black}{Inputs}}};

  \node<1,3->[draw=none, line width=0.5mm, dashed, inner sep=8, fit={(oldproof) (oldspec) (oldskeleton) (oldinvariants) (oldobligations) (newprogram) (oldprogram)}] (inputs) {};

   \node<1,3->[below=0.785 of inputs.south,fill=none, draw=none] {};

  \node<3>[draw=ACMPurple!80, line width=0.5mm, dashed, inner sep=8, fit={(newproof) (newspec) (newskeleton) (newinvariants) (newobligations)}] (outputs) {};
   \node<3>[below=0.125 of outputs.south,fill=none, draw=none] {\fontsize{14}{16}\selectfont{\color{ACMPurple!80!black}{Output}}};
  \node<-2,4->[draw=none, line width=0.5mm, dashed, inner sep=8, fit={(newproof) (newspec) (newskeleton) (newinvariants) (newobligations)}] (outputs) {};

  \end{scope}



  % SISYPHUS PDT
  % =====================================
  % \node (sisred) [sis-component, component, below=0.85 of sistest] {Proof Term Reduction};
  % \node (sisinst) [sis-component, component, left= of sisred] {Proof Term Instantiation};
  % \node (sisprune) [sis-component, component, right=of sisred] {Candidate Pruning};

  % \begin{scope}[on background layer={}]
  % \path[sis-internal-deep] (sistest) -- ($(sisred) - (0.5, 0.0)$) -- ($(sisred) + (0.5, 0.0)$) -- cycle;
  % \node[sis-internal-deep, inner sep=5, fit={(sisinst) (sisred) (sisprune)}] {};
  % \end{scope}

  % \path[action,line width=0.5mm] (sisinst) -- (sisred);
  % \path[action,line width=0.5mm] (sisred) -- (sisprune);
  % \path[action,rounded corners] (sistest) -| ++(2.125, 0) |- (sisinst);

\end{tikzpicture}
  \end{center}
\end{frame}

\begin{frame}[fragile]
\centering
  \begin{center}
\begin{tikzpicture}[
  every node/.style={rounded corners, line width=0.2mm, font=\fontsize{7}{7}\selectfont},
  every path/.style={>=latex},
  action/.style={draw,line width=0.5mm,->,draw=ired},
  title/.style={},
  component/.style={minimum width=10.0em, minimum height=1.3em},
  user-provided/.style={fill=white,draw=black},
  sis-generated/.style={fill=igreen!60,draw=black},
  sis-component/.style={fill=ipurple!80,draw=black},
  proof/.style={fill=iblue!60, draw=none},
  sis-internal-light/.style={fill=ilgray!100, draw=none},
  sis-internal-deep/.style={fill=idgray!40, draw=none}
  ]

  % OLD PROOF
  % =====================================
  \node (oldproof) [title] { Old Proof };
  \node (oldspec) [user-provided, below=0.75 of oldproof.north,component] { Specification };
  \node (oldskeleton) [user-provided, below=0.75 of oldspec.north,component] { Skeleton };
  \node (oldinvariants) [user-provided, below=0.75 of oldskeleton.north,component] { Invariants };
  \node (oldobligations) [draw=none,fill=none, below=0.75 of oldinvariants.north,component] {  };

  \begin{scope}[on background layer={}]
  \node[proof, inner sep=5, fit={(oldspec) (oldskeleton) (oldinvariants) }] {};
  \end{scope}

  % OLD & NEW PROGRAMS
  % =====================================
  \node (newprogram) [user-provided, below=1.0 of oldobligations.north, component] { New Program };
  \node (oldprogram) [user-provided, below=0.75 of newprogram.north, component] { Old Program };

  % NEW PROOF
  % =====================================
  \node (newproof) [title, right = 8.5 of oldproof.east] {New Proof};

  \node (newspec) [user-provided, below=0.75 of newproof.north,component] { Specification };
  \node (newskeleton) [sis-generated, below=0.75 of newspec.north,component] { Skeleton };
  \node (newinvariants) [sis-generated, below=0.75 of newskeleton.north,component] { Invariants };
  \node (newobligations) [sis-generated, dashed, below=0.75 of newinvariants.north,component] { Obligations };

  \begin{scope}[on background layer={}]
  \node[proof, inner sep=5, fit={(newspec) (newskeleton) (newinvariants) (newobligations)}] {};
  \end{scope}

  % SISYPHUS
  % =====================================
  \path<2->[action,dashed] (oldspec) to ([xshift = -5pt]newspec.west);
  \path (oldskeleton) -- node (sisskelgen) [sis-component,component] {Skeleton Generation} (newskeleton);
  \path<3->[action] (sisskelgen) -- ([xshift = -5pt]newskeleton.west);

  % \node (sisyphus) [title] at (sisskelgen|-oldproof) {\textsc{Sisyphus}};
  \node (sisyphus) [title] at (sisskelgen|-oldproof) {\fontsize{18}{18}\selectfont{\textsc{Sisyphus}}};
  \node (sisyphusbottom) [draw=none,fill=none,above =0.3 of sisskelgen] {};

  % \node (sisalign) [sis-component, component, below=1.0  of sisskelgen.north] {Alignment};
  \node (sisgen) [sis-component, component, below=0.9 of sisskelgen.north] {Invariant Synthesis};
  \node (sistest) [sis-component, component, below=0.9 of sisgen.north] {Invariant Testing};


  \node<3->[draw=none,fill=none,xshift=-4.25em] at (sisskelgen) {\textbf{(1)}};
  % \node<5->[draw=none,fill=none,xshift=-4.25em] at (sisalign) {\textbf{(3)}};
  \node<4->[draw=none,fill=none,xshift=-4.25em] at (sisgen) {\textbf{(2)}};
  \node<5->[draw=none,fill=none,xshift=-4.25em] at (sistest) {\textbf{(3)}};

  \begin{scope}[on background layer={}]
  \node[sis-internal-light, inner sep=10, fit={(sisyphusbottom) (sisskelgen) (sisgen) (sistest)}] {};
  % \node[sis-internal-deep, inner sep=5, fit={(sistest)}] {};
  \end{scope}

  % SISYPHUS PDT
  % =====================================
  % \node (sisred) [sis-component, component, below=0.85 of sistest] {Proof Term Reduction};
  % \node (sisinst) [sis-component, component, left= of sisred] {Proof Term Instantiation};
  % \node (sisprune) [sis-component, component, right=of sisred] {Candidate Pruning};

  % \begin{scope}[on background layer={}]
  % \path[sis-internal-deep] (sistest) -- ($(sisred) - (0.5, 0.0)$) -- ($(sisred) + (0.5, 0.0)$) -- cycle;
  % \node[sis-internal-deep, inner sep=5, fit={(sisinst) (sisred) (sisprune)}] {};
  % \end{scope}

  % LINES
  % =====================================
  % \path<5->[action,line width=0.5mm] (sisalign) -- % node[midway,xshift=10] {(2)}
  % (sisgen);
  \path<5->[action,line width=0.5mm] ([xshift=-20pt]sisgen.south) to ([xshift=-20pt]sistest.north);
  \path<5->[action,line width=0.5mm] ([xshift=20pt]sistest.north) to ([xshift=20pt]sisgen.south);

  \path<3->[action,rounded corners] (newprogram) -| ++(2.10, 0) |- (sisskelgen);
  \path<4->[action,rounded corners] (newprogram) -| ++(2.10, 0) |- ([yshift=8pt]sisgen);
  \path<4->[action,rounded corners] (oldprogram) -| ++(2.35, 0) |- ([yshift=-8pt]sisgen);
  % \path<4->[action,rounded corners,-] (oldinvariants) -- ++(2.35, 0.0375);


  \path<6->[action,rounded corners] (sisgen) -| ++(2.35, 0.0) |- ([xshift = -5pt]newinvariants.west);
  \path<6->[action,rounded corners] (sisgen) -| ++(2.35, 0.0) |- ([xshift = -5pt]newobligations.west);


  % \path[action,line width=0.5mm] (sisinst) -- (sisred);
  % \path[action,line width=0.5mm] (sisred) -- (sisprune);
  % \path[action,rounded corners] (sistest) -| ++(2.125, 0) |- (sisinst);

\end{tikzpicture}
  \end{center}
  |]

