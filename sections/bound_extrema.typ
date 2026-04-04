#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *

= Lokální extrémy vázané rovnostmi

Následující úlohy vyřešte nejprve libovolným (co možná jednoduchým) způsobem a potom metodou Lagrangeových multiplikátorů. Při tom nemusíte ověřovat podmínky druhého řádu – lze-li ale usoudit na druh extrému nějakou snadnou úvahou, udělejte to.

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
    enum.item(3)[
      Úlohu nejprve vyřešníme pomocí parametrizace a poté pomocí Lagrangeových multiplikátorů.
      #enum(
        numbering: "(A)",
        [
          Ihned vidíme, že body pro než platí, že $x = 0$, na dané křivce neleží. Můžeme tedy z rovnice pro křivku vyjádřit $y = 1/x^2$ a zvolite parametrizaci
          $
            phi(t) = vec(t, 1/t^2).
          $
          Máme minimalizovat funkci $norm(phi(t))$ pro $t in RR$, ale víme, že to je to stejné jako minimalizovat funkci $psi(t) = innerproduct(phi(t), phi(t)) = t^2 + 1/t^4$. Vypočítáme tedy její první,
          $
            psi'(t) = 2t -4/t^5,
          $
          a druhou,
          $
            psi''(t) = 2 + 20/t^6,
          $
          derivaci.

          Dále řešíme rovnici $phi'(t) = 0$:
          $
            2 t - 4/t^5 = 0.
          $
          Zjevně platí, že $t != 0$, můžeme tedy rovnici upravovat následovně
          $
            t - 2/t^5 & = 0 \
                    t & = 2/t^5 \
                  t^6 & = 2 \
                    t & = plus.minus root(6, 2).
          $
          Dostáváme tedy stacionární body $vec(plus.minus root(6, 2), 1/root(3, 2))$ a pouze jednu funkční hodnotu $psi(plus.minus root(6, 2)) = root(3, 2) + root(3, 4)$. Musíme tedy využít druhé derivace. Platí $phi''(plus.minus root(6, 2)) = 2 + 20/2 = 2 + 10 = 12 > 0$, v obou bodech tedy $psi$ (a tedy i $phi$) nabývá minima.
        ],
        [
          Nejprve zkonstruujeme Lagrangeovu funkci
          $
            L vec(x, y, lambda) = x^2 + y^2 + lambda (x^2 y - 1).
          $
          Určíme první,
          $
            L' vec(x, y, lambda) = mat(column-gap: #1em, 2x + 2 x y lambda, 2 y + x^2 lambda, x^2 y - 1),
          $
          a druhou,
          $
            L'' vec(x, y, lambda) = mat(
              column-gap: #1em,
              2 + 2 y lambda, 2 x lambda, 2 x y;
              2 x lambda, 2, x^2;
              2 x y, x^2, 0
            ),
          $
          derivaci.

          Řešíme tedy rovnici $L' vec(x, y, lambda) = 0$.
          $
            2 x + 2 x y lambda & = 0 \
              2 y + x^2 lambda & = 0 \
                     x^2 y - 1 & = 0.
          $
          Ze třetí rovnice ihned vidíme, že $x != 0$. Třetí rovnice lze tedy upravit na $y = 1/x^2$. Za $y$ můžeme tedy dosadit do druhé rovnice
          $
            2/x^2 + x^2 lambda & = 0 \
                2 + x^4 lambda & = 0 \
                    x^4 lambda & =- 2 \
                        lambda & =- 2/x^4 \
          $
          Nyní dosadíme za $y$ a $lambda$ do první rovnice:
          $
            2 x + 2 x 1/x^2 (-2/x^4) & = 0 \
                           x - 2/x^5 & = 0 \
                             x^6 - 2 & = 0 \
                                 x^6 & = 2 \
                                   x & = plus.minus root(6, 2) \
          $
          Z toho vidíme, že $y = 1/root(3, 2)$ a $lambda = -2/root(3, 4)$. Ze znaménka Hessiínu v daných bodech vidíme, že oba body minima.
          #show math.equation.where(block: false): set text(
            top-edge: "bounds",
            bottom-edge: "bounds",
          )
          #block(align(center, table(
            columns: 4,
            align: center + horizon,
            [*Bod*],
            [*$f''$ v bodě*],
            [*Znaménko\ determinantu*],
            [*Klasifikace\ extrému*],

            $vec(root(6, 2), 1/root(3, 2), -2/root(3, 4))$,
            $
              mat(
                column-gap: #1em,
                0, - 4/sqrt(2), 2/root(6, 2);
                - 4/sqrt(2), 2, root(3, 2);
                2/root(6, 2), root(3, 2), 0
              )
            $,
            [Záporné],
            [Minimum],

            $vec(-root(6, 2), 1/root(3, 2), -2/root(3, 4))$,
            $
              mat(
                column-gap: #1em,
                0, 4/sqrt(2), - 2/root(6, 2);
                4/sqrt(2), 2, root(3, 2);
                - 2/root(6, 2), root(3, 2), 0
              )
            $,
            [Záporné],
            [Minimum],
          )))
          #v(16pt)
        ],
      )
    ],
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

  Nápověda: Uvažujte zrcadlo/rozhraní jako křivý povrch $X = {boup(x) in RR^n | g(boup(x)) = 0}$, kde funkce $g : RR^n -> R$ má v každém bodě nenulový gradient. Uvažujte (libovolné) dva body $boup(a), boup(b) in RR^n$ (v případě lomu každý na jiné straně rozhraní) a napište podmínku na bod $boup(x) in X$ tak, aby čas letu světla po dráze $boup(a)-boup(x)-boup(b)$ byl lokálně extrémní.

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
