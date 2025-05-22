import LeanTeX
import JobTalk.Utils

#latex_preamble [|
\tikzset{
    idea/.style={
      rectangle callout,
      fill=primary1!30,
      rounded corners=1,
      callout pointer arc=100,
      callout pointer start size=5,
      callout pointer shorten=1cm,
      callout absolute pointer={(origin)},
      minimum width=4.5cm, minimum height=1.0cm
    },
    example/.style={
      text width=5em,
      align=center,
      font=\fontsize{8}{8}\selectfont
    },
    problem/.style={
      text width=22em,
      align=center,
      rounded corners=1,
      line width=0.75mm,
      fill=primary1!80!blue,
      font=\fontsize{20}{20}\selectfont\color{white}
    },
    large text/.style={
      font=\fontsize{16}{16}\selectfont
    }
}|]

#latex_slide "We are experiencing a software revolution..." do
  latex![| \centering |]
  tikz [overlay, "remember picture"] do
      node at (-3.5,2)     diagram (scale:=0.225) "github-innovation-data"
      node at (-3.5,-0.1)  diagram (scale:=0.23) "github-graph"
      node at (5,-2.5)     diagram (scale:=0.125) "ai-headline-1"
      node at (1.5,-2.5)   diagram (scale:=0.1) "ai-headline-2"
      node at (3.5,1.5)    diagram (scale:=0.25) "ai-headline-3"
      node at (3.75,-0.75) diagram (scale:=0.25) "ai-headline-4"

#latex_slide "...but this comes with a risk" do
  latex![|\centering|]
  tikz [overlay, "remember picture"] do
    node at (-3.5,1.9) diagram (scale:=0.2) "bug-example-1" 
    node at (-3.5,0.125) diagram (scale:=0.2) "bug-example-2"
    node at (-4.5,-1) diagram (scale:=0.2) "bug-example-3"
    node at (-4.0,-2) diagram (scale:=0.2) "bug-example-4"
    node at (4.0,2) diagram (scale:=0.275) "bug-example-5"
    node at (4.0,0) diagram (scale:=0.275) "bug-example-6"
    node at (3.0,-2.25) diagram (scale:=0.175) "bug-example-7"

#latex_slide "The Good News: a Verification Renaissance" do
   latex![|\centering|]
   with steps [_empty, verified, fs, fs1, fs2, comp, comp1, comp2, crypto, crypto1, crypto2, dist, dist1, dist2, os, os1, os2, problem] do
      tikz [overlay, "remember picture"] do
         node<verified->[] origin at (0,0)
           "Real software can be now be verified"
         node<comp-> compilers at (4.8,1.25) "Compilers"
         node<fs-> file_systems at (-4.8,1.25) "File Systems"
         node<crypto-> crypto at (-4,-2) "Cryptographic Protocols"
         node<dist-> distrib at (4,-2) "Distributed Algorithms"
         node<os-> osses at (0,2) "Operating Systems"
         on layer background do
           for (n,id) in [("file_systems",fs), ("compilers",comp), ("crypto",crypto), ("distrib",dist), ("osses", os)] do
             node<id-> [idea, {if n == "osses" then "draw=none" else "callout pointer shorten=2.25cm"}] at (s!"({n})") ""

           node["fill=white", "draw=primary1!30", "line width=0.55mm", "minimum width=8cm", "minimum height=0.75cm"]  at (0,0) ""

         node<comp1->["example"] at ("($(compilers) + (-1.25, 1.0)$)") "CakeML"
         node<comp2->["example"] at ("($(compilers) + (1.25, 1.0)$)") "CompCert"

         node<fs1->["example"] at ("($(file_systems) + (-1.25, 1.0)$)") "CrashFS"
         node<fs2->["example"] at ("($(file_systems) + (1.25, 1.0)$)") "Daisy-NFSD"

         node<crypto1->["example"] at ("($(crypto) + (-1.25, -1.0)$)") "Fiat Crypto"
         node<crypto2->["example"] at ("($(crypto) + (1.25, -1.0)$)") "HACL*"

         node<dist1->["example"] at ("($(distrib) + (-1.25, -1.0)$)") latex![|IronFleet\\Paxos|]
         node<dist2->["example"] at ("($(distrib) + (1.25, -1.0)$)") latex![|Velisarios\\PBFT|]

         node<os1->["example"] at ("($(osses) + (-1.25, -1.0)$)") "seL4"
         node<os2->["example"] at ("($(osses) + (1.25, -1.0)$)") "CertiKOS"

         node<problem->["problem", "anchor=north"] at (-3,-2.5) s!"but a problem arises..."


#latex_slide "The Problem" do
   latex![|\centering|]
   with steps [verif_from_maths, code_is_not_maths] do
     tikz [overlay, "remember picture"] do
        node<verif_from_maths->["large text"] at (0,1.25) latex![|Verification draws from @{highlighted "mathematics"}...|]
        node<code_is_not_maths->["large text"] at (1.5,-1.25) latex![|...but @{highlighted (color:="primary2") "code"} is not maths.|]

#latex_preamble [|
\tikzset{
   bold text/.style={font=\bfseries},
   big arrow/.style={->,>=stealth, line width=1.25mm, draw=primary1},
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
   },
   medium text/.style={
     font=\fontsize{11}{11}\selectfont
   }
}
|]

#latex_slide "The Problem" do
   latex![|\centering|]
   with steps [
      base,
      maths_stmt,
      maths_old, maths_old_date, maths_new, maths_new_date, maths_new_benefit1, maths_new_benefit2,
      code_stmt,
      code_old, code_old_date, code_new, code_new_date, code_new_failure, code_new_failure_err
   ] do
     tikz [overlay, "remember picture"] do
        node<maths_stmt->["large text", "anchor=west"] at (-6, 2) "Mathematics"
        node<code_stmt->["large text", "anchor=west"] at (-6, -0.5) "Code"

        node<maths_old->["large text"] math_old at (-3, 1) "$a^2 + b^2 = c^2$"
        node<maths_old_date->["bold text"] at (-3, 0.0) "560 BC"

        node<code_old->["large text"] program_old at (-3, -1.5) "\\texttt{program.c}"
        node<code_old_date->["bold text"] at (-3, -2.5) "Yesterday"

        node<maths_new->["large text"] math_new at (4, 1) "$a^2 + b^2 = c^2$"
        node<maths_new_date->["bold text"] at (4, 0) "2024"

        node<code_new->["large text"] program_new at (4, -1.5) "\\texttt{program.c}"
        node<code_new_date->["bold text"] at (4, -2.5) "Today"

        draw<maths_new->["big arrow", "draw=primary1"] ("(math_old) -- (math_new)")
        draw<code_new_failure->["big arrow", "dashed", "draw=primary2"] ("(program_old) -- ($(program_new) ! 0.5 ! (program_old)$) node[starburst,fill=primary2] (explosion) {}")

        node<maths_new_benefit1->["highlight comment"] at ("($(math_new) + (-1.5, 1.0)$)") "No maintenance"
        node<maths_new_benefit2->["highlight comment"] at ("($(math_new) + (1.5, 1.0)$)") "Unchanged"

        node<code_new_failure_err->["highlight comment bad"] at ("($(program_new) + (1.5, 0.75)$)") "err: file not found"

#latex_preamble [|
\tikzset{
   cause of change box/.style={
     highlight comment bad, medium text,
     text width=14em,
     align=left,
     anchor=west
   }
}
|]

#latex_slide "The Problem" do
    latex![|\centering|]
    with steps [base, cause_1_spec, cause_2_impl, cause_3_ecosystem] do
       tikz [overlay, "remember picture"] do
          node["large text"] program_old at (-4.0,0.0) "\\texttt{program.c}"
          node["draw=none", "fill=none"] program_new at (4.0,0.0) ""
          draw["big arrow", "dashed", "draw=primary2"] ("(program_old) -- ($(program_new) ! 0.5 ! (program_old)$) node[starburst,fill=primary2] (explosion) {}")
          node<cause_1_spec->["cause of change box"] at (1.5, 1.75) "1. Change in \\textbf{Specification}"
          node<cause_2_impl->["cause of change box"] at (1.5, 0.0) "2. Change in \\textbf{Implementation}"
          node<cause_3_ecosystem->["cause of change box"] at (1.5, -1.75) "3. Change in \\textbf{Ecosystem}"

#latex_preamble [|
\tikzset{
   image bordered/.style={
     align=center,
     fill=white,
     inner sep=0.25cm,
     font=\fontsize{8}{8}\selectfont,
     path picture={
       \draw[primary1!10, line width=1.5mm]
         (path picture bounding box.north west) -- 
         (path picture bounding box.south west);
       \draw[primary1!10, line width=1.5mm]
         (path picture bounding box.north east) -- 
         (path picture bounding box.south east);
       \draw[primary1!10, line width=1.5mm]
         (path picture bounding box.south west) -- 
         (path picture bounding box.south east);
       \draw[primary1!80, line width=2.75mm]
         (path picture bounding box.north west) -- 
         (path picture bounding box.north east);
     },
     anchor=north
   }
}
|]

#latex_preamble [|
\tikzset{
  dashed box/.style={draw=primary2, dashed, line width=0.75mm, minimum height=1.0em}
}
|]

#latex_slide "The Problem" do
   latex![|\centering|]
   with steps [
      base,
      repo1, repo1_unmaintained,
      repo2, repo2_questions,
      repo3, repo3_fixes,
      repo4, repo4_last_update,
      question
   ] do
      tikz [overlay, "remember picture"] do
        node<repo1->["image bordered"] at (-3,2.5) diagram.pdf "example-repo-1-fscq" (scale:=0.45)
        node<repo1_unmaintained->["text width=9em", "dashed box"] at (-5.1,-1.7) ""

        node<repo2->["image bordered"] at (-1,1) diagram.pdf "example-repo-2-ironclad" (scale:=0.45)
        draw<repo2_questions->["draw=primary2", "line width=0.75mm"] "(-2, -2.95) -- (2, -2.95)"
        draw<repo2_questions->["draw=primary2", "line width=0.75mm"] "(0, -3.2) -- (2.5, -3.2)"
        node<repo2_questions->["highlight comment bad"] at (3, -2) "can this be reused?"

        node<repo3->["image bordered"] at (3,3) diagram.pdf "example-repo-3-verdi" (scale:=0.4)
        draw<repo3_fixes->["draw=primary2", "line width=0.75mm"] "(-0.5,0.25) -- (-0.5,-4)"
        node<repo3_fixes-> ["highlight comment bad"] at (-2, -0) "Maintenance Fixes"

        node<repo4->["image bordered"] at (0,2) diagram.pdf "example-repo-4-velisarios" (scale:=0.5)
        node<repo4_last_update->["text width=3em", "dashed box"] at (2.75,-0.3) ""
        node<repo4_last_update->["highlight comment bad"] at (5, 0.5) "Last update: \\textbf{5} years ago"


        node<question->["highlight comment", "font=\\fontsize{16}{16}\\selectfont", "text width=25em", "align=center"
        ]
          "How can we make\\\\verified systems \\textbf{maintainable}?"

#latex_slide "Research Vision" do
   latex![|\centering|]
   with steps [] do
     tikz [overlay, "remember picture"] do
        node["large text", "text width=35em", "align=center"] at (0,0)
           latex![|
Building the next generation\\[1.25em]
of \textbf{maintainable} verified systems\\[1.25em]
gracefully handling changes in\\[1.25em]
@{highlighted "specification"}, @{highlighted "implementation" (color:="primary2")}, and  @{highlighted "ecosystem" (color:="primary3")}. |]

