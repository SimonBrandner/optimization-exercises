#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *

= Konvexní množiny a mnohostěny

#exercise[
  Odpovězte, zda následující množiny jsou konvexní a odpověď dokažte z definice konvexní
  množiny:
  + interval $[a, b]$,
  + ${vec(x, y) in RR^2 mid(|) y = x^2}$,
  + ${vec(x, y) in RR^2 mid(|) y >= x^2}$,
  + ${vec(x, y) in RR^2 mid(|) y^2 >= x^2}$,
  + ${boup(x) in RR^n mid(|) boup(A) boup(x) <= boup(b), boup(C) boup(x) = boup(d)}$,
  + ${boup(x) in RR^n mid(|) boup(x)^T boup(x) = 1}$,
  + $ZZ$ (množina celých čísel),
  + ${boup(x) in RR^n mid(|) max{x_1, dots, x_n} >= 0}$,
  + ${boup(C) boup(x) | boup(x) in RR^n, boup(A) boup(x) >= boup(b)}$ (lineární zobrazení konvexního mnohostěnu).
]

#exercise[
  Jsou následující množiny konvexní? Odpověď nemusíte dokazovat z definice kovexní množiny, stačí uvést přesvědčivý argument. Jestliže množina není konvexní, napište její konvexní obal jako množinu řešení soustavy (co možná nejjednodušší) rovnic a nerovnic.
  + ${boup(x) in RR^n mid(|) boup(x) >= boup(0), sum_(i=1)^n x_i = 1}$,
  + ${boup(x) in RR^n mid(|) norm(boup(x))_2 = 1}$,
  + ${boup(x) in RR^n mid(|) norm(boup(x))_2 < 1}$,
  + ${vec(x, y) in RR^2 mid(|) y = x^2 }$,
  + ${vec(x, y) in RR^2 mid(|) x >= 0, y>= 0, x y = 1 }$,
  + ${vec(x, y) in RR^2 mid(|) x^2 + y^2 <= 2} inter {vec(x, y) in RR^2 mid(|) (x-1)^2 + y^2 <= 2}$,
  + ${vec(x, y) in RR^2 mid(|) x^2 + y^2 = 1, x >= 0, y >= 0}$,
  + ${-1, 0, 1}$,
  + ${(1, 1), (2, 2)}$,
  + ${(1, 1), (1, 2), (3, 1)}$.
]

#exercise(number: 7)[
  Jsou následující množiny konvexní mnohostěny? Zápornou odpověď odůvodněte. Kladnou odpověď dokažte tak, že množinu napíšete jako množinu řešení soustavy konečně mnoha lineárních nerovnic (tj. jako průnik konečně mnoha poloprostorů).
  + ${boup(x) in RR^n | boup(x)^T boup(C) boup(x) <= 1}$, kde $boup(C)$ je positivně definitní,
  + ${alpha boup(v) | alpha in RR}$, kde $boup(v) in RR^n$,
  + ($star$) ${boup(C) boup(x) | boup(x) in RR^n, norm(boup(x))_2 <= 1}$, kde $boup(C) in RR^(m times n)$,
  + ${boup(x) in RR^n | norm(boup(x) - boup(a))_2 <= norm(boup(x) - boup(b))_2}$, kde $boup(a), boup(b)$ josu dány.
]
