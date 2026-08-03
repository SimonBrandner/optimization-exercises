#import "../dependencies/simplex-template/lib.typ": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "../utils.typ": *

= Linearita

#exercise[
  Rozhodněte, zda následující množiny jsou lineární nebo afinní podprostory $RR^n$ a když ano, určete jejich dimenze:
  #enum(
    [${boup(x) in RR^n | boup(a)^T boup(x) = 0}$ pro dané $boup(a) in RR^n$,],
    [${boup(x) in RR^n | boup(a)^T boup(x) = b}$ pro dané $boup(a) in RR^n$, $b in RR$,],
    [${boup(x) in RR^n | boup(x)^T boup(x) = 1}$,],
    [${boup(x) in RR^n | boup(a) boup(x)^T = boup(I)}$ pro dané $boup(a) in RR^n$,],
    [${boup(x) in RR^n | sum_(i=1)^n x_i = 0}$,],
    [$boup(a) + "span"{boup(b), boup(c)}$, kde $boup(a), boup(b), boup(c) in RR^n$ jsou známé vektory takové, že $boup(b)$ a $boup(c)$ jsou lineárně nezávislé.],
  )
]

#solution[
  #enum(
    [Je lineární, $dim ({boup(x) in RR^n | boup(a)^T boup(x) = 0}) = "def"(boup(a)^T) in {n-1, n}$.],
    [Je afinní, $dim({boup(x) in RR^n | boup(a)^T boup(x) = b}) = "def"(boup(a)^T) in {n-1, n}$.],
    [Není lineární ani afinní, jde jednotkovou kouli.],
    [Není lineární ani afinní.],
    [Je lineární, $dim({boup(x) in RR^n | sum_(i=1)^n x_i = 0}) = "def"(underbrace(mat(1, dots, 1), n times)) = n - 1$.],
    [Je afinní, $dim(boup(a) + "span"{boup(b), boup(c)}) = 2$.],
  )
]

#exercise[
  Je množina ${mat(x_1; x_2; x_3; x_4) in RR^4 | x_1 + x_3 = 0}$ lineární podprostor? Pokud ano, najděte jeho libovolnou bázi.
]

#solution[
  Jde o množinu
  $ ker(mat(1, 0, 1, 0)), $
  což je lineární podprostor. Jeho báze zjevně je
  $ {mat(1; 0; -1; 0), mat(0; 1; 0; 0), mat(0; 0; 0; 1)}. $
]

#exercise(number: 7)[
  Máme zobrazení $f : RR^2 → RR^3$ definované jako $f mat(x; y) = mat(x + y; 2x − 1; x − y)$. Je toto zobrazení lineární? Pokud ano, napište ho ve formě $f(boup(x)) = boup(A x)$. Je toto zobrazení afinní? Pokud ano, napište ho ve formě $f(boup(x)) = boup(A x + b)$. Obě odpovědi dokažte z definic.
]

#solution[
  Není lineární:
  $
    f(mat(0; 0) + mat(0; 0)) = mat(0; -1; 0) != mat(0; -2; 0) = mat(0; -1; 0) + mat(0; -1; 0) = f mat(0; 0) + f mat(0; 0).
  $

  Je afinní: nechť $r_1, dots, r_n in RR$, $sum_(i=1)^n r_i = 1$ a $mat(x_1; y_1), dots, mat(x_n; y_n) in RR^2$, potom
  $
    f(sum_(i=1)^n r_i mat(x_i; x_i))
    = f mat(sum_(i=1)^n r_i x_i; sum_(i=1)^n r_i y_i)
    = mat(sum_(i=1)^n r_i x_i &+ sum_(i=1)^n r_i y_i; 2 sum_(i=1)^n r_i x_i &+ 1; sum_(i=1)^n r_i x_i &+ sum_(i=1)^n r_i y_i)=\
    = mat(sum_(i=1)^n r_i x_i &+ sum_(i=1)^n r_i y_i; sum_(i=1)^n r_i (2 x_i) &+ sum_(i=1)^n r_i; sum_(i=1)^n r_i x_i &+ sum_(i=1)^n r_i y_i)
    = mat(sum_(i=1)^n (x_i + y_i); sum_(i=1)^n (2 x_i + r_i); sum_(i=1)^n (x_i - y_i)) = \
    = sum_(i=1)^n r_i mat(x_i + y_i; 2 x_i + r_i; x_i - y_i)
    = sum_(i=1)^n r_i f mat(x_i; y_i).
  $

  Tedy
  $ f(boup(x)) = mat(1, 1; 2, 0; 1, -1) boup(x) + mat(0; -1; 0). $
]

#exercise[
  Máme nehomogenní soustavu lineárních rovnic
  $
     x & + & 2 y & + &  z & = & 1 \
    -x & + &   y & + & 2z & = & 2
  $
  dvou rovnic o třech neznámých. Napište množinu řešení soustavy jako $X+boup(x_0)$, kde $X subset.eq RR^3$ je lineární podprostor (napište jeho bázi) a $x_0 in RR^3$.
]

#solution[
  Po úpravě dostaneme soustavu
  $
    x & + & 2 y & + &  z & = & 1 & space ("R1") \
    0 & + & 3 y & + & 3z & = & 3 & space ("R2" - "R1").
  $

  Tedy řešením je afinní podprostor
  $ underbrace("span"{mat(1; -1; 1)}, X) + underbrace(mat(-1; 1; 0), x_0). $
]

#exercise(number: 10)[
  Najděte bázi prostoru obrazů a bázi nulového prostoru následujících lineárních zobrazení:
  + $ f mat(x_1; x_2; x_3) = mat(x_1 &-& x_2 &; 2 x_1 &+& x_2 &-& x_3), $
  + $ f mat(x_1; x_2) = mat(2 x_1 &+& x_2; x_1 &-& x_2 &; 2 x_2 &+& x_1). $
]

#solution[
  #enum(
    [
      Matice $f$ je $ mat(1, -1, 0; 2, 1, -1). $

      Pro nalezení $im(f)$ stačí nalézt nezávislou podmnožinu sloupců matice $f$. Máme tedy

      $ im(f) = "span"{mat(1; 2), mat(-1; 1)}. $

      Řešíme soustavu $f(boup(x)) = boup(0)$:
      $
        mat(augment: #3, 1, -1, 0, 0; 2, 1, -1, 0) ~ mat(augment: #3, 1, -1, 0, 0; 0, 3, -1, 0) mat(align: #left, delim: #none, "R1"; "R2" - 2"R1").
      $

      Lze tedy vidět, že
      $ ker(f) = "span"{ mat(1; 1; 3) }. $
    ],
    [Postupujeme analogicky k minulému bodu:

      $ ker(f) = {boup(0)}, im(f) = "span"{mat(2; 1; 1), mat(1; -1; 2)}. $
    ],
  )
]
