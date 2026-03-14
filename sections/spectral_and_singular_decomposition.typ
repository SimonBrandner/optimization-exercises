#import "@local/simplex-template:0.1.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "../utils.typ": *

= Spektrální a singulární rozklad

#exercise[
  Spočítejte vlastní čísla a vlastní vektory matic níže. Pro symetrické matice určete jejich definitnost z vlastních čísel.
  + $mat(1, 2; -1, -3)$,#v(10pt)
  + $mat(1, 2; 1, 0)$,#v(10pt)
  + $mat(1, 2; 2, 1)$,#v(10pt)
  + $mat(2, 1; 1, 2)$.
]

#solution[
  #enum(
    [
      Určíme charakteristický polynom matice:
      $
        det(mat(1, 2; -1, -3) - lambda boup(I)) & = det mat(1 - lambda, 2; -1, -3 - lambda) = \
        & = (1 - lambda) (-3 - lambda) - 2 (-1) = \
        & = - (1 - lambda) (3 + lambda) + 2 = \
        & = - (3 + lambda - 3 lambda - lambda^2) + 2 = \
        & = lambda^2 + 2 lambda - 1.
      $

      Určíme jeho kořeny:
      $
        lambda_(1, 2) = (-2 plus.minus sqrt(4 - 4 (-1)))/2 = (-2 plus.minus 2 sqrt(2))/2 = -1 plus.minus sqrt(2).
      $

      Nalezněme vlastní vektor pro vlastní číslo $lambda_1 = -1 + sqrt(2)$:
      $
        mat(augment: #2, 1 - (-1 + sqrt(2)), 2, 0; -1, -3 - (-1 + sqrt(2)), 0) &= mat(augment: #2, 2 - sqrt(2), 2, 0; -1, -2 - sqrt(2), 0) ~ \
        & ~ mat(augment: #2, 2 - sqrt(2), 2, 0; - 2 + sqrt(2), -2, 0) mat(delim: #none, align: #left, "R1"; (2 - sqrt(2)) "R2") ~ \
        & ~ mat(augment: #2, 2 - sqrt(2), 2, 0; 0, 0, 0) mat(delim: #none, align: #left, "R1"; "R2" + "R1")
      $
      máme tedy vlastní vektor $boup(v)_1 = mat(2; sqrt(2) - 2)$.

      Nalezněme vlastní vektor pro vlastní číslo $lambda_2 = -1 - sqrt(2)$:
      $
        mat(augment: #2, 1 - (-1 - sqrt(2)), 2, 0; -1, -3 - (-1 - sqrt(2)), 0) &= mat(augment: #2, 2 + sqrt(2), 2, 0; -1, -2 + sqrt(2), 0) ~ \
        & ~ mat(augment: #2, 2 + sqrt(2), 2, 0; - 2 - sqrt(2), -2, 0) mat(delim: #none, align: #left, "R1"; (2 + sqrt(2)) "R2") ~ \
        & ~ mat(augment: #2, 2 + sqrt(2), 2, 0; 0, 0, 0) mat(delim: #none, align: #left, "R1"; "R2" + "R1")
      $
      máme tedy vlastní vektor $boup(v)_2 = mat(2; - sqrt(2) - 2)$.
    ],
    [
      Určíme charakteristický polynom matice:
      $
        det(mat(1, 2; 1, 0) - lambda boup(I)) & = det mat(1 - lambda, 2; 1, - lambda) = \
                                              & = (1- lambda) (-lambda) -2 = \
                                              & = lambda^2 - lambda - 2= \
                                              & = (lambda - 2) (lambda + 1).
      $

      Jeho kořeny jsou $lambda_1 = 2$ a $lambda_2 = - 1$.

      Nalezněme vlastní vektor pro vlastní číslo $lambda_1 = 2$:
      $
        mat(augment: #2, 1 - 2, 2, 0; 1, 0 - 2, 0) = mat(augment: #2, -1, 2, 0; 1, -2, 0) ~ mat(augment: #2, -1, 2, 0; 0, 0, 0),
      $
      máme tedy vlastní vektor $boup(v)_1 = mat(2; 1)$.

      Nalezněme vlastní vektor pro vlastní číslo $lambda_2 = -1$:
      $
        mat(augment: #2, 1 - (-1), 2, 0; 1, 0 - (-1), 0) = mat(augment: #2, 2, 2, 0; 1, 1, 0) ~ mat(augment: #2, 1, 1, 0; 0, 0, 0),
      $
      máme tedy vlastní vektor $boup(v)_2 = mat(1; -1)$.
    ],
    [
      Určíme charakteristický polynom matice:
      $
        det(mat(1, 2; 2, 1) - lambda boup(I)) & = det mat(1 - lambda, 2; 2, 1 - lambda) = \
        & = (1- lambda)^2 - 4= \
        & = 1 - 2 lambda + lambda^2 - 4 = \
        & = lambda^2 - 2 lambda -3 = \
        & = (lambda - 3) (lambda + 1).
      $

      Jeho kořeny jsou $lambda_1 = 3$ a $lambda_2 = -1$. Matice je tedy indefinitní.

      Nalezněme vlastní vektor pro vlastní číslo $lambda_1 = 3$:
      $
        mat(augment: #2, 1 - 3, 2, 0; 2, 1 - 3, 0) = mat(augment: #2, -2, 2, 0; 2, -2, 0) ~ mat(augment: #2, -1, 1, 0; 0, 0, 0),
      $
      máme tedy vlastní vektor $boup(v)_1 = mat(1; 1)$.

      Nalezněme vlastní vektor pro vlastní číslo $lambda_2 = -1$:
      $
        mat(augment: #2, 1 - (-1), 2, 0; 2, 1 - (-1), 0) = mat(augment: #2, 2, 2, 0; 2, 2, 0) ~ mat(augment: #2, 1, 1, 0; 0, 0, 0),
      $
      máme tedy vlastní vektor $boup(v)_2 = mat(1; -1)$.
    ],
    [
      Určíme charakteristický polynom matice:
      $
        det(mat(2, 1; 1, 2) - lambda boup(I)) & = det mat(2 - lambda, 1; 1, 2 - lambda) = \
        & = (2- lambda)^2 - 1= \
        & = 4 - 4 lambda + lambda^2 - 1 = \
        & = lambda^2 - 4 lambda + 3 = \
        & = (lambda - 3) (lambda - 1).
      $

      Jeho kořeny jsou $lambda_1 = 3$ a $lambda_2 = 1$. Matice je positivně definitní.

      Nalezněme vlastní vektor pro vlastní číslo $lambda_1 = 3$:
      $
        mat(augment: #2, 2 -3, 1, 0; 1, 2 - 3, 0) = mat(augment: #2, -1, 1, 0; 1, -1, 0) ~ mat(augment: #2, -1, 1, 0; 0, 0, 0),
      $
      máme tedy vlastní vektor $boup(v)_1 = mat(1; 1)$.

      Nalezněme vlastní vektor pro vlastní číslo $lambda_2 = 1$:
      $
        mat(augment: #2, 2 -1, 1, 0; 1, 2 - 1, 0) = mat(augment: #2, 1, 1, 0; 1, 1, 0) ~ mat(augment: #2, 1, 1, 0; 0, 0, 0),
      $
      máme tedy vlastní vektor $boup(v)_2 = mat(1; -1)$.
    ],
  )
]

#exercise[
  Napište charakteristický polynom matice $mat(2, 0, 3; 0, -2, -1; 3, -1, 2)$.
]

#solution[
  $
    det(mat(2, 0, 3; 0, -2, -1; 3, -1, 2) - lambda boup(I)) & = \
    & = det mat(2 - lambda, 0, 3; 0, -2- lambda, -1; 3, -1, 2- lambda) = \
    & = (2 - lambda) (-2 - lambda) (2 - lambda) - (9 (-2 - lambda) + (2 - lambda)) = \
    & =- (2 - lambda)^2 (2 + lambda) + 16 + 10 lambda = \
    & = - (4 - 4 lambda + lambda^2) (2 + lambda) + 16 + 10 lambda = \
    & = - (8 - 8 lambda + 2 lambda^2 + 4 lambda - 4 lambda^2 + lambda^3 ) + 16 + 10 lambda = \
    & = - lambda^3 + 2 lambda^2 + 14 lambda + 8.
  $

]

#exercise[
  Jaká jsou vlastní čísla a vlastní vektory
  + nulové,
  + jednotkové,
  + diagonální matice?
  Jaká jsou vlastní čísla trojúhelníkové matice?
]

#solution[
  + Vlastní čísla jsou všechna $0$ a vlastní vektory jsou libovolná báze $RR^n$, jestliže matice je z $RR^(n times n)$,
  + Vlastní čísla jsou všechna $1$ a vlastní vektory jsou libovolná báze $RR^n$, jestliže matice je z $RR^(n times n)$,
  + Vlastní čísla jsou prvky matice na diagonále a vlastní vektory jsou standardní báze $RR^n$.

  Vlastní čisla trojúhelníkové matice jsou kořeny polynomu $product_(i=1)^n (a_(i i) - lambda)$, jestliže značíme prvky matice na diagonále $a_(i i)$ a matice je z $RR^(n times n)$.
]

#exercise(number: 13)[
  Přidejme k úloze
  $
    max{boup(x)^T boup(A) boup(x) | boup(x) in RR^n, innerproduct(boup(x), boup(x)) = 1}
  $
  omezení, že $boup(x)$ musí být kolmé na vlastní vektory $boup(v)_1, dots , boup(v)_k$. Tedy maximalizujeme $boup(x)^T boup(A) boup(x)$ přes $boup(x) in RR^n$ za podmínek $innerproduct(boup(x), boup(x)) = 1$ a $innerproduct(boup(v)_1, boup(x)) = dots.c = innerproduct(boup(v)_k, boup(x)) = 0$. Dokažte, že optimální hodnota této úlohy je $lambda_(k+1)$ a optimum se nabývá pro $boup(x) = boup(v)_(k + 1)$.
]

#exercise[
  Jsou-li $boup(x)_1, dots , boup(x)_k$ sloupce matice $boup(X)$, dokažte tyto rovnosti:
  $
    tr(boup(X)^T boup(A) boup(X)) = innerproduct(boup(A) boup(X), boup(X)) = innerproduct(boup(A), boup(X) boup(X)^T) = boup(x)_1^T boup(A) boup(x)_1 + dots.c + boup(x)_k^T boup(A) boup(x)_k.
  $
]
