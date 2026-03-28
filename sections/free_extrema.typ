#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *

= Volné lokální extrémy

#exercise[
  Funkce $f : RR^3 -> RR$ má stacionární bod $vec(2, 1, 5)$. Co se dá o tomto stacionárním bodě řící, když Hessova matice $f'' vec(2, 1, 5)$ má vlastní čísla
  #enum(
    ${2, 3, -1},$,
    ${2, 3, 0},$,
    ${2, 1, 1}.$,
  )
]

#solution[]

#exercise[
  Pro následující funkce najděte stacionární body (dejte pozor při řešení stacionárních podmínek, ať vám nějaká řešení neuniknou). Pro každý stacionární bod určete, zda je to lokální minimum, lokální maximum, či ani jedno. Pokud to určit neumíte, odůvodněte.
  #enum(
    [$f vec(x, y) = x (1 - 2/3 x^2 - y^2)$,],
    [$f vec(x, y) = 1/x + 1/y + x y$,],
    [$f vec(x, y) = e^y (y^2 - x^2)$,],
    [$f vec(x, y) = 3 x - x^3 - 3 x y^2$,],
    [$f vec(x, y) = 6 x y^2 - 2 x^3 - 3 y^4$,],
    [$f vec(x, y) = x^4/3 + y^4/2 - 4 x y^2 + 2 x^2 + 2 y^2 + 3$,],
    [$f vec(x, y, z) = x^3 + y^3 + 2 x y z + z^2$.],
  )
]

#solution[
  #enum(
    enum.item(4)[],
    [],
  )
]

#exercise[
  Najděte lokální extrémy funkce $f : RR^n -> RR$ s hodnotami $f(boup(x)) = boup(a)^T boup(x) - sum_(i=1)^n x_i ln(x_i)$, kde $boup(a)$ je daný vektor.
]

#solution[]

#exercise[
  Najděte všechna řešení rovnice $sin(x) = 1/2 x$ (sinus je v radiánech) na kalkulačce s největší přesností, jakou dokážete.
]

#solution[]

#exercise[
  Najděte lokální extrém funkce $f vec(x, y) = x^2 − y + sin(y^2 − 2 x)$ čistou Newtonovou metodou. Počáteční odhad zvolte $vec(x_0, y_0) = vec(1, 1)$. Můžete použít počítač.
]

#solution[]
