#import "@local/simplex-template:0.1.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "../utils.typ": *

= Kvadratické formy a funkce

#exercise[
  Pro každou z těchto funkcí určete, zda je to polynom. Pokud ano, určete počet proměnných a stupeň polynomu a rozhodněte, jestli je polynom homogenní.
  #enum(
    [$f: RR^2 -> RR, f(x, y) = (x^2 + y^2)(x-y) + x y - x -y$,],
    [$f: RR^n -> RR, f(boup(x)) = boup(a)^T boup(x)$, kde $boup(a)$ je dáno,],
    [$f: RR^n -> RR, f(boup(x)) = norm(boup(x))$,],
    [$f: RR^n -> RR, f(boup(x)) = norm(boup(A x) + boup(b))^2$, kde $boup(A)$ a $boup(b)$ jsou dány,],
    [$f: RR^n times RR^n -> RR, f(boup(x), boup(y)) = boup(x)^T boup(y)$,],
    [$f: RR^(n times n) -> RR, f(boup(X)) = boup(a)^T boup(X) boup(b)$, kde $boup(a)$ a $boup(b)$ jsou dány,],
    [$f: RR^(n times n) -> RR, f(boup(X)) = det(boup(X))$,],
    [$f: RR^(m times n) times RR^(n times p) -> RR, f(boup(X), boup(Y)) = boup(X Y)$.],
  )
]

#solution[
  #enum(
    [Jedná se o polynom dvou proměnných třetího stupně, který není homogenní, neboť stupeň monomu $x$ je jedna, nikoliv tři.],
    [Jedná se o homogenní polynom $n$ proměnných prvního stupně.],
    [Nejedná se o polynom, neboť se nejedná o lineární kombinaci monomů, nybrž odmnocinu z lineární kombinace monomů.],
    [Jedná se o polynom $n$ proměnných stupně dva, který není homogenní, neboť obsahuje monom stupně nula.],
    [Jedná se o homogenní polynom $2 n$ proměnných stupně dva.],
    [Jedná se o homogenní polynom $n^2$ proměnných stupně jedna.],
    [Jedná se o homogenní polynom $n^2$ proměnných stupně $n$.],
    [Aby obor hodnot $f$ bylo $RR$, musí platit $p = m = 1$. Jedná se o homogenní polynom $2 n$ proměnných stupně dva.],
  )
]

#exercise[
  Určete definitnost těchto symetrických matic (a diskutujte možné postupy):
  + $mat(1, 2; 2, 1)$,#v(10pt)
  + $mat(2, 1; 1, 2)$,#v(10pt)
  + $mat(0, 1; 1, 0)$,#v(10pt)
  + $mat(1, 0; 0, 0)$,#v(10pt)
  + $mat(1, 0, 0; 0, 0, 1; 0, 1, 0)$,#v(10pt)
  + $mat(3, -2, 1; -2, 3, 0; 1, 0, 3)$,#v(10pt)
  + $mat(-2, 0, 1; 0, 3, -1; 1, -1, -2)$.
]

#solution[
  Matice (b), (f) i (g) jsou symetrické, využijeme tedy Sylvestrova kriteria.
  #enum(
    enum.item(
      2,
    )[Hodnoty vůdčích hlavních minorů jsou $2$ a $3$, jsou tedy kladné a matice je positivně definitní.],
    enum.item(
      6,
    )[Hodnoty vůdčích hlavních minorů jsou $3, 5$ a $12$, jsou tedy kladné a matice je positivně definitní.],
    enum.item(
      7,
    )[První dva diagonální prkvy matice jsou $-2$ a $3$, matice tedy není positivně ani negativně semidefinitní, je tudíž indefinitní.],
  )
]

#exercise[
  Máme matici $boup(A) = mat(1, -3; 2, -4)$. Která z následujících tvrzení jsou pravdivá?
  + Výraz $boup(x)^T boup(A) boup(x)$ je nezáporný pro každé $boup(x) in RR^2$.
  + Výraz $boup(x)^T boup(A) boup(x)$ je nekladný pro každé $boup(x) in RR^2$.
  + Funkce $f(boup(x)) = boup(x)^T boup(A) x$ má v bodě $boup(x) = boup(0)$ extrém.
]

#solution[
  Provedeme symetrizaci matice $boup(A)$:
  $
    boup(A)_s = 1/2 (boup(A) + boup(A)^T) = mat(1, -1/2; -1/2, -4).
  $
  Hodnoty na její diagonále jsou $1$ a $-4$, matice je tedy indefinitní (nemůže být positivně ani negativně semidefinitní). Neplatí tedy (a), (b), ani (c).
]

#exercise[
  Je množina ${mat(x; y) in RR^2 | x^2 - 3 x y + y^2 = 1}$ elipsa nebo hyperbola? Odůvodněte.
]

#solution[
  Upravíme do tvaru $boup(x)^T boup(A) boup(x) - y_0 = 0$, kde $boup(A)$ je symetrická:
  $
                                x^2 - 3 x y + y^2 & = & 1 & \
                x^2 - 3/2 x y - 3/2 x y + y^2 - 1 & = & 0 & \
    mat(x, y) mat(1, -3/2; -3/2, 1) mat(x; y) - 1 & = & 0 & .
  $
  Vůdčí hlavní minory matice $boup(A)$ jsou $1$ a $-5/4$, matice je tedy indefinitní (nemůže být positivně ani negativně semidefinitní). Neboť jde o kvadratickou formu $RR^2 -> RR$, jejíž matice je indefinitní, jedná se o (degenerovanou) hyperbolu. Neboť má matice přesně dvě vlastní čísla a z indefinitnosti víme, že musí mít alespoň jedno kladné a alespoň jedno záporné, nemůže mít žádné nulové. Tato hyperbola tedy vlivem matice nemůže být degenerovaná#footnote[Tato úvaha platí pro indefinitní kvadratické formy $RR^2 -> RR$ obecně.]. Nemůže být degenerovaná ani vlivem absolutního členu, protože je nenulový. Jedná se tedy o nedegenerovanou hyperbolu.
]

#exercise(number: 8)[
  Co se dá říct o definitnosti symetrické matice (ne nutně diagonální), známe-li znaménka jejích diagonálních prvků? Konkrétně, co se dá říct, jestliže její diagonální prvky jsou
  + $1, 2, 0$,
  + $1, 2, 3$,
  + $−4, −2, −1$,
  + $−1, 2, 0$.
]

#solution[
  Nazvěme matici, o které je řeč, $boup(A)$.
  #enum(
    [
      Hodnota prvního vůdčího hlavního minoru je $1 > 0$, $boup(A)$ tedy není negativně (semi)definitní. Platí $boup(e)_3^T boup(A) boup(e)_3 = 0$, matice $boup(A)$ tedy nemůže být positivně definitní. Matice $boup(A)$ je tedy buď positivně semidefinitní, nebo indefinitní.
    ],
    [
      Hodnota prvního vůdčího hlavního minoru je $1 > 0$, $boup(A)$ tedy není negativně (semi)definitní. Matice $boup(A)$ je tedy buď positivně (semi)definitní, nebo indefinitní.
    ],
    [
      Hodnota prvního vůdčího hlavního minoru je $-4 < 0$, $boup(A)$ tedy není positivně (semi)definitní. Matice $boup(A)$ je tedy buď negativně (semi)definitní, nebo indefinitní.
    ],
    [
      Hodnota prvního vůdčího hlavního minoru je $-1 < 0$, není tedy positivně (semi)definitní. Platí $boup(e)_3^T boup(A) boup(e)_3 = 0$, matice $boup(A)$ tedy nemůže být negativně definitní. Matice $boup(A)$ je tedy buď negativně semidefinitní, nebo indefinitní.
    ],
  )
]
