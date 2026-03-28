#import "@local/simplex-template:0.1.0": *
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
