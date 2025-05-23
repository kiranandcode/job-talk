import LeanTeX

#usepackage beamerthemeleantex
#usepackage bera
#usepackage "tikz"
#usepackage fontenc with options [T1]
#usepackage mathptmx
#usepackage amsmath
#usepackage amssymb

#latex_preamble [| \graphicspath{{./images}} |]
#latex_preamble [| \include{style} |]

#latex_preamble [| \usetikzlibrary{positioning, fit, backgrounds, scopes, calc, shapes, shapes.callouts, shapes.geometric, shapes.misc, arrows, arrows.meta} |]
#latex_preamble [| \pgfdeclarelayer{background} |]
#latex_preamble [| \pgfdeclarelayer{background-block} |]
#latex_preamble [| \pgfdeclarelayer{foreground} |]
#latex_preamble [| \pgfsetlayers{background, background-block, main, foreground} |]

#latex_preamble [|
\tikzset{
   highlight comment/.style={
     align=center,
     fill=primary1!30,
     inner sep=0.25cm,
     font=\fontsize{8}{8}\selectfont,
     path picture={
       \draw[primary1!80, line width=2.75mm]
         (path picture bounding box.north west) -- 
         (path picture bounding box.north east);
     }
   },
   highlight comment bad/.style={
     align=center,
     fill=primary2!30,
     inner sep=0.25cm,
     font=\fontsize{8}{8}\selectfont,
     path picture={
       \draw[primary2!80, line width=2.75mm]
         (path picture bounding box.north west) -- 
         (path picture bounding box.north east);
     }
   }
}
|]
