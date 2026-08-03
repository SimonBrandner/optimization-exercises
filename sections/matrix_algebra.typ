#import "../simplex-template/lib.typ": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "../utils.typ": *

= Maticová algebra

#exercise[
  Vyřešte tyto rovnice a soustavy rovnic pro neznámou matici $boup(X)$ (předpokládejte, že každá
  potřebná inverze existuje):
  #enum(
    $boup(A) boup(X) + boup(B) = boup(A)^2 boup(X)$,
    $boup(X) - boup(A) = boup(X) boup(B)$,
    $2 boup(X) - boup(A) boup(X) + 2 boup(A) = boup(0)$,
  )
]

#solution[
  #enum(
    $
      boup(A) boup(X) + boup(B) & = boup(A)^2 boup(X) \
                        boup(B) & = boup(A)^2 boup(X) - boup(A) boup(X) \
                        boup(B) & = (boup(A)^2 - boup(A)) boup(X) \
                        boup(X) & = (boup(A)^2 - boup(A))^(-1) boup(B)
    $,
    $
                boup(X) - boup(A) & = boup(X) boup(B) \
        boup(X) - boup(X) boup(B) & = boup(A) \
      boup(X) (boup(I) - boup(B)) & = boup(A) \
                          boup(X) & = boup(A) (boup(I) - boup(B))^(-1)
    $,
    $
      2 boup(X) - boup(A) boup(X) + 2 boup(A) & = boup(0) \
      2 boup(X) - boup(A) boup(X) & =- 2 boup(A) \
      (2 boup(I) - boup(A)) boup(X) & =- 2 boup(A) \
      boup(X) & = (2 boup(I) - boup(A))^(-1) (-2 boup(A)) \
    $,
  )
]

#exercise(number: 3)[
  Chceme vyřešit soustavu rovnic
  $
    boup(A x) + (boup(y)^T boup(B))^T & = alpha boup(1) \
                        boup(A y + c) & = boup(0)
  $
  kde $boup(A), boup(B)$ jsou známé matice, $boup(c)$ je známý vektor, $boup(x), boup(y)$ jsou neznámé vektory a $alpha$ je neznámý skalár. Soustavu přepište do tvaru $boup(P) boup(u) = boup(q)$, kde matice $boup(P)$ a vektor $boup(q)$ obsahují známé konstanty a vektor $boup(u)$ obsahuje všechny neznámé.
]

#solution[
  Soustavu upravíme soustavu do tvaru
  $
    boup(A x) + boup(B)^T boup(y) & - alpha boup(1) & = & boup(0) \
                        boup(A y) &                 & = & - boup(c)
  $
  a zapíšeme jí blokově:

  $
    mat(augment: #(hline: 1, vline: (1, 2)), boup(A), boup(B)^T, -boup(1); boup(0), boup(A), boup(0)) mat(augment: #(hline: (1, 2)), boup(x); boup(y); alpha) = mat(augment: #(hline: 1), boup(0); -boup(c)).
  $
]
