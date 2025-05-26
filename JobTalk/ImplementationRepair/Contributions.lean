import LeanTeX
import JobTalk.Utils

#latex_slide "This work" do
   latex![|\centering|]
   tikz ["overlay"] do
     node at (0.0, 1.0) diagram (scale:=0.3) "sisyphus-logo"
     node at (0.0, -2.0)
        latex![|
        \fontsize{16}{16}\selectfont{\textit{Mostly} automated \textit{proof-repair} for OCaml programs}
        |]
