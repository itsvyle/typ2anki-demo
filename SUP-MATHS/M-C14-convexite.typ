#import "../ankiconf.typ": *
#show: doc => conf(doc)
#set page(height: auto)

#let custom-card(
  id: "",
  q: "",
  a: "",
  ..args,
) = {
  new_id(id)
  // Can add custom code here for preview only
  card(id: id, q: q, a: a, container: true, show-labels: true)
  pagebreak()
}

#custom-card(
  id: "2503292004",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    Définition: fonction convexe
  ],
  a: [
    #hypos([$I$ intervale non vide], [$f$ définie sur $I$])
    On dit que $f$ est convexe sur $I$ si $ forall x,y in I, lambda in [0,1], \ f(lambda x + (1-lambda)y) <= lambda f(x) + (1-lambda) f(y) $

    On dit que $f$ est concave si $-f$ est convexe

    #elem_remarque[
      Les fonctions et concaves et convexes sur $I$ sont les fonctions affines
    ]
  ],
)

#custom-card(
  id: "2503292007",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    Inégalité des pentes
  ],
  a: [
    #hypos([$I$ intervale non vide], [$f$ fonction convexe sur $I$])
    Alors $ forall x_1 < x_2 < x_3 in I, \
    (f(x_2) - f(x_1)) / (x_2 - x_1) <= (f(x_3) - f(x_1)) / (x_3 - x_1) <= (f(x_3) - f(x_2)) / (x_3 - x_2) $

    #elem_reformulation[
      Comme la fonction est convexe, on a la croissance des pentes
    ]

    #elem_remarque[
      On a la réciproque: si $f$ vérifie l'inégalité de gauche (ou de droite) pour tous les $x_1 < x_2 < x_3$, alors $f$ est convexe
    ]
  ],
)

#custom-card(
  id: "2503292010",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    #hypos(
      [$I$ intervale non vide],
      [$f$ fonction convexe sur $I$],
      [$a$ in $I$],
    )
    On a équivalence entre:
    + $f$ convexe sur $I$
    + \<que dire de la fonction $phi_a$ définie sur $I without {a}$ par $ phi_a (x) = (f(x)-f(a)) / (x-a) $
  ],
  a: [
    On a équivalence entre:
    + $f$ convexe sur $I$
    + #math_function($phi_a$, $I without {a}$, $RR$, $x$, $ (f(x)-f(a)) / (x-a) $) est croissante

    #elem_preuve[
      Conséquence de l'inégalité des pentes
    ]
  ],
)

#custom-card(
  id: "2503292012",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    #hypos(
      [$x_1,...,x_n in I$],
      [$lambda_1,...,lambda_n in RR^+$ tq $sum_(i=1)^n lambda_i != 0$],
    )
    alors que dire de $ (sum_(i=1)^n lambda_i x_i) / (sum_(i=1)^n lambda_i) $
  ],
  a: [
    $ (sum_(i=1)^n lambda_i x_i) / (sum_(i=1)^n lambda_i) in I $

    #elem_preuve[
      Récurrence
    ]
  ],
)

#custom-card(
  id: "2503292014",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    Inégalité de Jensen
  ],
  a: [
    #hypos(
      [$I$ intervale non vide],
      [$f$ fonction convexe sur $I$],
      [$x_1,...,x_n in I$],
      [$lambda_1,...,lambda_n in RR^+$ tq $sum_(i=1)^n lambda_i = 1$],
      t: "bullet",
    )
    Alors $ f(sum_(i=1)^n lambda_i x_i) <= sum_(i=1)^n lambda_i f(x_i) $

    #elem_reformulation[
      La moyenne des images est inférieure à la valeur au point si les points sont pondérés positivement
    ]
  ],
)

#custom-card(
  id: "2503292016",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    #hypos(
      [$I$ intervale non vide],
      [$f$ fonction convexe sur $I$],
      [$a in I$, *pas une borne de $I$*],
    )
    Alors que dire de la lipschitziennité de $f$ au voisinage de $a$?
  ],
  a: [
    $f$ est lipschitzienne au voisinage de $a$
  ],
)

#custom-card(
  id: "2503292017",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    #hypos([$I$ intervale non vide], [$f$ fonction convexe sur $I$])
    Que dire de la continuité de $f$?
  ],
  a: [
    Une fonction convexe sur $I$ est continue en tout point $a in I$ qui n'est pas une borne

    #elem_preuve[
      Il existe un voisinnage de $a$ sur lequel $f$ est lip, donc $f$ est continue.
    ]
  ],
)

#custom-card(
  id: "2503292019",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    #hypos([$I$ intervale non vide], [$f$ fonction convexe sur $I$])
    Que dire de la dérivabilité de $f$?
  ],
  a: [
    $f$ est dérivable à gauche et à droite en tout point de $I$ - pas nécessairement dérivable au point (exemple: $x |-> abs(x)$)
  ],
)

#custom-card(
  id: "2503292020",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    #hypos([$I$ intervale non vide], [$f$ fonction dérivable sur $I$])
    Alors il y a équivalence entre:
    + $f$ est convexe sur $I$
    + \<que dire de $f'$?>
  ],
  a: [
    Il y a équivalence entre:
    + $f$ est convexe sur $I$
    + $f'$ est croissante sur $I$

    #elem_remarque[
      On en déduit que si $f$ est deux fois dérivable, c'est aussi équivalent à $f'' >= 0$
    ]
  ],
)

#custom-card(
  id: "2503292021",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    #hypos([$I$ intervale non vide], [$f$ fonction convexe dérivable sur $I$])
    Alors que dire de la courbe de $f$ par rapport à ses tangentes?
  ],
  a: [
    La courbe de $f$ est au dessus de ses tangentes, càd $ forall a, x in I, \ f'(a)(x-a) + f(a) <= f(x) $
  ],
)

#custom-card(
  id: "2503292022",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    Inégalités usuelles de convexité: $ ln (1+x) " ?" $
  ],
  a: [
    $ forall x in ]-1,+oo[, ln (1+x) <= x $
    #math_plot(
      (-1.5, 3),
      y: (-1.5, 3),
      x-tick: 1,
      y-tick: 1,
      y-label: $ln(x)$,
      x-label: $x$,
      size: (7, 7),
      x-grid: true,
      y-grid: true,
      legend-coordinates: (5, 3.5),
      (
        (-1, 3),
        x => {
          if (x == -1) { return -100 }
          calc.ln(1 + x)
        },
        $ln(x)$,
      ),
      (stroke: red),
      (none, x => x, $x|->x$),
      (stroke: orange),
      (vert: (-1,)),
    )
  ],
)

#custom-card(
  id: "2503292023",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    Inégalités usuelles de convexité: $ sin (x) " ?" $
  ],
  a: [
    $ forall x in RR^+, sin (x) <= x $
    #math_plot(
      (-1.5, 3),
      y: (-1.5, 3),
      x-tick: 1,
      y-tick: 1,
      y-label: $sin(x)$,
      x-label: $x$,
      size: (7, 7),
      x-grid: true,
      y-grid: true,
      legend-coordinates: (5, 5),
      (
        (-1.5, 3),
        x => {
          calc.sin(x)
        },
        $sin(x)$,
      ),
      (stroke: red),
      (none, x => x, $x|->x$),
      (stroke: orange),
      (vert: (-1,)),
    )
  ],
)

#custom-card(
  id: "2503292024",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    Inégalités usuelles de convexité: $ e^(x) " ?" $
  ],
  a: [
    $ forall x in RR, x+1 <= e^x $
    #math_plot(
      (-3, 3),
      y: (-3, 3),
      x-tick: 1,
      y-tick: 1,
      y-label: $e^x$,
      x-label: $x$,
      size: (7, 7),
      x-grid: true,
      y-grid: true,
      legend-coordinates: (5, 5),
      (
        (-3, 3),
        x => {
          calc.exp(x)
        },
        $e^x$,
      ),
      (stroke: red),
      (none, x => x + 1, $x|->x + 1$),
    )
  ],
)

#custom-card(
  id: "2503292025",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    Inégalités usuelles de convexité: $ tan (x) " ?" $
  ],
  a: [
    $ forall x in [0,pi / 2[, x <= tan(x) $
    #math_plot(
      (-1.5, 3),
      y: (-1.5, 3),
      x-tick: 1,
      y-tick: 1,
      y-label: $tan(x)$,
      x-label: $x$,
      size: (7, 7),
      x-grid: true,
      y-grid: true,
      legend-coordinates: (5, 3.5),
      (
        (-1, calc.pi / 2),
        x => {
          calc.tan(x)
        },
        $tan(x)$,
      ),
      (stroke: red),
      (none, x => x, $x|->x$),
      (stroke: orange),
      (vert: (0, calc.pi / 2)),
    )
  ],
)

#custom-card(
  id: "2503292026",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    Inégalités usuelles de convexité: $ forall x in [0,pi / 2], "?" <= sin(x) $
  ],
  a: [
    $ forall x in [0,pi / 2], 2 / pi x <= sin(x) $
    #math_plot(
      (-1.5, 3),
      y: (-1.5, 3),
      x-tick: 1,
      y-tick: 1,
      y-label: $tan(x)$,
      x-label: $x$,
      size: (7, 7),
      x-grid: true,
      y-grid: true,
      legend-coordinates: (5, 1),
      (
        (-1, 3),
        x => {
          calc.sin(x)
        },
        $sin(x)$,
      ),
      (stroke: red),
      (
        none,
        x => {
          2 * x / calc.pi
        },
        $2 / pi x$,
      ),
      (stroke: orange),
      (vert: (0, calc.pi / 2)),
    )
  ],
)

#custom-card(
  id: "2503292027",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    Inégalité arithmético géométrique
  ],
  a: [
    Pour $n in NN^*$ et $(a_1,...,a_n) in (RR^(+*))^n$
    $ root(n, a_1 a_2 ... a_n) <= (a_1 + a_2 + ... + a_n) / n $
    Ou:
    $ (product_(k=1)^n a_k)^(1 / n) <= 1 / n sum_(k=1)^n a_k $

    #elem_remarque[
      C'est hors programme, ça se prouve avec l'inégalité de Jensen, en utilisant le ln et l'exponentielle
    ]

    #elem_reformulation[
      "Moyenne géométrique $<=$ Moyenne arithmétique"
    ]
  ],
)

#custom-card(
  id: "2503292029",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    Inégalité de Holder
  ],
  a: [
    Pour:
    - $n in NN^*$
    - $(x_1,...,x_n), (y_1,...,y_n) in (RR^(+*))^n$
    - $p, q in RR^(+*) tq 1 / p + 1 / q = 1$
    On a:
    $
      sum_(k=1)^n x_k y_k <= (sum_(k=1)^n x_k^p)^(1 / p) (sum_(k=1)^n y_k^q)^(1 / q)
    $

    #elem_remarque[
      Le cas général est hors programme.
      Le cas pour $p = q = 2$ est à connaitre.

      $
        summ(var: k, s: 1, e: n) x_k y_k <= sqrt(summ() x_k^2)sqrt(summ() y_k^2)
      $
    ]

    #elem_preuve[
      La fonction $ln$ est convexe, donc $ forall x, y in RR^(+ *), ln(1 / p x + 1 / q y) >= 1 / p ln(x) + 1 / q ln(y) $

      Valable pour tout $x$ et $y$, donc on peut l'appliquer à $x^p$ et $y^q$
      $
        ln(1 / p x^p + 1 / q y^q) >= 1 / p ln(x^p) + 1 / q ln(y^q) = & ln(x)+ln(y) \
                                                                     & = ln(x y)   \
      $
      Par passage à l'exponentielle, on obtient: $ x y <= 1 / p x^p + 1 / q y^q $
      Appliquons le à $ alpha_i = x_i / (summ(var: k) x_k^p )^(1 / p) "et" beta_i = y_i / (summ(var: k) x_k^p )^(1 / q) $

      Par sommation: $ summ(var: i) alpha_i beta_i <=& summ() 1 / p alpha_i^p + 1 / q beta_i^q
      \ &= 1 / p summ() x_i^p / (summ(var: k) x_k^p ) + 1 / q summ(var: i) y_i^p / (summ(var: k) y_k^q ) \
      &= 1 / p (summ(var: i) x_i^p) / (summ(var: k) x_k^p) + 1 / q (summ(var: i) y_i^q) / (summ(var: k) y_k^q) \
      &= 1 / p + 1 / q \
      &= 1 $
      D'où $ summ(var: i) x_i / (summ(var: k) x_k^p)^(1 / p) y_i / (summ(var: k) y_k^q)^(1 / q) <= 1 \ vert(==>) \ sum_(k=1)^n x_k y_k <= (sum_(k=1)^n x_k^p)^(1 / p) (sum_(k=1)^n y_k^q)^(1 / q) $
    ]
  ],
)

#custom-card(
  id: "2503292031",
  target-deck: "M_SUP_C14_CONVEXITE",
  q: [
    Définition: point d'inflexion
  ],
  a: [
    #hypos(
      [$I$ intervale non vide],
      [$f$ fonction d],
      [$a < b < c$ 3 points de $I$ tels que $f$ est convexe sur $[a,b]$, concave sur $[b,c]$ (ou l'inverse)],
    )
    alors la courbe de $f$ traverse sa tangente en $b$, et on dit que la courbe de $f$ a un point d'inflexion au point $(b,f(b))$
  ],
)
