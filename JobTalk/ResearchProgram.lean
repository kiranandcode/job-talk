import LeanTeX

#latex_preamble[|
\tikzset{
   diagram header/.style={
      font=\fontsize{8}{8}\selectfont,
      minimum width=9em,
      inner ysep=0.75em,
      fill=#1!30,
      path picture={
         \draw[draw=#1!80, line width=2.75mm]
            (path picture bounding box.south west) --
            (path picture bounding box.south east);
      }
   },
   diagram box/.style={
      font=\fontsize{8}{8}\selectfont,
      minimum width=9em,
      minimum height=4em,
      align=center,
      fill=#1!30
   },
   diagram box intense/.style={
      diagram box=#1,
      fill=#1!60,
      draw=#1!90, line width=1.55mm
   },
   diagram split/.style 2 args={
     path picture={
         \fill[#1] (path picture bounding box.north east) -- 
                   (path picture bounding box.north west) -- 
                   (path picture bounding box.south west) -- cycle;
         \fill[#2] (path picture bounding box.north east) -- 
                   (path picture bounding box.south west) -- 
                   (path picture bounding box.south east) -- cycle;
      }
   },
  primary vertical/.style 2 args={
    path picture={
      \fill[#1]
        (path picture bounding box.south west) rectangle
        (path picture bounding box.north);
      \fill[#2]
        (path picture bounding box.south) rectangle
        (path picture bounding box.north east);
    }
  },
  diagram caption/.style={
     font=\fontsize{9}{9}\selectfont,
     align=right,
     text width=4em
  }   
}
|]


#latex_slide "Research Program" do
   latex![|\centering|]
   with steps [base, focus_on_spec, focus_on_implementation, focus_on_ecosystem, base2, focus_on_implementation2] do
      tikz [] do
         node["diagram header=primary1"] spec_title at ("-9.5em",2) "Specification"
         node["diagram header=primary2"] impl_title at (0,2) "Implementation"
         node["diagram header=primary3"] ecosystem_title at ("9.5em",2) "Ecosystem"

         node<base,focus_on_implementation-focus_on_implementation2>["diagram box=primary1"] spec_prior_work at
           ("($(spec_title) - (0,3.5em)$)") latex![|CertiSuSLiK~[ICFP21]:\\{\fontsize{8}{8}\selectfont{Certified Synthesis}}|]
         node<focus_on_spec>["diagram box intense=primary1"] spec_prior_work at
           ("($(spec_title) - (0,3.5em)$)") latex![|CertiSuSLiK~[ICFP21]:\\{\fontsize{8}{8}\selectfont{Certified Synthesis}}|]

         node<base-focus_on_spec, focus_on_ecosystem-base2>["diagram box=primary2"] impl_prior_work at
            ("($(impl_title) - (0,3.5em)$)") latex![| Sisyphus~[PLDI23]:\\{\fontsize{8}{8}\selectfont{Proof Repair}}|]
         node<focus_on_implementation, focus_on_implementation2>["diagram box intense=primary2"] impl_prior_work at
            ("($(impl_title) - (0,3.5em)$)") latex![| Sisyphus~[PLDI23]:\\{\fontsize{8}{8}\selectfont{Proof Repair}}|]

         node<base-focus_on_implementation, base2-focus_on_implementation2>["diagram box=primary3"] ecosystem_prior_work at
            ("($(ecosystem_title) - (0,3.5em)$)") latex![|Axolocl~[CAV25]:\\{\fontsize{8}{8}\selectfont{Proof Localisation}}|]
         node<focus_on_ecosystem>["diagram box intense=primary3"] ecosystem_prior_work at
            ("($(ecosystem_title) - (0,3.5em)$)") latex![|Axolocl~[CAV25]:\\{\fontsize{8}{8}\selectfont{Proof Localisation}}|]

         with coordinates
           (leftx, _) := [|(spec_title.west)|],
           (rightx, _) := "(impl_title.east)",
           (_, lasty) := "(spec_prior_work)"
         in
              node[
                "diagram box=yellow",
                "primary vertical={primary1!20}{primary2!20}",
                "minimum height=5em",
                s!"minimum width=\{{rightx}-{leftx}}",
                "align=left"
              ] spec_and_impl_future_work at (s!"\{({leftx} + {rightx})/2}", s!"{lasty} - 5em") latex![|
              Beyond Sequential:\\
              {\fontsize{8}{8}\selectfont{- Concurrent Programs}}\\
              {\fontsize{8}{8}\selectfont{- Randomised Algorithms}}\\
              {\fontsize{8}{8}\selectfont{- Distributed Systems}}
            |]
         node["diagram box=primary3", "align=left", "minimum height=5em"] at ("($(ecosystem_prior_work) - (0,5em)$)") latex![|
         Proof Hardening\\
         Version Evolution\\
         Tactic Repair
         |]

         with coordinates
           (leftx, _) := [|(spec_title.west)|],
           (rightx, _) := "(ecosystem_title.east)",
           (_, lasty) := "(spec_and_impl_future_work)"
         in
              node[
                "diagram box=primary1",
                -- "primary vertical={primary1!20}{primary2!20}",
                "minimum height=3em",
                s!"minimum width=\{{rightx}-{leftx}}",
                "align=left"
              ] long_future_work at (s!"\{({leftx} + {rightx})/2}", s!"{lasty} - 4.5em") latex![|
              Preventative Maintenance: Language Design, Unverified Code
            |]
         node["diagram caption", "anchor=east"] at ("($(spec_prior_work.west) - (0.5em,0.0em)$)") "Prior\\\\Work"
         node["diagram caption", "anchor=east"] at ("($(spec_and_impl_future_work.west) - (0.5em,0.0em)$)") "Future\\\\Work"
         node["diagram caption", "anchor=east"] at ("($(long_future_work.west) - (0.5em,0.0em)$)") "Beyond"



