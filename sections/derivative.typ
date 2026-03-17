#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *

= Derivace

#exercise[
  Načrtněte několik vrstevnic (připište k nim výšky) těchto funkcí dvou proměných:
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

#exercise(number: 10)[
  Nadmořská výška krajiny je dána vzorcem $h(d, s) = 2 s^2 + 3 s d - d^2 + 5$, kde $d$ je zeměpisná délka (zvětšuje se od západu k východu) a $s$ je zeměpisná šířka (zvětšuje se od jihu k severu). V bodě $mat(d; s) = mat(−1; 1)$ určete
  + směr nejstrmějšího stoupání terénu,
  + strmost terénu v jihovýchodním směru.
]

#exercise(number: 13)[
  Je dána funkce $f(x, y) = 6 x y^2 − 2 x^3 − 3 y^3$. V bodě $mat(x_0; y_0) = mat(1; −2)$ najděte Taylorův polynom nultého, prvního a druhého stupně.
]
