#import "@local/simplex-template:0.1.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#let boup(x) = $bold(upright(#x))$
#let innerproduct(x, y) = {
  $lr(chevron.l #x mid(|) #y chevron.r)$
}

#show: body => simplex-template(
  title-page: (
    title: [
      Cvičení z Optimalizace
    ],
    author: "Šimon Brandner",
    institution: [
      České vysoké učení technické v Praze

      Fakulta elektrotechnická
    ],
  ),
  lang: "cs",
  show-outline: true,
  body,
)

= Značení a základní pojmy

#exercise[
  Vyřešte následující úlohy, přičemž slovní úlohy nejdříve formulujte ve vhodném tvaru. Stačí vám k tomu papír, tužka, zdravý rozum a analýza funkcí jedné proměnné. Všimněte si, že některé úlohy lze převést na hledání extrémů funkce jedné proměnné na intervalu, což umíte z analýzy funkcí jedné proměnné.
  #enum(
    [
      $min{x^2 + y^2 | x >= 0, x y > 1}$,#v(5pt)
    ],
    [
      $min{(x-2)^2 + (y-1/2)^2 | x^2 <= 1, y^2 <= 1}$,#v(3pt)
    ],
    [
      $min{x | x in RR, x >= a_i forall i in {1, dots, n}}$ pro dané $a_1, dots, a_n in RR$,
    ],
    [
      Máte vyrobit papírovou krabici o objemu 72 litrů, jejíž délka je dvojnásobek její šířky. Krabice má všech šest stěn. Jaké budou její rozměry, má-li se na ni spotřebovat co nejméně papíru? Tloušťka stěn je zanedbatelná.
    ],
  )
]

#solution[
  #enum(
    enum.item(3)[
      Zjevně $min{x | x in RR, x > a_i forall i in {1, dots, n}} = max{a_i | forall i in {1, dots, n}}$.
    ],
  )
]

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

= Linearita

#exercise[
  Rozhodněte, zda následující množiny jsou lineární nebo afinní podprostory $RR^n$ a když ano, určete jejich dimenze:
  #enum(
    [${boup(x) in RR^n | boup(a)^T boup(x) = 0}$ pro dané $boup(a) in RR^n$,],
    [${boup(x) in RR^n | boup(a)^T boup(x) = b}$ pro dané $boup(a) in RR^n$, $b in RR$,],
    [${boup(x) in RR^n | boup(x)^T boup(x) = 1}$,],
    [${boup(x) in RR^n | boup(a) boup(x)^T = boup(I)}$ pro dané $boup(a) in RR^n$,],
    [${boup(x) in RR^n | sum_(i=1)^n x_i = 0}$,],
    [$boup(a) + "span"{boup(b), boup(c)}$, kde $boup(a), boup(b), boup(c) in RR^n$ jsou známé vektory takové, že $boup(b)$ a $boup(c)$ jsou lineárně nezávislé.],
  )
]

#solution[
  #enum(
    [Je lineární, $dim ({boup(x) in RR^n | boup(a)^T boup(x) = 0}) = "def"(boup(a)^T) in {n-1, n}$.],
    [Je afinní, $dim({boup(x) in RR^n | boup(a)^T boup(x) = b}) = "def"(boup(a)^T) in {n-1, n}$.],
    [Není lineární ani afinní, jde jednotkovou kouli.],
    [Není lineární ani afinní.],
    [Je lineární, $dim({boup(x) in RR^n | sum_(i=1)^n x_i = 0}) = "def"(underbrace(mat(1, dots, 1), n times)) = n - 1$.],
    [Je afinní, $dim(boup(a) + "span"{boup(b), boup(c)}) = 2$.],
  )
]

#exercise[
  Je množina ${mat(x_1; x_2; x_3; x_4) in RR^4 | x_1 + x_3 = 0}$ lineární podprostor? Pokud ano, najděte jeho libovolnou bázi.
]

#solution[
  Jde o množinu
  $ ker(mat(1, 0, 1, 0)), $
  což je lineární podprostor. Jeho báze zjevně je
  $ {mat(1; 0; -1; 0), mat(0; 1; 0; 0), mat(0; 0; 0; 1)}. $
]

#exercise(number: 7)[
  Máme zobrazení $f : RR^2 → RR^3$ definované jako $f mat(x; y) = mat(x + y; 2x − 1; x − y)$. Je toto zobrazení lineární? Pokud ano, napište ho ve formě $f(boup(x)) = boup(A x)$. Je toto zobrazení afinní? Pokud ano, napište ho ve formě $f(boup(x)) = boup(A x + b)$. Obě odpovědi dokažte z definic.
]

#solution[
  Není lineární:
  $
    f(mat(0; 0) + mat(0; 0)) = mat(0; -1; 0) != mat(0; -2; 0) = mat(0; -1; 0) + mat(0; -1; 0) = f mat(0; 0) + f mat(0; 0).
  $

  Je afinní: nechť $r_1, dots, r_n in RR$, $sum_(i=1)^n r_i = 1$ a $mat(x_1; y_1), dots, mat(x_n; y_n) in RR^2$, potom
  $
    f(sum_(i=1)^n r_i mat(x_i; x_i))
    = f mat(sum_(i=1)^n r_i x_i; sum_(i=1)^n r_i y_i)
    = mat(sum_(i=1)^n r_i x_i &+ sum_(i=1)^n r_i y_i; 2 sum_(i=1)^n r_i x_i &+ 1; sum_(i=1)^n r_i x_i &+ sum_(i=1)^n r_i y_i)=\
    = mat(sum_(i=1)^n r_i x_i &+ sum_(i=1)^n r_i y_i; sum_(i=1)^n r_i (2 x_i) &+ sum_(i=1)^n r_i; sum_(i=1)^n r_i x_i &+ sum_(i=1)^n r_i y_i)
    = mat(sum_(i=1)^n (x_i + y_i); sum_(i=1)^n (2 x_i + r_i); sum_(i=1)^n (x_i - y_i)) = \
    = sum_(i=1)^n r_i mat(x_i + y_i; 2 x_i + r_i; x_i - y_i)
    = sum_(i=1)^n r_i f mat(x_i; y_i).
  $

  Tedy
  $ f(boup(x)) = mat(1, 1; 2, 0; 1, -1) boup(x) + mat(0; -1; 0). $
]

#exercise[
  Máme nehomogenní soustavu lineárních rovnic
  $
     x & + & 2 y & + &  z & = & 1 \
    -x & + &   y & + & 2z & = & 2
  $
  dvou rovnic o třech neznámých. Napište množinu řešení soustavy jako $X+boup(x_0)$, kde $X subset.eq RR^3$ je lineární podprostor (napište jeho bázi) a $x_0 in RR^3$.
]

#solution[
  Po úpravě dostaneme soustavu
  $
    x & + & 2 y & + &  z & = & 1 & space ("R1") \
    0 & + & 3 y & + & 3z & = & 3 & space ("R2" - "R1").
  $

  Tedy řešením je afinní podprostor
  $ underbrace("span"{mat(1; -1; 1)}, X) + underbrace(mat(-1; 1; 0), x_0). $
]

#exercise(number: 10)[
  Najděte bázi prostoru obrazů a bázi nulového prostoru následujících lineárních zobrazení:
  + $ f mat(x_1; x_2; x_3) = mat(x_1 &-& x_2 &; 2 x_1 &+& x_2 &-& x_3), $
  + $ f mat(x_1; x_2) = mat(2 x_1 &+& x_2; x_1 &-& x_2 &; 2 x_2 &+& x_1). $
]

#solution[
  #enum(
    [
      Matice $f$ je $ mat(1, -1, 0; 2, 1, -1). $

      Pro nalezení $im(f)$ stačí nalézt nezávislou podmnožinu sloupců matice $f$. Máme tedy

      $ im(f) = "span"{mat(1; 2), mat(-1; 1)}. $

      Řešíme soustavu $f(boup(x)) = boup(0)$:
      $
        mat(augment: #3, 1, -1, 0, 0; 2, 1, -1, 0) ~ mat(augment: #3, 1, -1, 0, 0; 0, 3, -1, 0) mat(align: #left, delim: #none, "R1"; "R2" - 2"R1").
      $

      Lze tedy vidět, že
      $ ker(f) = "span"{ mat(1; 1; 3) }. $
    ],
    [Postupujeme analogicky k minulému bodu:

      $ ker(f) = {boup(0)}, im(f) = "span"{mat(2; 1; 1), mat(1; -1; 2)}. $
    ],
  )
]

= Ortogonalita

#exercise[
  Máme vektory $boup(x) = mat(1; 2; 3)$ a $boup(y) = mat(−1; 0; 1)$. Spočítejte
  + délku vektoru $boup(x)$,
  + vzdálenost bodů $boup(x)$ a $boup(y)$,
  + úhel mezi vektory $boup(x)$ a $boup(y)$.
]

#solution[
  #enum(
    $norm(boup(x)) = sqrt(innerproduct(boup(x), boup(x))) = sqrt(1 + 4 + 9) = sqrt(14),$,
    $d(boup(x), boup(y)) = norm(boup(x) - boup(y)) = sqrt(4 + 4 +4) = sqrt(12),$,
    $angle (boup(x), boup(y)) = arccos((innerproduct(boup(x), boup(y)))/(norm(boup(x)) norm(boup(y)))) = arccos((-1+0+3)/ (sqrt(14) sqrt(2))) = arccos(2/sqrt(28)) = arccos(1/sqrt(7)).$,
  )
]

#exercise(number: 3)[
  Najděte bázi ortogonálního doplňku prostoru $"span"{mat(0; 1; 1),mat(1; 2; 3)}$.
]
#solution[
  Najdeme jádro matice $boup(A)$ jejíž řádky jsou dané vektory:
  $
    mat(augment: #3, 0, 1, 1, 0; 1, 2, 3, 0) ~ mat(augment: #3, 0, 1, 1, 0; 0, 1, 1, 0) mat(delim: #none, align: #left, "R1"; "R2" - "R1".)
  $

  Tedy
  $
    ker(boup(A)) = "span"{ mat(-1; -1; 1)}.
  $
]

#exercise(number: 5)[
  Pro dva vektory $boup(x), boup(y) in RR^n$ dokažte následující tvrzení, nakreslte obrázek a uvědomte si, jaké známe středoškolské poučky jste vlastně dokázali.
  + Jestliže $norm(boup(x)) = norm(boup(y))$, pak $(boup(x) + boup(y)) bot (boup(x) - boup(y))$.
  + Jestliže $boup(x) bot boup(y)$, pak $norm(boup(x))^2 + norm(boup(y))^2 = norm(boup(x) - boup(y))^2$.
]

#solution[
  #enum(
    [
      Nechť $norm(boup(x)) = norm(boup(y))$. Potom
      $
        innerproduct(boup(x + y), boup(x - y)) &= \
        &= innerproduct(boup(x), boup(x - y)) + innerproduct(boup(y), boup(x - y)) =\
        &= innerproduct(boup(x), boup(x)) - innerproduct(boup(x), boup(y)) + innerproduct(boup(y), boup(x)) - innerproduct(boup(y), boup(y)) = \
        &= innerproduct(boup(x), boup(x)) - innerproduct(boup(y), boup(y)) = \
        &= norm(boup(x))^2 - norm(boup(y))^2 = \
        &= norm(boup(x))^2 - norm(boup(x))^2 = 0.
      $

      Z obrázku níže lze vidět, že jsme ukázali, že úhlopříčky v kosočtverci jsou na sebe navzájem kolmé.

      #figure(
        caption: [Kolmé úhlopříčky v kosočtverci],
        cetz.canvas(length: 2cm, {
          import cetz.draw: *

          set-style(
            mark: (fill: black, scale: 2),
            content: (padding: 1pt),
          )

          line((-0.25, 0), (2.5, 0), stroke: 1pt + gray, mark: (
            end: "stealth",
            fill: gray,
          ))
          content((), $ #h(10pt)x $, anchor: "east")
          line((0, -0.25), (0, 2.5), stroke: 1pt + gray, mark: (
            end: "stealth",
            fill: gray,
          ))
          content((), $ y $, anchor: "south")

          line((0, 0), (3 / 2, 0.75))
          line((0, 0), (0.75, 3 / 2))
          line((3 / 2, 3 / 4), (3 / 2 + 3 / 4, 3 / 2 + 3 / 4))
          line((3 / 4, 3 / 2), (3 / 2 + 3 / 4, 3 / 2 + 3 / 4))
          line((3 / 2, 3 / 4), (3 / 4, 3 / 2))

          line((0, 0), (3 / 2 + 3 / 4, 3 / 2 + 3 / 4))

          line((9 / 8 + 1 / 8, 9 / 8 + 1 / 8), (10 / 8 - 1 / 8, 10 / 8 + 1 / 8))
          line((10 / 8 - 1 / 8, 10 / 8 + 1 / 8), (8 / 8, 10 / 8))


          content((0.25, 1), $norm(boup(x))$)
          content((1, 0.25), $norm(boup(y))$)
          content((0.45, 1.65), $norm(boup(x - y))$)
          content((2.65, 2.25), $norm(boup(x + y))$)
        }),
      )
    ],
    [
      Nechť $boup(x) bot boup(y)$, tj. $innerproduct(boup(x), boup(y)) = 0$. Potom
      $
        norm(boup(x))^2 + norm(boup(y))^2 &=\
        &= innerproduct(boup(x), boup(x)) + innerproduct(boup(y), boup(y)) = \
        &= innerproduct(boup(x), boup(x)) - innerproduct(boup(x), boup(y)) + innerproduct(boup(y), boup(y)) = \
        &= innerproduct(boup(x), boup(x)) - innerproduct(boup(y), boup(x)) + innerproduct(boup(y), boup(y)) = \
        &= innerproduct(boup(x - y), boup(x)) + innerproduct(boup(y), boup(y)) = \
        &= innerproduct(boup(x - y), boup(x)) + innerproduct(boup(y), boup(y)) - innerproduct(boup(x), boup(y)) = \
        &= innerproduct(boup(x - y), boup(x)) + innerproduct(boup(y - x), boup(y)) = \
        &= innerproduct(boup(x - y), boup(x)) - innerproduct(boup(x - y), boup(y)) = \
        &= innerproduct(boup(x - y), boup(x - y)) = \
        &= norm(boup(x - y))^2. \
      $

      Z obrázku níže lze vidět, že jde o Pythagorovu větu.

      #figure(
        caption: [Pythagorova věta pomocí normy vektorů],
        cetz.canvas(length: 2cm, {
          import cetz.draw: *

          set-style(
            mark: (fill: black, scale: 2),
            content: (padding: 1pt),
          )

          line((-0.5, 0), (2.5, 0), stroke: 1pt + gray, mark: (
            end: "stealth",
            fill: gray,
          ))
          content((), $ #h(10pt)x $, anchor: "east")
          line((0, -0.5), (0, 2.5), stroke: 1pt + gray, mark: (
            end: "stealth",
            fill: gray,
          ))
          content((), $ y $, anchor: "south")

          line((0, 0), (2, 1))
          line((0, 0), (-0.5, 1))
          line(
            (-0.5, 1),
            (2, 1),
          )
          line((0.2, 0.1), (0.1, 0.3))
          line((-0.1, 0.2), (0.1, 0.3))

          content((0.75, 1.15), $norm(boup(x - y))$)
          content((1.5, 0.5), $norm(boup(y))$)
          content((-0.5, 0.5), $norm(boup(x))$)
        }),
      )
    ],
  )
]

#exercise(number: 10)[
  Existuje isometrie $f : RR^3 -> RR^4$ tak, že $f mat(1; −1; 2) = mat(1; 2; −1; 1)$ a $f mat(1; 1; 0) = mat(0; 1; −1; 0)$?
]

#solution[
  Neexistuje, neboť
  $
    d(mat(1; -1; 2), mat(1; 1; 0)) = norm(mat(0; -2; 2)) = sqrt(8) != sqrt(3) = norm(mat(1; 1; 0; 1)) = d(mat(1; 2; -1; 1), mat(0; 1; -1; 0)).
  $
]

#exercise(number: 13)[
  Najděte dva ortogonální vektory $boup(x)$ a $boup(y)$ takové, že $"span"{boup(x), boup(y)} = "span"{mat(0; 1; 1),mat(1; 2; 3)}$.
]

#solution[
  Jinými slovy máme najít ortogonální bázi ${boup(x), boup(y)}$ daného prostoru (prostor má dimensi 2, neboť počítáme lineaární obal dvou lineárně nezávislých vektorů). Nechť
  $ boup(x) = mat(0; 1; 1), $
  potom
  $
    boup(y) = mat(1; 2; 3) - innerproduct(mat(1; 2; 3), mat(0; 1; 1))/innerproduct(mat(0; 1; 1), mat(0; 1; 1)) mat(0; 1; 1) = mat(1; 2; 3) - 5/2 mat(0; 1; 1) = mat(1; 4/2; 6/2) - mat(0; 5/2; 5/2) = mat(1; -1/2; 1/2).
  $
]

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
      Vektory jejichž lineární obal je v zadání jsou lineárně nezávislé (to lze ověřit pomocí GEM), tudíž $dim(x^bot) = 1$, je pak snadné vidět, že $X^bot = "span"mat(0; 1; 0; 0;)$. Označme
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

= Kvadratické formy a funkce

#exercise[
  Pro každou z těchto funkcí určete, zda je to polynom. Pokud ano, určete počet proměnných a stupeň polynomu a rozhodněte, jestli je polynom homogenní.
  #enum(
    [$f: RR^2 -> RR, f(x, y) = (x^2 + y^2)(x-y) + x y - x -y$,],
    [$f: RR^n -> RR, f(boup(x)) = boup(a)^T boup(x)$, kde $boup(a)$ je dáno,],
    [$f: RR^n -> RR, f(boup(x)) = norm(boup(x))$,],
    [$f: RR^n -> RR, f(boup(x)) = norm(boup(A x) + boup(b))^2$, kde $boup(A)$ a $boup(b)$ jsou dány,],
    [$f: RR^n times RR^n -> RR, f(boup(x), boup(y)) = boup(x)^T boup(y)$,],
    [$f: RR^(n times n) -> RR, f(boup(X)) = boup(a)^T boup(X) boup(b)$, kde $boup(a)$ a $boup(b)$ jsou dány,],
    [$f: RR^(n times n) -> RR, f(boup(X)) = det(boup(X))$,],
    [$f: RR^(m times n) times RR^(n times p) -> RR, f(boup(X), boup(Y)) = boup(X Y)$.],
  )
]

#solution[
  #enum(
    [Jedná se o polynom dvou proměnných třetího stupně, který není homogenní, neboť stupeň monomu $x$ je jedna, nikoliv tři.],
    [Jedná se o homogenní polynom $n$ proměnných prvního stupně.],
    [Nejedná se o polynom, neboť se nejedná o lineární kombinaci monomů, nybrž odmnocinu z lineární kombinace monomů.],
    [Jedná se o polynom $n$ proměnných stupně dva, který není homogenní, neboť obsahuje monom stupně nula.],
    [Jedná se o homogenní polynom $2 n$ proměnných stupně dva.],
    [Jedná se o homogenní polynom $n^2$ proměnných stupně jedna.],
    [Jedná se o homogenní polynom $n^2$ proměnných stupně $n$.],
    [Aby obor hodnot $f$ bylo $RR$, musí platit $p = m = 1$. Jedná se o homogenní polynom $2 n$ proměnných stupně dva.],
  )
]

#exercise[
  Určete definitnost těchto symetrických matic (a disutujte možné postupy):
  + $mat(1, 2; 2, 1)$,#v(10pt)
  + $mat(2, 1; 1, 2)$,#v(10pt)
  + $mat(0, 1; 1, 0)$,#v(10pt)
  + $mat(1, 0; 0, 0)$,#v(10pt)
  + $mat(1, 0, 0; 0, 0, 1; 0, 1, 0)$,#v(10pt)
  + $mat(3, -2, 1; -2, 3, 0; 1, 0, 3)$,#v(10pt)
  + $mat(-2, 0, 1; 0, 3, -1; 1, -1, -2)$.
]

#solution[
  Matice (b), (f) i (g) jsou symetrické, využijeme tedy Sylvestrova kriteria.
  #enum(
    enum.item(
      2,
    )[Hodnoty hlavních minorů jsou $2$ a $3$, jsou tedy kladné a matice je positivně definitní.],
    enum.item(
      6,
    )[Hodnoty hlavních minorů jsou $3, 5$ a $12$, jsou tedy kladné a matice je positivně definitní.],
    enum.item(
      7,
    )[Hodnoty prvních dvou hlavních minorů jsou $-2$ a $-6$, matice je tedy indefinitní.],
  )
]

#exercise[
  Máme matici $boup(A) = mat(1, -3; 2, -4)$. Která z následujících tvrzení jsou pravdivá?
  + Výraz $boup(x)^T boup(A) x$ je nezáporný pro každé $boup(x) in RR^2$.
  + Výraz $boup(x)^T boup(A) x$ je nekladný pro každé $boup(x) in RR^2$.
  + Funkce $f(boup(x)) = boup(x)^T boup(A) x$ má v bodě $boup(x) = boup(0)$ extrém.
]

#solution[
  Provedeme symetrizaci matice $boup(A)$:
  $
    boup(A)_s = 1/2 (boup(A) + boup(A)^T) = mat(1, -1/2; -1/2, -4).
  $
  Hodnoty jejích hlavních minorů jsou $1$ a $-17/4$, je tedy indefinitní definitní. Neplatí tedy (a), (b), ani (c).
]

#exercise[
  Je množina ${mat(x; y) in RR^2 | x^2 - 3 x y + y^2 = 1}$ elipsa nebo hyperbola? Odůvodněte.
]

#solution[
  Upravíme do tvaru $boup(x)^T boup(A) boup(x) - y_0 = 0$, kde $boup(A)$ je symetrická:
  $
                                x^2 - 3 x y + y^2 & = & 1 & \
                x^2 - 3/2 x y - 3/2 x y + y^2 - 1 & = & 0 & \
    mat(x, y) mat(1, -3/2; -3/2, 1) mat(x; y) - 1 & = & 0 & .
  $
  Matice $boup(A)$ je regulární (její determinant je $-5/4 != 0$), a tedy množina obsauje nekonečně mnoho bodů. Hlavní minory matice $boup(A)$ jsou $1$ a $-5/4$, matice je tedy indefinitní, tudíž se jedná o hyperbolu.
]

#exercise(number: 8)[
  Co se dá říct o definitnosti symetrické matice (ne nutně diagonální), známe-li znaménka jejích diagonálních prvků? Konkrétně, co se dá říct, jestliže její diagonální prvky jsou
  + $1, 2, 0$,
  + $1, 2, 3$,
  + $−4, −2, −1$,
  + $−1, 2, 0$.
]

#solution[
  Nazvěme matici, o které je řeč, $boup(A)$.
  #enum(
    [
      Hodnota prvního hlavního minoru je $1 > 0$, $boup(A)$ tedy není negativně (semi)definitní. Platí $boup(e)_3^T boup(A) boup(e)_3 = 0$, matice $boup(A)$ tedy nemůže být positivně definitní. Matice $boup(A)$ je tedy buď positivně semidefinitní, nebo indefinitní.
    ],
    [
      Hodnota prvního hlavního minoru je $1 > 0$, $boup(A)$ tedy není negativně (semi)definitní. Matice $boup(A)$ je tedy buď positivně (semi)definitní, nebo indefinitní.
    ],
    [
      Hodnota prvního hlavního minoru je $-4 < 0$, $boup(A)$ tedy není positivně (semi)definitní. Matice $boup(A)$ je tedy buď negativně (semi)definitní, nebo indefinitní.
    ],
    [
      Hodnota prvního hlavního minoru je $-1 < 0$, není tedy positivně (semi)definitní. Platí $boup(e)_3^T boup(A) boup(e)_3 = 0$, matice $boup(A)$ tedy nemůže být negativně definitní. Matice $boup(A)$ je tedy buď negativně semidefinitní, nebo indefinitní.
    ],
  )
]
