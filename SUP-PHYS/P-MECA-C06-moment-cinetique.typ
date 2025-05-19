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
  id: "2505122026",
  target-deck: "P_SUP_MECA_C06_MOMENT_CINE",
  q: [
    Quels sont les deux types de moments cinétiques?
  ],
  a: [
    Il existe deux moments cinétiques différents:
    + Le moment cinétique par-rapport à un point (le moment cinétique sera *vectoriel*)
    + Le moment cinétique par-rapport à un axe (le moment cinétique sera *scalaire*)
  ],
)

#custom-card(
  id: "2505122027",
  target-deck: "P_SUP_MECA_C06_MOMENT_CINE",
  q: [
    Définition: Moment cinétique par-rapport à un point
  ],
  a: [
    #let ref = $\/cal(R)$

    On note $arw(L_(O ref)) (M)$ ou $arw(sigma_(O ref)) (M)$ le moment cinétique d'un point $M$ par-rapport au point $O$,
    avec $cal(R)$ le référentiel.

    On le définit par:
    $
      arw(L_(O ref)) (M) &= arw(O M) and arw(P_ref) (M) \
      &= arw(O M) and m arw(v_ref) (M)
    $

    #elem_remarque[
      - Normal au plan défini par les deux vecteurs $O M$ et $arw(P_ref)$
      
      - Pour $O$ et $O'$ deux points distincts, à moins d'avoir une vitesse nulle ou colinéaire au déplacement $arw(O' O)$, on aura $arw(L_(O' ref)) != arw(L_(O ref))$
    ]
  ],
)

#custom-card(
  id: "2505122028",
  target-deck: "P_SUP_MECA_C06_MOMENT_CINE",
  q: [
    Définition: Moment cinétique par-rapport à un axe
  ],
  a: [
    #let ref = $\/cal(R)$
    #let axe = $Delta$

    On considère $axe$ un axe passant par $O$ et dirigé par
    le vecteur unitaire $arw(u_axe)$. \
    On pose le moment cinétique par-rapport à $O$:
    $ arw(L_(O ref)) (M) = arw(O M) and m arw(v_ref) (M) $

    On définit le moment cinétique par-rapport à l'axe $axe$ par:
    $ L_(axe ref) (M) = arw(L_(O ref)) (M) dot arw(u_axe) $

    #elem_remarque[
      Le point $O$ peut-être choisi arbitrairement

      Démonstration en reprenant l'expression précedente avec $O'$ un autre point de $axe$:
      $
        arw(L_(O' ref)) (M) dot arw(u_axe)
        &= (underbrace(arw(O' O) and m arw(v_ref), "perpendiculaire à" arw(u_Delta)) + arw(L_(O ref)) (M)) dot arw(u_axe) \
        &= arw(L_(O ref)) (M) dot arw(u_axe)
      $
    ]
  ],
)

#custom-card(
  id: "2505122029",
  target-deck: "P_SUP_MECA_C06_MOMENT_CINE",
  q: [
    Moment cinétique d'un point en mouvement circulaire autour d'un axe
  ],
  a: [
    #let ref = $\/cal(R)$
    #let axe = $Delta$
    On considère un point en mouvement circulaire.
    On se place en coordonées cylindriques avec l'axe $(O_z)$ perpendiculaire
    au plan du mouvement et le point $O$ centre de la trajectoire.

    Le moment cinétique par-rapport à l'axe $Delta = (O_z)$
    $ arw(L_(Delta ref)) (M) = m R^2 dot(theta) $

    #elem_preuve[
      On a donc:
      $ arw(O M) = r arw(u_r) + z arw(u_z) = r arw(u_r) $
      $ arw(v) = dot(r) arw(u_r) + r dot(theta) arw(u_theta) = R dot(theta) arw(u_theta) $
      Comme on est en mouvement circulaire, on a $r = R "constant"$,
      donc $dot(r) = 0$, et $dot(z) = 0$, donc

      On calcule le moment cinétique:
      $
        arw(L_(O ref)) (M) &= arw(O M) and m arw(v_ref) (M) \
        &= (R arw(u_r) + z arw(u_z)) and m R dot(theta) arw(u_theta) \
        &= R arw(u_r) and m R dot(theta) arw(u_theta) \
        &= m R^2 dot(theta) arw(u_z)
      $

      On en déduit le moment cinétique par-rapport à l'axe $axe = (O_z)$
      $ arw(L_(axe ref)) (M) = m R^2 dot(theta) $
    ]
  ],
)

#custom-card(
  id: "2505122031",
  target-deck: "P_SUP_MECA_C06_MOMENT_CINE",
  q: [
    Définition: Moment d'une force par rapport à un point
  ],
  a: [
    De la même manière qu'on a définit le travail d'une force,
    on définit le moment d'une force par:
    $ arw(MMM_O) (arw(f)) = arw(O M) and arw(f) $

    #elem_remarque[
      Si on prend $O'$ un autre point:
      $
        arw(MMM_O') (arw(f)) &= arw(O' M) and arw(f) \
        &= arw(O' O) and arw(f) + arw(O M) and arw(f) \
        &= arw(O' O) and arw(f) + arw(MMM_O) (arw(f))
      $
      De la même manière, à moins que la force soit nulle ou collinéaire
      à $arw(O' O)$, $arw(MMM_O') (arw(f)) != arw(MMM_O) (arw(f))$
    ]
  ],
)

#custom-card(
  id: "2505122033",
  target-deck: "P_SUP_MECA_C06_MOMENT_CINE",
  q: [
    Définition: bras de levier, et droite d'action d'une force
  ],
  a: [
    On définit le *bras de levier*, la distance entre le point $O$ et
    *la droite d'action* de la force $arw(f)$, qui permet
    de calculer la norme du moment de la force:

    #figcan({
      import draw: *

      line((-1, -1), (4, 4), stroke: (paint: gray))

      line((3, -1), (3, 4), stroke: red)
      content((3.3, -0.5), ["droite d'action" de $arw(f)$], anchor: "west")

      content((1.2, -0.8), ["bras de levier"], anchor: "north")

      point((0, 0), value: $O$, name: "O")
      point((3, 3), value: $M$, name: "M")
      point((3, 0), value: $H$)

      arrow("M", (3, 4.5), tip: $arw(f)$)
      cetz.angle.angle((3, 3), (4, 4), (3, 4))
      content((3.4, 3.8), $theta$)

      line((0.2, 0), (2.8, 0))
      content((1.5, -0.2), $d$, anchor: "north")
    })

    On a:
    $ norm(arw(MMM_O)(arw(f))) = O M times f times sin theta $

    Le triangle $O M H$ est triangle en $H$, donc:
    $ sin theta = (O H) / (O M) $
    Donc:
    $ O M sin theta = O H = d "la distance de" O "à la droite d'action de" arw(f) $
  ],
)

#custom-card(
  id: "2505122035",
  target-deck: "P_SUP_MECA_C06_MOMENT_CINE",
  q: [
    Définition: Moment d'une force par-rapport à un axe
  ],
  a: [
    On prend un axe $Delta$ passant par un point $O$ et de vecteur directeur
    unitaire $arw(u_Delta)$, et on définit le moment par-rapport à un axe:
    $ MMM_Delta (arw(f)) = arw(MMM_O) (arw(f)) dot arw(u_Delta) $
  ],
)

#custom-card(
  id: "2505122036",
  target-deck: "P_SUP_MECA_C06_MOMENT_CINE",
  q: [
    Théorème du moment cinétique par rapport à un point fixe
  ],
  a: [
    La dérivée du moment cinétique par-rapport à un point est égale
    à la somme des moments par-rapport à ce point:

    $ (dif arw(L_(O \/cal(R)))) / (dif t) = sum arw(MMM_O) (arw(f)) $

    #elem_preuve[
      On repart de la définition du moment cinétique:
      $ arw(L_(O \/cal(R))) (M) = arw(O M) and m arw(v_(\/cal(R))) (M) $

      $
        (dif arw(L_(O \/cal(R))) (M)) / (dif t)
        &= (dif) / (dif t) (arw(O M) and m arw(v_(\/cal(R))) (M)) \
        &= underbrace((dif arw(O M)) / (dif t), arw(v_(\/cal(R))) (M) "car" O "fixe") and m arw(v_(\/cal(R))) (M)
        + arw(O M) and underbrace((dif) / (dif t) (m arw(v_(\/cal(R))) ( M )), sum arw(f)) \
        &= arw(0) + sum arw(O M) and arw(f) \
        &= sum arw(MMM_O) (arw(f))
      $
    ]

    #elem_remarque[
      Si $O$ est mobile, on prend $O'$ un point fixe, on peut décomposer (comme vu précedemment)
      $arw(L_O)$ en $arw(O' O)$ et en $arw(L_O')$ et on tombe sur:
      $
        (dif arw(L_(O \/cal(R))) (M)) / (dif t) = (m arw(v_(\/cal(R))) (M) and arw(v_(\/cal(R))) (O)) + sum arw(MMM_O) (arw(f))
      $
    ]
  ],
)

#custom-card(
  id: "2505122038",
  target-deck: "P_SUP_MECA_C06_MOMENT_CINE",
  q: [
    Théorème du moment cinétique par rapport à un axe
  ],
  a: [
    $ (dif L_Delta (M)) / (dif t) = sum MMM_Delta (arw(f)) $

    #elem_preuve[
      Soit $O$ un point d'un axe $Delta$ fixe.
      Par le théorème du moment cinétique:

      $ (dif arw(L_(O \/cal(R))) (M)) / (dif t) = sum arw(MMM_O) (arw(f)) $
      $ (dif arw(L_(O \/cal(R))) (M)) / (dif t) dot arw(u_Delta) = sum arw(MMM_O) (arw(f)) dot arw(u_Delta) $
    ]
  ],
)

#custom-card(
  id: "2505122039",
  target-deck: "P_SUP_MECA_C06_MOMENT_CINE",
  q: [
    Conditions de conservation du moment cinétique
  ],
  a: [
    Le moment cinétique est constant si:
    - Le point étudié est confondu avec l'origine
    - La somme des forces est nulle
    - Que $arw(O M)$ et $arw(F)$ soient colinéaires.
    Dans ce dernier cas, on parle de *force centrale*, quand la force totale
    $arw(F)$ est toujours dirigée vers un point fixe $O$.

    #elem_preuve[
      Le moment cinétique se conserve (= est constante)
      si sa dérivé s'annule, donc:
      $ (dif arw(L_(O \/cal(R))) (M)) / (dif t) = 0 <=> sum arw(MMM_O) (arw(f)) = 0 $

      En substituant la définition du moment:
      $ sum arw(MMM_O) (arw(f)) = sum arw(O M) and arw(f) = arw(O M) and sum arw(f) = arw(O M) and arw(F) $
    ]
  ],
)

#custom-card(
  id: "2505122040",
  target-deck: "P_SUP_MECA_C06_MOMENT_CINE",
  q: [
    Définition: constante des aires
  ],
  a: [
    #let momcin = $arw(L_(O \/cal(R)))$

    #figcan({
      import draw: *

      arrow((-4, 0), (4, 0), tip: $x$)
      arrow((0, -2), (0, 2), tip: $x$)

      point((2, 1), value: $M$, name: "M")
      cetz.angle.angle((0, 0), (1, 0), "M")
      line((0, 0), "M")
      content((0.9, 0.8), $r$)
      content((1, 0.25), $theta$)

      circle((-1, 1.5), radius: 0.2)
      circle((-1, 1.5), radius: 0.05, fill: black)
      content((-1, 0.8), $momcin$)
    })
    On a:
    $ arw(O M) = r arw(u_r) $
    $ arw(v_(\/cal(R))) (M) = dot(r) arw(u_r) + r dot(theta) arw(u_theta) $
    Donc:
    $
      momcin (M) = (r arw(u_r)) and m (dot(r) arw(u_r) + r dot(theta) arw(u_theta))
      = m r^2 dot(theta) arw(u_z)
    $

    Comme $momcin$, $m$ et $arw(u_z)$ sont constants, on en déduit que
    *$r^2 dot(theta)$* est constant.

    On appelle cette quantité la *constante des aires*:
    #figcan({
      import draw: *

      arrow((0, 0), (4, 0), tip: $arw(u_r)$)
      arrow((4, 0), (4, 2), tip: $arw(u_theta)$)

      point((0, 0), value: $O$)

      content((2, -0.2), $r$)
      content((4.4, 1), $r dot(theta)$)

      line((0, 0), (4, 0), (4, 1), closed: true)
    })
  ],
)

#custom-card(
  id: "2505122107",
  target-deck: "P_SUP_MECA_C06_MOMENT_CINE",
  q: [
    Quel est le lien entre $M$, $O$ et $arw(L_(O \/cal(R)))$ quand le moment cinétique est conservé ?
  ],
  a: [
    #let momcin = $arw(L_(O \/cal(R)))$

    Si le moment cinétique est conservé, on a par définition que
$momcin = arw(O M) and m arw(v_(\/cal(R))) (M) = arw("constante")$

En se plaçant dans la situation où le mouvement n'est pas rectiligne, on a alors que le vecteur $arw(v)$, et $momcin$ forment un plan qui passe par $O$, formé par les vecteurs $arw(O M)$ et $arw(v)$

#grid(
  columns: (1fr, 1fr),
  align: (center, left),
  figcan({
    import draw: *

    arrow((0, 0, 0), (0, 3, 0))

    point((0, 1.5, 0), value: $O$, name: "O")
    point((-1, 1.5, 1), value: $M$, name: "M")
    arrow("O", "M")
    arrow("M", (0, 1.5, 1), tip: $arw(v)$)
  }),
  [$M$ évolue dans le plan perpendiculaire à $momcin (M)$
    et passant par $O$
  ],
)

#elem_methode[
   Il faut d'abords montrer le mouvement plan, puis introduire les coordonnées polaires.

   Généralement, pour les solides, soit on aura une liaison pivot parfaite, soit il sera évident que le mouvement est dans un plan
]
  ]
)