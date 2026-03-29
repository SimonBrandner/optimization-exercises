#import "@local/simplex-template:0.1.0": *
#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot
#import "../utils.typ": *

= Extrémy funkce na množině

#exercise(number: 7)[
  Najděte (úvahou, s pomocí náčrtků, bez použití derivací) všechny extrémy funkce
  + $f(boup(x)) = boup(a)^T boup(x)$,
  + $f(boup(x)) = boup(x)^T boup(x)$
  na množině
  #enum(
    numbering: "(A)",
    [$RR^n$,],
    [${boup(x) in RR^n | norm(boup(x)) = 1}$,],
    [${boup(x) in RR^n | norm(boup(x)) <= 1}$,],
    [${boup(x) in RR^n | norm(boup(x)) < 1}$,],
    [daný afinní podprostor $RR^n$,],
    [${boup(x) in RR^n | -1 <= boup(1)^T boup(x) <= 1}$.],
  )

  U každého extrému určete, zda je lokální/globální, volný/vázaný.
]

#solution[
  #enum(
    [
      #enum(
        numbering: "(A)",
        enum.item(3)[
          Obecně bude grafem funkce $f$ nadrovina procházející počátkem. Je pak zjevné, že bude-li $boup(a) = boup(0)$, funkce $f$ nebude mít extrém. Pro $boup(a) != boup(0)$ můžeme vykreslit vrstevnice. Je pak vidět, že funkce na dané množině bude bude mít dva lokální vázané extrémy, jedno minumum a jedno maximum, které budou ležet na hranici dané množiny.
          #align(center, canvas({
            plot.plot(
              axis-style: "school-book",
              size: (6, 6),
              x-label: none,
              y-label: none,
              x-tick-step: 1,
              y-tick-step: 1,
              y-min: -1.5,
              y-max: 1.5,
              {
                let domain = (-1.5, 1.5)

                plot.add-contour(
                  x-domain: domain,
                  y-domain: domain,
                  x-samples: 50,
                  y-samples: 50,
                  op: "<",
                  z: 1,
                  (x, y) => calc.pow(x, 2) + calc.pow(y, 2),
                )
                for h in range(-3, 9, step: 1) {
                  plot.add(
                    x => h + 2 * x,
                    domain: domain,
                    style: (stroke: color.lighten(red, 50%)),
                  )
                }
              },
            )
          }))

          To lze ukázat i bez grafu, který můžeme vykreslit jen pro konkrétní $boup(a)$ nízké dimenze. Ukážeme, že funkce $boup(a)^T$ nabýva maxima $norm(boup(a))$ v bodě $boup(a)$.

          Nejprve ukážeme, že v libovolně malém okolí bodu $boup(v)$, který leží ve vnitřku množiny, existují body, ve kterých funkce $boup(a)^T$ nabýva menší i větší hodnoty než v bodě $boup(v)$. Pro libovolný bod $boup(v)$ takový, že $norm(boup(v)) < 1$ a pro libovolné $epsilon > 0$ takové, že $norm((1 + epsilon) boup(v)) < 1$, platí
          $
            underbrace(boup(a)^T ((1 + epsilon) boup(v)), (1 + epsilon) boup(a)^T boup(v)) >= boup(a)^T boup(v) >= underbrace(boup(a)^T ((1- epsilon) boup(v)), (1 - epsilon) boup(a)^T boup(v)),
          $
          pokud je $boup(a)^T boup(v)$ nezáporné, nebo
          $
            underbrace(boup(a)^T ((1 + epsilon) boup(v)), (1 + epsilon) boup(a)^T boup(v)) <= boup(a)^T boup(v) <= underbrace(boup(a)^T ((1- epsilon) boup(v)), (1 - epsilon) boup(a)^T boup(v)),
          $
          pokud je $boup(a)^T boup(v)$ nekladné. V bodě $boup(v)$ tedy nemůže funkce $boup(a)^T$ nabývat extrému (až na případ, kdy $boup(a) = boup(0)$). Maximum tedy opravdu musí ležet na hranici množiny.

          Nyní stačí ukázat, že $norm(boup(a))$ je maximum, tj. že pro všechna $boup(v) != boup(0)$ platí
          $
            norm(boup(a)) >= boup(a)^T (boup(v)/norm(boup(v))) = innerproduct(boup(a), boup(v))/norm(boup(v)),
          $
          to jest $norm(boup(a)) norm(boup(v)) >= innerproduct(boup(a), boup(v))$, to je ale přesně Cauchyho–Schwarzova nerovnost. Úvaha pro minimum je pak analogická.
        ],
      )
    ],
  )
]
