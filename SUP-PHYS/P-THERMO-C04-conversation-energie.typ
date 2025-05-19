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
  id: "2505011524",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Premier principe de la thermodynamique
  ],
  a: [
    À tout système thermodynamique, on associe une fonction d'état appelée
    énergie interne, notée $U$ et vérifiant:
    + $U$ est une _grandeur extensive_
    + La variation d'énergie totale dans un système
      est la somme des échanges énergétiques:
      $ Delta (U + E_m) = Q + W $

      #elem_preuve[
        $
          Delta (U + E_m) = Q + W \
          <=> (U + E_m) (B) - (U + E_m) (A) = Q + W \
          <=> U(B) + E_m(B) - (U(A) + E_m(A)) = Q + W
        $
      ]


    Il existe aussi une version différentielle qui observe
    les changements infinitésimaux d'énergie:
    $ d (U + E_m) = delta Q + delta W $

    ce principe traduit la *conservation de l'énergie*.
    À condition d'être un système fermé (de ne rien échanger avec l'extérieur),
    l'énergie totale reste constante.

    #elem_remarque[
      Ce principe est fondamental: on ne peut pas avoir de travail ou de changement de température sans qu'il y ait eu apport d'énergie

      Comme en mécanique, la variation d'énergie totale "ne dépend pas du chemin suivi",mais les transferts d'énergie en eux-mêmes si.
    ]

    #elem_reformulation[
      il existe une fonction d'état extensive U telle que l'énergie d'un système est E=U+E_m
    ]
  ],
)

#custom-card(
  id: "2505011528",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    L'énergie interne est-elle intensive ou extensive?
  ],
  a: [
    L'énergie interne est extensive.
    On peut donc découper un système en sous-systèmes,
    résoudre l'énergie interne pour chacun des sous-systèmes,
    puis faire la somme pour trouver l'énergie interne totale,
  ],
)

#custom-card(
  id: "2505011532",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Application du premier principe de la thermodynamique: Cas d'un système isolé
  ],
  a: [
    Un système est isolé s'il n'y a aucun transfert énergétique.

    $ cases(Q = 0, W = 0) => Delta (E_m + Q) = 0 $
  ],
)

#custom-card(
  id: "2505011533",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Application du premier principe de la thermodynamique: Systèmes à énergie mécanique constante
  ],
  a: [

    On aura alors:
    $ Delta U = W + Q $
    #elem_remarque[
      La majorité des systèmes rencontrés seront dans ce cas.
    ]

    On différentie deux cas \
    #sens([Cas $W = 0$])[
      la majorité du temps, le seul travail
      présent sera celui des forces de pression, et
      toutes les transformations seront alors _isochores_.
      On aura alors:
      $ Delta U = Q $
    ]
    #sens([Cas $Q = 0$])[
      Toutes les transformations seront aediabatiques, donc:
      $ Delta U = W $
    ]


  ],
)

#custom-card(
  id: "2505011536",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Expression générale de l'énergie interne
  ],
  a: [
    $-->$ L'énergie interne $U$ est une fonction d'état \
    $-->$ Elle peut donc s'exprimer à l'aide des deux variables intensives choisies: on choisira le volume $V$ et la température $T$

    $
      U (V,T) \ "en dérivant" U ":" \ dif U = ((diff U) / (diff V))_T dif V + ((diff U) / (diff T))_V dif T
    $

    #elem_methode[
      On comprend la logique:
      la température est liée aux transferts thermiques,
      et on a exprimé le travail des forces de pression avec un $dif V$.

      Une variation de volume impliquera une variation d'énergie interne.
    ]
  ],
)

#custom-card(
  id: "2505011540",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Gaz parfait - 1ère loi de Joule
  ],
  a: [
    Dans un gaz parfait #underline[monoatomique], on avait posé l'énergie interne:
    $ U = (3 / 2) n R T $
    L'énergie interne ne dépend alors que de la température.

    #elem_methode[
      On dit qu'un système vérifie la première loi de Joule si son énergie interne ne dépend *que* de la température.
    ]

    #hr
    Dans un gaz parfait #underline[non-monoatomique], on avait posé:
    $ U = C_V T "avec" C_V >= 3 / 2 n R $

    Énergie microscopique :
    - Liée uniquement à l'agitation des molécules
    - donc uniquement à la température
    - on néglige les intéractions entre les particules
  ],
)

#custom-card(
  id: "2505011541",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Définition: Capacité thermique à volume constant $C_V$
  ],
  a: [
    Elle peut être définie pour n'importe quel système
    $ bold(C_V = ((diff U) / (diff T))_V) $

    et on a alors $dif U = ((diff U) / (diff V))_T dif V + C_V dif T$

    === Cas d'un gaz parfait #underline[monoatomique]
    $ U = 3 / 2 n R T $
    On calcule la dérivée partielle de la température par-rapport au volume:
    #resultb[$ ((diff U) / (diff T))_V = 3 / 2 n R ==> C_V = 3 / 2 n R $]

    === Cas d'un gaz parfait #underline[non-monoatomique]
    $ U = C_V T => C_V >= 3 / 2 n R $

    Dans l'hypothèse d'un gaz parfait qui ne dépend que de la température?
    #resultb[$ dif U = C_V dif T => U(T) = ((diff U) / (diff V))_T = 0 $]

  ],
)

#custom-card(
  id: "2505011703",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Énergie interne des phases condensées - Capacité thermique
  ],
  a: [
    Pour modéliser les phases condensées, on utilise le modèle des fluides incompressibles:
    $ "Comme fluide incompressible : " V = c^("te") => dif V = 0 $

    L'énergie interne est donc proportionnelle à la température:
    $ U = C T $

  ],
)

#custom-card(
  id: "2505011704",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Définition: Enthalpie
  ],
  a: [
    Définition de l'enthalpie $H$ (en joules):
    $ H = U + P V $

    L'enthalpie s'exprime uniquement avec des variables d'état. C'est donc une fonction d'état.

    Ainsi, comme pour l'énergie interne:
    - Les variations d'enthalpie ne dépendent
      pas du chemin suivi. (On utilise donc un $Delta$ et un $dif$).
    - $H$ est une grandeur *extensive* car somme de $U$ et de $P V$ (grandeurs extensives)

    #elem_methode[
      On se servira souvent de l'enthalpie lorsqu'on est à pression constante
      
      Si le système est à pression constante, et à phase condensée (volume constant), et à l'équilibre, on a $Delta H = Q$
    ]
  ],
)

#custom-card(
  id: "2505011705",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Seconde loi de Joule
  ],
  a: [
    L'enthalpie d'un gaz parfait ne dépend que de la température.

    #elem_methode[
      Un gaz parfait vérifie la première loi de Joule, donc l'énergie interne de dépend que de la température.

      On a : $P V = n R T = f(T)$
      L'enthalpie ne dépend donc que de la température: c'est la *seconde loi de Joule*.
    ]
  ],
)

#custom-card(
  id: "2505011706",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Définition: capacité thermique à pression constante
  ],
  a: [
    #resultb[
      $ C_p =((diff H) / (diff T))_P $
    ]
  ],
)

#custom-card(
  id: "2505011716",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Définition: Capacités thermiques massiques et capacités thermiques molaires
  ],
  a: [
    $ "Capacité thermique massique:"\ c_V = C_V / m "et" c_p = C_p / m $
    $ "Capacité thermique molaire:"\ c_(V,m) = C_V / n "et" c_(p,m) = C_p / n $

    #elem_remarque[
      Notation non standards, tjrs regarder l'énoncé
    ]
  ],
)

#custom-card(
  id: "2505011722",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Relation de Mayer
  ],
  a: [
    #resultb[
      $ C_P - C_V = n R $
    ]

    #elem_preuve[
      == À connaitre
      On part de:
      $ H = U + P V $
      Or, dans un gaz parfait, $P V = n R T$, donc: $     H & = U + n R T         \
       H(T) & = U(T) + n R T      \
      dif H & = dif U + n R dif T \ $
      Par la première loi de Joule: $ C_P dif T = C_V dif T + n R dif T\
      dif T ( C_p - C_v - n R) = 0 $

      Cette relation est valide peut importe la variation $dif T$ (qui est non nulle).

      On en déduit
      $ C_P - C_V = n R $
    ]

    #elem_methode[
      On peut l'exprimer avec les capacités thermiques massiques:
      $ c_p - c_V = (n R) / m = R / M "avec M la masse molaire du système." $
      Ou molaires:
      $ c_(p,m) - c_(V,m) = R $
    ]
  ],
)

#custom-card(
  id: "2505011724",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Coefficient $gamma$ - Expression des capacités thermiques
  ],
  a: [
    On définit *$gamma$* le rapport entre les deux capacités thermiques:
    $ gamma = C_P / C_V = c_p / c_V = c_(p,m) / (c_(p,V)) $

    #resultb[
      $ C_V = (n R) / (gamma - 1) "ou" C_p = (gamma n R) / (gamma - 1) $
    ]

    #elem_preuve[
      Les capacités massiques, qu'elles soient à pression constante
      ou à volume constant, ne sont pas indépendantes
      (on peut en exprimer une en fonction de l'autre)


      En utilisant la relation de Meyer: $ C_p - C_v = n R\
      gamma = C_p / C_v ==> C_p = gamma C_v\
      (gamma - 1)C_v = n R\
      ==> C_V = (n R) / (gamma - 1) "ou" C_p = (gamma n R) / (gamma - 1) $
    ]

    #elem_methode[
      On en déduit également:$ C_(v,m) = R / (gamma - 1)\
      C_p,m = (gamma R) / (gamma - 1)\
      c_v = R / (M(gamma - 1))\
      c_p = (gamma R) / (M(gamma - 1)) $
    ]

    #elem_remarque[
      Vu qu'elles sont liées par les relations de Meyer,
      $gamma$ suffit à caractériser les capacités thermiques.
      Souvent, on nous donnera seulement la valeur de $gamma$ d'un gaz parfait.
    ]
  ],
)

#custom-card(
  id: "2505011726",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Lois de Laplace
  ],
  a: [
    #resultb[Les 3 lois de Laplace en résumé
      $
        P V^gamma = c^"te"\
        P^(1-gamma) T^gamma = c^"te" \
        T V^(gamma-1) = c^"te"
      $]

    #elem_remarque[
      #emoji.warning Ces relations nécessitent de nombreuses hypothèses:
      - La transformation est adiabatique
      - La transformation est quasistatique
      - Le système étudié est un gaz parfait (on oublie les fluides incompressibles)
    ]
  ],
)

#custom-card(
  id: "2505011732",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Définition: calorimétrie
  ],
  a: [
    On appelle *calorimétrie* la mesure et le calcul de transferts
    thermiques en l'absence de travail extérieur.

    C'est l'aspect expérimental lié à ce qui a été fait auparavant.
  ],
)

#custom-card(
  id: "2505122017",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Généralisation du théorème des moments à toute grandeur extensive
  ],
  a: [
    Si un système est composé de deux phases,
respectivement de masse $m_1$ et $m_2$, d'énergie interne $U_1$ et $U_2$ et d'enthalpie $H_1$ et $H_2$.
On a:
$ U = U_1 + U_2 "et" H = H_1 + H_2 $

$ U = (m_1 + m_2) u = m_1 u_1 + m_2 u_2 $

En divisant par $m_1 + m_2$:
$ u = underbrace(m_1 / (m_1 + m_2), "titre massique") u_1 + (m_2) / (m_1 + m_2) u_2 = x_1 u_1 + x_2 u_2 $

Or, on a : $ x_1 + x_2 = 1 => x_2 = 1 - x_1 $
Donc:
$ u = x_1 u_1 + (1 - x_1) u_2 $
Ainsi:
#resultb[$ x_1 = (u - u_1) / (u_1 - u_2) $]

On peut faire exactement la même chose sur $H$:
#resultb[$ x_1 = (h - h_1) / (h_1 - h_2) $]

où $x_1, x_2$ sont des titres massiques
  ],
)

#custom-card(
  id: "2505122020",
  target-deck: "P_SUP_TH_C04_CONSERVATION",
  q: [
    Définition: enthalpie de changement de phase
  ],
  a: [
    Le changement d'état s'opère toujours à température et pression constante \
    $-->$ Pression constante: grandeur énergétique appropriée est l'enthalpie

    On définit l'*enthalpie de changement de phase* comme étant
l'énergie nécessaire pour effectuer le changement de phase
de 1kg du corps étudié.

Comme $H$ dépend de la température et de la pression

$dif H = C_p dif T\ dif H = h_(1->2) dif m$

#elem_remarque[
  Bien évidemment, $H_(1->2)$ est relié au $H_1$ et au $H_2$
utilise dans le théorème des moments.
]
  ],
)
