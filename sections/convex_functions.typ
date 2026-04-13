#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *
#import "@preview/cetz:0.4.2"

= Konvexní funkce

#exercise[
  Pro každou funkci $f: RR^n -> RR$ dokažte z podmínky
  ,
  které z těchto čtyř tvrzení platí (a pro jaké $n$): funkce je konvexní, konkávní, konvexní i konkávní, ani konvexní ani konkávní:
  + $f(boup(x)) = boup(a)^T boup(x) + b$,
  + $f(boup(x)) = boup(x)^T boup(x)$,
  + $f(boup(x)) = 1/n sum_(i=1)^n x_i$,
  + $f(boup(x)) = "median"_(i=1)^n x_i$,
  + $f(boup(x)) = min_(i=1)^n abs(x_i)$,
  + $f(boup(x)) = "součet dvou nejmenších čísel z čísel" x_1, dots, x_n$.
]

#exercise(number: 3)[
  Pro každou funkci dokažte, které z těchto čtyřech tvrzení platí: funkce je konvexní, konkávní, konvexní i konkávní, ani konvexní ani konkávní.
  + $f(x) = e^(x^2)$,
  + $f(x) = e^(-x^2)$,
  + $f vec(x, y) = abs(x - y)$,
  + $f vec(x, y) = -y$,
  + $f(boup(x)) = norm(boup(A) boup(x) - boup(b))_2^2$,
  + $f(boup(x)) = sum_(i=1)^n x_i ln(x_i)$ na množině $RR^n_(++)$,
  + $f(boup(x)) = sum_(i=1)^k ln(b_i - boup(a)_i^T boup(x))$ na množině $X = {boup(x) in RR^n | boup(a)_i^T boup(x) < b_i, i = 1, dots, k}$,
  + $f(boup(x)) = min_(i=1)^n x_i$,
  + $f(boup(x)) = max_(i=1)^n x_i - min_(i=1)^n x_i$,
  + $f(boup(x)) = max_(i=1)^n x_i + min_(i=1)^n x_i$,
  + $f(boup(x)) = max{abs(sum_(i=1)^n x_i - 1), sum_(i=1)^n abs(x_i) - 1}$,
  + $(star)$ $f(boup(x))$ je součet $k$ největších složek $x_1, dots, x_n$ vektoru $boup(x)$ (kde $k <= n$ je dáno).
]

#exercise(number: 7)[
  Každý z obrázků zobrazuje některé vrstevnice funkce dvou proměnných a jejich výšky. Je možné, aby funkce, která má tyto vrstevnice, byla konvexní?
  #align(center, cetz.canvas(length: 2cm, {
    import cetz.draw: *

    circle((-1.5, 0), radius: 1, name: "cl3")
    content("cl3.east", anchor: "west", padding: 3pt, $3$)
    circle((-1.5, 0), radius: 0.5, name: "cl2")
    content("cl2.east", anchor: "west", padding: 3pt, $2$)
    circle((-1.5, 0), radius: 0.25, name: "cl1")
    content("cl1.east", anchor: "west", padding: 3pt, $1$)

    circle((1.5, 0), radius: 1, name: "cr3")
    content("cr3.east", anchor: "west", padding: 3pt, $3$)
    circle((1.5, 0), radius: 0.75, name: "cr2")
    content("cr2.east", anchor: "west", padding: 3pt, $2$)
    circle((1.5, 0), radius: 0.25, name: "cr1")
    content("cr1.east", anchor: "west", padding: 3pt, $1$)
  }))
]

#exercise(number: 8)[
  Co je subkontura výšky $2$ funkce jedné proměnné $f(x) = x^2 - x$?
]
