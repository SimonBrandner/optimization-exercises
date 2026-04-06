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

#exercise[
  Následující úlohy nejprve převeďte na rovnicový tvar (tj. tvar s nezápornými proměnnými a omezeními typu lineární rovnice). Potom je převeďte do maticové formy $min{boup(r)^T boup(u) | boup(P) boup(u) = boup(q), boup(u) >= 0}$ (výsledkem tedy budou $boup(u), boup(P), boup(q), boup(r)$).
  #enum(
    [
      Minimum z
      $
        2 x_1 - 3 x_3 + x_4
      $
      za podmínek
      $
        &&   x_1 & - &   x_2 & -   &    x_3 &&          & >= 0, \
        &&  -x_1 & + & 2 x_2 & -   &        &&    3 x_3 & <= 5, \
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
        sum_(i=1)^n x_(i j) & =  & a_i & ,#h(10pt) && i = 1, dots, m, \
        sum_(i=1)^m x_(i j) & =  & b_j & ,#h(10pt) && j = 1, dots, n, \
                    x_(i j) & >= &   0 & ,#h(10pt) && i = 1, dots, m, j = 1, dots, n.
      $
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

#exercise(number: 9)[
  Firma na výrobu kánoí má 120 zaměstnanců, z nichž každý pracuje maximálně 30 hodin týdně. Polovina zaměstnanců pracuje v truhlářské dílně, 20 zaměstnanců pracuje v dílně na zpracování plastů a zbytek v kompletační dílně. Firma vyrábí dva typy kánoí: standardní kánoe s čistým ziskem 7 EUR za kus a luxusní kánoe s čistým ziskem 10 EUR za kus. Na výrobu jedné standardní kánoe je třeba 4.5 hodiny práce v truhlářské dílně a dvě hodiny v každé ze zbylých dvou dílen. Jedna luxusní kánoe vyžaduje 5 hodin práce v truhlárně, hodinu v dílně na plasty a 4 hodiny kompletace. Průzkum trhu odhalil, že ne méně jež 1/3 a ne více než 2/3 vyrobených kánoí by měly být luxusní. Kolik kterých kánoí má firma týdně vyrobit, aby byl její čistý zisk maximální? Formalizujte jako optimalizační úlohu. Tuto úlohu už ale neřešte.
]
