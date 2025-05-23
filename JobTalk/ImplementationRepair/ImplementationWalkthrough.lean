import LeanTeX


#latex_slide [fragile] do
  latex![|
  \begin{center}
  \color{black}
    \begin{tikzpicture}[overlay, remember picture, highlight/.style={fill=primary1!20}]
      % \draw<2>[highlight]
      % ($(pic cs:describeimpl1s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl1e) + (0.125, -0.125)$);      

      % \draw<3>[highlight]
      % ($(pic cs:describeimpl2s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl2e) + (0.125, -0.125)$);      

      % \draw<4>[highlight]
      % ($(pic cs:describeimpl3s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl3e) + (0.125, -0.125)$);      

      % \draw<5>[highlight]
      % ($(pic cs:describeimpl4s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl4e) + (0.125, -0.125)$);      

      % \draw<6>[highlight]
      % ($(pic cs:describeimpl5s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl5e) + (0.125, -0.125)$);      

      % \draw<7>[highlight]
      % ($(pic cs:describeimpl6s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl6e) + (0.125, -0.125)$);      

      % \draw<8>[highlight]
      % ($(pic cs:describeimpl7s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl7e) + (0.125, -0.125)$);      

      % \draw<9>[highlight]
      % ($(pic cs:describeimpl8s) + (-0.125, 0.375)$) rectangle
      % ($(pic cs:describeimpl8e) + (0.125, -0.125)$);      
    \end{tikzpicture}
    \begin{minipage}[p]{0.5\linewidth}
\begin{minted}[escapeinside=@@]{ocaml}
let to_array s =
  @\tikzmark{describeimpl1s}@match s () with@\tikzmark{describeimpl1e}@
  | @\tikzmark{describeimpl2s}@Nil -> @\tikzmark{describeimpl2.1s}@[||]@\tikzmark{describeimpl2e}@
  | @\tikzmark{describeimpl3s}@Cons (h, _) ->@\tikzmark{describeimpl3e}@
    @\tikzmark{describeimpl4s}@let sz = length s in@\tikzmark{describeimpl4e}@
    @\tikzmark{describeimpl5s}@let a = make sz h in@\tikzmark{describeimpl5e}@
    @\tikzmark{describeimpl6s}@iteri (fun i vl -> 

       @\tikzmark{describeimpl7s}@a.(i) <- vl@\tikzmark{describeimpl7e}@

    ) s;                            @\tikzmark{describeimpl6e}@
    @\tikzmark{describeimpl8s}@a@\tikzmark{describeimpl8e}@                             @\tikzmark{describeimplstop}@
\end{minted}
    \end{minipage}    
\begin{tikzpicture}[overlay, remember picture, hide/.style={fill=white,draw=none}]
  \draw<1>[hide]
      ($(pic cs:describeimpl1s) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  
  \draw<2>[hide]
      ($(pic cs:describeimpl2s) + (-1.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  
  
  \draw<3-4>[hide]
      ($(pic cs:describeimpl3s) + (-1.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  
  \draw<3>[hide]
      ($(pic cs:describeimpl2.1s) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  

  \draw<5>[hide]
      ($(pic cs:describeimpl4s) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  

  \draw<6>[hide]
      ($(pic cs:describeimpl5s) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  

  \draw<7>[hide]
      ($(pic cs:describeimpl6s) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  

  \draw<8>[hide]
      ($(pic cs:describeimpl8s) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  

  \draw<9>[hide]
      ($(pic cs:describeimplstop) + (-0.125, 0.375)$) rectangle
      ($(pic cs:describeimplstop) + (0.125, -0.125)$);  


\end{tikzpicture}
  \end{center}
  |]

