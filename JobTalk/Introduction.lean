import LeanTeX

def diagram (filename: String) (scale:=0.25) :=
   s!"\\includegraphics[scale={scale}]\{{filename}.png}"

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

#latex_slide do



