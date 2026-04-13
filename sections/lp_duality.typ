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
          x_1 & - &   x_2 & -    &   x_3 &&          && >= & 0 \
        - x_1 & + & 2 x_2 & -    & 3 x_3 &&          && <= & 5 \
        2 x_1 & - &   x_2 & -    &   x_3 &&  + 2 x_4 &&  = & 6 \
              &   &       & x_1, &  x_2, && x_3, x_4 && >= & 0.
      $
      Inicializujte co nejjednodušším způsobem základní simplexový algoritmus. Vyřešte tímto algoritmem. Nepoužívejte dvoufázovou metodu.
    ],
    [
      $min_(x in RR) max_(i = 1)^n abs(a_i - x)$ (střed intervalu).
    ],
    enum.item(7)[
      Minimalizace maxima afinních funkcí:
      + $min_(x_1, x_2 in RR) max{2 x_1 - x_2 - 3, 1 - x_1, x_2 - 2, x_1 + x_2}$,
      + $min_(boup(x) in RR^n) max_(i=1)^m (boup(a)_i^T boup(x) + b_i)$.
    ],
  )
]
