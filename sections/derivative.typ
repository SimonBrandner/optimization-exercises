#import "@local/simplex-template:0.1.0": *
#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot
#import "../utils.typ": *

= Derivace

#exercise[
  Načrtněte několik vrstevnic (připište k nim výšky) těchto funkcí dvou proměnných:
  #enum(
    spacing: 13pt,
    [$f mat(x_1; x_2) = 2x_1 + x_2$,],
    [$f mat(x_1; x_2) = x_1 - 3 x_2 + 1$,],
    [$f mat(x_1; x_2) = x_1^2$,],
    [$f mat(x_1; x_2) = x_1^2 + 4 x_2^2$,],
    [$f mat(x_1; x_2) = x_1^2 - x_2^2 = (x_1 + x_2) (x_1 - x_2)$,],
    [$f mat(x_1; x_2) = x_1 x_2$,],
    [$f mat(x_1; x_2) = sqrt(x_1^2 + x_2^2) = norm(mat(x_1; x_2))$.],
  )
]

#solution[
  #enum(
    enum.item(2)[
      Lze vidět, že zafixováním $f vec(x_1, x_2)$ a úpravou dostaneme afinní funkci. Vrstevnice budou tedy přímky:
      #align(center, canvas({
        plot.plot(
          axis-style: "school-book",
          size: (6, 6),
          x-label: $x_2$,
          y-label: $x_1$,
          x-tick-step: 1,
          y-tick-step: 1,
          y-min: -3,
          y-max: 3,
          {
            let domain = (-3, 3)

            for h in range(-3, 9, step: 3) {
              plot.add(
                x => h + 3 * x - 1,
                label: $h = #h$,
                domain: domain,
              )
            }
          },
        )
      }))
    ],
    [
      Můžeme si všimnout, že v proměnné $x_2$ máme úplnou volnost, zafixováním $f vec(x_1, x_2)$ pak dostaneme dva skaláry řešením dané kvadratické rovnice. Vrstevnice tedy budou dvojice rovnoběžných přímek:
      #align(center, canvas({
        plot.plot(
          axis-style: "school-book",
          size: (6, 6),
          x-label: $x_2$,
          y-label: $x_1$,
          x-tick-step: 1,
          y-tick-step: 1,
          y-min: -3,
          y-max: 3,
          {
            let domain = (-3, 3)
            let colors = (red, green, blue)

            for (h, color) in range(0, 6, step: 2).zip(colors) {
              plot.add(
                x => calc.sqrt(h),
                label: $h = #h$,
                domain: domain,
                style: (stroke: color),
              )
              plot.add(
                x => -calc.sqrt(h),
                domain: domain,
                style: (stroke: color),
              )
            }
          },
        )
      }))
    ],
    [
      Zjevně se jedná o diagonální positivně definitní kvadratickou formu dvou proměnných, vrstevnice tedy budou elipsy:
      #align(center, canvas({
        plot.plot(
          axis-style: "school-book",
          size: (6, 6),
          x-label: $x_1$,
          y-label: $x_2$,
          x-tick-step: 1,
          y-tick-step: 1,
          y-min: -3,
          y-max: 3,
          {
            for h in (1, 4, 9) {
              plot.add-contour(
                x-domain: (-3, 3),
                y-domain: (-3, 3),
                label: $h = #h$,
                x-samples: 50,
                y-samples: 50,
                op: "<",
                z: h,
                (x_1, x_2) => calc.pow(x_1, 2) + 4 * calc.pow(x_2, 2),
              )
            }
          },
        )
      }))
    ],
    enum.item(6)[
      Po zafixováním $f vec(x_1, x_2)$ lze rovnost snadno upravit do vzorce pro hyperbolu:
      #align(center, canvas({
        plot.plot(
          axis-style: "school-book",
          size: (6, 6),
          x-label: $x_1$,
          y-label: $x_2$,
          x-tick-step: 1,
          y-tick-step: 1,
          y-min: -3,
          y-max: 3,
          {
            for h in range(1, 5) {
              plot.add-contour(
                x-domain: (-3, 3),
                y-domain: (-3, 3),
                label: $h = #h$,
                x-samples: 50,
                y-samples: 50,
                op: (ploz-z, data-z) => calc.abs(ploz-z - data-z) < 0.17,
                z: h,
                (x_1, x_2) => x_1 * x_2,
              )
            }
          },
        )
      }))
    ],
  )
]

#exercise(number: 3)[
  Máme funkci $f: RR^2 -> RR$ s hodnotami $f mat(x; y) = ln(1 + x y)$. Máme bod $mat(x_0; y_0) = mat(1; 2)$.
  #enum(
    spacing: 13pt,
    [Je funkce $f$ v bodě $mat(x_0; y_0)$ spojitá?],
    [Je funkce $f$ v bodě $mat(x_0; y_0)$ spojitě diferencovatelná?],
    [Je funkce $f$ v bodě $mat(x_0; y_0)$ diferencovatelná?],
    [Najděte totální derivaci (Jacobiho matici) $f' mat(x; y)$ v bodě $mat(x_0; y_0)$.],
    [Najděte gradient $Delta f mat(x; y)$ funkce $f$ v bodě $mat(x_0; y_0)$.],
    [Najděte řez a směrovou derivaci funkce $f$ v bodě $mat(x_0; y_0)$ ve směru $mat(1; -1)$.],
    [Najděte Hessovu matici funkce $f$ v bode $mat(x_0; y_0)$.],
  )
]

#solution[
  #enum(
    enum.item(4)[],
    enum.item(7)[],
  )
]

#exercise(number: 10)[
  Nadmořská výška krajiny je dána vzorcem $h(d, s) = 2 s^2 + 3 s d - d^2 + 5$, kde $d$ je zeměpisná délka (zvětšuje se od západu k východu) a $s$ je zeměpisná šířka (zvětšuje se od jihu k severu). V bodě $mat(d; s) = mat(−1; 1)$ určete
  + směr nejstrmějšího stoupání terénu,
  + strmost terénu v jihovýchodním směru.
]

#exercise(number: 13)[
  Je dána funkce $f(x, y) = 6 x y^2 − 2 x^3 − 3 y^3$. V bodě $mat(x_0; y_0) = mat(1; −2)$ najděte Taylorův polynom nultého, prvního a druhého stupně.
]
