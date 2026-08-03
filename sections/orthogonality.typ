#import "../dependencies/simplex-template/lib.typ": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "../utils.typ": *

= Ortogonalita

#exercise[
  Máme vektory $boup(x) = mat(1; 2; 3)$ a $boup(y) = mat(−1; 0; 1)$. Spočítejte
  + délku vektoru $boup(x)$,
  + vzdálenost bodů $boup(x)$ a $boup(y)$,
  + úhel mezi vektory $boup(x)$ a $boup(y)$.
]

#solution[
  #enum(
    $norm(boup(x)) = sqrt(innerproduct(boup(x), boup(x))) = sqrt(1 + 4 + 9) = sqrt(14),$,
    $d(boup(x), boup(y)) = norm(boup(x) - boup(y)) = sqrt(4 + 4 +4) = sqrt(12),$,
    $angle (boup(x), boup(y)) = arccos((innerproduct(boup(x), boup(y)))/(norm(boup(x)) norm(boup(y)))) = arccos((-1+0+3)/ (sqrt(14) sqrt(2))) = arccos(2/sqrt(28)) = arccos(1/sqrt(7)).$,
  )
]

#exercise(number: 3)[
  Najděte bázi ortogonálního doplňku prostoru $"span"{mat(0; 1; 1),mat(1; 2; 3)}$.
]
#solution[
  Najdeme jádro matice $boup(A)$ jejíž řádky jsou dané vektory:
  $
    mat(augment: #3, 0, 1, 1, 0; 1, 2, 3, 0) ~ mat(augment: #3, 0, 1, 1, 0; 0, 1, 1, 0) mat(delim: #none, align: #left, "R1"; "R2" - "R1".)
  $

  Tedy
  $
    ker(boup(A)) = "span"{ mat(-1; -1; 1)}.
  $
]

#exercise(number: 5)[
  Pro dva vektory $boup(x), boup(y) in RR^n$ dokažte následující tvrzení, nakreslte obrázek a uvědomte si, jaké známe středoškolské poučky jste vlastně dokázali.
  + Jestliže $norm(boup(x)) = norm(boup(y))$, pak $(boup(x) + boup(y)) bot (boup(x) - boup(y))$.
  + Jestliže $boup(x) bot boup(y)$, pak $norm(boup(x))^2 + norm(boup(y))^2 = norm(boup(x) - boup(y))^2$.
]

#solution[
  #enum(
    [
      Nechť $norm(boup(x)) = norm(boup(y))$. Potom
      $
        innerproduct(boup(x + y), boup(x - y)) &= \
        &= innerproduct(boup(x), boup(x - y)) + innerproduct(boup(y), boup(x - y)) =\
        &= innerproduct(boup(x), boup(x)) - innerproduct(boup(x), boup(y)) + innerproduct(boup(y), boup(x)) - innerproduct(boup(y), boup(y)) = \
        &= innerproduct(boup(x), boup(x)) - innerproduct(boup(y), boup(y)) = \
        &= norm(boup(x))^2 - norm(boup(y))^2 = \
        &= norm(boup(x))^2 - norm(boup(x))^2 = 0.
      $

      Z obrázku níže lze vidět, že jsme ukázali, že úhlopříčky v kosočtverci jsou na sebe navzájem kolmé.

      #figure(
        caption: [Kolmé úhlopříčky v kosočtverci],
        cetz.canvas(length: 2cm, {
          import cetz.draw: *

          set-style(
            mark: (fill: black, scale: 2),
            content: (padding: 1pt),
          )

          line((-0.25, 0), (2.5, 0), stroke: 1pt + gray, mark: (
            end: "stealth",
            fill: gray,
          ))
          content((), $ #h(10pt)x $, anchor: "east")
          line((0, -0.25), (0, 2.5), stroke: 1pt + gray, mark: (
            end: "stealth",
            fill: gray,
          ))
          content((), $ y $, anchor: "south")

          line((0, 0), (3 / 2, 0.75))
          line((0, 0), (0.75, 3 / 2))
          line((3 / 2, 3 / 4), (3 / 2 + 3 / 4, 3 / 2 + 3 / 4))
          line((3 / 4, 3 / 2), (3 / 2 + 3 / 4, 3 / 2 + 3 / 4))
          line((3 / 2, 3 / 4), (3 / 4, 3 / 2))

          line((0, 0), (3 / 2 + 3 / 4, 3 / 2 + 3 / 4))

          line((9 / 8 + 1 / 8, 9 / 8 + 1 / 8), (10 / 8 - 1 / 8, 10 / 8 + 1 / 8))
          line((10 / 8 - 1 / 8, 10 / 8 + 1 / 8), (8 / 8, 10 / 8))

          content((0.25, 1), $norm(boup(x))$)
          content((1, 0.25), $norm(boup(y))$)
          content((0.45, 1.65), $norm(boup(x - y))$)
          content((2.65, 2.25), $norm(boup(x + y))$)
        }),
      )
    ],
    [
      Nechť $boup(x) bot boup(y)$, tj. $innerproduct(boup(x), boup(y)) = 0$. Potom
      $
        norm(boup(x))^2 + norm(boup(y))^2 &=\
        &= innerproduct(boup(x), boup(x)) + innerproduct(boup(y), boup(y)) = \
        &= innerproduct(boup(x), boup(x)) - innerproduct(boup(x), boup(y)) + innerproduct(boup(y), boup(y)) = \
        &= innerproduct(boup(x), boup(x)) - innerproduct(boup(y), boup(x)) + innerproduct(boup(y), boup(y)) = \
        &= innerproduct(boup(x - y), boup(x)) + innerproduct(boup(y), boup(y)) = \
        &= innerproduct(boup(x - y), boup(x)) + innerproduct(boup(y), boup(y)) - innerproduct(boup(x), boup(y)) = \
        &= innerproduct(boup(x - y), boup(x)) + innerproduct(boup(y - x), boup(y)) = \
        &= innerproduct(boup(x - y), boup(x)) - innerproduct(boup(x - y), boup(y)) = \
        &= innerproduct(boup(x - y), boup(x - y)) = \
        &= norm(boup(x - y))^2. \
      $

      Z obrázku níže lze vidět, že jde o Pythagorovu větu.

      #figure(
        caption: [Pythagorova věta pomocí normy vektorů],
        cetz.canvas(length: 2cm, {
          import cetz.draw: *

          set-style(
            mark: (fill: black, scale: 2),
            content: (padding: 1pt),
          )

          line((-0.5, 0), (2.5, 0), stroke: 1pt + gray, mark: (
            end: "stealth",
            fill: gray,
          ))
          content((), $ #h(10pt)x $, anchor: "east")
          line((0, -0.5), (0, 2.5), stroke: 1pt + gray, mark: (
            end: "stealth",
            fill: gray,
          ))
          content((), $ y $, anchor: "south")

          line((0, 0), (2, 1))
          line((0, 0), (-0.5, 1))
          line(
            (-0.5, 1),
            (2, 1),
          )
          line((0.2, 0.1), (0.1, 0.3))
          line((-0.1, 0.2), (0.1, 0.3))

          content((0.75, 1.15), $norm(boup(x - y))$)
          content((1.5, 0.5), $norm(boup(y))$)
          content((-0.5, 0.5), $norm(boup(x))$)
        }),
      )
    ],
  )
]

#exercise(number: 10)[
  Existuje isometrie $f : RR^3 -> RR^4$ tak, že $f mat(1; −1; 2) = mat(1; 2; −1; 1)$ a $f mat(1; 1; 0) = mat(0; 1; −1; 0)$?
]

#solution[
  Neexistuje, neboť
  $
    d(mat(1; -1; 2), mat(1; 1; 0)) = norm(mat(0; -2; 2)) = sqrt(8) != sqrt(3) = norm(mat(1; 1; 0; 1)) = d(mat(1; 2; -1; 1), mat(0; 1; -1; 0)).
  $
]

#exercise(number: 13)[
  Najděte dva ortogonální vektory $boup(x)$ a $boup(y)$ takové, že $"span"{boup(x), boup(y)} = "span"{mat(0; 1; 1),mat(1; 2; 3)}$.
]

#solution[
  Jinými slovy máme najít ortogonální bázi ${boup(x), boup(y)}$ daného prostoru (prostor má dimensi 2, neboť počítáme lineaární obal dvou lineárně nezávislých vektorů). Nechť
  $ boup(x) = mat(0; 1; 1), $
  potom
  $
    boup(y) = mat(1; 2; 3) - innerproduct(mat(1; 2; 3), mat(0; 1; 1))/innerproduct(mat(0; 1; 1), mat(0; 1; 1)) mat(0; 1; 1) = mat(1; 2; 3) - 5/2 mat(0; 1; 1) = mat(1; 4/2; 6/2) - mat(0; 5/2; 5/2) = mat(1; -1/2; 1/2).
  $
]
