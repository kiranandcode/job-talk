import LeanTeX
import JobTalk.Utils

#latex_slide "Proof-Driven Testing" do
  latex![|\centering|]
  with steps [proofs_are_programs, but_what_do_they_compute, classic_answer, pdt_answer] do
    tikz ["overlay"] do
      node<proofs_are_programs-> at(3.0, 2.0)
         latex![| \fontsize{14}{16}\selectfont{Proofs are \emph{programs}...} |]
      node<proofs_are_programs-> at (-4,0.0)
         diagram (scale:=0.175) "galaxy-brain"
      node<but_what_do_they_compute-> at (4.25, 1.0)
         latex![| \fontsize{14}{16}\selectfont{but, what do they \emph{compute}?} |]
      node<classic_answer-> at (4.0,-0.5)
         latex![|\fontsize{10}{18}\selectfont{\textbf{Curry Howard:} {They establish logical facts.}}|]
      node<pdt_answer-> at (3.5,-1.5)
         latex![|\fontsize{12}{18}\selectfont{\textbf{PDT:} {HO-proofs describe tests!}}|]
