#import "./simplex-template/lib.typ": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

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

#include "sections/introduction.typ"
#include "sections/matrix_algebra.typ"
#include "sections/linearity.typ"
#include "sections/orthogonality.typ"
#include "sections/least_squares.typ"
#include "sections/quadratic_forms.typ"
#include "sections/spectral_and_singular_decomposition.typ"
#include "sections/derivative.typ"
#include "sections/extrema_on_sets.typ"
#include "sections/free_extrema.typ"
#include "sections/bound_extrema.typ"
#include "sections/linear_programming.typ"
#include "sections/convex_sets.typ"
#counter(heading).update(i => i + 1)
#include "sections/lp_duality.typ"
#include "sections/convex_functions.typ"
#include "sections/convex_optimization.typ"
