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
  id: "2505122047",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Définition: un solide
  ],
  a: [
    Un solide est un ensemble de points $S$ tel que:
$ forall A, B in S, norm(arw(A B)(t)) "est constante" $

#elem_methode[
  "Un solide est un système continu de points"
]

Pour décrire le mouvement du solide dans son ensemble, on
s'interesse au mouvement d'un point particulier d'un solide. \
On prendra en général $G$ le centre de gravité/le centre d'inertie/le centre de masse du solide.
  ]
)

#custom-card(
  id: "2505122048",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    De quelle manière va-t-on s'intéresser à la rotation d'un solide sur lui meme?
  ],
  a: [
    On s'intéresse de plus à la rotation du solide sur lui même:
on fixe des axes sur le solide et on note les angles entre les axes
relatifs du solide et les axes fixes du repère.

On obtient donc $6$ inconnues (3 pour la position et 3 pour la rotation)

On devra donc utiliser 2 méthodes de résolutions:
le PFD _et_ le théorème du moment cinétique.
  ]
)

#custom-card(
  id: "2505122049",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Définition: Mouvement de translation
  ],
  a: [
    On parle de *translation* quand tout les point se deplacent de la même façon (cela inclu un mouvement circulaire de l'ensemble des points du solide).
  ]
)

#custom-card(
  id: "2505122050",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Définition: Mouvement de rotation
  ],
  a: [
    On parle de *rotation* quand les points du solide se déplacent autour d'un axe du solide (les points ont des mouvement différents).
  ]
)

#custom-card(
  id: "2505122051",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Définition: moment d'inertie
  ],
  a: [
    
En se plaçant calculant le moment cinétique:
$
  arw(L_(O \/cal(R))) (M)
  = m (-z r dot(theta) arw(u_r) + (dot(r)z - dot(z)r) arw(u_theta)
    + r^2 dot(theta) arw(u_z))
$

En prenant $i = (O_z)$ (donc $arw(u_Delta) = arw(u_z)$),
on fait le produit scalaire:
$ arw(L_Delta)(M) = m r^2 dot(theta) $

On définit $J_Delta$ le moment d'inertie (constant dans un solide donné), ici $J_Delta = m r^2$

#elem_methode[
  Pour le moment cinétique, $J_Sigma$ joue le même rôle que la masse
  dans la quantité de mouvement
]
  ]
)

#custom-card(
  id: "2505122056",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Définition: moment cinétique d'un ensemble de points
  ],
  a: [
    Pour obtenir le moment cinétique combiné de plusieurs points,
on les somme:
$
    arw(L_O) = sum_i arw(L_(O,i)) "et"
  L_Sigma = sum_i L_(Sigma,i)
$
  ]
)

#custom-card(
  id: "2505122101",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Définition: moment cinétique d'un solide
  ],
  a: [
    On prend le produit scalaire avec $arw(u_Sigma) = arw(u_z)$, et on obtient:
    $ L_Sigma = integral.triple_(M in S) r^2 dot(theta) rho(M) dif tau $

    #elem_preuve[
      Pour obtenir son moment cinétique, on remplace la sommation discrète
par une sommation continue:

      Dans un solide quelconque, la masse peut varier.
On a, en chaque point $M$ du solide:
$
  underbrace(dif m, "\"masse" \ "élémentaire\"") = underbrace(rho (M), "masse" \ "volumique") underbrace(dif tau, "volume" \ " élementaire")
$


$
  arw(L_(O \/cal(R))) (S) &= integral.triple_(M in S) (arw(O M) and dif m arw(v_(\/cal(R))) (M)) \
  &= integral.triple_(M in S) (arw(O M) and rho(M) dif tau arw(v_(\/cal(R))) (M)) \
  arw(L_Sigma) (S) &=
  integral.triple_(M in S) (arw(O M) and rho(M) dif tau arw(v_(\/cal(R))) (M)) dot arw(u_Sigma)
$

On se place en coordonnées cylindriques:
$
  arw(O M) = r arw(u_r) + z arw(u_r) \
  arw(v_(\/cal(R))) (M) = dot(r) arw(u_r) + r dot(theta) arw(u_theta) + dot(z) arw(u_z)
$
Donc:
$
  arw(O M) and rho(M) dif tau arw(v_(\/cal(R))) = rho(M) dif tau (r^2 dot(theta) arw(u_z) +
    (- r dot(z) + z dot(r)) arw(u_theta) - r dot(theta) z arw(u_r))
$

    ]
  ]
)

#custom-card(
  id: "2505122105",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Définition: Moment d'inertie d'un solide
  ],
  a: [
    On pose $omega = dot(theta)$ la vitesse angulaire.
Tout les points du solide possèdent la même vitesse
angulaire, on peut donc le factoriser et on a:
$ L_Sigma = omega J_Sigma "avec" J_Sigma = integral.triple_(M in S) r^2 rho(M) dif tau $
  ]
)

#custom-card(
  id: "2505122113",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Définition: couple de deux forces
  ],
  a: [
    #grid(
  columns: (2fr, 1fr),
  align: (auto, horizon),
  [
    On dit que deux forces $arw(F_1)$ et $arw(F_2)$ forment un couple
    $(arw(F_1), arw(F_2))$ par-rapport à $Sigma$ si:
    - Les deux forces sont *opposées*: $arw(F_1) = - arw(F_2)$
    - Le moment de la résultante des forces n'est pas nul et est proportionnel à la distance:
      $ cal(M)_Sigma (arw(F_1) + arw(F_2)) = F d != 0 $

    Avec $d_1$ la distance entre $O$ et le projeté orthogonal de $O$ sur $(F_1)$
    (la distance entre $O$ et $(F_1)$),
    $d_2$ la distance entre $O$ et $(F_2)$,
    et $d = d_1 + d_2$ la distance entre $arw(F_1)$ et $arw(F_2)$ $A$ et $B$

  ],
  figcan({
    import draw: *


    line((0.5, 2, -0.5), (0.5, -2, -0.5), name: "l", stroke: (dash: "dotted"))

    point((0, 0, 0), value: $A$, name: "A")
    point((1, 0, -1), value: $B$, name: "B")

    arrow((0, 0, 0), (-1, -1, 1), tip: $arw(F_1)$)

    line((-1, 0, 1), (-1, 0, -2), (2, 0, -2), (2, 0, 1), close: true, stroke: red)
    line((1, 0, -1), (0, -1, 0), stroke: (dash: "dashed"), name: "f2r")

    arrow((1, 0, -1), (2, 1, -2), tip: $arw(F_2)$)

    line((0, 0, 0), (1, 1, -1), stroke: (dash: "dashed"), name: "f1r")

    line("f1r.33%", "f2r.33%")

    content("f1r.33%", $d_1$, anchor: "north", padding: 4pt)
    content("f2r.33%", $d_2$, anchor: "south", padding: 5pt)


    // content((0.7, 0, 0.4), $d_1$)
    // content((1.3, 0, -0.2), $d_2$)

    point((0.5, 0, -0.5), value: $O$, padding: 8pt)

    content((0.8, 2, -0.5), $Sigma$)
  }),
)

  ]
)

#custom-card(
  id: "2505122114",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Définitions:
    - couple moteur
    - couple de freinage
  ],
  a: [
    On parle de *couple moteur* si le couple augmente la vitesse de rotation,
et de *couple de freinage* si il diminue la vitesse de rotation.

#elem_remarque[
  Un couple de forces ne fait que appliquer une rotation et n'applique
  aucune translation.
]
  ]
)

#custom-card(
  id: "2505122115",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Définition rapide: torseur
  ],
  a: [
    Toute action mécanique sur un solide peut être décrîte par:
  - Une force sur le centre de gravité (qui n'applique qu'une translation)
  - Un couple (qui n'applique qu'une rotation)

  On parle alors de *torseur*.\
  Voir #link("https://fr.wikipedia.org/wiki/Torseur_cin%C3%A9tique")[Torseur cinétique] et #link("https://fr.wikipedia.org/wiki/Torseur_cin%C3%A9matique")[Torseur cinématique]

  #elem_remarque[
    HP
  ]
  ]
)

#custom-card(
  id: "2505122116",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Cas des couples de tension
  ],
  a: [
    De la même manière qu'un ressort applique une force de rappel sur un point,
un couple de torsion applique un *moment de rappel* d'amplitude
$Gamma = - C alpha$ avec $alpha$ l'angle de torsion et $C$ la cosntante de
torsion du fil (équivalent à $k$ la raideur du ressort).
  ]
)

#custom-card(
  id: "2505122117",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Définition: liaison pivot
  ],
  a: [
   On appelle *liaison pivot* une liaison entre des solides qui permet de limiter
le mouvement d'un solide à la rotation autour d'une axe fixe.

On supposera toujours que les liasons pivots sont parfaites et sans frottement. 
  ]
)

#custom-card(
  id: "2505121254",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Puissance d'un solide en rotation autour d'un axe
  ],
  a: [
    #let axe = $Delta$
    $ cal(P) = cal(M)_axe dot(theta) "(expression à réétablir avec le mouvement élémentaire)" $

    #elem_methode[
      On rappelle $ cal(P) = (delta W)/(dif t) $
      On a:
$ cal(P) = cal(M)_axe dot(theta) "(expression à réétablir avec le mouvement élémentaire)" \
= (delta W)/(dif t) = cal(M)_axe (dif theta)/(dif t) \
=> delta W = cal(M)_axe dif theta
$
    ]
  ]
)

#custom-card(
  id: "2505121300",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    Énergie cinétique d'un solide en rotation autour d'un axe
  ],
  a: [
    #let axe = $Delta$
    #let ref = $\/cal(R)$
    #let intsolid = $integral.triple_(M in S)$
    $ E_c = 1/2 dot(theta)^2 J_axe $

    #elem_preuve[
      On reprend l'expression de l'énergie cinétique:
$ E_c = 1/2 m v_ref (M)^2 $

On avait vu que pour obtenir l'énergie cinétique d'un système de point, on fait la somme:
$ E_c = sum_i E_(c,i) = sum_i 1/2 m_i v_ref (M_i)^2 $

Pour obtenir l'énergie cinétique d'un solide, on transforme la somme
discrète en somme continue:
$ E_c = intsolid 1/2 (rho dif tau) v_ref (M)^2 $

Exemple: solide en rotation autour de l'axe $(O_z)$:
si on prend un point $M$ appartenant au solide:
$ arw(v_ref) (M) = underbrace(dot(r) arw(u_r), "nul car" r "constant dans un solide") + r dot(theta) arw(u_theta) $

Donc:
$ arw(v_ref) (M) = r dot(theta) arw(u_theta) => v_ref (M)^2 = r^2 dot(theta)^2 $

En reprenant l'expression de l'énergie cinétique:
$ E_c &= intsolid 1/2 rho dif tau r^2 dot(theta)^2 \
&= 1/2 dot(theta)^2 underbrace(intsolid rho dif tau r^2, J_axe) \
&= 1/2 dot(theta)^2 J_axe
$
    ]
  ]
)

#custom-card(
  id: "250512",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    
  ],
  a: [
    
  ]
)

#custom-card(
  id: "250512",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    
  ],
  a: [
    
  ]
)

#custom-card(
  id: "250512",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    
  ],
  a: [
    
  ]
)

#custom-card(
  id: "250512",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    
  ],
  a: [
    
  ]
)

#custom-card(
  id: "250512",
  target-deck: "P_SUP_MECA_C07_MVMT_SOLIDE",
  q: [
    
  ],
  a: [
    
  ]
)

