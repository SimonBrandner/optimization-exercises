#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *

= Dualita v lineárním programování

#exercise(number: 2)[
  Pro daná čísla $c_1, dots, c_n in RR$ chceme maximalizovat $sum_(i=1)^n c_i x_i$ za podmínek $-1 <= x_i <= 1$ pro všechna $i in {1, dots, n}$.
  + Vyřešte úvahou.
  + Sestrojte duální úlohu a upravte ji do co nejjednoduššího tvaru. Vyřešte duální úlohu úvahou (musí vám vyjít stejná optimální hodnota jako u primární úlohy).
  + Napište podmínky komplementarity.
  + Najděte číselné hodnoty optimálních primárních a duálních proměnných (které si odpovídají přes podmínky komplementarity) pro $n = 3$ a $vec(c_1, c_2, c_3) = vec(-2, 3, 4)$.
]

#solution[
  #enum(
    [
      Volíme
      $
        x_i = cases(
          1 & "pokud" c_i > 0\,,
          -1 & "pokud" c_i < 0\,,
          v & "jinak"\,
        ) #h(20pt) "kde" v in [-1, 1].
      $
    ],
    [
      Úlohu lze zapsat jako maximalizace
      $
        boup(c)^T boup(x),
      $
      kde $boup(c) = vec(c_1, dots.v, c_n)$, $boup(x) = vec(x_1, dots.v, x_n)$, za podmínkek $boup(x) >= -boup(1)$ a $boup(x) <= boup(1)$, tj.
      $
        mat(augment: #(hline: 1), boup(I); -boup(I)) &boup(x) <= mat(augment: #(hline: 1), boup(1); boup(1)),\
        &boup(x) in RR^n.
      $

      K ní je duální úlohou minimalizace
      $
        mat(augment: #(vline: 1), boup(1)^T, boup(1)^T) mat(augment: #(hline: 1), boup(y); boup(z)) = sum_(j=1)^n (y_j + z_j)
      $
      za podmínek
      $
        boup(y) & >= boup(0), \
        boup(z) & >= boup(0), \
        mat(augment: #(vline: 1), boup(I), -boup(I)) mat(augment: #(hline: 1), boup(y); boup(z)) & = boup(c), "resp." boup(y) - boup(z) = boup(c).
      $

      Bude-li $c_i = 0$, stačí splnit $y_i = z_i$ tak, že $y_i = z_i = 0$. Bude-li $c_i > 0$, bude muset $y_i > z_i$, zvolíme tedy $y_i = c_i$ a $z_i = 0$. Bude-li $c_i < 0$, bude muset $z_i > y_i$, tudíž zvolíme $y_i = 0$ a $z_i = -c_i$.
    ],
    [
      Podmínky komplementarity jsou
      $
         x_i & = & 1 & "nebo"          & y_i = 0, \
        -x_i & = & 1 & "nebo"          & z_i = 0, \
             &   &   & #h(12pt) dots.v &          \
         x_i & = & 1 & "nebo"          & y_i = 0, \
        -x_i & = & 1 & "nebo"          & z_i = 0. \
      $
    ],
    [
      Pro $boup(c) = vec(-2, 3, 4)$ je optimální argument primární úlohy $boup(x) = vec(-1, 1, 1)$, čímž dostaneme hodnotu $(-2)(-1) + 3 + 4 = 9$. V duální úloze volíme $boup(y) = vec(0, 3, 4)$, hodnota $z$ bude $boup(z) = vec(2, 0, 0)$, tím dostaneme hodnotu úlohy $0 + 2 + 3 + 0 + 4 + 0 = 9$. Optimální hodnoty duálních úloh si tedy odpovídájí.

      Můžeme rozepsat podmínky komplementarity:
      $
        #let sat(x) = text(fill: green, $#x$)
        x_1 & = & -1 & = & 1 & "nebo" & sat(y_1 & = & 0 & = & 0), \
        sat(-x_1 & = & 1 & = & 1)& "nebo" & z_1 & = & 2 & = & 0, \
        sat(x_2 & = & 1 & = & 1) & "nebo" & y_2 & = & 3 & = & 0, \
        -x_2 & = & -1 & = & 1 & "nebo" & sat(z_2 & = & 0 & = & 0), \
        sat(x_3 & = & 1 & = & 1) & "nebo" & y_3 & = & 4 & = & 0, \
        -x_3 & = & -1 & = & 1 & "nebo" & sat(z_3 & = & 0 & = & 0). \
      $
    ],
  )
]

#exercise[
  Napište duální úlohu a podmínky komplementarity k následujícím úlohám. Pokud úloha není LP, nejdříve převeďte na LP. Výslednou duální úlohu zjednodušte, je-li to možné. Kde to má smysl, pokuste se interpretovat duální úlohu a věty o dualitě.
  #enum(
    [
      Minimalizujme
      $
        2 x_1 - 3 x_3 + x_4
      $
      za podmínkek
      $
          x_1 & - &   x_2 & - &   x_3 &&         && >= & 0, \
        - x_1 & + & 2 x_2 & - & 3 x_3 &&         && <= & 5, \
        2 x_1 & - &   x_2 & - &   x_3 && + 2 x_4 &&  = & 6, \
          x_1 &   &       &   &       &&         && >= & 0, \
              &   &   x_2 &   &       &&         && >= & 0, \
              &   &       &   &   x_3 &&         && >= & 0, \
              &   &       &   &       &&     x_4 && >= & 0.
      $
    ],
    [
      $min_(x in RR) max_(i = 1)^n abs(a_i - x)$ (střed intervalu).
    ],
    enum.item(7)[
      Minimalizace maxima afinních funkcí:
      #enum(
        numbering: "(i)",
        enum.item(2)[
          $min_(boup(x) in RR^n) max_(i=1)^m (boup(a)_i^T boup(x) + b_i)$.
        ],
      )
    ],
  )
]

#solution[
  #enum(
    [
      Duální úlohou je maximalizace
      $
        5 y_2 + 6 y_3
      $
      za podmínek
      $
          y_1 &   &       &   &       & >= &  0, \
              &   &   y_2 &   &       & <= &  0, \
              &   &       &   &   y_3 & in & RR, \
          y_1 & - &   y_2 & + & 2 y_3 & <= &  2, \
        - y_1 & + & 2 y_2 & - &   y_3 & <= &  0, \
        - y_1 & - & 3 y_2 & - &   y_3 & <= & -3, \
              &   &       &   & 2 y_3 & <= &  1. \
      $

      Podmínky komplementarity jsou
      $
        y_1 & & & & & = & 0 "nebo"& &x_1 & - & x_2 & - & x_3 && && = & 0, \
        & & y_2 & & & = & 0 "nebo"& - &x_1 & + & 2 x_2 & - & 3 x_3 && && = & 5, \
        y_1 & - & y_2 & + & 2 y_3 & = & 2 "nebo"& &x_1 & & & & && && = & 0, \
        - y_1 & + & 2 y_2 & - & y_3 & = & 0 "nebo"& && & x_2 & & && && = & 0, \
        - y_1 & - & 3 y_2 & - & y_3 & = & -3 "nebo"& && & & & x_3 && && = & 0, \
        & & & & 2 y_3 & = & 1 "nebo"& && & & & && x_4 && = & 0.
      $

      Neboť se úloha zdá poměrně arbitrární, nebudeme se pokoušet interpretovat její duální úlohu a věty o dualitě.
    ],
    [
      Úloha
      $
        min_(x in RR) max_(i = 1)^n abs(a_i - x)
      $
      je ekvivalentní úloze
      $
        min_(x in RR) max{a_1 - x, - a_1 + x , dots, a_n - x, - a_n + x}
      $
      a to lze zapsat jako úloha lineárního programování. Minimalizujeme $u$ za podmínek
      $
        x + u & >=           & a_1, \
        x - u & <=           & a_1, \
              & space dots.v &      \
        x + u & >=           & a_n, \
        x - u & <=           & a_n, \
            x & in           &  RR, \
            u & in           &  RR.
      $

      Duální úlohou je maximalizace
      $
        sum_(i=1)^n (a_i y_(2i-1) + a_i y_(2i))
      $
      za podmínek
      $
                                    y_1 & >=           & 0, \
                                    y_2 & <=           & 0, \
                                        & space dots.v &    \
                               y_(2n-1) & >=           & 0, \
                                 y_(2n) & <=           & 0, \
        sum_(i=1)^n (y_(2i-1) + y_(2i)) & =            & 0, \
        sum_(i=1)^n (y_(2i-1) - y_(2i)) & =            & 1.
      $

      Podmínky komplementarity jsou potom
      $
        x + u & = & a_1 & "nebo"          &      y_1 & = & 0, \
        x - u & = & a_1 & "nebo"          &      y_2 & = & 0, \
              &   &     & #h(12pt) dots.v &           \
        x + u & = & a_n & "nebo"          & y_(2n-1) & = & 0, \
        x - u & = & a_n & "nebo"          &   y_(2n) & = & 0.
      $
    ],
    enum.item(7)[
      #enum(
        numbering: "(i)",
        enum.item(2)[
          Úloha
          $
            min_(boup(x) in RR^n) max_(i=1)^m (boup(a)_i^T boup(x) + b_i)
          $
          lze zapsat jako lineární program, kde minimalizujeme
          $
            mat(augment: #(vline: 1), 1, boup(0)) mat(augment: #(hline: 1), u; boup(x))
          $
          za podmínek
          $
            mat(augment: #(vline: 1), boup(1), -boup(A)) mat(augment: #(hline: 1), u; boup(x)) & >= && boup(b), \
            boup(x) & in && RR^n,
          $
          kde $boup(A) = mat(augment: #(hline: (1, 2)), boup(a)_1^T; dots.v; boup(a)_m^T)$ a $boup(b) = mat(augment: #(hline: (1, 2)), b_1; dots.v; b_m)$.

          Duální úlohou je maximalizace
          $
            boup(b)^T boup(y)
          $
          za podmínek
          $
            boup(y) &>=&& boup(0),\
            mat(augment: #(hline: 1), boup(1)^T; -boup(A)^T) boup(y) &=&& mat(augment: #(hline: 1), 1; boup(0)).
          $

          Podmínky komplementarity pak jsou
          $
            u - boup(a)_1^T boup(x) & = & b_1 & "nebo"          & y_1 & = & 0, \
                                    &   &     & #h(12pt) dots.v &     &   &    \
            u - boup(a)_m^T boup(x) & = & b_m & "nebo"          & y_m & = & 0. \
          $
        ],
      )
    ],
  )
]
