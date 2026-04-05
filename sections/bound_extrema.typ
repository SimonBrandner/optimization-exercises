#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *
#import "@preview/cetz:0.4.2"

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
    enum.item(4)[
      Úlohu nejprve vyřešníme pomocí parametrizace a poté pomocí Lagrangeových multiplikátorů.
      #enum(
        numbering: "(A)",
        [
          Extrémy vyšetříme pomocí parametrizace množiny, jedná se o kružnici, tudíž volíme parametrizaci
          $
            phi(t) = vec(cos(t), sin(t)), "kde" t in [0, 2 pi).
          $

          Určíme první derivaci funkce $f(phi(t))$,
          $
            (f(phi(t)))' &= f'(phi(t)) phi'(t) = \
            &= mat(column-gap: #1em, 2 cos(t) sin(t), cos^2(t)) vec(-sin(t), cos(t)) = \
            &= -2 sin^2(t) cos(t) + cos^3(t) = \
            &= cos(t) (cos^2(t) - 2 sin^2(t)),
          $
          a její druhou derivaci
          $
            (f(phi(t)))'' & = -4 sin(t) cos^2(t) + 2 sin^3(t) - 3 cos^2(t) sin(t) = \
                          & = 2 sin^3(t) - 7 sin(t) cos^2(t).
          $

          Řešíme tedy rovnici $cos(t) (cos^2(t) - 2 sin^2(t)) = 0$, ihned vidíme řešení $t = pi/2$ a $t = (3 pi)/2$, protože v těchto případech $cos(t) = 0$. Dále musíme vyřešit
          $
                cos^2(t) - 2 sin^2(t) & = 0 \
            1 - sin^2(t) - 2 sin^2(t) & = 0 \
                            sin^2 (t) & = 1/3. \
          $
          Z toho vidíme, že $sin(t) = plus.minus sqrt(1/3)$. Také můžeme upravit na
          $
            1 - cos^2(t) & = 1/3 \
                cos^2(t) & = 2/3 \
                  cos(t) & = plus.minus sqrt(2/3).
          $

          Z @circle-points[Obrázku] pak ihned vidíme, které body jsou maxima a minima.
          #figure(
            caption: [Extrémy na kružnici],
            cetz.canvas(length: 2cm, {
              import cetz.draw: *

              set-style(
                mark: (fill: black, scale: 2),
                content: (padding: 1pt),
              )

              line((-2.5, 0), (2.5, 0), stroke: 1pt + gray, mark: (
                end: "stealth",
                fill: gray,
              ))
              content((), $ #h(10pt)x $, anchor: "east")
              line((0, -2.5), (0, 2.5), stroke: 1pt + gray, mark: (
                end: "stealth",
                fill: gray,
              ))
              content((), $ y $, anchor: "south")

              circle((0, 0), radius: 2)
              let points = (
                (
                  "south-west",
                  $sqrt(1/3)$,
                  $sqrt(2/3)$,
                  $1/3 sqrt(2/3)$,
                  calc.sqrt(1 / 3),
                  calc.sqrt(2 / 3),
                ),
                (
                  "north-west",
                  $sqrt(1/3)$,
                  $-sqrt(2/3)$,
                  $- 1/3 sqrt(2/3)$,
                  +calc.sqrt(1 / 3),
                  -calc.sqrt(2 / 3),
                ),
                (
                  "south-east",
                  $-sqrt(1/3)$,
                  $sqrt(2/3)$,
                  $1/3 sqrt(2/3)$,
                  -calc.sqrt(1 / 3),
                  +calc.sqrt(2 / 3),
                ),
                (
                  "north-east",
                  $-sqrt(1/3)$,
                  $-sqrt(2/3)$,
                  $- 1/3 sqrt(2/3)$,
                  -calc.sqrt(1 / 3),
                  -calc.sqrt(2 / 3),
                ),
                ("south-west", $0$, $1$, $0$, 0, 1),
                ("north-west", $0$, $-1$, $0$, 0, -1),
              )
              let scale = 2

              for (point-anchor, x, y, v, x-pos, y-pos) in points {
                let point-name = (
                  "circle-"
                    + str(x-pos).replace(".", ":")
                    + str(y-pos).replace(".", ":")
                )
                circle(
                  (2 * x-pos, 2 * y-pos),
                  name: point-name,
                  radius: 3pt,
                  stroke: none,
                  fill: blue,
                )
                content(
                  (point-name),
                  padding: 7pt,
                  anchor: point-anchor,
                  $f vec(#x, #y) = #v$,
                )
              }
            }),
          ) <circle-points>
        ],
        [
          Nyní úlohu vyřešíme pomocí Lagrangeových multiplikátorů. Zkonstruujeme Lagrangeovu funkci:
          $
            L vec(x, y, lambda) = x^2 y + lambda (x^2 + y^2 - 1).
          $
          Její derivace je
          $
            L' vec(x, y, lambda) = mat(column-gap: #1em, 2 x y + 2 x lambda, x^2 + 2 y lambda, x^2 + y^2 - 1).
          $
          Nyní řešíme soustavu $L' vec(x, y, lambda) = 0$:
          $
            2 x y + 2 x lambda & = 0 \
              x^2 + 2 y lambda & = 0 \
                 x^2 + y^2 - 1 & = 0
          $
          Nejprve se zaměříme na případ $x = 0$, kde z třetí rovnice ihned dostáváme $y = plus.minus 1$. Dále můžeme řešit soustavu s předpokladem $x != 0$, vyjádříme z první rovnice $y$ a dostáváme $y = - lambda$; to dosadíme do dalších dvou rovnic:
          $
              x^2 - 2 lambda^2 & = 0 \
            x^2 + lambda^2 - 1 & = 0.
          $
          Nyní lze od první rovnice odečíst tu druhou a dostaneme $-3 lambda^2 + 1 = 0$, resp. $lambda = plus.minus sqrt(1/3)$. Z toho už vidíme, že $y = plus.minus sqrt(1/3)$ a $x = plus.minus sqrt(2/3)$. Dále můžeme postupovat analogicky k předchozímu bodu pomocí @circle-points[Obrázku].
        ],
      )
    ],
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
          Z toho vidíme, že $y = 1/root(3, 2)$ a $lambda = -2/root(3, 4)$. Ze znaménka Hessiánu v daných bodech vidíme, že oba body minima.
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

  Nápověda: Uvažujte zrcadlo/rozhraní jako křivý povrch $X = {boup(x) in RR^n | g(boup(x)) = 0}$, kde funkce $g : RR^n -> RR$ má v každém bodě nenulový gradient. Uvažujte (libovolné) dva body $boup(a), boup(b) in RR^n$ (v případě lomu každý na jiné straně rozhraní) a napište podmínku na bod $boup(x) in X$ tak, aby čas letu světla po dráze $boup(a)-boup(x)-boup(b)$ byl lokálně extrémní.

  Později se zjistilo, že správným kritériem není nejkratší ale extrémní čas, tedy skutečná dráha paprsku má čas větší nebo menší než jí blízké dráhy. Dokážete najít situaci, kdy skutečná dráha paprsku má čas větší než jí blízké dráhy?
]

#solution[
  #enum(
    enum.item(1)[
      Úlohu vyřešíme pomocí Lagrangeových multiplikátorů, Zkonstruujeme Lagrangeovu funkci,
      $
        L mat(augment: #(hline: 1), boup(x); lambda) = norm(boup(a) - boup(x))/c + norm(boup(b) - boup(x))/c + lambda g(boup(x)),
      $
      a určíme její první derivaci,
      $
        L' mat(augment: #(hline: 1), boup(x); lambda) = mat(augment: #(vline: 1), -(boup(x) - boup(a))^T/(c norm(boup(x) - boup(a))) - (boup(x) - boup(b))^T/(c norm(boup(x) - boup(b))) + lambda g'(boup(x)), g(boup(x))).
      $
      Nyní musíme vyřešit soustavu
      $
        -(boup(x) - boup(a))^T/(c norm(boup(x) - boup(a))) - (boup(x) - boup(b))^T/(c norm(boup(x) - boup(b))) + lambda g'(boup(x)) &= 0 \
        g(boup(x)) &= 0.
      $
      Úpravami první rovnice,
      $
        -(boup(x) - boup(a))^T/(c norm(boup(x) - boup(a))) - (boup(x) - boup(b))^T/(c norm(boup(x) - boup(b))) &= - lambda g'(boup(x)) \
        -(boup(x) - boup(a))/(c norm(boup(x) - boup(a))) - (boup(x) - boup(b))/(c norm(boup(x) - boup(b))) &= - lambda ( g'(boup(x)))^T, \
      $
      získáváme výraz, který můžeme skalárně vynásobit normovaným vektorem $boup(t) = times((g'(boup(x)))^T)$, čímž po dalších úpravách,
      $
        innerproduct(-(boup(x) - boup(a))/(c norm(boup(x) - boup(a))) - (boup(x) - boup(b))/(c norm(boup(x) - boup(b))), boup(t)/norm(boup(t)))
        &= innerproduct(lambda (g'(boup(x)))^T, boup(t)/norm(boup(t))) \
        innerproduct(-(boup(x) - boup(a))/(c norm(boup(x) - boup(a))) - (boup(x) - boup(b))/(c norm(boup(x) - boup(b))), boup(t)/norm(boup(t)))
        &= 0 \
        1/c (- innerproduct(
            (boup(x) - boup(a))/norm(boup(x) - boup(a)), boup(t)/norm(boup(t))
          ) - innerproduct(
            (boup(x) - boup(b))/norm(boup(x) - boup(b)),
            boup(t)/norm(boup(t))
          )
        )
        &= 0 \
        - innerproduct((boup(x) - boup(a))/norm(boup(x) - boup(a)), boup(t)/norm(boup(t)))
        &= innerproduct((boup(x) - boup(b))/norm(boup(x) - boup(b)), boup(t)/norm(boup(t))) \
        - innerproduct((boup(x) - boup(a)), boup(t))/(norm(boup(x) - boup(a)) norm(boup(t)))
        &= innerproduct((boup(x) - boup(b)), boup(t))/(norm(boup(x) - boup(b)) norm(boup(t))) \
        - cos(phi) &= cos(psi),
      $
      dostaneme rovnost $-cos(phi) = cos(psi)$, tu můžeme interpretovat geometricky, viz @fermat níže, že jsme skutečně ukázali, že úhel dopadu se rovná úhlu odrazu.
      #context [
        #figure(
          caption: [Úhel dopadu a úhel odrazu],
          cetz.canvas(length: 2cm, {
            import cetz.draw: *

            set-style(
              mark: (fill: black, scale: 2),
              content: (padding: 1pt),
            )

            circle((-2, 2), radius: 2pt, stroke: none, fill: black)
            content((), padding: 5pt, anchor: "east", $boup(b)$)
            circle((2, 2), radius: 2pt, stroke: none, fill: black)
            content((), padding: 5pt, anchor: "west", $boup(a)$)


            let x-pos = calc.cos(45deg) * 1.5
            let y-pos = calc.sin(45deg) * 1.5
            line((-2, 2), (0, 0))
            arc((), anchor: "origin", start: 0deg, stop: 180deg, radius: 1.5)
            content((1.5, .75), $phi$)
            line((x-pos, 0), (x-pos, y-pos))
            circle(
              (x-pos, 0),
              radius: 2pt,
              fill: black,
              stroke: none,
            )
            content((), anchor: "south-east", $cos(phi)$, padding: 4pt)

            line((2, 2), (0, 0))
            content((0, 1.75), $psi$)
            content((-1.85, .75), $phi = pi - psi$)
            line((-x-pos, 0), (-x-pos, y-pos))
            circle(
              (-x-pos, 0),
              radius: 2pt,
              fill: black,
              stroke: none,
            )
            content((), anchor: "south-west", $cos(psi)$, padding: 4pt)
            arc-through((-2, -0.3), (0, 0), (2, -0.3))
            let x-set-content = $X = { boup(x) | g(boup(x)) = 0 }$
            content(
              (),
              anchor: "north",
              x-set-content,
              padding: 5pt,
            )
            content(
              (-2, 0),
              anchor: "north",
              h(measure(x-set-content).width),
              padding: 5pt,
            )

            line((-2, 0), (2, 0))
            content((), anchor: "west", $"span"(boup(t))$, padding: 5pt)

            circle((0, 0), radius: 2pt, stroke: none, fill: black)
            content((0.1, -0.1), $boup(x)$)

            line((0, 0), (0, -0.5), mark: (
              scale: 0.5,
              end: "stealth",
            ))
            content((), anchor: "west", $gradient g(boup(x))$, padding: 5pt)
          }),
        ) <fermat>
      ]
    ],
  )
]

#exercise(number: 16)[
  Minimalizujte $boup(x)^T boup(x)$ za podmínky, že $boup(a)^T boup(x)$ = 1. Jaký je geometrický význam úlohy?
]

#solution[
  Úlohu lze geometricky snadno chápat. Řešení soustavy $boup(a)^T boup(x)$ je nějaký afinní podprostor a my hledáme jeho bod, který je nejblíže počátku (minimalizujeme kvadrát $norm(boup(x))$). Je tedy zjevné, že úloha bude mít pouze jeden stacionární bod, který bude řešením, až na případ $boup(a) = 0$, kterým se zaobírat nebude.
  #enum(
    numbering: "(A)",
    [
      Velmi snadno úlohu vyřešíme tak, že vypočítáme
      $
        norm("proj"_((ker(boup(a)^T))^bot) (boup(p)))^2 = norm("proj"_im(boup(a)) (boup(p)))^2 = norm("proj"_boup(a) (boup(p)))^2,
      $
      kde $boup(p)$ je partikulární řešení soustavy $boup(a)^T boup(x) = 1$. Platí ale
      $
        norm("proj"_boup(a) boup(p))^2 =
        norm(innerproduct(boup(a), boup(p))/innerproduct(boup(a), boup(a)) boup(a))^2 =
        norm((boup(a)^T boup(p))/norm(boup(a))^2 boup(a))^2 =
        norm(1/norm(boup(a))^2 boup(a))^2 =
        norm(boup(a))^2/norm(boup(a))^4 =
        1/norm(boup(a))^2.
      $
    ],
    [
      Alternativou je využít Lagrangeových multiplikátorů. Zkonstruujeme Lagrangeovu funkci,
      $
        L mat(augment: #(hline: 1), boup(x); lambda) = boup(x)^T boup(x) + lambda (boup(a)^T boup(x) - 1),
      $
      a určíme první derivaci:
      $
        L' mat(augment: #(hline: 1), boup(x); lambda) = mat(augment: #(vline: 1), 2 boup(x)^T + lambda boup(a)^T, boup(a)^T boup(x) - 1).
      $

      Nyní musíme vyřešit soustavu
      $
        2 boup(x)^T + lambda boup(a)^T & = 0 \
                 boup(a)^T boup(x) - 1 & = 0.
      $
      Z první rovnice vidíme, že $boup(x)^T = -1/2 lambda boup(a)^T$, a tedy $boup(x) = -1/2 lambda boup(a)$. Za $boup(x)$ tedy můžeme dosadit do druhé rovnice a upravovat:
      $
        boup(a)^T (-1/2 lambda boup(a)) - 1 & = 0 \
          -1/2 lambda boup(a)^T boup(a) - 1 & = 0 \
                   lambda boup(a)^T boup(a) & = -2 \
                     lambda norm(boup(a))^2 & = -2 \
                                     lambda & = -2/norm(boup(a))^2. \
      $
      Dosazením $lambda$ do zpátky do první rovnice dostáváme:
      $
        2 boup(x)^T -2/norm(boup(a))^2 boup(a)^T & = 0 \
                                       boup(x)^T & = 1/norm(boup(a))^2 boup(a)^T \
                                         boup(x) & = 1/norm(boup(a))^2 boup(a).
      $

      Nyní už stačí vypočítat hodnotu funkce v nalezeném $boup(x)$:
      $
        boup(x)^T boup(x) = (1/norm(boup(a))^2 boup(a)^T) 1/norm(boup(a))^2 boup(a) = 1/norm(boup(a))^4 boup(a)^T boup(a) = norm(boup(a))^2/norm(boup(a))^4 = 1/norm(boup(a))^2.
      $
    ],
  )
]
