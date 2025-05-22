import LeanTeX

def diagram (filename: String) (scale:=0.25) :=
   s!"\\includegraphics[scale={scale}]\{{filename}.png}"
def diagram.pdf (filename: String) (scale:=0.25) :=
   s!"\\includegraphics[scale={scale}]\{{filename}.pdf}"

#latex_preamble [|
  \tikzset{
  highlight word/.style={
    fill=primary1,
    anchor=base, inner xsep=3pt, inner ysep=7pt,
    rounded corners=2pt,
    font=\color{white}
  }
  }
|]

def highlighted (txt: String) (color := "primary1") :=
   s!"\\tikz[baseline=(box.base)] \\node[highlight word, fill={color}] (box) \{{txt}};"
