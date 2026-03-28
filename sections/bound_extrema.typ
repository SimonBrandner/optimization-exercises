#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *

= Lokální extrémy vázané rovnostmi

#exercise[
  Na kružnici $x^2 + y^2 = 1$ najděte lokální extrémy funkce
  #enum(
    $f vec(x, y) = 2x - y,$,
    $f vec(x, y) = x(y-1),$,
    $f vec(x, y) = x^2 + 2y^2,$,
    $f vec(x, y) = x^2y,$,
    $f vec(x, y) = x^4+y^2,$,
    $f vec(x, y) = e^(x y),$,
    $f vec(x, y) = sin(x y).$,
  )
]

#solution[
  #enum(
    enum.item(4)[],
  )
]

#exercise(number: 4)[
  Najděte bod nejblíže počátku na křivce
  + $x+y = 1$,
  + $x+2y = 5$,
  + $x^2y = 1$,
  + $x^2+2y^2 = 1$.
]

#solution[
  #enum(
    enum.item(3)[],
  )
]

#exercise(number: 11)[
  Fermatův princip nejkratšího času v paprskové optice říká, že cesta mezi libovolnými dvěma body na paprsku má takový tvar, aby ji světlo proběhlo za čas kratší než jí blízké dráhy. Z tohoto principu odvoďte:
  #enum(
    [
      Zákon odrazu od zrcadla: úhel dopadu se rovná úhlu odrazu.
    ],
    [
      Snellův zákon lomu: na rozhraní dvou prostředí se světlo lomí tak, že
      $
        c_1/c_2 = sin(alpha_1)/sin(alpha_2),
      $
      kde $alpha_i$ je úhel paprsku od normály rozhraní a $c_i$ je rychlost světla v prostředí $i$.
    ],
  )

  Nápověda: Uvažujte zrcadlo/rozhraní jako křivý povrch $X = {boup(x) in RR^n | g(boup(x)) = 0}$, kde funkce $g : RR^n -> R$ má v každém bodě nenulový gradient. Uvažujte (libovolné) dva body $a, b in RR^n$ (v případě lomu každý na jiné straně rozhraní) a napište podmínku na bod $boup(x) in X$ tak, aby čas letu světla po dráze $boup(a)-boup(x)-boup(b)$ byl lokálně extrémní.

  Později se zjistilo, že správným kritériem není nejkratší ale extrémní čas, tedy skutečná dráha paprsku má čas větší nebo menší než jí blízké dráhy. Dokážete najít situaci, kdy skutečná dráha paprsku má čas větší než jí blízké dráhy?
]

#solution[
  #enum(
    enum.item(1)[],
  )
]

#exercise(number: 16)[
  Minimalizujte $boup(x)^T boup(x)$ za podmínky, že $boup(a)^T boup(x)$ = 1. Jaký je geometrický význam úlohy?
]

#solution[]
