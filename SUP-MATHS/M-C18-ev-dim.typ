#let max_element_width = 40pt;
#import "../ankiconf.typ": *
#show: doc => conf(doc)

#let custom-card(
  id: "",
  q: "",
  a: "",
  ..args,
) = {
  new_id(id)
  card(id: id, q: q, a: a, container: true, show-labels: true)
}

#custom-card(
  id: "2502151731",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [Soit $cal(F) = (#tpp("x"))$ famille de $n$ vecteurs (=ordonnée, avec potentielles répétitions), on dit que $cal(F)$ est génératrice de $E$ si:],
  a: [Soit $cal(F) = (#tpp("x"))$ famille de $n$ vecteurs (=ordonnée, avec potentielles répétitions), on dit que $cal(F)$ est génératrice de $E$ si: \
    *tout vecteur de $E$ peut s'écrire comme une combinaison linéaire de #tpp("x") \ \
    $forall x in E, exists (#tpp($lambda$)) in KK^n, x = lambda_1 x_1 + ... + lambda_n x_n$
    *
  ],
)

#custom-card(
  id: "2502151741",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [$cal(F)$ génératrice $<=> E =$ ?],
  a: [$cal(F)$ génératrice $<=> E = Vect_KK (F)$ ],
)

#custom-card(
  id: "2502151742",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos(
      [$E$ $KK$ev],
      [$cal(F)$ famille généatrice de $E$ alors toute *???* de $cal(F)$ est génératrice ],
    )],
  a: [
    $cal(F)$ famille généatrice de $E$ alors toute *surfamille* de $cal(F)$ est génératrice

    #elem_preuve([
      On peut annuler les nouveaux termes
    ])
  ],
)

#custom-card(
  id: "2502151807",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos(
      [$E$ $KK$ev],
      [$cal(G)$ famille génératrice de $E$],
      [$chi$ famille qqconque de vecteurs de $E$],
    )
    Il y a équivalence entre:
  ],
  a: [
    + $chi$ famille génératrice
    + $forall x in cal(G), x in Vect(chi)$

    #elem_preuve([
      *$1 ==> 2$:* vects de $cal(G)$ sont vect de $E$ \
      *$2 ==> 1$:* on sq $x in Vect(chi)$ et on inverse les sommes
    ])
  ],
)

#custom-card(
  id: "2502151811",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [Famille libre, définition],
  a: [
    #hypos([$E$ $KK$ev], [$(#tpp("x"))$ famille de vecteurs de $E$])

    Cette famille est libre si $forall (#tpp($lambda$)) in KK^n$:
    $ lambda_1 x_1 + ... + lambda_n x_n = 0_E => lambda_1 = ... = lambda_n = 0 $
    ("la seule combinaison linéaire nulle est la combinaison linéaire triviale")

    L'inverse d'une famille libre est une *famille liée*

    #elem_methode([
      Pour montrer liberté on pourra poser des $(#tpp($lambda$))$ tel que la combinaison linéaire est nulle, puis prouver que $lambda_1 = ... = lambda_n = 0$
    ])
  ],
)

#custom-card(
  id: "2502151815",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos(
      [$E$ $KK$ev],
      [$cal(F)$ une famille de vecteurs de $E$],
      [$cal(G)$ une surfamille de $cal(F)$ vecteurs de $E$],
    )
    alors:
    + $cal(G)$ libre $=>$ ?
    + $cal(F)$ liée $=>$ ?
  ],
  a: [
    + $cal(G)$ libre $=> cal(F)$ libre
    + $cal(F)$ liée $=> cal(G)$ liée

    #elem_preuve([
      + on a déjà que la combinaison linéaire de $cal(G)$ est nulle que si tous les lambdas sont nuls, or $cal(F)$ est sous famille de $cal(G)$ donc ok!
      + la meme chose dans l'autre sens en fait
    ])
  ],
)

#custom-card(
  id: "2502151819",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos(
      [$E$ $KK$ev],
      [$(#tpp("x"))$ famille *libre* de vecteurs de E],
      [$x in E$],
    )
    Il y a équivalence entre:
    + $(#tpp("x"),x)$ liée
    + $x in$ ?
    + $exists$ ?
  ],
  a: [
    Équivalence entre:
    + $(#tpp("x"),x)$ liée
    + $x in Vect(#tpp("x"))$
    + $exists #tpp($lambda$) in KK, x = sum_(k=1)^n lambda_k x_k$

    #elem_methode([
      Si on ajoute un vecteur combinaison linéaire des vecteurs précédents, la nouvelle famille formée est alors liée
    ])

    #elem_preuve([
      *$2 <==> 3$:* définition du sev engendré (on peut décomposer élément) \
      *$1 ==> 3$:* liée, donc il existe des $#tpp($lambda$)$ tels que combinaison linéaire non nulle, sq $lambda$ = 0, puis montrer contradiction
      *$3 ==> 1$:* enlever $1*x$, et pouf c'est lié!
    ])
  ],
)

#custom-card(
  id: "2502151825",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos([$E$ $KK$ev], [$#tpp("x")$ famille libre], [$x in Vect(#tpp("x"))$])
    alors $exists "unique" (#tpp($lambda$))$ tq *?*
  ],
  a: [
    alors $exists "unique" (#tpp($lambda$))$ tq $x = sum lambda_k x_k$
    #elem_methode([Unique décomposition])
    #elem_preuve([
      *Existence*: définition de $Vect(#tpp("x"))$ \
      *Unicité*: sq deux différentes, montrer contradiction
    ])
  ],
)

#custom-card(
  id: "2502151828",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [Base, définition],
  a: [
    Famille $cal(F) = (#tpp("e"))$ de vecteurs du $KK$ev $E$ est une base de $E$ si $cal(F)$ est libre et génératrice

    #elem_methode([
      exemple des base canoniques, bases de référence (exemple, pour un plan orthonormé c'est $(vec(1, 0),vec(0, 1))$)
    ])
  ],
)

#custom-card(
  id: "2502151830",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [Caractérisation de la base],
  a: [
    #hypos([$(#tpp("e"))$ famille de vecteurs de $E$])
    Il y a équivalence entre:
    + $(#tpp("e"))$ base de $E$
    + $
        forall x in E, exists "unique" (#tpp($lambda$)) in KK^n "tq" x = sum_(k=1)^n lambda_k e_k
      $

    #elem_preuve([
      *Unicité:* liberté \
      *Existence:* génératrice
    ])

    #elem_methode([
      Le vecteur $(#tpp($lambda$))$ est appelé vecteur de coordonnées de $x$ dans la base $cal(B)$, noté $"Mat"_cal(B) = vec(lambda_1, ..., lambda_n)$
    ])
  ],
)

#custom-card(
  id: "2502151940",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos(
      [$E$ $KK$ev],
      [$cal(F) = (#tpp("e"))$ famille de vecteurs de $E$, $phi$ l'application de $KK^n --> E$ définie par $phi(#tpp($lambda$)) = sum_(k=1)^n lambda_k e_k$],
    )
    alors:
    + $phi$ est ?
    + $phi "injective" <=>$ ?
    + $phi "surjective" <=>$ ?
    + $phi "bijective" <=>$ ?
  ],
  a: [
    + $phi$ est* linéaire de $KK^n --> E$, $phi in L(KK^n,E)$*
    + $phi "injective" <=> cal(F) "libre"$
    + $phi "surjective" <=> cal(F) "génératrice"$
    + $phi "bijective" <=> cal(F) "base"$

    #elem_preuve([
      + mq linéaire, comme d'hab
      + double implication, avec Ker
      + double implication
      + automatique avec 2 et 3
    ])
  ],
)

#custom-card(
  id: "2502151945",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos([$E, F$ $KK$ev], [$cal(B) = (#tpp("e"))$], [$Psi in L(E,F)$])
    alors:
    + $(Psi(e_1),...,Psi(e_n))$ est famille *?* de *?*
    + $Psi "injective" <=> (Psi(e_1),...,Psi(e_n))$ ?
    + $Psi "surjective" <=> (Psi(e_1),...,Psi(e_n))$ ?
    + $Psi "bijective/isomorphisme" <=> (Psi(e_1),...,Psi(e_n))$ ?
  ],
  a: [
    + $(Psi(e_1),...,Psi(e_n))$ est famille *génératrice* de *$Im(Psi)$*
    + $Psi "injective" <=> (Psi(e_1),...,Psi(e_n))$ *libre*
    + $Psi "surjective" <=> (Psi(e_1),...,Psi(e_n))$ *génératrice*
    + $Psi "bijective/isomorphisme" <=> (Psi(e_1),...,Psi(e_n))$ *base*

    #elem_preuve([
      On prend $phi in L(KK^n,E)$ tq $phi(#tpp($lambda$)) = lambda_1 e_1 + ... + lambda_n e_n$ \
      On a déjà $phi$ bijective car $(#tpp("e"))$ base

      + $Im Psi = Psi(E) = Psi(Vect(#tpp("e")))$ puis linéarité ok!
      + $Psi "injective" <=> Psi compose phi "injective"$ (composition à gauche à droite possible par linéarité) puis utiliser proposition précédente
      + $Psi "injective" <=> Psi compose phi "surjective"$
      + ok
    ])
  ],
)

#custom-card(
  id: "2502161031",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos(
      [$E$ $KK$ev],
      [$(#tpp("e"))$ base de $E$],
      [$(#tpp("f"))$ famille qqconque de vecteurs de $F$ $KK$ev],
    )
    alors *?*
  ],
  a: [
    alors *il existe une unique application linéaire $u$ de $E$ dans $F$ tel que $ forall i in [|1;n|], u(e_i) = f_i $*

    #elem_methode([Ainsi, une application linéàire est entièrement caractérisée par l'image d'une base

      Donco on obtient l'équivalence suivante: $ f "est l'application lineaire nulle" <=> f "est nulle sur une base" $])


    #elem_preuve([
      *Unicité*: sq deux, mq les memes, en passant par les vects car base génératrice \
      *Existence*: se reservir de $phi "de" KK^n --> E, phi(#tpp($lambda$))= sum_(k=1)^n lambda_k e_k$, isomorphisme car $(#tpp("e"))$ base, puis créer $Psi(#tpp($lambda$)) = sum lambda_k f_k$ linéaire, puis se servir de $phi^(-1)(e_k) = (0,...,0,1,0,...,0)$, d'où $psi(phi^(-1)(e_k)) = f_k$, donc $psi compose phi^(-1)$ convient
    ])
  ],
)

#custom-card(
  id: "2502161036",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [Dimension finie: un $KK$ev est de dimension finie s'il existe une *?*],
  a: [
    Un $KK$ev est de dimension finie s'il existe une *partie génératrice finie*

    Sinon, c'est dit de dimension infinie
  ],
)

#custom-card(
  id: "2502161039",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [Si $E$ $KK$ev de dimension finie, il admet *?*],
  a: [
    Si $E$ $KK$ev de dimension finie, il admet *une base*

    #elem_preuve([
      Algorithmique, on parcourt la liste en rajoutant des vecteurs si besoin pour rester libre, et ça termine
    ])
  ],
)

#custom-card(
  id: "2502161043",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos(
      [#tpp("x") $n$ vecteurs de $E$ $KK$ev],
      [$#tpp("y", end: "n+1")$ vecteurs combinaisons linéaires de #tpp("x") ($forall i in [|1;n+1|], y_i in Vect(#tpp("x"))$)],
    )
    alors que dire de $(#tpp("y", end: "n+1"))$?
  ],
  a: [
    $(#tpp("y"))$ est liée

    #elem_preuve([
      Une récurrence\
      On fait un gros système, on peut alors échanger des lignes, on trouve un lambda non nul et on annule une autre ligne - s'ils sont tous nuls alors c'est bon
    ])
  ],
)

#custom-card(
  id: "2502161046",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos(
      [$E$ $KK$ev],
      [$cal(F)$ une famille libre de vecteurs de $E$],
      [$cal(G)$ famille génératrice de vecteurs de $E$],
    )
    alors que dire du cardinal de ces familles?
  ],
  a: [
    $ "card" cal(F) <= "card" cal(G) $

    #elem_reformulation[
      $ "libre" <= "génératrice" $
    ]

    #elem_preuve([
      Sq $"card" cal(F) > "card" cal(G)$, contradiction car $cal(F)$ libre et $E = Vect(cal(G))$, et que les vecteurs de $cal(F)$ sont dans ce $Vect$, donc liée
    ])
  ],
)

#custom-card(
  id: "2502161049",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos([$E$ $KK$ev de dimension finie])
    Que dire du cardinal de ses bases?
  ],
  a: [
    Toutes les bases ont le meme cardinal

    On appelle ce dardinal *dimension*, noté $dim E$ (ou $dim_KK E$ si corps à préciser)

    #elem_preuve([
      Prendre deux bases qqconques, puis utiliser le fait que le cardinal d'une famille libre est inférieur ou égal à celui d'une base génératrice
    ])
  ],
)

#custom-card(
  id: "2502161052",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos([$E$ $KK$ev], [$(#tpp("x"))$ famille de $n$ vecteurs de E])

    Si deux des trois propriétés suivantes sont vérifiées:
    + *?*
    + *?*
    + *?*

    alors *?*
  ],
  a: [
    Si deux des trois propriétés suivantes sont vérifiées:
    + $dim E = n$
    + $(#tpp("x"))$ est une famille génératrice
    + $(#tpp("x"))$ est une famille libre

    alors *la troisième l'est aussi et $(#tpp("x"))$ est une base de $E$*

    #elem_preuve([
      *$2 and 3==>1$*: définition de la dimension \
      *$1 and 3 ==> 2$*: $(#tpp("x"))$ non génératrice, donc $exists y in E without Vect(#tpp("x"))$ et on peut donc le rajouter à $(#tpp("x"))$ libre par 2, or le card d'une libre est inférieur ou égal à celui d'une génératrice, donc contradiction \
      *$1 and 2 ==> 3$*: sq liée, donc il existe un $x_i$ dans le vect sans $x_i$, donc on peut l'enlever -> contradictoire car le card d'une libre est inférieur à card d'une génératrice
    ])
  ],
)

#custom-card(
  id: "2502161058",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos([$E$ $KK$ev])
    Il y a équivalence entre:
    + E a une dimension infinie
    + ?
  ],
  a: [
    Il y a équivalence entre:
    + E a une dimension infinie
    + $forall n in NN^*$, il existe famille libre de $n$ vecteurs de $E$

    #elem_preuve([
      *$1 ==> 2$*: on construit suite infinie de vecteurs $(x_n)_(n in N)$ tq $(#tpp("x"))$ par récurrence; Init: on prend $x_0 in E without {0_E}$ hérédité: la suite construite est non génératrice car E de dim infinie, donc il existe $x in E without Vect(#tpp("x"))$ \
      *$2 ==> 1$*: sq E a dim finie n; toutes familles libres on cardinal au plus n, donc il n'existe par de $(#tpp("x", end: "n+1"))$ libre
    ])
  ],
)

#custom-card(
  id: "2502161109",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [Théorème de la base incomplète],
  a: [#hypos(
      [$E$ $KK$ev de dimension finie],
      [$cal(F)$ famille *libre* de vecteurs de $E$],
    )
    alors il existe une base $cal(B)$ surfamille de $cal(F)$

    #elem_preuve([
      Récurrence, on construit une suite libre de cardinal strictement croissant, on s'arrete quand c'est une base, majoré par la dimension de $E$
    ])
  ],
)

#custom-card(
  id: "2502161812",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [Théorème de la base extraite],
  a: [
    #hypos([$E$ $KK$ev], [$cal(G)$ famille génératrice finie de $E$])
    Alors il existe $cal(B)$ une base qui est sous-famille de $G$

    #elem_preuve([
      Récurrence, en gardant les vecteurs, s'ils agrandissent l'engendré
    ])
  ],
)

#custom-card(
  id: "2502161815",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos([$E$ $KK$ev de dimension finie], [$F$ sous-espace vectoriel de $E$])
    Que dire de la dimension de $F$? Que dire si $E = F$?
  ],
  a: [
    $F$ est de dimension finie, et $dim F <= dim E$

    De plus, on a:
    $ E = F <=> dim E = dim F $

    #elem_preuve[
      TODO
    ]

    #elem_methode([
      On utilise cette propriété pour montrer égalité de deux $KK$ev; on montre $dim E = dim F$ et seulement une inclusion, par exemple $F subset E$ et cela suffit à conclure
    ])
  ],
)

#custom-card(
  id: "2502161817",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos([$E$ $KK$ev], [$F$ sev de $E$])
    alors il existe $G$ sev de $E$, *?*
  ],
  a: [
    alors il existe $G$ sev de $E$, *supplémentaire de $F$ dans $E$ avec $dim G = dim E - dim F$*

    #elem_preuve([
      On complète $F$ en une base de $E$, avec des vecteurs $#tpp("g", end: "n-k")$ qui formeront $G=Vect(#tpp("g", end: "n-k"))$; on a directement $dim G = card(#tpp("g", end: "n-k")) = n-k$

      Puis on montre que $F$ et $G$ sont supplémentaires, par caractérisation
    ])
  ],
)

#custom-card(
  id: "2502161821",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos([$E$ $KK$ev de dimension finie], [$F$ $KK$ev])
    Il y a équivalence entre:
    + $F$ de $dim$ finie et $dim E = dim F$
    + $E$ et $F$ sont *?*
  ],
  a: [
    Il y a équivalence entre:
    + $F$ de $dim$ finie et $dim E = dim F$
    + $E$ et $F$ sont *isomorphes*

    #elem_preuve([
      *$1 ==> 2$*: Poser deux bases, utiliser $phi in L(E,F), phi(e_i) = f_i$, unique, et l'image de $cal(B)_E$ est une base donc $phi$ isomorphisme ok! \
      *$2 ==> 1$*: ensembles sont isomorphes, on peut donc prendre la fonction $phi in L(E,F)$ bijective; puis, $phi(cal(B)_E) = (phi(e_1),...,phi(e_n))$ libre car $phi$ injective; $F = phi(E) = phi(Vect(#tpp("e"))) = Vect(phi(e_1), ..., phi(e_n))$, d'où $(phi(e_1),...,phi(e_n))$ libre et génératrice de $F$, donc base, et $dim F = n = dim E$
    ])

    #elem_methode([
      On sort un corollaire intéréssant:
      Soit $E$ de dimension finie $n$, alors $E tilde.equiv KK^n$
    ])
  ],
)

#custom-card(
  id: "2502161826",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos(
      [$E,F$ 2 $KK$ev de dimension finie],
      [$cal(B)_E = (#tpp("e"))$ base de $E$],
      [$cal(B)_F = (#tpp("f"))$ base de $F$],
    )
    + $dim E*F =$ ?
    + *?* est base de $E * F$
  ],
  a: [
    + $dim E*F = dim E + dim F$
    + $((e_1,0_F),...,(e_n,0_F),(0_E,f_1),...,(0_E,f_n))$ est base de $E * F$

    #elem_preuve([
      Il suffit de montrer la deuxième propriété, la première en descend;

      Montrer liberté et génératrice
    ])
  ],
)

#custom-card(
  id: "2502161851",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos(
      [$E$ $KK$ev],
      [$F, G$ 2 sev en somme directe],
      [$cal(B)_F = (#tpp("f"))$ base de $F$],
    )
    alors
    + $dim (F xor G) =$ ?
    + ? est une base adaptée à cette somme directe
  ],
  a: [
    + $dim (F xor G) = dim F + dim G$
    + (#tpp("f"),#tpp("g", end: "m")) est une base adaptée à cette somme directe

    #elem_preuve([
      Montrer liberté: on peut introduire projecteur + linéarité \
      Génératrice: ça s'écrit
    ])
  ],
)

#custom-card(
  id: "2502161857",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [Formule de Grassman],
  a: [
    #hypos([$E$ $KK$ev de dimension finie], [$F, G$ deux sev de $E$])

    Alors $F + G$ de dimension finie, et $ dim (F+ G) = dim F + dim G - dim F inter G $

    #elem_preuve([
      Considérons $F inter G$ sev de $F$, donc il admet un supplémentaire dans F: $F = F inter G xor H$ et $dim H = dim F - dim F inter G$

      Montrons que $F + G = H xor G$ par double inclusion:
      - *$subset$* Soit $x in F + G => x = x_F + x_G$; or $x_F in F = F inter G xor H => exists x_(F inter G)" et "x_H in H$ tq $x_F = x_(F inter G) + x_H$, d'où $ x = x_(F inter G) + x_H + x_G = underbrace(x_H, in H) + underbrace(x_(F inter G) + x_G, in G) $ donc $x in H xor G$
      - #[*$supset$* Soit $x in H xor G$, on a alors $x = underbrace(x_H, subset H subset G) + x_G => x in F + G "et" F + G = H + G$

          *Montrons alors que cette somme est directe*: Soit $x in F + G$, alors $cases(x in H "sev de" F, x in G)$, d'où $x in F inter G$, or $F inter H "et" H$ sont en somme directe, donc $x = 0_E$ d'où H et G en somme directe

        ]

      d'où $dim F + G = dim (H xor G) = dim H + dim G = dim F - dim F inter G + dim G$ ok
    ])
  ],
)

#custom-card(
  id: "2502161906",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    Définition du rang
    + pour une famille $cal(F)$
    + pour une application linéaire $f$
  ],
  a: [
    #hypos([$E$ $KK$ev])
    + $rg cal(F) = dim Vect(cal(F))$ ("la dimension du sev engendré par $cal(F)$")
    + $f in L(E,F)$, $rg f = dim Im(f) = dim f(E)$

    #elem_methode([
      On peut relier les deux définitions dans le cas où $E$ est de dimension finie;
      Si $cal(B)_E = (#tpp("e"))$ base de $E$, $rg f = dim f(E) = dim f(Vect(#tpp("e"))) = dim (Vect(f(e_1), ..., f(e_n))) = rg (f(e_1),...,f(e_n))$

      -> Donc le *rang d'une application linéaire est le rang de l'image d'une base*
    ])
  ],
)

#custom-card(
  id: "2502161907",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [#hypos([$E = KK^n$], [$(#tpp("u", end: "k"))$ $k$ vecteurs de E])
    Si les vecteurs $#tpp("u", end: "k")$ sont échelonnés, alors: *?*
  ],
  a: [
    Si les vecteurs $#tpp("u", end: "k")$ sont échelonnés, alors: *$rg (#tpp("u", end: "k")) = k$*

    #elem_preuve([
      On fait une récurrence descendante, en créant une base - Cf cours
    ])
  ],
)

#custom-card(
  id: "2502181725",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos([$E$ $KK$ev], [$(#tpp("u"))$ famille de vecteurs $E$])
    Quelles sont les opérations possibles sur les vecteurs $u_i$ tels que les rangs restent les memes?
  ],
  a: [
    + $forall i, j in [|1;n|], u_i <--> u_j$
    + $forall i in [|1;n|], alpha in KK*n, u_i <-- alpha u_i$
    + $forall i!=j in [|1;n|], lambda in KK, u_i <-- u_i + lambda u_j$

    #elem_methode([
      Cela permet de se ramener au cas où les vecteurs sont échelonnés
    ])

    #elem_preuve([
      + sommes des vecteurs sont commutatives, donc on remet dans l'ordre dans le Vect
      + double inclusion des vects + expression du nouveau coefficient en fonction de l'ancien
      + double inclusion, formule de Bel
    ])
  ],
)

#custom-card(
  id: "2502181730",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos(
      [$E$ $KK$ev],
      [$f in L(E,F)$],
      [$E_0$ un supplémentaire de $Ker f$ dans $E$],
    )
    alors
  ],
  a: [
    alors $E_0$ et $Im f$ sont isomorphes et $f_(|E_0)$ induit un isomorphisme de $E_0$ sur $Im f$

    #elem_methode[
      Cette méthode de preuve pour le théorème du rang est aussi appelée théorème du rang géométrique
    ]

    #elem_preuve([
      On a $E = Ker f xor E_0$ par hypothèse, et $phi = f_(|E_0)^(|Im f) in L(E_0,Im f)$;

      mq $phi$ isomorphisme (deux doubles inclusions)
      - injective car $x in Ker f inter E_0 = {0}$ (par la restriction de phi à $E_0$) car $Ker f xor E_0$
      - puis surjective ($E_0 subset E, phi(E_0) = f(E_0) subset E = Im f$, et pour l'autre sens décomposer un $x$ par $x_(Ker f) + x_(E_0)$)
    ])
  ],
)

#custom-card(
  id: "2502181735",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [Théorème du rang],
  a: [
    #hypos([$E$ $KK$ev de dimension finie], [$F$ $KK$ev], [$f in L(E,F)$])
    alors $dim E = dim Ker f + rg f = dim Ker f + dim Im f$

    #elem_preuve([
      *Méthode 1*: utiliser une base \
      *Méthode 2*: $Ker f$ admet un supplémentaire dans $E$, $E_0$; la dimension est finie, donc $dim E_0 = dim E - dim Ker f$; de plus, $E_0$ et $Im f$ sont isomorphes, donc $dim E_0 = dim Im f$ et comme la dimension est finie $dim E_0 = dim Im f = rg f$, d'où $rg f = dim E - dim Ker f$
    ])
  ],
)

#custom-card(
  id: "2502181739",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos([$E$ $KK$ev], [$f in L(E,F)$], [$dim E = dim F$])
    alors que dire de l'injectivité/surjectivité/bijectivité de $f$?
  ],
  a: [
    On a $ f "surjective" <=> f "injective" <=> f "bijective" $

    #elem_preuve([
      *$1==>2$*: on a f surjective, donc $f(E) = F = Im f$, d'où par le théorème du rang, $dim E = Im f + dim Ker f => dim E = dim F + dim Ker f => dim Ker F = 0 => Ker f = {0_E} => f "injective"$ \
      *$2==>1:$*: on a donc $dim Ker f = 0$, d'où par le th du rang $dim Im f = dim E = dim F$, inclusion et égalité des dimensions, donc $Im f = F$, d'où $f$ surjective
    ])
  ],
)

#custom-card(
  id: "2502181743",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos([$E,F,G$ $KK$ev], [$f in L(E,F)$], [$g in L(F,G)$])
    alors
    + $Im g compose f$ *?*
    + $Ker g compose f$ *?*
  ],
  a: [
    + $Im g compose f subset Im g$
    + $Ker g compose f supset Ker f$

    #elem_preuve([
      + trivial
      + linéarité de $g$ nous done que $g(0_F) =0_G$, et trivial
    ])
  ],
)

#custom-card(
  id: "2502181746",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos(
      [$E, F, G$ $KK$ev de dimension finie],
      [$f in L(E,F)$],
      [$g in L(F,G)$],
    )
    alors
    + $rg (g compose f) <=$ *?*
    + si $f$ surjective, $rg (g compose f) =$ *?*
    + si $g$ injective, $rg (g compose f)=$ *?*
  ],
  a: [
    + $rg (g compose f) <= min(rg f, rg g)$
    + si $f$ surjective, $rg (g compose f) = rg g$
    + si $g$ injective, $rg (g compose f)= rg f$

    #elem_preuve([
      + #[
          $Im g compose f subset Im g => dim Im g compose f <= dim Im g$, càd $rg g compose f <= rg g$ \
          De plus, $Ker f subset Ker g compose f => dim Ker f <= dim Ker g compose f$ \
          Par le théorème du rang, $dim E - dim Im f <= dim E - dim Im g compose f$ donc $dim Im g compose f <= dim Im f$, d'où $rg g compose f <= rg f$
        ]
      + $f(E) = F$, donc $g compose f(E) = g(F) => Im (g compose f) = Im g => rg (g compose f) = rg g$
      + considérer $g_(|Im f)$, puis théorème du rang et $Ker g inter Im f subset Ker g$, or $dim Ker g = 0$ car g injective. d'où $dim Im f = dim g compose f(E)$, ok
    ])
  ],
)

#custom-card(
  id: "2502181755",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [Hyperplan définition],
  a: [
    #hypos([$E$ un $KK$ev], [$H$ sev de $E$])
    $H$ est un hyperplan de $E$ s'il existe $phi$ une forme linéaire non nulle telle que $ H = Ker phi $

    #elem_methode([
      En dimension finie, si $dim E = n$, comme $phi$ non nulle, $Im phi != {0}$, or $Im phi in KK$ d'où $Im phi = KK$; par le théorème du rang, $dim E = dim Im phi + dim Ker phi = 1 + dim Ker phi$ d'où *$dim Ker phi = dim E - 1 =n-1$*
    ])
  ],
)

#custom-card(
  id: "2502181758",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos([$H$ hyperplan de $E$])
    Que dire du supplémentaire de $H$?
  ],
  a: [
    Les supplémentaires de $H$ sont de *dimension 1*

    De plus, $forall u in E without H, E = H xor KK u$

    #elem_preuve([
      Si $H$ hyperplan, $exists phi in L(E,K)^*, H = Ker phi$; or grace au théorème du rang (pdv géométrique), $Im phi = KK$, donc les supplémentaires du noyau sont isomorphes à $KK$, donc de dimension 1.

      Soit $u in E without H$, on a donc $phi(u) = lambda != 0$ car $u in.not Ker phi$; on réalise ensuite une analyse synthèse en décomposant $x$, or $phi(x_H) = 0$ par définition de l'hyperplan; on montre existence et unicité
    ])
  ],
)

#custom-card(
  id: "2502181805",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos([$u in E without {0_E}$])
    alors que dire des supplémentaires de $KK u$
  ],
  a: [
    Les supplémentaires de $KK u$ sont des hyperplans

    #elem_preuve([
      Comme $KK u$ sev de $E$, il admet supplémentaire $S$; on décompose en $x = lambda_x u + x_s$ et on pose $phi " "E-->KK, phi(x) = lambda_x$; on vérifie que $phi$ est linéaire, et donc on aura bien $Ker phi = S$, d'où $S$ hyperplan
    ])
  ],
)

#custom-card(
  id: "2502181808",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos([$E$ $KK$ev de dimension finie], [$cal(B)_E=(#tpp("e"))$ base de $E$])
    alors $forall x in E$, *?*
  ],
  a: [
    $forall x in E$, *il existe une unique décomposition $x = sum_(k=1)^n x_k e_k$ avec $(#tpp("x")) in KK^n$* et les applications $ f_k " " E --> KK \ x |-> x_k $ sont appelées formes linéaires coordonnées associées à la base $E$

    $
      forall i,j in [|1;n|], f_(i)(e_j) = cases(
        1 "si" i=j,
        0 "sinon, si " i!=j
      )
    $
  ],
)

#custom-card(
  id: "2502190820",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos(
      [$E$ $KK$ev de dimension finie],
      [$cal(B)_E = (#tpp("e"))$ base de $E$],
      [$H$ sev de $E$],
    )
    Alors il y a équivalence entre:
    + $dim H =$ ?
    + $H$ est un hyperplan
    + \<équation cartésienne de l'hyperplan>
  ],
  a: [
    Il y a équivalence entre:
    + $dim H = dim E - 1$
    + $H$ est un hyperplan
    + Il existe $(#tpp("a")) in KK^n without {0_(KK^n)}$ tel que
    $ x= sum_(k=1)^n lambda_k e_k in H <=> sum_(k=1)^n a_k lambda_k = 0 $
    Une telle équation est appelée équation cartésienne de l'hyperplan dans la base $cal(B)_E$

  ],
)

#custom-card(
  id: "2502190821",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos(
      [$E$ $KK$ev de dimension finie $n$],
      [$(H_i)_(i in [|1;m|])$ $m$ hyperplans de $E$],
    )
    alors $ dim inter.big_(i=1)^m H_i " ?" $
  ],
  a: [
    alors $ dim inter.big_(i=1)^m H_i >= n-m $


    #elem_preuve([
      Prendre $(#tpp($phi$))$ formes linéaires non nulles tq $forall i in [|1;n|], Ker phi_k = H_k$; on a alors $x in inter.big_(i=1)^n H_k <=> forall k in [|1;n|], phi_k(x) = 0$; puis on introduit $Psi(x) = (phi_1(x), ...,phi_n(x))$ linéaire, puis th du rang ($Im psi subset KK^m$, donc dimension majorée, on réinsère et trouve que $dim Ker psi =dim E - dim Im psi >= n-m$)
    ])

  ],
)

#custom-card(
  id: "2502190822",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos(
      [$E$ $KK$ev de dimension finie],
      [$f, g in L(E,KK) without {0_(L(E,KK))}$],
    )
    On a $ (f,g) "liée" <=> " ?" $
  ],
  a: [
    On a $ (f,g) "liée" <=> Ker f = Ker g $

    #elem_preuve([
      #sens($==>$, hypo: $Sq (f,g) "liée"$)[
        On a alors $f = lambda g$, donc $forall x in Ker f <=> x in Ker g$, ok
      ]
      #sens($<==$, hypo: $Sq Ker f= Ker g$)[
        Alors $dim Ker f = dim Ker g = dim E - 1 = n - 1$; ainsi on peut prendre $#tpp($epsilon$, end: "n-1")$ base de $Ker f = Ker g$, qu'on complète avec $u$ en base de $E$, or $forall i in [|1;n-1|], f(epsilon_i) = g(epsilon_i) = 0$, d'où $f(u) = alpha, g(u) = beta, a,beta!=0 => g(u) = beta / alpha f(u)$; vraie sur une base, par linéarité vraie sur $E$
      ]
    ])
  ],
)

#custom-card(
  id: "2502190845",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    Polynômes de Lagrange
  ],
  a: [
    #hypos(
      [$(x_0,...,x_n) in KK^(n+1)$ un $(n+1)"-uplet"$ de scalaires deux à deux distincts],
      [$(y_0,...,y_n) in KK^(n+1)$ un $(n+1)"-uplet"$ de scalaires],
    )
    alors il existe un unique polynôme $P$ de *degré au plus $n$* tel que $ forall i in [|0;n|], P(x_i) = y_i $

    #elem_preuve[
      On a $dim KK^(n+1) = dim KK_n [X] = n +1$

      Prendre $phi in L(KK_n [X], KK^(n+1))$ (admis que cest linéaire) tel que $ phi(P) = (P(x_0),...,P(x_n)) $

      Puis justifier que c'est un isomorphisme: $dim KK_n [X] = dim KK^(n+1)$ donc par théorème du rang il suffira de démontrer que $Ker phi = {0}$, d'où n+1 racines pour polynome de degré $n$
    ]
  ],
)

#custom-card(
  id: "2502190858",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    Base d'interpolation de Lagrange
  ],
  a: [
    #hypos([$(x_0,...,x_n) in KK^(n+1)$ un $(n+1)"-uplet"$ de scalaires deux à deux distincts])
    alors la famille $(L_0,...,L_n)$ définie par $ forall i in [|0;n|], L_i (X) = product_(0<=j<=n \ j != i) (X-x_j) / (x_i - x_j) $
    est une base de $KK_n [X]$ appelée base d'interpolation de Lagrange aux points $(x_0,...,x_n)$
    Si $P$ est le polynome d'interpolation tel que $ forall i in [|0;n|], P(x_i) = y_i $
    alors $ P = sum_(k=0)^n y_k L_k $
  ],
)

#custom-card(
  id: "2503261649",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos([$E$ $KK$ev], [$f,g in L(E)$])
    alors il y a équivalence entre:
    + $f compose g = 0_L(E)$
    + ?
  ],
  a: [
    Il y a équivalence entre:
    + $f compose g = 0_L(E)$
    + $Im g subset Ker f$

    #elem_preuve[
      #sens($==>$, hypo: $"Sq" f compose g = 0_L(E)$)[
        Alors $forall y in Im g, exists x in E tq g(x) = y$ \
        Or, $f(y) = f(g(x)) = 0_L(E) = 0 => y in Ker f$
      ]
      #sens($<==$, hypo: $Sq Im G subset Ker f$)[
        Ainsi, $forall x in E, g(x) in Ker f, "donc" f(g(x)) = 0, "d'où" f compose g = 0_L(E)$
      ]
    ]
  ],
)
