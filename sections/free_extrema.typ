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

#solution[
  #enum(
    [Hessova matice je indefinitní, v daném bodě bude tedy sedlo.],
    [Hessova matice je positivně semidefinitní, v daném bodě bude tedy neostré minimum.],
    [Hessova matice je positivně definitní, v daném bodě bude tedy ostré minimum.],
  )
]

#exercise[
  Pro následující funkce najděte stacionární body (dejte pozor při řešení stacionárních podmínek, ať vám nějaká řešení neuniknou). Pro každý stacionární bod určete, zda je to lokální minimum, lokální maximum, či ani jedno. Pokud to určit neumíte, odůvodněte,
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
    enum.item(4)[
      První derivace je
      $
        f' vec(x, y) = mat(column-gap: #1em, 3 - 3 x^2 - 3 y^2, -6 x y).
      $

      Musíme vyřešit soustavu $f' vec(x, y) = mat(0, 0)$. To jest
      $
        3 - 3 x^2 - 3 y^2 & = 0, \
                   -6 x y & = 0.
      $
      Z druhé rovnice vidíme, že $x = 0$, nebo $y = 0$. Pokud $x = 0$, potom dostáme rovnice $3 - 3 y^2 = 0$, tedy $y^2 = 1$, resp. $y = plus.minus 1$. Je-li $y = 0$, pak dostáváme analogickou rovnici $3 - 3 x^2$, to jest $x^2 = 1$, resp. $x = plus.minus 1$. Stacionární body jsou tedy $vec(0, plus.minus 1)$ a $vec(plus.minus 1, 0)$.
    ],
    [
      První derivace je
      $
        f' vec(x, y) = mat(column-gap: #1em, 6 y^2 - 6 x, 12 x y - 12 y^3).
      $
      Musíme vyřešit soustavu $f' vec(x, y) = mat(0, 0)$. To jest
      $
            6 y^2 - 6 x & = 0, \
        12 x y - 12 y^3 & = 0,
      $
      úpravou dostáváme
      $
        y^2 & = x, \
        x y & = y^3.
      $
      Dosazením za $x$ z první rovnice vidíme, že druhá rovnost je splněna pro všechna $y in RR$. Stacionárními body tedy jsou $vec(t^2, t)$ pro všechna $t in RR$.
    ],
  )
]

#exercise[
  Najděte lokální extrémy funkce $f : RR^n -> RR$ s hodnotami $f(boup(x)) = boup(a)^T boup(x) - sum_(i=1)^n x_i ln(x_i)$, kde $boup(a)$ je daný vektor.
]

#solution[
  První derivace funkce $f$ podle $i$-té proměnné je
  $
    f'_i vec(x_i) = a_i - (1 ln(x_i) + x_i 1/x_i) = a_i - ln(x_i) - 1.
  $
  Musíme vyřešit soustavu $f'(boup(x)) = boup(0)$. Tedy
  $
    a_i - ln(x_i) - 1 & = 0 \
              ln(x_i) & = a_i - 1 \
                  x_i & = e^(a_i - 1)
  $
  pro $i in {1, dots, n}$. Označme řešení $boup(x)_0$.

  Nyní vypočteme derivaci druhou:
  $
    f''_(i j) (x_i) = - delta_(i j)/x_i.
  $
  Vidíme, že Hessova matice je diagonální, to, jestli je v bodě $boup(x)_0$ extrém (případně jaký) tedy závisí pouze na hodnotách
  $-1/(e^(a_i - 1))$
  pro $i in {1, dots, n}$. Protože exponenciela je na celém $RR$ kladná, budou všechny tyto hodnoty záporné, Hessova matice bude negativně definitní a v bodě $boup(x)_0$ máme tedy lokální maximum.
]

#exercise(number: 5)[
  Najděte všechna řešení rovnice $sin(x) = 1/2 x$ (sinus je v radiánech) na kalkulačce s největší přesností, jakou dokážete.
]

#solution[
  #let iterate-code = read("../code/iterate.m")
  Nejprve rovnici upravíme na $x = 2 sin(x)$, můžeme tedy využít metodu prosté iterace, kterou napíšeme v Octave/Matlab pro zjednodušení práce:

  #raw(iterate-code, lang: "matlab")
  Následovně ji můžeme zavolat příkazem  #raw("iterate(@(x) 2 * sin(x), 1/2, 0.05)", lang: "matlab") a dostaneme výsledek `1.9127`.

]

#exercise[
  Najděte lokální extrém funkce $f vec(x, y) = x^2 − y + sin(y^2 − 2 x)$ čistou Newtonovou metodou. Počáteční odhad zvolte $vec(x_0, y_0) = vec(1, 1)$. Můžete použít počítač.
]

#solution[
  #let newton-code = read("../code/newton.m")
  Nejprve určíme první derivaci
  $
    f' vec(x, y) = mat(column-gap: #1em, 2 x - 2 cos(y^2 - 2 x), 2 y cos(y^2 - 2 x) -1)
  $
  a poté derivaci druhou
  $
    f'' vec(x, y) = mat(
      column-gap: #1em,
      2 - 4 sin(y^2 - 2 x), 4 y sin (y^2 - 2 x);
      4 y sin(y^2 - 2 x), 2 cos(y^2 - 2 x) - 4 y^2 sin(y^2 - 2 x)
    ).
  $
  Chceme tedy najít kořeny soustavy rovnic
  $
    2 x + 2 cos(y^2 - 2 x) & = 0, \
     2 y cos(y^2 - 2 x) -1 & = 0.
  $

  Newtonovu metodu napíšeme v Octave/Matlab:

  #raw(newton-code, lang: "matlab")
  a můžeme ji zavolat s naší funkcí
  ```matlab
  function y = f(x)
      y = [
        2 * x(1) - 2 * cos(x(2)^2 - 2 * x(1)); ...
        2 * x(2) * cos(x(2)^2 - 2 * x(1)) - 1
      ];
  end
  ```
  její derivací
  ```matlab
  function y = f_derivative(x)
      y = [
        2 - 4 * sin(x(2)^2 - 2 * x(1)), ...
        4 * x(2) * sin(x(2)^2 - 2 * x(1)); ...
        4 * x(2) * sin(x(2)^2 - 2 * x(1)), ...
        2 * cos(x(2)^2 - 2 * x(1)) - 4 * x(2)^2 * sin(x(2)^2 - 2 * x(1))
      ];
  end
  ```
  pomocí #raw("newton(@f, @f_derivative, [1; 1], 0.1)", lang: "matlab"). Tím dostáváme výsledek `[0.6807; 0.7345]`.
]
