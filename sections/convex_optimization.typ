#import "@local/simplex-template:0.1.0": *
#import "../utils.typ": *

= Konvexní optimalizace

#exercise[
  Mějme úlohu
  $
    min{f vec(x, y) mid(|) x, y >= 0, 2 x + y >= 1, x + 3 y >= 1}.
  $
  Nakreslete množinu přípustných řešení. Pro každou z následujících účelových funkcí najděte úvahou množinu optimálních řešení a optimální hodnotu:
  + $f vec(x, y) = x + y$
  + $f vec(x, y) = x$
  + $f vec(x, y) = min{x, y}$
  + $f vec(x, y) = max{x, y}$
  + $f vec(x, y) = abs(x + y)$
  + $f vec(x, y) = x^2 + 9 y^2$
  V kterých případech se jedná o konvexní optimalizační úlohu?
]

#solution[
  #enum(
    enum.item(3)[],
    [],
  )
]

#exercise(number: 5)[
  Chceme rozestavit $n$ lidí v místnosti čtvercového půdorysu tak, aby "každý byl od každého co nejdále". Navrhněte možné formulace této úlohy a u každé určete, zda je konvexní.
]
