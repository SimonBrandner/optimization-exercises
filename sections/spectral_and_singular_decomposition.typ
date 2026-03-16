#import "@local/simplex-template:0.1.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "../utils.typ": *
#import "@local/simplex-template:0.1.0": light-color

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
    max_boup(x) {boup(x)^T boup(A) boup(x) | boup(X) in RR^(n times n), boup(X) = boup(X)^T, boup(x) in RR^n, innerproduct(boup(x), boup(x)) = 1}
  $
  omezení, že $boup(x)$ musí být kolmé na vlastní vektory $boup(v)_1, dots , boup(v)_k$. Tedy maximalizujeme $boup(x)^T boup(A) boup(x)$ přes $boup(x) in RR^n$ za podmínek $innerproduct(boup(x), boup(x)) = 1$ a $innerproduct(boup(v)_1, boup(x)) = dots.c = innerproduct(boup(v)_k, boup(x)) = 0$. Dokažte, že optimální hodnota této úlohy je $lambda_(k+1)$ a optimum se nabývá pro $boup(x) = boup(v)_(k + 1)$.
]

#solution[
  Chceme maximalizovat hodnotu $boup(x)^T boup(A) boup(x)$ tak, že $boup(x) in "span"{boup(v)_(k+1), dots, boup(v)_n}$ a $norm(boup(x)) = 1$. Použijme spektrální rozklad:
  $
    boup(x)^T boup(A) boup(x) = boup(x)^T boup(V) boup(Lambda) boup(V)^T boup(x) = boup(y)^T boup(Lambda) boup(y),
  $
  kde $boup(y) = boup(V)^T boup(x)$. Protože $boup(x) in "span"{boup(v)_(k+1), dots, boup(v)_n}$ a $boup(V)$ je ortogonální (a tedy isometrie), platí $boup(y) in "span"{boup(e)_(k+1), dots, boup(e)_n}$ a $norm(boup(y)) = 1$. To jest, platí
  $
    boup(y)^T boup(Lambda) boup(y) = sum_(k+1)^n y_i^2 lambda_i, space "kde" sum_(k+1)^n y_i^2 = 1.
  $

  Z toho, že $lambda_i$ je maximální pro $i = k + 1$ (vlastní čísla jsou řazena sestupně), vidíme, že $lambda_(k+1)$ je optimem. Argumentem optima je $boup(y) = boup(e)_(k+1)$, resp. $boup(x) = boup(V) boup(y) = boup(V) boup(e)_(k+1) = boup(v)_(k+1)$.
]

#exercise[
  Jsou-li $boup(x)_1, dots , boup(x)_k$ sloupce matice $boup(X)$, dokažte tyto rovnosti:
  $
    tr(boup(X)^T boup(A) boup(X)) = innerproduct(boup(A) boup(X), boup(X)) = innerproduct(boup(A), boup(X) boup(X)^T) = boup(x)_1^T boup(A) boup(x)_1 + dots.c + boup(x)_k^T boup(A) boup(x)_k.
  $
]

#solution[
  Nejprve důkaz provedeme netradičně, ale elegantně, pomocí grafického kalkulu pro multilineární zobrazení#footnote[
    O grafické notaci pro multilineární zobrazení se lze např. dočíst v Dodatku A skript #link("https://math.fel.cvut.cz/en/people/velebil/akla.html")[Abstraktní a konkrétní lineární algebra]. O notaci pro stopu a skalární součin se lze dočíst v článku #link("https://arxiv.org/pdf/2411.16094")[Very Basics of Tensors with Graphical Notations: Unfolding, Calculations, and Decompositions]. Tyto zdroje pojednávají specificky o~tensorech, ale situace je v našem případě podobná. Je ale třeba si dát pozor na to, že můžeme spojovat jen struny odpovídající stejným prostorům.
  ]. Matice jsou v tomto kalkulu reprezentovány obdelníčky s dvěma strunami, jednou (kovariantní) mířící dolů a druhou (kontravariantní) mířící nahoru. Součin matic $boup(A) boup(B)$ píšeme jako spojení kovariantní struny matice $boup(A)$ s kontravariantní strunou matice~$boup(B)$. Stopu matice počítáme spojením její kovariantní a kontravariantní struny (viz levá strana první rovnosti). Výpočet skalárního součinu dvou rozměrově odpovídajících si zobrazení je reprezentován spojením odpovídajících dvojic strun metrickým (ko)tensorem (viz levá a pravá strana druhé rovnosti). Metrický (ko)tensor je reprezentován ohnutou hranou.

  První rovnost dostaneme jednoduše tím, že $boup(X)^T$ "pošleme" nahoru skrz metrický tensor, což způsobí transponování; na druhé straně rovnosti tedy již vidíme $boup(X)$ v pravé straně diagramu. Druhou rovnost dokážeme analogicky tím, že "pošleme" dolů $boup(X)$ skrz metrický kotensor, čímž dostaneme $boup(X)^T$ v pravé straně diagramu.

  #align(center, diagram(
    node-shape: rect,
    node-stroke: black,
    node-corner-radius: 3pt,
    edge-corner-radius: 33pt,
    node-outset: 0pt,
    spacing: (3em, 2em),
    cell-size: (30pt, 0em),
    node-fill: luma(220),
    $
      #let tensor(..args) = node(..args, width: 25pt)
      tensor(boup(X)^T, fill: #red.lighten(60%)) edge("d") &&& tensor(boup(X), fill: #red.lighten(60%)) && tensor(boup(X), fill: #red.lighten(60%)) edge("u,l,dd") \
      tensor(boup(A), fill: #blue.lighten(60%)) edge("d") edge("rrr", =, label-pos: #(50% - 10pt), label-side: #center, stroke: #none) && tensor(boup(A), fill: #blue.lighten(60%)) edge("d")& edge("r", =, label-side: #center, stroke: #none) edge("uu,l,dd") & tensor(boup(A), fill: #blue.lighten(60%)) edge("dd,r,u") \
      tensor(boup(X), fill: #green.lighten(60%)) edge("d,r,uuuu,l,d") && tensor(boup(X), fill: #green.lighten(60%)) edge("d,r,uu") &&& tensor(boup(X)^T, fill: #green.lighten(60%)) edge("uu")
    $,
  ))

  Je nutné podotknout, že pokud bychom pracovali s jinou než kanonickou bází, situace by se komplikovala, neboť metrický (ko)tensor provádí dualizaci, která k transposici koresponduje pouze v této bázi.

  Alternativou je důkaz pomocí Einsteinovy sumační konvence pro milovníky indexů. V Ensteinově notaci se výpočet stopy matice $boup(A)$ provádí tak, že kotraktujeme matice s ní samotnou,
  $
    tr(boup(A)) = tr((a^i_j)) = (a^i_i) = (g_(i k) a^i_j g^(j k)),
  $
  to lze zapsat i pomocí metrického tensoru a kontensoru, čehož využijeme později.


  Výpočet skalárního součinu matic $boup(A)$ a $boup(B)$ se pak provádí tak, že metrickým tensorem kontraktujeme kovariantní indexy a metrickým kotensorem kontraktujeme kontravariantní indexy, tedy
  $
    innerproduct(boup(A), boup(B)) = innerproduct((a^i_j), (b^k_l)) = (g_(i k) a^i_j b^k_l g^(j l)).
  $

  Důkaz můžeme tedy provést následovně:
  $
    underbrace(g_(i m) (x^T)^i_r a^r_j x^j_l g^(l m), tr(boup(X)^T boup(A) boup(X))) &= g_(i m) g^(i p) x^o_p g_(r o) a^r_j x^j_l g^(l m) = \
    &= underbrace(x^o_m g_(r o) a^r_j x^j_l g^(l m), innerproduct(boup(A) boup(X), boup(X))) = \
    &= x^o_m g_(r o) a^r_j g^(j i) (x^T)^q_i g_(l q) g^(l m) = \
    &= x^o_m g_(r o) a^r_j g^(j i) (x^T)^m_i = \
    &= underbrace(a^r_j g_(r o) x^o_m (x^T)^m_i g^(j i), innerproduct(boup(A), boup(X) boup(X)^T)) = \
    &= a^r_j g_(r o) g^(o l) x^q_l (x^T)^p_q g_(i p) g^(j i) = \
    &= a^r_j x^q_r (x^T)^j_q = \
    &= underbrace(x^q_r a^r_j (x^T)^j_q, sum_(q=1)^k boup(x)^T_q boup(A) boup(x)_q).
  $
]
