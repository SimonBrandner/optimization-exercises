#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *
#import "@preview/cetz:0.4.2"

= Konvexní funkce

#exercise[
  Pro každou funkci $f: RR^n -> RR$ dokažte z definice, které z těchto čtyř tvrzení platí (a pro jaké $n$): funkce je konvexní, konkávní, konvexní i konkávní, ani konvexní ani konkávní:
  + $f(boup(x)) = boup(a)^T boup(x) + b$,
  + $f(boup(x)) = boup(x)^T boup(x)$,
  + $f(boup(x)) = 1/n sum_(i=1)^n x_i$,
  + $f(boup(x)) = "median"_(i=1)^n x_i$,
  + $f(boup(x)) = min_(i=1)^n abs(x_i)$,
  + $f(boup(x)) = "součet dvou nejmenších čísel z čísel" x_1, dots, x_n$.
]

#solution[
  #enum(
    [
      Z rovnosti
      $
        f((1 - alpha) boup(x) + alpha boup(y)) &= boup(a)^T ((1 - alpha) boup(x) + alpha boup(y)) + boup(b) = \
        &= (1 - alpha) boup(a)^T boup(x) + alpha boup(a)^T boup(y) + boup(b) = \
        &= (1 - alpha) boup(a)^T boup(x) + alpha boup(a)^T boup(y) + (1 - alpha + alpha) boup(b) = \
        &= (1 - alpha) boup(a)^T boup(x) + alpha boup(a)^T boup(y) + (1 - alpha) boup(b) + alpha boup(b) = \
        &= (1 - alpha) boup(a)^T boup(x) + (1 - alpha) boup(b) + alpha boup(a)^T boup(y) +alpha boup(b) = \
        &= (1 - alpha) (boup(a)^T boup(x) + boup(b)) + alpha (boup(a)^T boup(y) + boup(b)) =\
        &= (1 - alpha) f(boup(x)) + alpha f(boup(y))
      $
      vidíme, že funkce $f$ je konvexní i konkávní.
    ],
    [
      Budeme postupovat analogicky k úloze (c) ze @convex_sets_proof_from_definition. Chceme ukázat, že platí
      $
        f((1 - alpha) boup(x) + alpha boup(y)) <= (1 - alpha) f(boup(x)) + alpha f (boup(y))
      $
      resp. že
      $
        (1 - alpha) f(boup(x)) + alpha f (boup(y)) - f((1 - alpha) boup(x) + alpha boup(y)) >=0.
      $

      To ale platí:
      $
        & space space space (1 - alpha) f(boup(x)) + alpha f (boup(y)) - f((1 - alpha) boup(x) + alpha boup(y)) = \
        &= (1 - alpha) boup(x)^T boup(x) + alpha boup(y)^T boup(y) - ((1 - alpha) boup(x) + alpha boup(y))^T ((1 - alpha) boup(x) + alpha boup(y)) = \
        &= (1 - alpha) boup(x)^T boup(x) + alpha boup(y)^T boup(y) - ((1 - alpha)^2 boup(x)^T boup(x) + 2 alpha (1 - alpha) boup(x)^T boup(y) + alpha^2 boup(y)^T boup(y)) = \
        &= (1 - alpha) boup(x)^T boup(x) + alpha boup(y)^T boup(y) - (1 - alpha)^2 boup(x)^T boup(x) - 2 alpha (1 - alpha) boup(x)^T boup(y) - alpha^2 boup(y)^T boup(y) = \
        &= (1 - alpha) boup(x)^T boup(x) - (1 - alpha)^2 boup(x)^T boup(x) - 2 alpha (1 - alpha) boup(x)^T boup(y) + alpha boup(y)^T boup(y) - alpha^2 boup(y)^T boup(y) = \
        &= (1 - alpha) (boup(x)^T boup(x) - (1 - alpha) boup(x)^T boup(x) - 2 alpha boup(x)^T boup(y)) + alpha boup(y)^T boup(y) (1 - alpha) = \
        &= alpha (1 - alpha) (boup(x)^T boup(x) - 2 boup(x)^T boup(y) + boup(y)^T boup(y)) = \
        &= alpha (1 - alpha) norm(boup(x) - boup(y))^2 >=0. \
      $
      Vidíme tedy, že funkce $f$ je konvexní a není konkávní.
    ],
    enum.item(4)[
      Funkce $f$ je pro $n in {1, 2}$ konvexní i konkávní, neboť je v tom případě lineární. Pro $n > 2$ není konvexní ani konkávní. Nejprve ukážeme, že není konkávní: zvolme $alpha = 1/2$, $boup(x) = vec(0, 10, 100)$ a $boup(y) = vec(100, 10, 0)$. Potom platí
      $
        f((1 - alpha) boup(x) + alpha boup(y)) &= "median"(1/2 vec(0, 10, 100) + 1/2 vec(100, 10, 0)) = \
        &= "median"vec(50, 10, 50) = \
        &= 50,
      $
      což je větší než
      $
        (1 - alpha) f(boup(x)) + alpha f(boup(y)) = 1/2 "median"vec(0, 10, 100) + 1/2 "median"vec(100, 10, 0) = 10,
      $
      a tedy funkce není konkávní.

      Abychom ukázali, že není konvexní, zvolíme $alpha = 1/2$, $boup(x) = vec(0, -10, -100)$ a $boup(y) = vec(-100, -10, 0)$. Pak bude platit
      $
        f((1 - alpha) boup(x) + alpha boup(y)) &= "median"(1/2 vec(0, -10, -100) + 1/2 vec(-100, -10, 0)) =\
        &= "median"vec(-50, -10, -50) = \
        &= -50,
      $
      což je zjevně menší než
      $
        (1 - alpha) f(boup(x)) + alpha f(boup(y)) = 1/2 "median"vec(0, -10, -100) + 1/2 "median"vec(-100, -10, 0) = -10,
      $
      z čehož plyne, že funkce není ani konkávní.
    ],
    [
      Pro $n = 1$ je funkce $f$ zjevně lineární, a tedy i konvexní a konkávní. Pro $n > 1$ není konvexní ani konkávní. Nejprve ukážeme, že není konkávní. Zvolme $alpha = 1/2$, $boup(x) = vec(1, 1)$ a $boup(y) = vec(1, -1)$. Potom
      $
        f((1 - alpha) boup(x) + alpha boup(y)) = f (1/2 vec(1, 1) + 1/2 vec(1, -1)) = f vec(1, 0) = min vec(abs(1), abs(0)) = 0,
      $
      což je menší než
      $
        (1 - alpha) f(boup(x)) + alpha f(boup(y)) = 1/2 min vec(abs(1), abs(1)) + 1/2 min vec(abs(1), abs(-1)) = 1,
      $
      funkce tedy není konkávní.

      Abychom ukázali, že není konvexní, zvolíme $alpha = 1/2$, $boup(x) = vec(1, 0)$ a $boup(y) = vec(0, 1)$. Potom
      $
        f((1 - alpha) boup(x) + alpha boup(y)) = f (1/2 vec(1, 0) + 1/2 vec(0, 1)) = f vec(1/2, 1/2) = min vec(abs(1/2), abs(1/2)) = 1/2,
      $
      což je větší než
      $
        (1 - alpha) f(boup(x)) + alpha f(boup(y)) = 1/2 min vec(abs(1), abs(0)) + 1/2 min vec(abs(0), abs(1)) = 0,
      $
      funkce tedy není ani konvexní.
    ],
  )
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

#solution[
  #enum(
    [
      Funkce $g(x) = e^x$ je konvexní a neklesající, funkce $h(x) = x^2$ je konvexní, a tedy i funkce $g(h(x)) = e^(x^2)$ je konvexní. Zjevně není konkávní.
    ],
    [
      Není konvexní ani konkávní. Nejprve ukážeme, že není konvexní. Zvolme $alpha = 1/2$, $x = -1$ a $y = 1$. Potom
      $
        f((1 - alpha) x + alpha y) = e^(-(1/2 (-1) + 1/2 1)^2) = e^(0) = 1,
      $
      což je větší než
      $
        (1 - alpha) f(x) + alpha f(y) = 1/2 e^(-(-1)^2) + 1/2 e^(-1^2) = e^(-1).
      $

      Abychom ukázali, že není konkávní, zvolíme $alpha = 1/2$, $x = 1$ a $y = 2$. Pak platí, že
      $
        f((1 - alpha) x + alpha y) = e^(-(1/2 1 + 1/2 2)^2) = e^(-9/4),
      $
      což je menší než
      $
        (1 - alpha) f(x) + alpha f(y) = 1/2 e^(-1^2) + 1/2 e^(-2^2) = 1/2 (e^(-1) + e^(-4)).
      $

      Funkce $f$ tedy není ani konvexní, ani konkávní.
    ],
    [
      Z rovností a nerovností
      $
        f((1 - alpha) vec(x_1, y_1) + alpha vec(x_2, y_2)) &= abs((1 - alpha) x_1 + alpha x_2 - (1 - alpha) y_1 - alpha y_2) = \
        &= abs((1 - alpha) (x_1 - y_1) + alpha (x_2 - y_2)) <= \
        &<= abs((1 - alpha) (x_1 - y_1)) + abs(alpha (x_2 - y_2)) = \
        &= (1 - alpha) abs(x_1- y_1) + alpha abs(x_2 - y_2) = \
        &= (1 - alpha) f vec(x_1, y_1) + alpha f vec(x_2, y_2)
      $
      vidíme, že funkce je konvexní a není konkávní.
    ],
    enum.item(5)[
      Z předchozího cvičení víme, že funkce $g(boup(x)) = norm(boup(x))_2^2$ je konvexní funkce, pak tedy platí, že i $g(boup(A) boup(x) - boup(b)) = norm(boup(A) boup(x) - boup(b))_2^2$ je konvexní funkce. Zjevně není konkávní.
    ],
  )
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

#solution[
  Vrstevnice z prvního obrázku nemohou být vrstevnicemi konvexní funkce, neboť úsečka mezi body na vrstevnici výšky $1$ a vrstevnici výšky $3$, která leží v polopřímce, jejíž počátek je ve středu kružnic, nemůže ležet nad grafem funkce.

  Kružnice z druhého obrázku by mohly vrstevnicemi konvexní funkce. Příkladem by mohla být např. funkce $f vec(x, y) = 1/6 x^2 + 1/6 y^2 - 1/6 x - 1/6 y + 1$.
]

#exercise(number: 8)[
  Co je subkontura výšky $2$ funkce jedné proměnné $f(x) = x^2 - x$?
]

#solution[
  Jedná se o množinu
  $
    {x | f(x) <= 2} & = {x | x^2 - x <= 2} = \
                    & = {x | x^2 - x - 2 <= 0} = \
                    & = {x | (x - 2)(x + 1) <= 0} = \
                    & = [-1, 2].
  $
]
