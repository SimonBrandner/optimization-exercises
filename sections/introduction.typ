#import "../dependencies/simplex-template/lib.typ": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "../utils.typ": *

= Značení a základní pojmy

#exercise[
  Vyřešte následující úlohy, přičemž slovní úlohy nejdříve formulujte ve vhodném tvaru. Stačí vám k tomu papír, tužka, zdravý rozum a analýza funkcí jedné proměnné. Všimněte si, že některé úlohy lze převést na hledání extrémů funkce jedné proměnné na intervalu, což umíte z analýzy funkcí jedné proměnné.
  #enum(
    [
      $min{x^2 + y^2 | x >= 0, x y > 1}$,
    ],
    [
      $min{(x-2)^2 + (y-1/2)^2 | x^2 <= 1, y^2 <= 1}$,
    ],
    [
      $min{x | x in RR, x >= a_i forall i in {1, dots, n}}$ pro dané $a_1, dots, a_n in RR$,
    ],
    [
      Máte vyrobit papírovou krabici o objemu 72 litrů, jejíž délka je dvojnásobek její šířky. Krabice má všech šest stěn. Jaké budou její rozměry, má-li se na ni spotřebovat co nejméně papíru? Tloušťka stěn je zanedbatelná.
    ],
  )
]

#solution[
  #enum(
    enum.item(3)[
      Zjevně $min{x | x in RR, x > a_i forall i in {1, dots, n}} = max{a_i | forall i in {1, dots, n}}$.
    ],
  )
]
