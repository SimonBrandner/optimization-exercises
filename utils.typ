#let boup(x) = $bold(upright(#x))$
#let innerproduct(x, y) = {
  $lr(chevron.l #x mid(|) #y chevron.r)$
}
#let eval(expr, size: 100%) = $lr(#expr|, size: #size)$
