#import "../dependencies/simplex-template/lib.typ": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "../utils.typ": *

= Lineární úloha nejmenších čtverců

#exercise[
  Máme soustavu $boup(A x) = boup(b)$, kde $boup(A) in RR^(m times n)$ a $boup(b) != boup(0)$. Dokažte nebo vyvraťte následující tvrzení:
  + Pokud $m < n$, pak soustava má vždy řešení.
  + Pokud $m > n$, pak soustava nemá nikdy řešení.
  + Pokud $m < n$ a $boup(A)$ má plnou hodnost, pak soustava má vždy nekonečně mnoho řešení.
]

#solution[
  #enum(
    [
      Neplatí, soustava
      $ mat(0, 0) boup(x) = mat(1) $
      zjevně splňuje dané podmínky, ale nemá řešení.
    ],
    [
      Neplatí, soustava
      $ mat(1; 2) boup(x) = mat(1; 2) $
      zjevně splňuje dané podmínky, ale má řešení $boup(x) = mat(1)$.
    ],
    [
      Platí. Neboť má $boup(A)$ plnou hodnost (tedy $"rank"(boup(A)) = m$), resp. jedná se epimorfismus/surjekci, soustava má alespoň jedno řešení. Dále, z věty o dimenzi jádra a obrazu, víme, že $"def"(boup(A)) + "rank"(boup(A)) = n$, tedy $"def"(f) = n - m$, a protože $m < n$, $"def"(f) != 0$. Řešení soustavy $boup(A x) = boup(b)$ je ve tvaru $boup(x)_0 + ker(boup(A))$, kde $boup(x)_0$ je nějaké partikulární řešení, a my víme, že $"def"(boup(A)) = dim(ker(boup(A))) != 0$, tedy afinní prostor řešení má nenulovou dimenzi. Soustava má tedy nekonečně mnoho řešení.
    ],
  )
]

#exercise(number: 3)[
  Formulujte jako přibližné řešení soustavy $boup(P u) = boup(q)$ ve smyslu nejmenších čtverců, tedy jako úlohu $min_boup(u) norm(boup(P u) − boup(q))^2$. Jako výsledek napište matice $boup(P), boup(q), boup(u)$. Pokud existuje jednoduchý vzorec pro řešení (jak pro optimální hodnotu tak optimální argument), napište je.
  #enum(
    enum.item(
      2,
    )[Hledá se vzdálenost bodu $boup(y) in RR^n$ od přímky ${boup(a) + t boup(s) | t in RR}$ kde $boup(a), boup(s) in RR^n$.],
  )
]

#solution[
  #enum(
    enum.item(
      2,
    )[
      Jinými slovy chceme řešit soustavu $boup(a) + t boup(s) = boup(y)$, resp. soustavu $boup(s) t = boup(y) - boup(a)$. Tedy $boup(P) = boup(s)$, $boup(u) = t$ a $boup(q) = boup(y) - boup(a)$ (skalár $t$ lze vnímat jako prvek prostoru $RR^(1 times 1)$ a tím dát smyslu výrazu $boup(s) t$).


      Vektor $boup(u)$ lze nalézt jako
      $
        boup(u) = (boup(P)^T boup(P))^(-1) boup(P)^T boup(q) = (boup(s)^T boup(s))^(-1) boup(s)^T (boup(y) - boup(a)) = innerproduct(boup(s), boup(y) - boup(a))/innerproduct(boup(s), boup(s)).
      $

      Vzdálenost je tedy
      $
        norm(boup(P u) - boup(q)) = norm(boup(s) innerproduct(boup(s), boup(y) - boup(a))/innerproduct(boup(s), boup(s)) - (boup(y) - boup(a))) = norm(innerproduct(boup(s), boup(y) - boup(a))/innerproduct(boup(s), boup(s)) boup(s) - boup(y) + boup(a)).
      $
    ],
  )
]

#exercise(number: 8)[
  Máme vektory $boup(u) = mat(2; 1; -3)$ a $boup(v) = mat(1; -1; 1)$. Najděte ortogonální projekci vektoru $mat(2; 0; 1)$ na podprostory:
  #enum(
    enum.item(3)[$"span"{boup(u), boup(v)}$,],
    $("span"{boup(u), boup(v)})^bot.$,
  )
]

#solution[
  Nejprve vyřešíme (d), abychom výsledky mohli využít v (c).
  #enum(
    enum.item(4)[
      Nejprve nalezneme ortogonální doplněk k prostoru $"span"{boup(u), boup(v)}$ nalezením jádra matice, jejíž řádky jsou vektory $boup(u)$ a $boup(v)$. Dostáváme
      $ ("span"{boup(u), boup(v)})^bot = "span"{mat(2; 5; 3)}. $

      Nyní můžeme spočítat ortogonální projekci dle vzorce:
      $
        "proj"_(("span"{boup(u), boup(v)})^bot) mat(2; 0; 1) = "proj"_mat(2; 5; 3) mat(2; 0; 1) = innerproduct(mat(2; 5; 3), mat(2; 0; 1))/innerproduct(mat(2; 5; 3), mat(2; 5; 3)) mat(2; 5; 3) = 7/38 mat(2; 5; 3) = mat(7/19; 35/38; 21/38).
      $
    ],
    enum.item(3)[
      Místo počítání ortogonální projekce na $"span"{boup(u), boup(v)}$ můžeme vypočítat ortogonální rejekci na ortogonální doplněk $"span"{boup(u), boup(v)}$:
      $
        "proj"_("span"{boup(u), boup(v)}) mat(2; 0; 1) &= \
        &= "rej"_(("span"{boup(u), boup(v)})^bot) mat(2; 0; 1) = \
        &= "rej"_mat(7/19; 35/38; 21/38) mat(2; 0; 1) = \
        &= mat(2; 0; 1) - "proj"_mat(7/19; 35/38; 21/38) mat(2; 0; 1) = \
        &= mat(2; 0; 1) - innerproduct(mat(2; 0; 1), mat(7/19; 35/38; 21/38))/innerproduct(mat(7/19; 35/38; 21/38), mat(7/19; 35/38; 21/38)) mat(7/19; 35/38; 21/38) = \
        &= mat(2; 0; 1) - innerproduct(mat(2; 0; 1), mat(2; 5; 3))/innerproduct(mat(2; 5; 3), mat(2; 5; 3)) mat(2; 5; 3) = \
        &= mat(2; 0; 1) - 7/38 mat(2; 5; 3) = \
        &= 1/38 (mat(76; 0; 38) - mat(14; 35; 21)) = \
        &= 1/38 mat(62; -35; 17).
      $
    ],
  )
]

#exercise(number: 9)[
  Nechť $X = "span"{mat(-3/5; 0; 4/5; 0), mat(0; 0; 0; 1), mat(4/5; 0; 3/5; 0)}$. Najděte projektory na
  + podprostor $X$,
  + podprostor $X^bot$.
]

#solution[
  #enum(
    [
      Označme $ boup(A) = mat(-3/5, 0, 4/5; 0, 0, 0; 4/5, 0, 3/5; 0, 1, 0), $ projektor na $X$ je tedy:
      $
        boup(A) underbrace((boup(A)^T boup(A))^(-1), "matice" boup(A) "má" \ " ortonormální" \ " sloupce") boup(A)^T =
        boup(A) boup(A)^T =
        mat(-3/5, 0, 4/5; 0, 0, 0; 4/5, 0, 3/5; 0, 1, 0) mat(-3/5, 0, 4/5, 0; 0, 0, 0, 1; 4/5, 0, 3/5, 0) =
        mat(1, 0, 0, 0; 0, 0, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1).
      $
    ],
    [
      Vektory, jejichž lineární obal je v zadání, jsou lineárně nezávislé (to lze ověřit pomocí GEM), tudíž $dim(X^bot) = 1$, je pak snadné vidět, že $X^bot = "span"mat(0; 1; 0; 0;)$. Označme
      $ boup(A) = mat(0; 1; 0; 0), $
      projektor na tento podprostor je tedy:
      $
        boup(A) underbrace((boup(A)^T boup(A))^(-1), "matice" boup(A) "má" \ " ortonormální" \ " sloupce") boup(A)^T = boup(A) boup(A)^T = mat(0; 1; 0; 0) mat(0, 1, 0, 0) = mat(0, 0, 0, 0; 0, 1, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0).
      $
    ],
  )
]

#exercise(number: 17)[
  Pro vektory $boup(a), boup(b) in RR^n$ ukažte, že $norm(mat(augment: #(hline: 1), boup(a); boup(b)))^2 = norm(boup(a))^2 + norm(boup(b))^2$.
]

#solution[
  $
    norm(mat(augment: #(hline: 1), boup(a); boup(b)))^2 =
    innerproduct(mat(augment: #(hline: 1), boup(a); boup(b)), mat(augment: #(hline: 1), boup(a); boup(b))) =
    sum_(i=1)^n a_i^2 + sum_(i=1)^n b_i^2 = innerproduct(boup(a), boup(a)) + innerproduct(boup(b), boup(b)) =
    norm(boup(a))^2 + norm(boup(b))^2.
  $
]
