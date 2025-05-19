#import "../ankiconf.typ": *
#show: doc => conf(doc)

#let custom-card(
  id: "",
  q: "",
  a: "",
  ..args,
) = {
  new_id(id)
  // Can add custom code here for preview only
  card(id: id, q: q, a: a, container: true, show-labels: true)
}



#custom-card(
  id: "2504060934",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [
    Force de Lorentz

  ],
  a: [
    $
      arw(f) = F_"elec" + F_"mag" = q (arw(E) + arw(v) and arw(B)) \
      "car" F_"elec" = q arw(E) "et" F_"mag" = q arw(v) and arw(B)
    $
  ],
)


#custom-card(
  id: "2504060939",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [
    Vecteur accéleration d'une particule de charge q dans un champ électrique $arw(E)$.
  ],
  a: [
    On étudie le système $q$ de masse $m$ dans le référentiel terrestre
    supposé Galiléen.
    Bilan des forces:
    - Poids, que l'on néglige
    - Force électrique: $arw(f) = q arw(E)$

    On applique le principe fondamental de la dynamique:
    $ m arw(a) = q arw(E) <=> arw(a) = q / m arw(E) $

    Si $arw(E)$ est uniforme, l'*accélération sera constante*.

  ],
)

#custom-card(
  id: "2504062006",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [
    Que dire des ordres de grandeurs de la force électrique, de la force magnétique, de la force de gravitation?
  ],
  a: [
    La majorité du temps, la force électrique sera donc négligeable devant la force magnétique.

    La force de gravitation est de l'ordre de $m g = 9.1 times 10^(-31) times 10 approx 10^(-29) "N"$ et est *complètement négligeable*.

    #elem_preuve[
      On se place dans un environnement relativiste
      (donc vitesses bien plus faible que la vitesse de la lumière),
      au max $v <= c / 10$

      En prenant un champ magnétique relativement fort de $B = 0.1 "T"$,
      on trouve un ordre de grandeur de la force magnétique de:
      $ F_"mag" approx e v B = 5 times 10^(-13) " N" $

      Si on suppose que $F_"elec"$ est du même ordre de grandeur que $F_"mag"$, \
      on aurait alors $E approx v B approx 3.10^6 " V m"^(-1)$,
      qui est un énorme champ électrique qui ne sera pas vu en général.
    ]
  ],
)

#custom-card(
  id: "2504062008",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [
    Que dire de la force électrique?
  ],
  a: [
    C'est une force conservative.

    On a alors $ arw(F) = -grad(E_p) "avec" E_p = underbrace(q V, "potentiel électrique") + "constante" $
  ],
)

#custom-card(
  id: "2504062016",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [
    === Accélération d'une particule chargée par un champ électrique
    Expression de la vitesse finale.
  ],
  a: [
    Si on fait l'hypothèse que la vitesse initiale est nulle $(v(t = 0) = 0)$, on pose $v_f$ la vitesse finale, alors on a:
    $ 1 / 2 m (v_f)^2 = - q u $
    $v_f = display(sqrt((-2 q u) / m))$ si $q$ et $u$ sont de signe différents, on prend l'opposé sinon

    *Ici c'est la démonstration qui est intéressante:*

    #elem_preuve[
      On sait que la force électrique est une force conservative (par parachutage du résultat de deuxième année).

      On a donc:
      $
        arw(F) = - grad(E_p) "avec" E_p = underbrace(q V, "potentiel électrique") + "constante"
      $

      On n'a que des force conservatives, donc par théorème de l'énergie mécanique:
      $ E_m = E_c + E_p = "constante" $

      #underline[Note:] $Delta V$, c'est la différence de potentiel, autrement dit la tension $u$.

      $
        Delta E_c = - Delta E_p = - Delta (q V + "constante")
        = - q Delta V
      $

      On a $arw(E) = - grad V$,
      $ E = -(dif V) / (dif x) $
      Donc $V = - E x + "constant"$, \
      $ u = V_1 - V-2 = - E (x_1 - x_2) $
    ]
  ],
)

#custom-card(
  id: "2504062021",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [
    Déviation d'une particule chargée par un champ électrique
  ],
  a: [
    On fait l'hypothèse:
    - d'une vitesse initiale $v_0$ perpendiculaire au champ électrique
    - un champ électrique limité à la distance $L$.

    On pose $theta$ la déviation entre $arw(v_0)$ la vitesse initiale et $arw(v_1)$ la vitesse finale.
    #elem_preuve[
      On se place dans le plan $x, y$:
      #grid(
        columns: (max_element_width / 3, max_element_width / 2),
        align: (left, left),
        [
          On pose les équation horaires:
          $
            cases(diaer(x) = (q E) / m, diaer(y) = 0) \
            <=> cases(dot(x) = (q E) / m t, dot(y) = v_0) \
            <=> cases(x = (q E) / (2 m) t^2, y = v_0 t)
          $
        ],
        canvas({
          import draw: *

          arrow((-1, 0), (4, 0), tip: $x$)
          arrow((0, -1), (0, 3), tip: $y$)

          point((0, 0), value: $q$)

          arrow((0, 0), (1.5, 0), stroke: blue, tip: $arw(E) \ "" \ ""$)
          arrow((0, 0), (0, 1), stroke: red, tip: $arw(v_0) "    "$, pad: 0)

          line((0, 2), (4, 2), stroke: (dash: "dotted"))
          content((-0.4, 2), $L$)

          catmull((0, 0), (0.6, 1), (2.5, 2), name: "c")
          point("c.99%")
          arrow("c.99%", ("c.99%", 1.5, "c.100%"), tip: $arw(v_1)$, stroke: red)
        }),
      )
      $ tan theta = diaer(x_1) / dot(y_1) $

      On pose $t_1$ le temps de sortie:
      $ tan theta = (q E t_1) / (m v_0) $

      $y_1$ est l'ordonnée de la fin du champ, donc:
      $
        y_1 = L = v_0 t_1 => t_1 = L / v_0
      $

      Donc #resultb[$ tan theta = (q E L) / (m v_0^2) $]
    ]
  ],
)

#custom-card(
  id: "250406",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [

  ],
  a: [

  ],
)

#custom-card(
  id: "250406",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [

  ],
  a: [

  ],
)

#custom-card(
  id: "250406",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [

  ],
  a: [

  ],
)

#custom-card(
  id: "250406",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [

  ],
  a: [

  ],
)

#custom-card(
  id: "250406",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [

  ],
  a: [

  ],
)

#custom-card(
  id: "250406",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [

  ],
  a: [

  ],
)

#custom-card(
  id: "250406",
  target-deck: "P_SUP_MECA_PARTICULES_CHARGEES",
  q: [

  ],
  a: [

  ],
)

