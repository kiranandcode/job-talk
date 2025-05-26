import LeanTeX

#latex_preamble [|\setbeamercovered{transparent}|]

def mkOutlineSlide (focusOn : Nat) :=
  let guarded (id: Nat) := if focusOn == id then ",2" else ""
  slide "Outline" do
   latex![|
   \begin{enumerate}
   \item<1@{guarded 0}> Motivation
   \item<1@{guarded 1}> Key Challenges \& Solutions
   \item<1@{guarded 2}> Evaluation
   \end{enumerate}
   |]




