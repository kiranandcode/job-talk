import LeanTeX

#latex_preamble[|
\tikzset{
  title slide/.style={
    font=\fontsize{15}{20}\selectfont\color{white},
    text width=20em,
    inner xsep=1em,
    inner ysep=3em,
    align=left,
    fill=primary2!60!red,
    path picture={
      \draw[primary2!80!red, line width=6.0mm]
        (path picture bounding box.south west) -- 
                   (path picture bounding box.south east);
    }
  },
  title authors/.style={
    font=\fontsize{12}{12}\selectfont,
  }  
}
|]

#latex_slide do
  latex![| \centering |]
  tikz[] do
    node["title slide"] at (0,0) latex![|Sisyphus:\\Mostly Automated Proof Repair\\for Verified Librarires|]
    node["title authors"] at (0,-3) latex![|Kiran Gopinathan, Mayank Keoliya, Ilya Sergey|]
    node["title authors"] at (0,-4) latex![|PLDI'23|]



