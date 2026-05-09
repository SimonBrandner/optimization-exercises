#import "@preview/cetz-plot:0.1.3": plot
#import "@preview/cetz:0.4.2"
#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *

= Konvexní optimalizace

#exercise[
  Mějme úlohu
  $
    min{f vec(x, y) mid(|) x, y >= 0, 2 x + y >= 1, x + 3 y >= 1}.
  $
  Nakreslete množinu přípustných řešení. Pro každou z následujících účelových funkcí najděte úvahou množinu optimálních řešení a optimální hodnotu:
  + $f vec(x, y) = x + y$
  + $f vec(x, y) = x$
  + $f vec(x, y) = min{x, y}$
  + $f vec(x, y) = max{x, y}$
  + $f vec(x, y) = abs(x + y)$
  + $f vec(x, y) = x^2 + 9 y^2$
  V kterých případech se jedná o konvexní optimalizační úlohu?
]

#solution[
  Množina přípustných řešení vypadá následovně:
  #figure(
    align(center, cetz.canvas({
      import cetz.draw: *

      plot.plot(
        name: "plot",
        axis-style: "school-book",
        size: (6, 6),
        x-label: $#h(20pt)x_1$,
        y-label: $x_2$,
        x-tick-step: 1,
        y-tick-step: 1,
        y-min: -1,
        y-max: 2,
        {
          let domain = (-1, 2)

          plot.add(x => 1 - 2 * x, domain: domain)
          plot.add(x => (1 - x) / 3, domain: domain)
          plot.add-vline(0)
          plot.add-hline(0)
          plot.add-anchor("a", (1, 0))
          plot.add-anchor("b", (2.25, 0))
          plot.add-anchor("c", (2.25, 2.25))
          plot.add-anchor("d", (0, 2.25))
          plot.add-anchor("e", (0, 1))
          plot.add-anchor("f", (2 / 5, 1 / 5))
        },
      )
      on-layer(-1, merge-path(fill: gray, stroke: none, on-layer: 1, {
        line("plot.a", "plot.b")
        line("plot.b", "plot.c")
        line("plot.c", "plot.d")
        line("plot.d", "plot.e")
        line("plot.e", "plot.f")
        line("plot.f", "plot.a")
      }))
    })),
    caption: "Grafické znázornění omezeních",
  )
  Vidíme tedy, že je konvexní. Pro rozhodnutí, zda se jedná o konvexní optimalizační úlohu, tedy stačí určit, zda je daná funkce konvexní.

  #enum(
    enum.item(3)[
      Z obrázku vidíme, že optimum úlohy je množina
      $
        {vec(x, y) mid(|) x = 0, y >= 1 "nebo" x >= 1, y = 0},
      $
      kde funkce $f$ nabývá hodnoty $0$. V tomto případě funkce $f$ konvexní není (je ale konkávní), nejedná se tedy o konvexní optimalizační úlohu (úloha na ni však lze převést).
    ],
    [
      Z vrstevnice funkce $f$ na množině,
      #figure(
        align(center, cetz.canvas({
          import cetz.draw: *

          plot.plot(
            name: "plot",
            axis-style: "school-book",
            size: (6, 6),
            x-label: $#h(20pt)x_1$,
            y-label: $x_2$,
            x-tick-step: 1,
            y-tick-step: 1,
            y-min: -1,
            y-max: 2,
            {
              let domain = (-1, 2)

              plot.add(x => 1 - 2 * x, domain: domain)
              plot.add(x => (1 - x) / 3, domain: domain)
              plot.add-vline(0)
              plot.add-hline(0)
              plot.add-anchor("a", (1, 0))
              plot.add-anchor("b", (2.25, 0))
              plot.add-anchor("c", (2.25, 2.25))
              plot.add-anchor("d", (0, 2.25))
              plot.add-anchor("e", (0, 1))
              plot.add-anchor("f", (2 / 5, 1 / 5))

              for i in range(0, 15) {
                let v = 0.1 + i / 7

                plot.add-anchor("countour-c-" + str(i), (v, v))
                plot.add-anchor("countour-x-" + str(i), (v, 2.25))
                plot.add-anchor("countour-y-" + str(i), (2.25, v))
              }
            },
          )
          on-layer(-1, merge-path(fill: gray, stroke: none, on-layer: 1, {
            line("plot.a", "plot.b")
            line("plot.b", "plot.c")
            line("plot.c", "plot.d")
            line("plot.d", "plot.e")
            line("plot.e", "plot.f")
            line("plot.f", "plot.a")
          }))
          for i in range(15) {
            merge-path(
              stroke: purple,
              {
                line(
                  "plot.countour-c-" + str(i),
                  "plot.countour-x-" + str(i),
                )
                line(
                  "plot.countour-c-" + str(i),
                  "plot.countour-y-" + str(i),
                )
              },
            )
          }
        })),
        caption: [Vrstevnice funkce $f$ na množině],
      )
      vidíme, že minimum bude ležet na průsečíku grafů funkcí $x |-> x$ a $x |-> 1 - 2x$. To je bod $vec(1/3, 1/3)$ a funkce tam nabývá hodnoty $1/3$. Funkce $f$ konvexní, jedná se tedy o konvexní optimalizační úlohu.
    ],
  )
]

#exercise(number: 5)[
  Chceme rozestavit $n$ lidí v místnosti čtvercového půdorysu tak, aby "každý byl od každého co nejdále". Navrhněte možné formulace této úlohy a u každé určete, zda je konvexní.
]

#solution[
  Úlohu lze formulovat např. jako
  $
    max{sum_({i, j} in I) norm(boup(x)_i - boup(x)_j) mid(|) boup(x)_1, dots, boup(x)_n in [0, d] times [0, d], I = vec({1, dots, n}, 2) },
  $
  kde $d in RR$ je délka stěny místnosti.

  Protože čtverec je konvexní množina, funkce $f(boup(x), boup(y)) = norm(boup(x) - boup(y))$ je konvexní a součet konvexních funkcí je konvexní funkce, tato formulace úlohy je konvexní optimalizační úlohou.
]
