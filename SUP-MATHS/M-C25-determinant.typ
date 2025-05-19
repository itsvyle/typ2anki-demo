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
  id: "2504161953",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Définition: application $p$-linéaire
  ],
  a: [
    #let col(c) = color_math(red, c)
    #hypos([$E, F$ 2 $KK$ev], [$p in NN^*$])
    Une application $f$ est $p$-linéaire si elle est linéaire en chaque composante, c'est à dire $ forall i in [|1,p|], forall (x_1,...,x_(i-1),x_(i+1),...,x_p) in E^(p-1), \ x |-> f(x_1,...,x_(i-1),col(x),x_(i+1),...,x_p) in L(E,F) $

    #elem_reformulation[
      $
        forall i in [|1,p|], forall (x_1,...,x_(i-1),x_(i+1),...,x_p) in E^(p-1), forall x, y in E, forall lambda in KK, \
        f(x_1,...,x_(i-1),col(x+lambda y),x_(i+1),...,x_p) \ = \ f(x_1,...,x_(i-1),col(x),x_(i+1),...,x_p) + col(lambda) f(x_1,...,x_(i-1),col(y),x_(i+1),...,x_p)
      $
    ]
  ],
)

#custom-card(
  id: "2504162001",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Définition: application $p$-linéaire symétrique
  ],
  a: [
    #let col(c) = color_math(red, c)
    #hypos([$E, F$ 2 $KK$ev], [$p in NN^*$])
    Une application $f$ est $p$-linéaire symétrique si elle est $p$-linéaire et que $ forall (x_1,...,x_p) in E^p, forall (i,j) in [|1,p|]^2, i!=j \
    f(x_1,...,x_(i-1),x_i,x_(i+1),...,x_(j-1),x_j,x_(j+1),...,x_p) \ =
    f(x_1,...,x_(i-1),col(x_j),x_(i+1),...,x_(j-1),col(x_i),x_(j+1),...,x_p) $

    #elem_remarque[
      On en déduit dans ce cas: $ forall sigma in S_p, f(x_1,...,x_p) = f(x_sigma(1),...,x_sigma(p)) $
    ]
  ],
)

#custom-card(
  id: "2504162004",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Définition: application $p$-linéaire antisymétrique
  ],
  a: [
    #let col(c) = color_math(red, c)
    #hypos([$E, F$ 2 $KK$ev], [$p in NN^*$])
    Une application $f$ est $p$-linéaire antisymétrique si elle est $p$-linéaire et que $ forall (x_1,...,x_p) in E^p, forall (i,j) in [|1,p|]^2, i!=j \
    f(x_1,...,x_(i-1),x_i,x_(i+1),...,x_(j-1),x_j,x_(j+1),...,x_p) \ =
    col(-)f(x_1,...,x_(i-1),col(x_j),x_(i+1),...,x_(j-1),col(x_i),x_(j+1),...,x_p) $

    #elem_remarque[
      On en déduit que $ forall sigma in S_p, f(x_1,...,x_p) = epsilon(sigma) f(x_sigma(1),...,x_sigma(p)) $
    ]
  ],
)

#custom-card(
  id: "2504162006",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Définition: application $p$-linéaire alternée
  ],
  a: [
    #let col(c) = color_math(red, c)
    #hypos([$E, F$ 2 $KK$ev], [$p in NN^*$])
    Une application $f$ est $p$-linéaire alternée si elle est $p$-linéaire et que $ forall (x_1,...,x_p) in E^p, forall (i,j) in [|1,p|]^2, i!=j tq x_i = x_j \
    "alors" f(x_1,...,x_p) = 0 $

    #elem_reformulation[
      Si $p$-linéaire et que deux fois le meme vecteur alors nulle
    ]
  ],
)

#custom-card(
  id: "2504162012",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Soit $f$ une application $p$-linéaire sur $E^p$ à valeurs dans $F$, avec 2 inversible ($KK$ pas de caractéristique $2$), alors $ "?" $
  ],
  a: [
    #let col(c) = color_math(red, c)
    Alors $ f "antisymétrique" <=> f "alternée" $

    #elem_preuve[
      #sens($==>$, hypo: [Sq $f$ antisymétrique])[
        Soient $(x_1,...,x_p) in E^p, forall (i,j) in [|1,p|]^2, i!=j, "et" x_i = x_j$

        $ f(x_1...x_i...x_j...x_p) = col(-) f(x_1...col(x_j)...col(x_i)...x_p) \ = col(-) f(x_1...col(x_i)...col(x_i)...x_p) $ d'où $2f(x_1,...,x_p) = 0$

        On divise par $2$, possible si $2$ inversible, et on trouve que $f$ est alternée
      ]
      #sens($<==$, hypo: [Sq $f$ $p$-linéaire alternée])[
        Soient $(x_1,...,x_p) in E^p, forall (i,j) in [|1,p|]^2, i!=j$

        $
          & f(x_1,...,x_i + x_j,...,x_j + x_i,...,x_p) = 0 <- "f alternée" \
          & "par linéairité de la i-ème variable" \
          & = f(x_1,...,x_i,...,x_j + x_i,...,x_p) + f(x_1,...,x_j,...,x_j + x_i,...,x_p) = 0 \
          & = f(x_1,...,x_i,...,x_j,...,x_p) + f(x_1,...,x_j,...,x_i,...,x_p) \
          &+ underbrace(f(x_1,...,x_i,...,x_i,...,x_p), "alternée, = 0") + underbrace(f(x_1,...,x_j,...,x_j,...,x_p), "alternée, = 0") = 0 \
          &=> f(x_1,...,x_i,...,x_j,...,x_p) = - f(x_1,...,x_j,...,x_i,...,x_p) \
          &<=> f "antisymétrique"
        $
      ]
    ]
  ],
)

#custom-card(
  id: "2504162028",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Soit $f$ application $p$-linéaire alternée de $E^p$ dans $F$, on a:
    + Si $(x_1,...,x_p) in E^p$ contient deux fois le meme vecteur, alors $f(x_1,...,x_p) = "?"$
    + Si $(x_1,...,x_p) in E^p$ est liée, alors $f(x_1,...,x_p) = "?"$
  ],
  a: [
    Soit $f$ application $p$-linéaire de $E^p$ dans $F$, on a:
    + Si $(x_1,...,x_p) in E^p$ contient deux fois le meme vecteur, alors $f(x_1,...,x_p) = 0_F$
    + Si $(x_1,...,x_p) in E^p$ est liée, alors $f(x_1,...,x_p) = 0_F$

    #elem_preuve[
      #sens($1$)[Définition]
      #sens($2$)[
        Soient $(x_1,...,x_p) in E^p$ $p$ vecteurs liés, il existe $i in [|1,p|], (lambda_1,...,lambda_(i-1),lambda_(i+1),...,lambda_p) in KK^(p-1)$ tq $ x_i = summ(s: 1 <= k <= p \ k!= i, lambda_k x_k) $

        $
          f(x_1,...,x_i,...,x_p) = f(x_1,...,summ(),...,x_p) \ = summ(#$$) underbrace(f(x_1,...,x_k,...,x_p), =0_F) = 0
        $

        (le contenu de la somme est égal à 0 pour tout $k$ car comme on ne passe pas par $i$, on passe toujours par 2 fois le meme vecteur)
      ]
    ]
  ],
)

#custom-card(
  id: "2504162035",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Définition: déterminant
  ],
  a: [
    Soit $E$ $KK$ev de dimension $n$, et $BBB = (tpp(e))$ une base de $E$, alors il existe une unique forme $n$-linéaire antisymétrique définie sur $E^n$, notée $det_BBB$ telle que $ det_BBB (tpp(e)) = 1 $

    On a de plus que si $(tpp(u)) in E^n$, avec $forall j in [|1,n|]$, $ Mat(BBB, u_j) = mat(x_(1 i); dots.v; x_(n j)) $ alors $ det_BBB (tpp(u)) = summ(s: sigma in S_n, epsilon(sigma) x_(sigma(1) 1) x_(sigma(2) 2) times ... times x_(sigma(n) n)) $

    #elem_preuve[
      TODO
    ]
  ],
)

#custom-card(
  id: "2504181800",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    #hypos([$E$ $KK$ev de dimension $n$])
    Que dire de l'ensemble des formes linéaires sur $E$?
  ],
  a: [
    L'ensemble des formes linéaires sur $E$ est sous espace vectoriel de $FFF(E^n, KK)$ de dimension 1 - une droite vectorielle

    #elem_preuve[
      #sens([Si $f(tpp(e)) = alpha != 0$])[
        On prendre $dis(tilde(f) = 1 / alpha f)$, et on aura $tilde(f)(tpp(e)) = 1$, et $f$ $n$-linéaire antisymétrique, donc par unicité du déterminant, $tilde(f) = det_BBB, ==> f = alpha det_BBB$, d'où $ f in Vect(det_BBB) $
      ]
      #sens([Si $f(tpp(e)) = 0$])[
        Pour $(tpp(u)) in E^n$ avec $forall j, Mat(BBB, u_j) = mat(x_(1 j); dots.v; x_(n j))$, $ f(tpp(u)) = summ(s: sigma in S_n) epsilon(sigma) x_(sigma(1) 1)...x_(sigma(n) n) $
        Or, $f(tpp(e)) = 0$, donc on a $f = 0 times det_BBB$
      ]
    ]
  ],
)

#custom-card(
  id: "2504181807",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Définition: déterminant d'une matrice carrée
  ],
  a: [
    On définit le déterminant d'une matrice carrée comme le déterminant de ses colonnes dans la base canonique.

    #elem_remarque[
      On vera plus tard que $forall m in mm(), det(M) = det(M^T)$, donc c'est aussi le déterminant des lignes dans la base canonique
    ]

    #elem_exemple[
      $
        det(861 I_n) &= det_(BBB_c (KK^n)) (mat(861; 0; dots.v; 0),mat(0; 861; dots.v; 0),dots.h,mat(0; dots.v; 0; 861))
        \ &= (861)^n det_(BBB_c (KK^n)) (mat(1; 0; dots.v; 0),mat(0; 1; dots.v; 0),dots.h,mat(0; dots.v; 0; 1)) \
        &= 861^n
      $
    ]
  ],
)

#custom-card(
  id: "2504181812",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Déterminant d'une matrice de dimension 2
  ],
  a: [
    $ det mat(a, b; c, d) = a d - b c $

    #elem_preuve[
      $
        &det mat(a, b; c, d) = det (mat(a; c),mat(b; d)) \ &= a det(mat(1; 0), mat(b; d))
        + c det(mat(0; 1), mat(b; d)) \
        &= underbrace(a b det(mat(1; 0), mat(1; 0)), =0 "par antisymétrie") + underbrace(a d det(mat(1; 0), mat(0; 1)), =1) + underbrace(c b det(mat(0; 1), mat(1; 0)), =-det(mat(1, 0; 0, 1)) = -1) \ &+ underbrace(c d det(mat(0; 1), mat(0; 1)), =0) \
        &= a d - b c
      $
    ]
  ],
)

#custom-card(
  id: "2504181820",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    == Déterminants calculables directement
    Quel est le déterminant:
    + D'une matrice diagonale
    + D'une matrice carrée dont 2 des vecteurs colonne sont égaux
    + D'une matrice dont les colonnes sont liées
    + D'une matrice de permutation
    + D'une matrice de dilatation
    + D'une matrice de transvection
  ],
  a: [
    + #[D'une *matrice diagonale*: c'est le produit des éléments de sa diagonale]
    + #[D'une matrice carrée dont 2 des vecteurs colonne sont égaux $ det M = 0 $]
    + #[D'une matrice dont les colonnes sont liées $ det M = 0 $]
    + #[D'une matrice de permutation $ det P_(i j) = -1 $]
    + #[D'une matrice de dilatation $ det D_(i) (alpha) = alpha $]
    + #[D'une matrice de transvection $ det T_(i j) (lambda) = 1 $]
  ],
)

#custom-card(
  id: "2504181821",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    #hypos([$M in mm()$], [$alpha in KK$])
    $ det(alpha M) = "?" $
  ],
  a: [
    #hypos([$M in mm()$], [$alpha in KK$])
    $ det(alpha M) = alpha^n det(M) $
  ],
)

#custom-card(
  id: "2504181826",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Géométriquement, qu'est le déterminant?
  ],
  a: [
    - En dimension 2: $det(arw(u), arw(v))$ est l'aire du parallélogramme porté par $arw(u)$ et $arw(v)$
    - En dimension 3, $det(arw(u), arw(v), arw(w))$ est le volume de parallépipède porté par $arw(u), arw(v), "et" arw(w)$

    #elem_remarque[
      Ce sont des aires algébriques, donc elles peuvent etre négatives si la famille de vecteurs n'est pas dans le sens direct.
    ]
  ],
)



#custom-card(
  id: "2504181829",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Soit $M in mm()$, $ M = mat(lambda, (*), dots.h, (*); 0, , ; dots.v, , M', ; 0, , ; augment: #(hline: 1, vline: 1)) "ou" mat(, , , (*); , M', , dots.v; , , , (*); 0, dots.h, 0, lambda; augment: #(hline: 3, vline: 3)) $ où $M' in mm(n-1)$
    alors $ det (M) = "?" $
  ],

  a: [
    #let mat2(ea) = {
      $
        mat(, , , (*); , M', , dots.v; , , , (*); 0, dots.h, 0, ea; augment: #(hline: 3, vline: 3))
      $
    }
    alors $ det (M) = lambda det(M') $

    #elem_preuve[
      Cas $ M = mat2(lambda) $

      $ det M = underbrace(det mat2(0), =0) + lambda det mat2(1) $

      Considérons #math_function($ phi $, $ mm(n-1) $, $ KK $, $ M' $, $ det mat2(1) $)

      $phi$ est $(n-1)$-linéaire et antisymétrique, $phi in Vect(det_(BBB_C (KK^(n-1))))$, donc $phi = alpha det_(BBB_C (KK^(n-1)))$

      En évaluant en $M' = I_(n-1)$,$ phi(I_(n-1)) = det I_n = 1 = alpha det I_(n-1) = alpha $ donc $alpha=1$

      d'où $ det M = lambda det mat2(1) = lambda det M' $
    ]
  ],
)

#custom-card(
  id: "2504211133",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Que dire du déterminant d'une matrice triangulaire?
  ],
  a: [
    Le déterminant d'une matrice triangulaire est le produit de ses éléments diagonaux

    #elem_preuve[
      Corollaire de la proposition précédente
    ]
  ],
)

#custom-card(
  id: "2504211135",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Soit $M'$ une matrice obtenue d'une matrice $M$ par une opération élémentaire sur ses colonnes, alors $ det M' = cases(
      "?" "si permutation",
      "?" "si dilatation de rapport" alpha != 0,
      "?" "si transvection de rapport" lambda
    ) $
  ],
  a: [
    Soit $M'$ une matrice obtenue d'une matrice $M$ par une opération élémentaire sur ses colonnes, alors $ det M' = cases(
      -det M "si permutation",
      alpha det M "si dilatation de rapport" alpha != 0,
      det M "si transvection de rapport" lambda
    ) $

    #elem_preuve[
      #sens("Permutation", hypo: [$M'$ obtenue par $C_i <--> C_j, i != j$])[$
          det M' & = det (C_1 (M'),...,C_n (M'))                             \
                 & = det(C_1 (M), ..., C_j (M), ..., C_i (M), ..., C_n (M))  \
                 & = -det(C_1 (M), ..., C_i (M), ..., C_j (M), ..., C_n (M)) \
                 & = - det M                                                 \
        $
      ]
      #sens("Dilation", hypo: [$M'$ obtenue par $C_i <- alpha C_i$, $alpha!=0$])[$
          det M' & = det (C_1 (M'),...,C_n (M'))                    \
                 & = det(C_1 (M), ..., alpha C_i (M), ..., C_n (M)) \
                 & = alpha det(C_1 (M), ..., C_i (M), ..., C_n (M)) \
                 & = alpha det M                                    \
        $]
      #sens("Transvection", hypo: [$M'$ obtenue par $C_j <- C_j + lambda C_i$])[$
          det M' &= det (C_1 (M'),...,C_n (M')) \
          &= det(C_1 (M), ..., C_i (M), ..., C_j (M) + lambda C_i (M), ..., C_n (M)) \
          &= det(C_1 (M), ..., C_i (M), ..., C_j (M), ..., C_n (M)) \ &+ lambda det(C_1 (M), ..., C_i (M), ..., C_i (M), ..., C_n (M)) \
          &= det M
        $]
    ]
  ],
)

#custom-card(
  id: "2504211153",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Soit $M in mm()$, il a équivalence entre:
    + $M$ inversible
    + <\Que dire du déterminant de $M$>
  ],
  a: [
    Soit $M in mm()$, il a équivalence entre:
    + $M$ inversible
    + $det M != 0$

    #elem_preuve[
      #sens($not 1 ==> not 2$)[
        Si $M$ n'est pas inversible, alors ses colonnes sont liées, donc $det M = 0$ ok!
      ]
      #sens($1 ==> 2$, hypo: [Supposons $M$ inversible])[
        Donc les colonnes de $M$ forment une base $BBB = (tpp(epsilon))$, et il existe une application linéaire $n$-linéaire antisymétrique sur $(KK^n)^n$ telle que $f(tpp(epsilon)) = 1$

        $f in Vect(det_(BBB_C (KK^n)))$ car c'est une droite vectorielle, donc $f = alpha det_(BBB_C (KK^n)), alpha in KK$

        Or $f(C_1 (M),...,C_n (M)) = 1 = alpha det M$ donc $det M != 0$
      ]
    ]
  ],
)

#custom-card(
  id: "2504211200",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Soient $M, N in mm()$
    $ det (M N) = "?" $
  ],
  a: [
    $ det (M N) = det (M) det(N) $

    #elem_preuve[
      Si $M$ non-inversible, alors $M N$ non inversible et $det (M N) = 0 = det(M) det(N)$ ok!

      Si $M$ inversible, on prend #math_function($ phi $, $ mm() $, $ KK $, $ N $, $ det(M N) / det(M) $)

      $phi$ est $n$-linéaire antisymétrique par rapport aux colonnes de $N$

      $phi in Vect(det)$, donc $phi = alpha det$, $alpha in KK$

      $phi(I_n) = alpha det (I_n) = alpha = det(M I_n) / det(M) = 1$

      d'où $forall N in mm(), phi(N) = det(N) = det(M N) / det(M)$ CQFD
    ]
  ],
)

#custom-card(
  id: "2504211208",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Soit $M in GL_n (KK)$ une matrice inversible, alors $ det(M^(-1)) = "?" $
  ],
  a: [
    $ det(M^(-1)) = 1 / det(M) $

    #elem_preuve[
      Si $M$ inversible, $ 1 = det(I_n) = det(M times M^(-1)) = det (M) det(M^(-1)) $ ok!
    ]
  ],
)

#custom-card(
  id: "2504211212",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Soit $M in mm()$, alors $ det(M^T) = "?" $
  ],
  a: [
    Soit $M in mm()$, alors $ det(M^T) = det (M) $

    Ainsi, le déterminant d'une matrice est $n$-linéaire antisymétrique par rapport aux colonnes et par rapport aux lignes.

    On notera ainsi le déterminant de la matrice $M$ $ det M = dett(m_(1 1), dots.h, m_(1 n); dots.v, , dots.v; m_(n 1), dots.h, m_(n n)) $

    #elem_preuve[
      Si $M$ est non-inversible, $M^T$ non plus, et donc $det M = 0 det M^T$ ok

      Supposons $M$ inversible; alors on peut décomposer $M$ en produit de matrices d'opérations élémentaires: $M = tpp(P, end: k)$

      - Si $P$ est une transvection $T_(i j) (lambda)$, $T_(i j) (lambda)^T = T_(j i) (lambda)$ et $det (T_(i j) (lambda)) = 1 = det (T_(j i) (lambda))$
      - Si $P$ est une dialation ou une permutation, $P = P^T$ car les matrices sont symétriques, donc égalité des déterminants

      $ M^T = (tpp(P, end: k))^T= P_k^T...P_1^T $ donc ok
    ]
  ],
)

#custom-card(
  id: "250423",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Définition: déterminant d'un endomorphisme
  ],
  a: [
    Soit $f$ un endomorphisme d'un $KK$ev $E$ de dimension finie $n$ et $BBB$ une base de $E$, alors $ det(Mat(BBB, f)) $ est une quantité indépendante du choix de la base, et on l'appelera déterminant de l'endomorphise $f$, noté $det(f)$

    #elem_preuve[
      Soient $BBB_1,BBB_2$ 2 bases de $E$ $ Mat(BBB_1, f) = (Mat(BBB_2, BBB_1, Id))(Mat(BBB_2, f))(Mat(BBB_1, BBB_2, Id)) $

      $M_1 = P M_2 P^(-1)$
      donc $ det(M_1) & = det(P M_2 P^(-1))            \
               & = det(P) det(M_2) det(P^(-1))  \
               & = det (P) det(P^(-1)) det(M_2) \
               & = det(P P^(-1)) det(M_2)       \
               & = det (M_2) "CQFD"             \ $
    ]
  ],
)

#custom-card(
  id: "2504231220",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Déterminant d'une symétrie
  ],
  a: [
    Soit $s$ une symétrie d'un $KK$ev $E$ de dimension $n$

    On a $E = F xor G$, et $s$ symétrie par rapport à $F$ parallèlement à $G$, alors $ det(s) = (-1)^dis(dim G) $

    #elem_preuve[
      On prend une base adaptée à $F xor G$
      $
        BBB = (underbrace(e_1\,...\,e_p, "base de" F),underbrace(e_(p+1)\,...\,e_n, "base de" G))
      $

      $
        Mat(BBB, s) = mat(
          1;
          , dots.down, , , (0);
          , , 1;
          , , , -1;
          , (0), , , dots.down;
          , , , , , -1;
          augment: #(hline: 3, vline: 3)
        )
      $
      donc $ det (s) = (-1)^dis(n-p) $
    ]
  ],
)



#custom-card(
  id: "2505081139",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Définition: cofacteur d'indice $(i,j)$ (et comatrice)
  ],
  a: [
    On note $M(i,j)$ la sous matrice obtenue de $M$ en enlevant la $i$-ème ligne et la $j$-ème colonne
    
    On appelle cofacteur d'indices $(i,j)$ la quantité $ Delta_(i,j) = (-1)^(i+j) det(M(i,j)) $

    La comatrice est la matrice des cofacteurs: $ com(M) = mat( Delta_(1,1),dots.h, Delta_(1,n);dots.v,,dots.v; Delta_(n,1),dots.h, Delta_(n,n)) $
  ]
)

#custom-card(
  id: "2505081142",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Déterminant de Vandermonde
  ],
  a: [
    #let col(c) = color_math(blue, c)
    Soient $(tpp(a)) in KK^n$ et $ M_n = mat(1,a_1,...,a_1^(n-1);1,a_2,...,a_2^(n-1);dots.v,,dots.v;1,a_n,...,a_n^(n-1);) $

    $ det M = prodd(var: dis(1 <= i < j <= n), (a_j - a_i)) $
    
    $-->$ $forall i!=j$, $a_i = a_j ==> det M = 0$ (deux fois la meme ligne), ce qui correspond à la formule


    #elem_methode[
      Si une matrice est proche d'une matrice de Vandermonde, on pourra rajouter des lignes et des colonnes pour obtenir une matrice de Vandermonde, puis récupérer le det initial par rapport en factorisant par le paramètre ajouté sur la ligne et la colonne ajoutées
    ]

    #elem_exemple[
      $ dett(
        1,a,a^2,a^3,a^4;
        1,b,b^2,b^3,b^4;
        1,c,c^2,c^3,c^4;
        1,d,d^2,d^3,d^4;
        1,e,e^2,e^3,e^4;
      ) \ = &(e-d)(e-c)(e-b)(e-a) \ &(d-c)(d-b)(d-a) \ &(c-b)(c-a) \ &(b-a) $
    ]

    #elem_preuve[
      Par récurrence
  
      #sens("Initialisation")[
        Pour $n=1$, on a $M_1 = (1)$, $det M_1 = 1$ (le produit est vide)

        Pour $n=2$, on a $M_2 = mat(1,a_1;1,a_2)$ et $det M_2 = a_2 - a_1$ ok
      ]

      #sens("Hérédité",hypo: [pour $n in NN^*$ et $(tpp(a)) in KK^n$])[
        Supposons det $M_n = prodd(var: 1 <= i < j <= n)$

        On a $ det M_(n+1) = dett(
          1,a_1,dots.h,a_1^(n-1),col(a_1^n);
          dots.v,,,dots.v,dots.v;
          1, a_n, dots.h,a_n^(n-1),col(a_n^n);
          col(1),col(a_(n+1)),dots.h,col(a_(n+1)^(n-1)),col(a_(n+1)^n)
        )
        $

        Posons $ P = X^n + summ(var: k,s: 0,e: n-1,lambda_k X^k) $
        polynome unitaire auxiliaire

        On applique $ C_(n+1) <- C_(n+1) + lambda_0 C_1 + ... + lambda_(n-1) C_n $

        Ainsi, le coefficient de la $i$-ème ligne, $(n+1)$ colonne, $ a_(i)^n + summ(lambda_k a_i^k) = P(a_i) $ d'où 
        $ det M_(n+1) = dett(
          1,a_1,dots.h,a_1^(n-1),col(P(a_1));
          dots.v,,,dots.v,dots.v;
          1, a_n, dots.h,a_n^(n-1),col(P(a_n));
          col(1),col(a_(n+1)),dots.h,col(a_(n+1)^(n-1)),col(P(a_(n+1)))
        )
        $
        On cherche à avoir que des $0$ dans la dernière colonne: \ $P=(X-a_1)...(X-a_n)$ convient (car $P$ est un polynome unitaire), d'où 
        $ det M_(n+1) = dett(
          1,a_1,dots.h,a_1^(n-1),col(0);
          dots.v,,,dots.v,dots.v;
          1, a_n, dots.h,a_n^(n-1),col(0);
          col(1),col(a_(n+1)),dots.h,col(a_(n+1)^(n-1)),col(P(a_(n+1)))
        )
        $

        On développe par rapport a la dernière colonne: $ det M_(n+1) = P(a_(n+1)) det(M_n) &= product_(k=1)^n (a_(n+1) - a_k) prodd() \ &= prodd(var: 1<=i<j<=n+1) $
      ]
    ]
  ]
)

#custom-card(
  id: "2505081203",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Soit $M$ in $mm()$, alors $ M com(M)^T = com(M)M^T = "?" $
  ],
  a: [
    #let col(c) = color_math(red, c)
    Soit $M$ in $mm()$, alors $ M com(M)^T = com(M)M^T = det(M) I_n $


    #elem_remarque[
      Pas vraiment utilité dans la pratique, résultat théorique (il faut calculer $n$ déterminants de taille $n-1$)
    ]
    
    #elem_preuve[
      Soit $j in [|1,n|]$. Considérons #math_function($ phi_i $,$ KK^n $,$KK$,$ X $,$ det(C_1(M),...,C_(j-1)(M),X,C_(j+1)(M),C_n (M)) $,arw_size: 20pt)

      pour $i in [|1,n|]$ $ phi_j (C_i (M)) = cases(
        det(C_1,...,C_n) = det M "si" i=j,
        0 "si" i!=j "car deux fois le meme vecteur"
      ) $

      par un développelement par rapport à la j-ème colonne:
      $ X = mat(x_1;dots.v;x_n) ==> & det(C_1,...,C_(j-1),X,C_(j+1),C_n) \ &= summ(var: k,s: 1,e: n) x_k Delta_(k,j) (M) $

      Pour $(i,j) in [|1,n^2|]$ $ (M com(M)^T)_(i j) &= summ()m_(i k) (com(M)^T)_(k j) 
      \ &= underbrace(summ()m_(i k) com(M)_(j k),"on a mis la ligne" i "sur la ligne" j)

      \ = dett(
        m_(1 1),dots.h,m_(1,n);
        dots.v,,dots.v;
        m_(j-1,1),dots.h,m_(j-1,n);
        m_(col(i),1),dots.h,m_(col(i),n);
        m_(j+1,1),dots.h,m_(j+1,n);
        dots.v,,dots.v;
        m_(n 1),dots.h,m(n n);
        augment: #(hline: (3,4))
      )

      &= det(mat(L_1(M);dots.v;L_(j-1)(M);L_i (M);L_(j+1)(M);dots.v;L_n (M))) 
      \ = cases(
        det(M) "si" i=j,
        0 "si" i!=j
      )
      $

      donc #resultb[$ (M com(M)^T) = mat(
        det(M),,(0);
        ,dots.down,;
        (0),,det(M)
      ) $]
    ]
  ]
)

#custom-card(
  id: "2505081220",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Si $M in GL_n (KK)$ alors $ M^(-1) = "<par rapport à comatrice>" $
  ],
  a: [
    Si $M in GL_n (KK)$ alors $ M^(-1) = 1/(det M) com(M)^T $

    #elem_preuve[
      $M in GL_n (KK) <=> det M != 0$

      Or $M com(M)^T = det(M) I_n$
      donc, en divisant par $det M$ et en multipliant par $M^(-1)$ $ 1/(det M) com(M)^T = M^(-1) $
    ]
  ]
)

#custom-card(
  id: "2505081222",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    L'application 
    #math_function($ phi $,$ GL_n (RR) $,$ GL_n (RR) $,$ M $, $ M^(-1) $)
    est continue par rapport à ?
  ],
  a: [
    L'application 
    #math_function($ phi $,$ GL_n (RR) $,$ GL_n (RR) $,$ M $, $ M^(-1) $)
    est continue par rapport à *chaque coefficient de $M$*

    #elem_reformulation[
      C'est à dire que si on fixe toutes les variables sauf une, c'est continu aux endroits où c'est défini ($<=>$ aux endroits où c'est inversible)
      #math_function($ f $,$ RR $,$ GL_n (KK) $,$ x $,$ 
        mat(m_(1 1),dots.h,dots.h,dots.h,m_(1 n);
        dots.v,,,,dots.v;
        dots.v,,x,,dots.v;
        dots.v,,,,dots.v;
        m_(n 1),dots.h,dots.h,dots.h,m_(n n)
        )
      $)
      est continue aux endroits où elle est définie
    ]

    #elem_preuve[
      car pour $(i,j) in [|1,n^2|]$, $ m_(i j) |-> 1/(det M) com(M)^T $ est continue car les coefficients sont des fractions rationelles
    ]
  ]
)

#custom-card(
  id: "2505081228",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Soit $A$ un anneau commutatif, on considère $MMM_n (A)$ l'anneau des matrices à coefficients dans $A$. 

    Les inversibles de $(MMM_n (A),+,times)$ vérifient: ?
  ],
  a: [
    #let mma = $MMM_n (A)$
    Soit $A$ un anneau commutatif, on considère $mma$ l'anneau des matrices à coefficients dans $A$. 

    Les inversibles de $(mma,+,times)$ vérifient: $ (mma)^times = {M; M in mma and det(M) in A^times} $

    #elem_reformulation[
      Les inversibles de l'anneau $mma$ sont les matrices dont le déterminant est inversible dans $A$
    ]

    #elem_preuve[
      Par double inclusion
      
      #sens($subset$,hypo: [Soit $M in (mma)^times$])[
        $ ==> exists M' in mma tq M M' = I_n $
        $ ==> det(M M') = 1 = det(M) det(M') $
        donc $det(M)$ est inversible, ok!
      ]
      #sens($supset$,hypo: [Sq $det M in A^times$])[
        comme $M com(M)^T = det(M) I_n$, on a, car $det M$ est inversible, $ com(M)^T det(M)^(-1) = I_n $
        donc $det(M)^(-1) com(M)^T$ est l'inversible de $M$, ok!
      ]
    ]
  ]
)

#custom-card(
  id: "2505081233",
  target-deck: "M_SUP_C25_DETERMINANT",
  q: [
    Soit $M in MMM_n (#color_math(red,$ZZ$))$, $ M "inversible" <=> "?" $
  ],
  a: [
    Soit $M in MMM_n (#color_math(red,$ZZ$))$, $ M "inversible" <=> det M = 1 "ou" -1 $

    #elem_reformulation[
      Une matrice d'entiers est inversible si et seulement si son déterminant est $1$ ou $-1$
    ]

    #elem_preuve[
      Corollaire de la proposition $ (MMM_n (ZZ))^times = {M; M in MMM_n (ZZ) and det(M) in A^times} $
    ]
  ]
)

