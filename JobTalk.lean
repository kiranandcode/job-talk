import LeanTeX

#usepackage beamerthemeleantex
#usepackage bera
#usepackage tikz
#usepackage fontenc with options [T1]
#usepackage mathptmx
#usepackage amsmath
#usepackage amssymb

#latex_preamble [| \graphicspath{{./images}} |]
#latex_preamble [| \include{style} |]

#latex_preamble [| \usetikzlibrary{positioning, fit, backgrounds, scopes, calc, shapes.misc, arrows, arrows.meta} |]
#latex_preamble [| \pgfdeclarelayer{background} |]
#latex_preamble [| \pgfdeclarelayer{background-block} |]
#latex_preamble [| \pgfdeclarelayer{foreground} |]
#latex_preamble [| \pgfsetlayers{background, background-block, main, foreground} |]



#latex_preamble [|\title{Verified Systems that Evolve}|]
#latex_preamble[|\author{Kiran Gopinathan}|]
#latex_preamble[|\institute{University of Illinois Urbana Champaign}|]

#latex_slide do
   latex![| \titlepage |]

#latex_slide do
  latex![|
  \frametitle{We are experiencing a software revolution...}
  \centering
  \begin{tikzpicture}[overlay, remember picture]
  \node at (-3.5,2) {\includegraphics[scale=0.225]{github-innovation-data.png}};
  \node at (-3.5,-0.1) {\includegraphics[scale=0.23]{github-graph.png}};
  \node at (5,-2.5) {\includegraphics[scale=0.125]{ai-headline-1.png}};
  \node at (1.5,-2.5) {\includegraphics[scale=0.1]{ai-headline-2.png}};
  \node at (3.5,1.5) {\includegraphics[scale=0.25]{ai-headline-3.png}};
  \node at (3.75,-0.75) {\includegraphics[scale=0.25]{ai-headline-4.png}};
  \end{tikzpicture}
  |]

#latex_slide do
  latex![|
  \frametitle{...but this comes with a risk}
  \centering
  \begin{tikzpicture}[overlay, remember picture]
  \node at (-3.5,1.9) {\includegraphics[scale=0.2]{bug-example-1.png}};
  \node at (-3.5,0.125) {\includegraphics[scale=0.2]{bug-example-2.png}};
  \node at (-4.5,-1) {\includegraphics[scale=0.2]{bug-example-3.png}};
  \node at (-4.0,-2) {\includegraphics[scale=0.2]{bug-example-4.png}};
  \node at (4.0,2) {\includegraphics[scale=0.275]{bug-example-5.png}};
  \node at (4.0,0) {\includegraphics[scale=0.275]{bug-example-6.png}};
  \node at (3.0,-2.25) {\includegraphics[scale=0.175]{bug-example-7.png}};
  \end{tikzpicture}
  |]

#latex_slide do

#latex_slide do
  latex![|
    \begin{center}
    \include{research-vision}
    \end{center}
    |]
