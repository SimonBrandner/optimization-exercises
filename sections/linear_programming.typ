#import "@preview/cetz-plot:0.1.3": plot
#import "@preview/cetz:0.4.2"
#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *

= Lineární programování

#exercise[
  Najděte graficky množinu optimálních řešení úlohy: minimum z
  $
    c_1 x_1 + c_2 x_2 + c_3 x_3
  $
  za podmíky
  $
     x_1 & +   &   x_2 & >= 1, \
     x_1 & +   & 2 x_2 & >= 1, \
     x_1 & +   &   x_2 & <= 10, \
    x_1, & x_2 & , x_3 & >= 0,
  $
  pro následující případy:
  + $boup(c) = vec(-1, 0, 1)$,
  + $boup(c) = vec(0, 1, 0)$,
  + $boup(c) = vec(0, 0, -1)$.
]

#solution[
  Protože omezení (až na omezení na nezápornost) se týkají jen proměnných $x_1$ a $x_2$, graficky znázorníme právě tyto omezení.
  #figure(
    align(center, cetz.canvas({
      import cetz.draw: *

      plot.plot(
        name: "plot",
        axis-style: "school-book",
        size: (8, 8),
        x-label: $x_1$,
        y-label: $x_2$,
        x-tick-step: 1,
        y-tick-step: 1,
        y-min: -1,
        y-max: 11,
        {
          let domain = (-1, 11)

          plot.add(x => 1 - x, domain: domain)
          plot.add(x => (1 - x) / 2, domain: domain)
          plot.add(x => 10 - x, domain: domain)
          plot.add-anchor("a", (1, 0))
          plot.add-anchor("b", (10, 0))
          plot.add-anchor("c", (0, 10))
          plot.add-anchor("d", (0, 1))
        },
      )
      merge-path(fill: gray, {
        line("plot.a", "plot.b")
        line("plot.b", "plot.c")
        line("plot.c", "plot.d")
        line("plot.d", "plot.a")
      })
    })),
    caption: "Grafické znázornění omezeních",
  ) <lin-prg-easy>

  #enum(
    [
      Chceme minimalizovat $-x_1 + x_3$. Pro $x_3$ máme jediné omezení $x_3 >= 0$, tudíž zvolíme $x_3 = 0$. Poté chceme minimalizovat $-x_1$, tedy maximalizovat $x_1$. Z @lin-prg-easy[Obrázku] pak vidíme, že minima dosáhneme v bodě $boup(x) = vec(10, 0, 0)$.
    ],
    [
      Chceme minimalizovat $x_2$. Ihned vidíme, že $x_3$ lze volit libovolně. Zároveň z obrázku vidíme, že množina řešeních bude
      $
        {vec(x_1, x_2, x_3) mid(|) x_1 in [1, 10], x_2 = 0, x_3 >= 0}.
      $
    ],
    [
      Z předchozích bodů vidíme, že omezení na proměnné $x_1$ a $x_2$ jsou splnitelná. V této podúloze máma minimalizovat $-x_3$ s jedinou podmínkou na $x_3$, která je,že $x_3 >= 0$. Hodnota $x_3$ tedy není shora omezená, tedy Hodnota $-x_3$ není zdola omezená. Úloha tedy nemá optimum.
    ],
  )
]

#exercise[
  Následující úlohy nejprve převeďte na rovnicový tvar (tj. tvar s nezápornými proměnnými a omezeními typu lineární rovnice). Potom je převeďte do maticové formy $min{boup(r)^T boup(u) | boup(P) boup(u) = boup(q), boup(u) >= boup(0)}$ (výsledkem tedy budou $boup(u), boup(P), boup(q), boup(r)$).
  #enum(
    [
      Minimum z
      $
        2 x_1 - 3 x_3 + x_4
      $
      za podmínek
      $
        &&   x_1 & - &   x_2 & -   &    x_3 &&          & >= 0, \
        &&  -x_1 & + & 2 x_2 & -   &  3 x_3 &&          & <= 5, \
        && 2 x_1 & - &   x_2 & -   &    x_3 &&  + 2 x_4 & = 6, \
        &&       &   &       & x_1 & , x_2, && x_3, x_4 & >= 0,
      $
    ],
    [
      Minimum z
      $
        min sum_(i=1)^m sum_(j=1)^n c_(i j) x_(i j)
      $
      za podmínek
      $
        sum_(j=1)^n x_(i j) & =  & a_i & ,#h(10pt) && i = 1, dots, m, \
        sum_(i=1)^m x_(i j) & =  & b_j & ,#h(10pt) && j = 1, dots, n, \
                    x_(i j) & >= &   0 & ,#h(10pt) && i = 1, dots, m, j = 1, dots, n.
      $
    ],
  )
]

#solution[
  #enum(
    [
      Úlohu nejprve převedeme na rovnicový tvar,
      $
        &&   x_1 & - &   x_2 & - &   x_3 &&           &&     - y_1 &          &  = 0, \
        &&  -x_1 & + & 2 x_2 & - & 3 x_3 &&           &&           & + y_2    &  = 5, \
        && 2 x_1 & - &   x_2 & - &   x_3 &&   + 2 x_4 &&           &          &  = 6, \
        &&       &   &       &   &       && x_1, x_2, && x_3, x_4, & y_1, y_2 & >= 0,
      $
      a poté ji zapíšeme pomocí matic,
      $
        boup(r) = vec(2, 0, -3, 1, 0, 0),
        boup(u) = vec(x_1, x_2, x_3, x_4, y_1, y_2),
        boup(P) = mat(1, -1, -1, 0, -1, 0; -1, 2, -3, 0, 0, 1; 2, -1, -1, 2, 0, 0)
        "a" boup(q) = vec(0, 5, 6).
      $
    ],
    [
      Úloha již je v rovnicovém tvaru, stačí ji tedy zapsat maticově. Zadefinujme
      $
        boup(a) = mat(a_1; dots.v; a_m),
        boup(b) = mat(b_1; dots.v; b_n),
        boup(x)_j = vec(x_(1 j), dots.v, x_(m j)) "a"
        boup(c)_j = vec(c_(1 j), dots.v, c_(m j)) "pro" j = 1, dots, n,
      $
      poté můžeme zadefinovat požadované vektory a matice,
      $
        boup(r) = mat(augment: #(hline: (1, 2)), boup(c)_1; dots.v; boup(c)_n),
        boup(u) = mat(augment: #(hline: (1, 2)), boup(x)_1; dots.v; boup(x)_n),
        boup(P) = mat(
          augment: #(hline: (1, 2, 3, 4, 5), vline: (1, 2, 3, 4)),
          boup(I), boup(I), dots.c, boup(I), boup(I);
          boup(1)^T, boup(0)^T, dots.c, boup(0)^T, boup(0)^T;
          boup(0)^T, boup(1)^T, dots.c, boup(0)^T, boup(0)^T;
          dots.v, dots.v, dots.down, dots.v, dots.v;
          boup(0)^T, boup(0)^T, dots.c, boup(1)^T, boup(0)^T;
          boup(0)^T, boup(0)^T, dots.c, boup(0)^T, boup(1)^T;
        ) "a"
        boup(q) = mat(augment: #(hline: 1), boup(a); boup(b)),
      $
      kde $boup(I) in RR^(m times m)$ a $boup(0), boup(1) in RR^m$.
    ],
  )
]

#exercise[
  Vyřešte úvahou tyto jednoduché lineární programy a napište (jednoduchý) výraz pro optimální hodnotu. Odpovědi dokažte. Vektor $boup(c) in RR^n$ a číslo $k in {1, dots, n}$ jsou dány.
  + $max{boup(c)^T boup(x) | boup(x) in RR^n, boup(0) <= boup(x) <= boup(1)}$,
  + $max{boup(c)^T boup(x) | boup(x) in RR^n, -boup(1) <= boup(x) <= boup(1)}$,
  + $max{boup(c)^T boup(x) | boup(x) in RR^n, boup(x) >= boup(0), boup(1)^T boup(x) = 1}$,
]

#exercise[
  Pokuste se úlohy transformovat na LP. Pokud to nedokážete, vysvětlete proč.
  + $min{abs(x_1) + abs(x_2) | x_1, x_2 in RR, 2 x_1 - x_2 >= 1, -x_1 + 2 x_2 >= 1}$,
]

#solution[
  Převedeme na úlohu minimalizace
  $
    y_1 + y_2
  $
  za podmínek
  $
    &   & 2 x_1 & - &   x_2 &   &     &   &    >= 1, \
    & - &   x_1 & + & 2 x_2 &   &     &   &    >= 1, \
    &   &   x_1 &   &       & - & y_1 &   &    <= 0, \
    & - &   x_1 &   &       & - & y_1 &   &    <= 0, \
    &   &       &   &   x_2 &   &     & - & y_2<= 0, \
    &   &       & - &   x_2 &   &     & - & y_2<= 0. \
  $
]

#exercise(number: 9)[
  Firma na výrobu kánoí má 120 zaměstnanců, z nichž každý pracuje maximálně 30 hodin týdně. Polovina zaměstnanců pracuje v truhlářské dílně, 20 zaměstnanců pracuje v dílně na zpracování plastů a zbytek v kompletační dílně. Firma vyrábí dva typy kánoí: standardní kánoe s čistým ziskem 7 EUR za kus a luxusní kánoe s čistým ziskem 10 EUR za kus. Na výrobu jedné standardní kánoe je třeba 4.5 hodiny práce v truhlářské dílně a dvě hodiny v každé ze zbylých dvou dílen. Jedna luxusní kánoe vyžaduje 5 hodin práce v truhlárně, hodinu v dílně na plasty a 4 hodiny kompletace. Průzkum trhu odhalil, že ne méně než 1/3 a ne více než 2/3 vyrobených kánoí by měly být luxusní. Kolik kterých kánoí má firma týdně vyrobit, aby byl její čistý zisk maximální? Formalizujte jako optimalizační úlohu. Tuto úlohu už ale neřešte.
]
