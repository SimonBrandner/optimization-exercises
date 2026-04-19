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

#solution[
  #enum(
    [
      Množina konvexní je. Nechť $x, y in [a, b]$ a $alpha in [0, 1]$. Potom
      $
        (1 - alpha) x + alpha y = x - alpha x + alpha y = x + alpha (y - x).
      $
      Je-li $y >= x$, pak
      $
        a <= x <= x + alpha underbrace((y - x), >= 0) <= x + y - x = y <= b,
      $
      je-li $y <= x$, pak
      $
        a <= x + y - x <= x + alpha underbrace((y - x), <= 0) <= x <= b.
      $
      Platí tedy $(1 - alpha) x + alpha y in [a, b]$.
    ],
    [
      Množina konvexní není. Zvolme $boup(u) = vec(-1, 1)$, $boup(v) = vec(1, 1)$ a $alpha = 1/2$. Potom
      $
        (1 - alpha) boup(u) + alpha boup(v) = 1/2 vec(-1, 1) + 1/2 vec(1, 1) = vec(-1/2, 1/2) + vec(1/2, 1/2) = vec(0, 1),
      $
      ale neplatí $0^2 = 1$.
    ],
    [
      Ano, jedná se o konvexní množinu. Nechť $vec(x_1, y_1), vec(x_2, y_2) in RR^2$ a $alpha in [0, 1]$ takové, že
      $
        y_1 >= x_1^2,\
        y_2 >= x_2^2.
      $
      Chceme tedy ukázat, že bod
      $
        (1 - alpha) vec(x_1, y_1) + alpha vec(x_2, y_2)
      $
      leží v dané množině. Stačilo by ale ukázat, že bod
      $
        (1 - alpha) vec(x_1, x_1^2) + alpha vec(x_2, x_2^2)
      $
      leží v dané množině, protože zjevně platí
      $
        (1 - alpha) y_1 + alpha y_2 >= (1 - alpha) x_1^2 + alpha x_2^2.
      $


      Zbývá tedy ukázat, že tedy, že
      $
        (1 - alpha) vec(x_1, y_1) + alpha vec(x_2, y_2) = vec((1-alpha) x_1 + alpha y_1, (1- alpha) x_2 + alpha y_2)
      $
      skutečně leží v dané množině:
      $
        &((1 - alpha) x_1^2 + alpha x_2^2) - ((1 - alpha) x_1 + alpha x_2)^2 = \
        &= (1 - alpha) x_1^2 + alpha x_2^2 - (1 - alpha)^2 x_1^2 - 2 (1 - alpha) x_1 alpha x_2 - alpha^2 x_2^2 =\
        &= (1 - alpha) (x_1^2 - (1 - alpha) x_1^2 - 2 x_1 alpha x_2) + alpha x_2^2 - alpha^2 x_2^2 = \
        &= (1 - alpha) (x_1^2 - (1 - alpha) x_1^2 - 2 x_1 alpha x_2) + (1 - alpha) alpha x_2^2 = \
        &= (1 - alpha) (x_1^2 - (1 - alpha) x_1^2 - 2 x_1 alpha x_2 + alpha x_2^2) = \
        &= (1 - alpha) (alpha x_1^2 - 2 x_1 alpha x_2 + alpha x_2^2) = \
        &= alpha (1 - alpha) (x_1^2 - 2 x_1 x_2 + x_2^2) = \
        &= alpha (1 - alpha) (x_1 - x_2)^2 >= 0.
      $
    ],
    enum.item(5)[
      Ano, je. Nechť $boup(x), boup(y) in RR^n$ a $alpha in [0, 1]$ takové, že
      $
        boup(A) boup(x) & <= boup(b), \
        boup(A) boup(y) & <= boup(b), \
        boup(C) boup(x) & = boup(d), \
        boup(C) boup(y) & = boup(d). \
      $
      Potom platí
      $
        boup(A) ((1 - alpha ) boup(x) + alpha boup(y)) = (1 - alpha) boup(A) boup(x) + alpha boup(A) boup(y) <= (1 - alpha) boup(b) + alpha boup(b) = boup(b) - alpha boup(b) + alpha boup(b) = boup(b)
      $
      a
      $
        boup(C) ((1 - alpha ) boup(x) + alpha boup(y)) = (1 - alpha) boup(C) boup(x) + alpha boup(C) boup(y) = (1 - alpha) boup(d) + alpha boup(d) = boup(d) - alpha boup(d) + alpha boup(d) = boup(d).
      $
      Konvexní kombinace tedy leží v množině.
    ],
    enum.item(7)[
      Zjevně není. Zvolme $x = 0$, $y = 1$ a $alpha = 1/2$. Potom
      $
        (1 - alpha) x + alpha y = 1/2 dot 0 + 1/2 1 = 1/2 in.not ZZ.
      $
    ],
  )
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
  + ${vec(1, 1), vec(2, 2)}$,
  + ${vec(1, 1), vec(1, 2), vec(3, 1)}$.
]

#solution[
  #enum(
    [
      Ano, je konvexní. Jedná se o průnik afinního podprostoru (který je zjevně konvexní) a nezáporné $2^n$-ant (zobecnění kvadrantu, který je také zjevně konvexní), jejich průnik je tedy také konvexní.
    ],
    [
      Nejedná se o konvexní množinu -- jedná se o povrch koule, je tedy zjevné, že zvolíme-li dva _různé_ body, které jsou prvky této množiny, úsečka mezi nimi nebude ležet v této množině (až na krajní body). Jejím konvexním obalem je jednotková koule. Tu lze zapsat jako
      $
        {boup(x) mid(|) norm(boup(x))_2 <= 1}.
      $
    ],
    enum.item(5)[
      Zjevně se o konvexní množinu nejedná -- jedná se o body hyperboly ležící v prvním kvadrantu. Lze snadno najít dva body ležící na této křivce, ale úsečka mezi nimi součástí množiny není. Jejím konvexním obalem jsou body, které leží "nad hyperbolou", tj.
      $
        {vec(x, y) mid(|) x >= 0, y >= 0, y >= 1/x}.
      $
    ],
    [
      Je to konvexní množina. Jedná se o průnik dvou kruhů, což jsou konvexní množiny, tedy i jejich průnik bude konvexní.
    ],
    [
      Nejedná se o konvexní množinu. Jedná se o netriviální část kružnice, která ale sama není konvexní, tedy ani jeji netriviální část nebude konvexní. Jejím konvexním obalem je
      $
        {vec(x, y) mid(|) x >= 0, y >= 0, x^2 + y^2 <= 1}.
      $
    ],
    [
      Jedná se o diskrétní množinu, je tedy zjevně nekonvexní. Její konvexní obal je interval $[-1, 1]$, tj.
      $
        {x | x >= -1, x <= 1}.
      $
    ],
    [
      Jedná se o diskrétní množinu, je tedy zjevně nekonvexní. Její konvexní obal je úsečka
      $
        {vec(1, 1) + t vec(1, 1) mid(|) t in [0, 1]},
      $
      to jest
      $
        {vec(x, y) mid(|) y = x, 1 <= x <= 2}.
      $
    ],
    [
      Jedná se o diskrétní množinu, je tedy zjevně nekonvexní. Její konvexní obal je trojúhelník vymezený danými body. Tedy množina
      $
        {vec(x, y) mid(|) x >= 1, y >= 1, x + 2 y <= 5}.
      $
    ],
  )
]

#exercise(number: 7)[
  Jsou následující množiny konvexní mnohostěny? Zápornou odpověď odůvodněte. Kladnou odpověď dokažte tak, že množinu napíšete jako množinu řešení soustavy konečně mnoha lineárních nerovnic (tj. jako průnik konečně mnoha poloprostorů).
  + ${boup(x) in RR^n | boup(x)^T boup(C) boup(x) <= 1}$, kde $boup(C)$ je positivně definitní,
  + ${alpha boup(v) | alpha in RR}$, kde $boup(v) in RR^n$,
  + ($star$) ${boup(C) boup(x) | boup(x) in RR^n, norm(boup(x))_2 <= 1}$, kde $boup(C) in RR^(m times n)$,
  + ${boup(x) in RR^n | norm(boup(x) - boup(a))_2 <= norm(boup(x) - boup(b))_2}$, kde $boup(a), boup(b)$ jsou dány.
]

#solution[
  #enum(
    [
      Nejedná se o konvexní mnohostěn. Rozepsáním $boup(x)^T boup(C) boup(x)$ po složkách dostaneme polynom druhého stupňě, množina tedy nebude mít lineární charakter.
    ],
    [
      Ano, množina je (degenerovaný) konvexní mnohostěn. Máme-li bázi $boup(b)_1, dots, boup(b)_(n-1)$ prostoru $("span"(boup(v)))^bot$ uspořádanou do matice $boup(B) = mat(augment: #(vline: (1, 2)), boup(b)_1, dots, boup(b)_(n-1))$, daná množina lze zapsat jako
      $
        {boup(x) mid(|) boup(B) boup(x) >= boup(0), boup(B) boup(x) <= boup(0)}.
      $
    ],
    enum.item(4)[
      Jedná se o konvexní mnohostěn, resp. o poloprostor kolmý na $boup(b) - boup(a)$. Je zjevné, že bod $1/2 (boup(b) - boup(a)) + boup(a)$ musí ležet na hranici tohoto poloprostoru. Tento poloprostor tedy zapsat jako
      $
        {boup(x) mid(|) (boup(b) - boup(a))^T boup(x) <= (norm(boup(a))^2 - norm(boup(b))^2)/2}.
      $
    ],
  )
]
