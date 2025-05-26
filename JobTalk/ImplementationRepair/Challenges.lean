import LeanTeX

#latex_preamble [|\setbeamercovered{transparent}|]

def mkChallengesSlide (focusOn : Nat) :=
  let guarded (id: Nat) := if focusOn == id then ",2" else ""
  slide "Key Challenges for Proof Repair" do
   latex![|
   \begin{enumerate}
   \item<1@{guarded 0}> \textit{Generating} candidate invariants
   \item<1@{guarded 1}> \textit{Choosing} valid invariants
   \end{enumerate}
   |]


