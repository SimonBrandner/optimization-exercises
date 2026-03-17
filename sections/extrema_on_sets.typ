#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *

= Extrémy funkce na množině

#exercise(number: 7)[
  Najděte (úvahou, s pomocí náčrtků, bez použití derivací) všechny extrémy funkce
  + $f(boup(x)) = boup(a)^T boup(x)$,
  + $f(boup(x)) = boup(x)^T boup(x)$
  na množině
  #enum(
    numbering: "(A)",
    [$RR^n$,],
    [${boup(x) in RR^n | norm(boup(x)) = 1}$,],
    [${boup(x) in RR^n | norm(boup(x)) <= 1}$,],
    [${boup(x) in RR^n | norm(boup(x)) < 1}$,],
    [daný afinní podprostor $RR^n$,],
    [${boup(x) in RR^n | -1 <= boup(1)^T boup(x) <= 1}$.],
  )

  U každého extrému určete, zda je lokální/globální, volný/vázaný.
]
