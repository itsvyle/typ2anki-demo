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
  id: "2504031015",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Définition: série
  ],
  a: [
    On appelle série une suite $(S_n)$ de la forme $ forall n in NN, S_n = #summ(s: 0, e: $n$, var: $k$, $u_k$) $
    où $(u_n)$ est une suite à valeurs dans $KK$ (=$RR$ le plus souvent, ou $CC$)

    Le terme $(u_n)$ est appelé *terme général de la suite*.

    On appelle *somme partielle* de la série le terme $ S_n = summ(u_k) $
    #elem_reformulation[
      Une série est une suite de sommes partielles
    ]

    On dit que la série converge si la suite $(S_n)$ converge, et on notera $ sum_(k=0)^(+oo) u_k $ cette suite.

    En cas de convergence, on notera le reste de cette série $(R_n)$
    $ R_n = (sum_(k=0)^(+oo) u_k) - S_n = sum_(k=n+1)^(+oo) u_k $

    #elem_methode[
      - On notera parfois $sum u_n$ "la série de terme général $u_n$"
      - On notera parfois TG le "terme général"
      - On notera parfois CV (resp. DV) "converge" (resp. "diverge") (ou un terme de la meme famille)
    ]

    #elem_exemple[
      + #[
          Soit $(u_n)$ suite arithmétique \
          $u_n = alpha + beta n$
          $ S_n = summ(u_k) = (n+1)alpha + n(n+1)beta $
          converge ssi $alpha = beta = 0$
        ]
      + #[
          Soit $(u_n)$ suite géométrique de raison $q != 1$ \
          $u_n = u_0 dot q^n$
          $ S_n = summ(u_k) = (1-q^(n+1)) / (1-q) u_0 $
          converge ssi $u_0 = 0$ ou *$abs(q) < 1$*, et $ #summ(e: $+oo$, $u_k$) = u_0 / (1-q) $

          et alors $ R_n =u_0 / (1-q) - u_0 #summ(e: $n$, $q^k$) = u_0 q^(n+1) / (1-q) $
        ]
      + #[
          $ u_n = 1 / ((n+1)(n+3)) $
          On fait déomposition en éléments simples:
          $ 1 / ((n+1)(n+3)) = 1 / 2(1 / (k+1) - 1 / (k+3)) $
          Puis on fait un téléscopage
        ]
    ]
  ],
)

#custom-card(
  id: "2504031053",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Soit $(u_n)$ le terme général d'une série convergente \
    Que dire de la convergence de $(u_n)$ ?
  ],
  a: [
    Alors $ u_n #limm(var: $n$, val: $+oo$) 0 $

    Si $u_n$ ne tend pas vers $0$, on dit que la *série diverge grossièrement*

    #elem_preuve[
      Sq $S_n = #summ(var: $k$, s: $0$, e: $n$, $u_k$)$ CV vers $l in RR$ \
      donc on a $u_n = S_n - S_(n-1)$ donc par opérations sur les limites
      #resultb[
        $ u_n limm() l - l = 0 $
      ]
    ]

    #elem_remarque[
      C'est une condition nécessaire, mais loin d'etre suffisante
    ]
  ],
)

#custom-card(
  id: "2504031111",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Soit $(u_n)$ une suite, alors il y a équivalence entre:
    + La suite $(u_n)$ converge
    + La série de terme général ? converge
  ],
  a: [
    Il y a équivalence entre:
    + La suite $(u_n)$ converge
    + La série de terme général $u_(n+1) - u_n$ converge

    #summ(s: 0, var: $k$, e: $n$, "")
    #limm(var: $n$, val: $+oo$, silent: true)

    #elem_preuve[
      #sens($1==>2$, hypo: [Sq la suite $(u_n)$ converge])[
        Soit $(v_n) = (u_(n+1)-u_n)$ \
        On a alors $ summ(v_k) = summ(u_(k+1) - u_k) = u_(n+1) - u_0 limm() l in RR $ \
        donc la série de TG $(u_n)$ converge
      ]
      #sens(
        $2<==1$,
        hypo: [Sq $(S_n)$ de terme général $(v_n)$ converge vers $l_1 in RR$],
      )[
        On a $ summ(e: n-1, v_k) = u_n - u_0 $ \
        donc $ u_n = (summ(v_k)) + u_0 limm() l_1 + u_0 $
        donc converge
      ]
    ]
  ],
)

#custom-card(
  id: "2504031125",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Soit une série à terme général *positif réels*, alors il y a équivalence entre:
    + La série converge
    + \<que dire des sommes partielles>
  ],
  a: [
    Il y a équivalence entre:
    + La série converge
    + Les sommes partielles de la série sont majorées

    #summ(s: 0, var: $k$, e: $n$, "")
    #limm(var: $n$, val: $+oo$, silent: true)

    #elem_preuve[
      #sens(
        $1==>2$,
        hypo: [$(u_n) in (RR^+)^NN$ tq la série de TG $u_n$ converge],
      )[
        On a donc $ (summ(u_k))_(n in NN) $ converge donc bornée donc majorée
      ]

      #sens(
        $2==>1$,
        hypo: [Sq $(u_n) in (RR^+)^NN$ et $(summ(u_k))_(n in NN)$ majorée],
      )[
        On a $ S_n = summ(u_k) "vérifie" S_(n+1) = S_n - u_(n+1) >= 0 $ pour tout $n$, donc la suite des sommes partielles est croissante majorée, donc converge
      ]
    ]
  ],
)

#custom-card(
  id: "2504031130",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Inégalité entre termes généraux de séries ($u_n <= v_n$)
  ],
  a: [
    Soient deux séries à TG *réels positifs* respectifs de $u_n$ et $v_n$ tel que $ forall n, u_n <= v_n $
    Alors:
    + La série $sum v_n$ converge $==>$ La série $sum u_n$ converge
    + La série $sum u_n$ diverge $==>$ La série $sum v_n$ diverge

    #elem_remarque[
      On peut se contenter de ces hypothèses:
      - $u_n <= v_n$ à partir d'un certain rang
      - les termes généraux sont positifs à partir d'un premier rang
    ]

    #elem_preuve[
      #underline[Preuve de 1]

      Sq la série de TG $v_n$ converge, donc $ exists M in RR^+ tq forall n in NN, summ(var: k, s: 0, e: n, v_k) <= M \ "d'où" \ forall n, summ(u_k) <= summ(v_n) <= M $

      Les sommes partielles de la série de TG $u_n$ sont majorées et $(u_n) in (RR^+)^NN$ donc $sum u_n$ converge
    ]
  ],
)

#custom-card(
  id: "2504031629",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Comparaison série-intégrale
  ],
  a: [
    === Comparaison série-intégrale
    #hypos([$f$ une fonction continue monotone sur $RR^+$])
    On a $forall n in NN$
    + si $f$ décroissante $ integral_1^(n+1) f(t) dif t <= summ(var: k, s: 1, e: n, f(k)) <= integral_0^n f(t) dif t $
    + si $f$ croissante $ integral_0^(n) f(t) dif t <= summ(var: k, s: 1, e: n, f(k)) <= integral_1^(n+1) f(t) dif t $

    #elem_methode[
      Les bornes inférieures/supérieures peuvent etre différentes, en fonction de si on part de 1 ou pas; par exemple, ceci est un encadrement valide par une comparaison série intégrale
      $
        & inte(var: t, a: 1, b: n, ln(t)) <= summ(var: k, s: 2, e: n, ln k) <= inte(a: 2, b: n+1)
      $
    ]

    #elem_remarque[
      C'est bien représenté graphiquement:
      #import cetz-plot: plot
      #import draw: content
      #let PLOT(
        x: $x$,
        y: $y$,
        x-step: none,
        y-step: none,
        size: (4, 3),
        ..a,
      ) = {
        $
          #canvas({
            plot.plot(x-label: x, y-label: y, x-tick-step: x-step, y-tick-step: y-step, size: size, axis-style: "school-book", ..a)
          })
        $
      }

      #let area(l: 10pt, ..s) = tiling(size: (l, l))[
        #let p = (start: (0%, 0%), end: (100%, 100%))
        #place(line(..p, ..s))
        #place(dx: 1pt, dy: -l + 1pt, line(..p, ..s))
        #place(dx: -1pt, dy: -1pt + l, line(..p, ..s))
      ]
      #PLOT(x: none, y: none, x-ticks: ((0.5, $k-1$), (1, $k$), (1.5, $k+1$)), {
        import plot: *
        import calc: *
        let k = (stroke: black)
        let b = (stroke: blue)
        let r = (stroke: red)

        add(domain: (0, 2), style: k, x => exp(-x))
        add-vline(style: r, 0.5, max: exp(-0.5))
        add-vline(1, max: exp(-1), style: k)
        add-vline(1.5, max: exp(-1), style: b)
        add-fill-between(
          domain: (0.5, 1),
          style: (fill: area(..r)),
          x => exp(-x),
          x => 0,
        )
        add-fill-between(
          domain: (1, 1.5),
          style: (fill: area(..b)),
          x => exp(-1),
          x => 0,
        )
        add-hline(exp(-1), min: 0.5, max: 1, style: k)
      })

      Le rectangle sous la courbe une plus grande aire que le rectangle bleu sous la courbe.

      L'idée cruciale (pour une déroissante): *ce qui vient après est plus petit que ce qui vient avant*
    ]

    #elem_preuve[
      #underline[Cas $f$ décroissante] \
      par décroissance de $f$ on a $ forall t in [k-1,k], f(k) <= f(t) \
      => inte(a: k-1, b: k, var: t, f(k)) <= inte(f(t)) \
      "càd" f(k) <= inte(f(t)) \
      forall t in [k,k+1], f(t) <= f(k) \
      => inte(a: k, b: k+1, f(t)) <= inte(f(k)) = f(k) $
      d'où $forall k >= 1$:
      $
        & inte(a: k, b: k+1, f(t)) <= f(k) <= inte(a: k-1, b: k, var: t, f(t)) \
        & => underbrace(summ(inte(a: k, b: k+1, f(t))), = integral_1^(n+1) f(t) dif t) <= summ(f(k)) <= underbrace(summ(inte(a: k-1, b: k, var: t, f(t))), = integral_0^n f(t) dif t)
      $
      ok!
    ]

    #elem_exemple[
      On veut encadrer $ R_n = summ(var: k, s: n+1, e: +oo, 1 / k^2) $
      On a $ inte(a: k, b: k+1, 1 / t^2) <= 1 / k^2 <= inte(a: k-1, b: k) $
      Puis on somme jusqu'à $m$ $ inte(a: n+1, b: m+1) <= summ(e: m) <= inte(a: n, b: m) $
      Puis passage à limite, et on trouve $ R_n ~_(n->+oo) 1 / n $
    ]
  ],
)

#custom-card(
  id: "2504031638",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    #hypos([$f$ une fonction continue *positive* et *monotone* sur $RR^+$])
    Alors il y a équivalence entre:
    + La série de terme général $u_n = f(n)$ converge
    + \<que dire de la suite $(I_n)$ définie par $I_n = integral_0^n f(t) dif t$>
  ],
  a: [
    === Un corollaire de la comparaison série-intégrale
    Il y a équivalence entre:
    + La série de terme général $u_n = f(n)$ converge
    + La suite $(I_n)$ définie par $I_n = integral_0^n f(t) dif t$ *converge*

    #elem_remarque[
      On n'est pas obligé de prendre 0 comme borne de début de l'intégrale, on prend la valeur où commence la suite $u_n$
    ]

    #elem_preuve[
      #sens(
        $1 ==> 2$,
        hypo: [Sq $f in FFF(RR^+, RR^+)$ décroissante sur $RR^+$ et que la série de TG $f(n)$ converge],
      )[
        Comme $I_n = integral_0^n f(t) dif t$, on a $ I_(n+1) - I_n & = inte(var: t, a: 0, b: n+1, f(t)) - inte(b: n, f(t)) \
                      & = inte(a: n, b: n+1, f(t)) >= 0                       \
                      & => (I_n) "est une suite croissante"                   \ $
        Comme $sum f(k)$ CV, $exists M in RR^+ tq forall n, summ(var: k, s: 0, e: n, u_k) <= M$
        $
          I_n &= inte(a: 0, b: n) = inte(b: 1) + inte(a: 1, b: n) \
          & <= underbrace(inte(a: 0, b: 1), "indépendant de" n) + underbrace(summ(e: n-1, f(k)), <=M) "majoré par" M'
        $
        donc $(I_n)$ converge
      ]
      #sens(
        $not 1 ==> not 2$,
        hypo: [Sq $f$ continue positive et monotone sur $RR^+$ et $sum f(k)$ diverge],
      )[
        donc $ summ(e: n, f(k)) limm(var: n, val: +oo) +oo $
        On a $ summ(s: 1, f(k)) <= inte(b: n) $
        et $ underbrace(summ(s: 0, f(k)), limm() +oo) - f(0) <= I_n $
        donc par le théorème des gendarmes à l'infini, $I_n limm() +oo$ et donc $not 2$
      ]
    ]
  ],
)

#custom-card(
  id: "2504031658",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Séries de Riemann
  ],
  a: [
    === Séries de Riemann
    #hypos($alpha in RR$)
    $
      "La série de terme général" 1 / n^alpha "converge" \ #vert($<==>$) \
      alpha > 1
    $

    #elem_remarque[
      On appellera parfois cette série la "série de Riemann de paramètre $alpha$"
    ]

    #elem_preuve[
      - Si $alpha <= 0$, DV grossière
      - #[
          Si $alpha > 0, t |-> 1 / t^alpha$ est décroissante, donc on va regarder $ I_n = inte(a: 1, b: n, var: t, 1 / t^alpha) $
          - Si $alpha = 1, I_n limm(var: n, val: +oo) + oo$
          - Si $alpha != 1$, $ I_n = [t^(1-alpha) / (1-alpha)]_1^n = 1 / (1-alpha)(n^(1-alpha) -1) $
          - si $0 <= alpha < 1, I_n limm() + oo$
          - si $alpha > 1, I_n limm() -1 / (1-alpha)$
          donc par le corollaire de la comparaison série-intégrale, il n'y a convergence que si et seulement si $alpha > 1$
        ]
    ]
  ],
)

#custom-card(
  id: "2504031705",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Soient $(u_n)$, $(v_n)$ 2 suites *réelles positives*, alors que dire des séries de TG $u_n$ et $v_n$:
    + Si $u_n = bigo_(+oo)(v_n)$: ?
    + Si $u_n = smallo_(+oo)(v_n)$: ?
    + Si $u_n ~_(n->+oo) v_n$: ?

  ],
  a: [
    Soient $(u_n)$, $(v_n)$ 2 suites *réelles positives*, alors:
    + Si $u_n = bigo_(+oo)(v_n)$: $ "La série de TG" v_n "converge" ==> "La série de TG" u_n "converge" $
    + Si $u_n = smallo_(+oo)(v_n)$: $ "La série de TG" v_n "converge" ==> "La série de TG" u_n "converge" $
    + Si $u_n ~_(n->+oo) v_n$: $ "La série de TG" v_n "converge" <==> "La série de TG" u_n "converge" $

    #elem_remarque[
      - Le signe constant des suites est suffisant en hypothèse, car on peut juste prendre l'opposé de la suite

      En général:
      - Si on veut info de divergence, faut qu'elle soit à l'extérieur du grand O, petit O, équivalent etc
      - Si on veut info de convergence, faut qu'elle soit à l'intérieur

      $-->$ "*Convergence dedans, divergence dehors*"
    ]

    #elem_preuve[
      #sens($1 ==> 2$)[
        Si $u_n = smallo(v_n)$, alors $u_n = bigo(v_n)$ donc on utilise $1$. \
        On peut ainsi se contenter de démontrer uniquement 2. et 3.
      ]
      #sens(
        $1$,
        hypo: [Sq $u_n = bigo(v_n)$ et la série de terme général $v_n$ converge],
      )[
        $
          & u_n = bigo(v_n) => exists M in RR^+ tq forall n, abs(u_n / v_n) <= M \
          & "par positivité" 0 <= u_n / v_n <= M                                 \
          & "par positivité" 0 <= u_n <= M v_n                                   \
        $
        d'où $ & summ(var: k, s: 0, e: n, u_k) <= M summ(v_k)    \
        & "or" (summ(v_k)) "converge, donc majoré par" M' \
        & "d'où" summ(u_k) <= M M'                        \ $
        donc les sommes partielles sont majorées et à termes positifs, donc la série de TG $u_n$ converge
      ]
      #sens(
        $3$,
        hypo: [Sq $(u_n), (v_n) in (RR^+)^NN$, $u_n ~ v_n$ et la série de TG $v_n$ converge],
      )[
        On a $u_n / v_n limm(var: n, val: +oo) 1$ d'où $abs(u_n / v_n)$ majorée car tout est positif donc \ $u_n = bigo(v_n)$ et on se ramène au cas de la $1$
      ]
    ]
  ],
)

#custom-card(
  id: "2504031719",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Série harmonique
  ],
  a: [
    === Série harmonique
    $ forall n, H_n = summ(var: k, s: 1, e: n, 1 / k) $ a le développement asymptotique suivant: #resultb[$ H_n = summ(1 / k) = ln n + gamma + smallo_(n->+oo) (1) $]
    où $gamma$ est la constante d'Euler-Mascheroni ($gamma approx 0.5772$)

    #elem_preuve[
      La série $(H_n)$ diverge car c'est une série de Riemann de paramètre 1.

      *Détermination d'un équivalent:* \
      pour $k>= 2$: $ & inte(var: t, a: k, b: k+1, 1 / t) <= 1 / k <= inte(a: k-1, b: k) \
      & "d'où" summ(s: 2, inte(a: k, b: k+1)) <= summ(1 / k) <= summ(inte(a: k-1, b: k)) \
      & <=> underbrace(inte(a: 2, b: n+1), = ln(n+1) - ln(2)) <= summ(1 / k) <= underbrace(inte(a: 1, b: n), = ln(n)) $
      Dès lors: $ & ln(n+1) - ln(2) + 1 <= H_n <= ln(n) + 1 \
      & <=> ln(n) + ln(1+1 / n) - ln(2) + 1 <= H_n <= ln(n) + 1 \
      & <=> 1 + ln(1+1 / n) / ln(n) (1 - ln(2)) / (ln(n)) <= H_n / ln(n) <= 1 + 1 / ln(n) \
      & => H_n ~_(n->+oo) ln(n) $

      *Un terme de plus:* \
      On pose $u_n = H_n - ln(n)$. Pour justifier la convergence de $(u_n)$, on va étudier la série de terme général $ & u_(n+1) - u_n = H_(n+1) - ln(n+1) - H_n + ln(n)                     \
      & = 1 / (n+1) + ln(n / (n+1))                                         \
      & = 1 / (n+1) + ln(1 + n / (n+1) - 1) = 1 / (n+1) + ln(1-1 / (n+1))   \
      & = -1 / (2(n+1)^2) + smallo_(n->+oo) (1 / (n+1)^2) ~ -1 / (2(n+1)^2) \ $
      qui est de signe constant par comparaison aux séries de Riemann, donc $ u_n = gamma + smallo(1) $ avec $gamma$ la limite de $u_n$ \
      d'où #[
        $ H_n = ln(n) + gamma + smallo_(n->+oo)(1) $
      ]
    ]
  ],
)

#custom-card(
  id: "2504031737",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Développement décimal propre d'un réel
  ],
  a: [
    === Développement décimal propre d'un réel
    Soit $x in [0,1[$, il existe une unique suite d'entiers de $[|0,9|]$ tel que:
    + la suite $(x_n)$ n'est pas stationnaire a 9
    + $ x = summ(var: k, s: 1, e: +oo, x_k 10^(-k)) $

    #elem_remarque[
      Pas de stationaire à 9 pour bien avoir l'unicité
    ]

    #elem_preuve[
      #sens("Existence", hypo: [On fixe $x in [0,1[$])[
        #underline[Analyse]:\
        On a $10x in [0,10[$, on prend $x_1 = floor(10x)$\
        On a alors $10x - x_1 in [0,1[$ \
        On obtient $ x = x_1 / 10 + underbrace((10x - floor(10x)) / 10, #$in [0,1 / 10 [$) $

        On itère: $ x &= x_1 / 10 + (x_2 / 10 + epsilon_2) / 10 = x_1 / 10 + x_2 / 100 + epsilon_2 / 100 $
        ...
        $ x = x_1 / 10 + x_2 / 100 + ... + x_n / 10^n +epsilon_n / 10^n $ avec $0<= epsilon_n <= 1 / 10^n$
      ]
    ]
  ],
)

#custom-card(
  id: "2504031745",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Caractérisation des nombres rationels par le développement décimal propre
  ],
  a: [
    === Caractérisation des nombres rationels par le développement décimal propre
    Soit $x in [0,1[$, on a équivalence entre:
    + $x$ est un rationnel
    + le développement décimal propre de $x$ est ultimement périodique: $ exists n_0 in NN, exists T in NN^* tq forall n >= n_0, x_(n+T) = x_n $

    #elem_preuve[
      TODO
    ]
  ],
)

#custom-card(
  id: "2504031747",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Définition: série absolument convergente
  ],
  a: [
    Soit $(u_n)$ une suite de nombres réels (ou complexes) \
    On dit que la série de terme général $u_n$ est absolument convergente si la série de terme général $abs(u_n)$ converge

    #elem_remarque[
      On l'abrègera des fois au brouillon "CVA": absolument convergente
    ]
  ],
)

#custom-card(
  id: "2504031749",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    #hypos([$(u_n) in KK^NN$])
    $
      "La série de terme général" u_n "CVA" \ vert(==>) \
      "<que dire de la série de terme général" u_n "?>"
    $
  ],
  a: [
    $
      "La série de terme général" u_n "CVA" \ vert(==>) \
      "La série de terme général" u_n "converge"
    $

    #elem_remarque[
      La réciproque est fausse! (contre exemple par la série harmonique alternée)
    ]

    #elem_preuve[
      #sens(
        [cas $(u_n) in RR^NN$],
        hypo: [tq $abs(u_n)$ est le TG d'une série convergente],
      )[
        On introduit $forall n$: $ & u_n^+ = max(u_n, 0) "et" u_n^- = max(-u_n, 0) \
        & "on remarque" u_n = u_n^+ - u_n^-             \ $
        donc $ summ(var: k, s: 0, e: n, u_k) = underbrace(summ(u_k^+), S_(1,n)) - summ(u_k^-) $

        $S_(1,n)$ série de terme général $u_n^+$ et $u_n^+$ est majoré par $abs(u_n)$, or $sum u_n$ converge, donc $sum u_n^+$ converge \
        Idem pour $u_n^-$: $0 <= u_n^- <= abs(u_n)$

        $-->$ donc $sum u_n$ converge
      ]

      #sens(
        [cas $(v_n) in CC^NN$],
        hypo: [tq $abs(v_n)$ est le TG d'une série convergente],
      )[
        $
          & v_n = a_n + i b_n, (a_n), (b_n) in RR^NN                        \
          & abs(a_n) <= abs(v_n) and sum abs(v_n) "CV" => sum abs(a_n) "CV" \
          & abs(b_n) <= abs(v_n) and sum abs(v_n) "CV" => sum abs(b_n) "CV" \
          & "donc:"                                                         \
          & summ(v_k) = summ(a_k) + i summ(b_k) "converge"                  \
        $
      ]
    ]
  ],
)

#custom-card(
  id: "2504031758",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Que dire de l'ensemble des termes généraux des séries convergentes (resp. absolument convergentes)?
  ],
  a: [
    L'ensemble des termes généraux des séries convergentes (resp. absolument convergentes) forme un sous-espace vectoriel de $(KK)^NN$

    #elem_methode[
      En découle: Si $u_n, v_n$ des TG de suites qui CVA, $lambda in KK$ alors la série de TG $u_n + lambda v_n$ est absolument convergente et $ abs(summ(var: n, s: 0, e: +oo, u_n + lambda v_n)) = abs(summ(u_n)) + lambda abs(summ(v_n)) $
    ]

    #elem_preuve[
      - $subset KK^NN$ ok
      - $0_(KK^NN)$ est le terme général d'une série convergente
      - Si $u_n, v_n$ deux termes généraux de séries convergentes et $lambda in KK$:
      $ summ(var: k, s: 0, e: n, u_k + lambda v_k) = underbrace(summ(v_k), "CV") + underbrace(lambda summ(v_k), "CV") $ donc $u_n + lambda v_n$ est le terme général d'une série convergente

      _Pour le cas absolument convergente, on pourra utiliser des valeurs absolues et l'inégalité triangulaire_
    ]
  ],
)

#custom-card(
  id: "2504071006",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    === Théorème des séries alternées/Critère spécial des séries alternées
  ],
  a: [
    === Théorème des séries alternées/Critère spécial des séries alternées
    Soit $(u_n) in RR^NN$ *décroissante de limite nulle*, alors la série de TG $(-1)^n u_n$ converge
    et $ R_n = summ(var: k, s: n+1, e: +oo, (-1)^k u_k) "est du signe de" (-1)^(n+1) $ et $ abs(R_n) <= u_(n+1) $

    #elem_remarque[
      - Décroissante et tend vers $0$ $==>$ $(u_n)$ positive
      - Attention: la décroissance ne peut pas se montrer avec des équivalents!
    ]

    #elem_exemple[
      Cela nous sonne directement la convergence de la série harmonique alternée:
      $ u_n = (-1)^n / (n+1) $ et $1 / (n+1) limm() 0$ et déçroissante, donc $sum (-1)^n / n$ converge

      #let f = n => {
        calc.pow(-1, n) / (n + 1)
      }
      #math_plot(
        (-3, 20),
        y: (-0.5, 0.5),
        size: (7, 3),
        y-label: $u_n$,
        x-label: $n$,
        ..range(1, 20).map(t => (mark: (t, f(t)), label: true)),
      )
    ]

    #elem_preuve[
      Considérons les sommes partielles:
      $
        S_n = summ(s: 0, e: n, (-1)^k u_k) \
        v_n = S_(2n) = summ(e: 2n) "et" w_n = S_(2n+1) = summ(e: 2n+1) \
      $
      On a $ v_(n+1) - v_n & = summ(e: 2n+2) - summ(e: 2n)                 \
                    & = (-1)^(2n+2) u_(2n+2) + (-1)^(2n+1) u_(2n+1) \
                    & = u_(2n+2) - u_(2n+1) <= 0                    \ $
      #resultb[
        $(v_n)$ décroissante \
        De meme, $(w_n)$ croissante
      ]
      Puis $v_n - w_n = u_(2n+1) limm(var: n, val: +oo) underbrace(0, "car" (u_n) "a limite nulle")$
      Donc par les suites adjacentes, $(v_n)$ et $(w_n)$ convergent vers la meme limite $l in RR$

      Donc comme les entiers pairs et impairs forment une parititon de $NN$, #resultb[$S_n limm() -> l in RR$]

      #hr
      On a donc $ R_n = summ(s: n+1, e: +oo) $ bien définie car $(S_n)$ CV

      On regarde $ (-1)^(n+1) R_n &= summ((-1)^(k+n+1) u_k) = summ(var: l, s: 0, (-1)^l u_(l+n+1)) \
      &= summ(var: k, underbrace(u_(2k + n + 1) - u_(2k+1+n+1), display(>=0))) \
      & ==> (-1)^(n+1) R_n >= 0 $
      #resultb[Donc $"sg"(R_n) = "sg"((-1)^(n+1))$]
      et $ abs(R_n) = summ(var: k, u_(2k + n + 1) - u_(2k+1+n+1)) $
      #hr

      Montrons que $abs(R_n) <= u_(n+1)$

      On pose $ abs(R_(n,m)) = summ(e: m, u_(2k + n + 1) - u_(2k+1+n+1))
      \ bullet R_(n,0) = u_(n+1)- u_(n+2) <= u_(n+1)
      \ bullet R_(n,1) = u_(n+1) underbrace(- u_(n+2) + u_(n+3), <=0) underbrace(- u_(n+4), <=0) <= u_(n+1) $
      Par récurrence on montre $ abs(R_(n,m) <= u_(n+1)) $ et par passage à la limite, on conclut #resultb[$ abs(R_n) <= u_(n+1) $]
    ]
  ],
)

#custom-card(
  id: "2504071052",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    === Produit de Cauchy
    Définition: Produit de Cauchy de dex suites
  ],
  a: [
    === Produit de Cauchy
    On définit le produit de Cauchy de deux suites $(a_n), (b_n)$ comme la suite $(c_n)$ définie par $ forall n in NN, c_n = sum_(k=0)^n a_k b_(n-k) $

    #elem_reformulation[
      On a aussi $ forall n in NN, c_n = sum_dis(k\, l <= n \ k+l=n) a_k b_l $
    ]
    
    #elem_remarque[
      On remarquera une similarité au produit de deux polynomes.
    ]
  ],
)

#custom-card(
  id: "2504071057",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    === Produit de Cauchy
    #hypos(
      [$a_n, b_n$ 2 termes généraux de séries qui convergent *absolument*],
      [$(c_n)$ le produit de Cauchy de $(a_n)$ et $(b_n)$],
    )
    Alors que dire de la série de terme général $c_n$?
  ],
  a: [
    $-->$ La série de terme général $c_n$ converge absolument. (donc la série de TG $c_n$ aussi) \
    $-->$ et $ summ(var: k, s: 0, e: +oo, c_k) = (summ(a_k))(summ(b_k)) $

    #elem_remarque[
      D'après Vicente, il suffit d'une seule des deux CVA
    ]

    #elem_preuve[
      _Pour montrer que a série de TG $c_n$ CVA, il suffit de majorer les sommes partielles, $summ(abs(c_k), e: n)$ par $M$ indépendant de $n$_
      On a
      $
        & summ(c_k) = summ(e: n, summ(var: l, s: 0, e: k, a_l b_(k-l))) \
        & "par ineg triangulaire:" \
        & abs(summ(var: k, s: 0, e: n, c_k)) <= summ(var: k, s: 0, e: n, summ(var: l, s: 0, e: k, abs(a_l) abs(b_(n-l)))) \
        & = summ(var: #none, e: #none, s: display(k\, l in [|0,n|] \ k+ l <= n),abs(a_l)abs(b_k)) \
        & <= summ(s: display(k\, l in [|0,n|])) \
        & = underbrace((summ(var: k, s: 0, e: n, abs(a_k)))(summ(abs(b_k))), "sommes partielles de séries CV") <= underbrace((summ(s: 0, e: +oo, abs(a_k)))(summ(abs(b_k))), "indépendant de" n)
      $
      Donc les sommes partielles de la série de TG $abs(c_n)$ sont majorées donc la série de terme positif $abs(c_n)$ converge
      #hr

      donc $ summ(var: k, s: 0, e: +oo, c_k) = l in CC $
      _Montrons que $display(l = (summ(a_k))(summ(b_k)))$_

      $ S_n = summ(e: n, c_k) $
      Si on montre q'une suite extraite de $(S_n)$ tend vers $(summ(e: +oo, a_k))(summ(b_k))$, alors on pourra conclure par unicité de la limite

      On regarde $(u_n) = (S_(2n))$
      #let wid = 16
      #let n_col = 9
      #let cell_dim = (max_element_width / (wid + 2))
      #table(
        columns: range(0, wid + 1).map(_ => cell_dim),
        rows: range(0, wid + 1).map(_ => cell_dim),
        stroke: luma(180),
        [], [0], [1], table.cell(
          colspan: int((wid / 2) - 3),
          align: center,
          [...],
        ), [$n$],
        [n+1], table.cell(colspan: int((wid / 2) - 2), align: center, [...]), [2n],
        ..range(1, wid + 1).map(r => {
          let val = if r == 1 { [0] } else if r == 2 { [1] } else if (
            r == wid / 2
          ) {
            [n]
          } else if r == wid / 2 + 1 {
            [n+1]
          } else if r == wid {
            [2n]
          } else { none }
          if val != none {
            table.cell(x: 0, y: r, val)
          }
        }),
        table.cell(x: 0, y: 3, rowspan: 5, align: center, sym.dots.v),
        table.cell(
          x: 0,
          y: 4 + int((wid / 2) - 3) + 1,
          rowspan: 6,
          align: center,
          sym.dots.v,
        ),
        table.hline(y: n_col, start: 0, end: n_col, stroke: 1pt + black),
        table.vline(x: n_col, start: 0, end: n_col, stroke: 1pt + black),
        fill: (k, l) => {
          if k == 0 or l == 0 { return }
          if k < n_col and l < n_col { return rgb("#ff7169") }
          if k + l < 2 * n_col {
            if k >= n_col {
              return orange
            }
            if l >= n_col {
              return blue
            }
          }
        },
      )
      #let orange_sum = color_math(orange, $sum$)
      #let blue_sum = color_math(blue, $sum$)
      $
        & u_n - (summ(var: k, s: 0, e: n, a_k))(summ(b_k)) "   " (1) \
        &= sum_display(k\,l <= 2n \ k + l <= 2n) a_k b_l - underbrace(sum_(k=0)^n sum_(l=0)^n a_k b_l, "rouge") \
        &= #orange_sum _display(k\,l <= 2n \ k > n \ k + l <= 2n) a_k b_l + #blue_sum _display(k\,l <= 2n \ l > n \ k + l <= 2n) a_k b_l
      $
      Or
      $
        & abs(#orange_sum _display(k\,l <= 2n \ k > n \ k + l <= 2n) a_k b_l) <= #orange_sum _display(k\,l <= 2n \ k > n \ k + l <= 2n) abs(a_k) abs(b_l) <= underbrace(#orange_sum _display(k\,l <= 2n \ k > n) abs(a_k) abs(b_l), "on somme des termes positifs") \
        & = sum_(k=n+1)^(2n) sum_(l=0)^(2n) abs(a_k) abs(b_l) \
        &= (sum_(l=0)^(2n) abs(b_l))(sum_(k=n+1)^(2n) abs(a_k)) \
        & <= underbrace((sum_(l=0)^(+oo) abs(b_l)), "CVA")underbrace((sum_(k=n+1)^(+oo) abs(a_k)), "Reste") = abs(sum_(l=0)^(+oo) abs(b_l)) underbrace(R_n, limm(var: n, val: +oo) 0)
      $
      d'où par $(1)$, les deux termes ont la meme limite, et ceci conclut
    ]
  ],
)

#custom-card(
  id: "2504091205",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    === Exponentielle complexe
    Définition de l'exponentielle complexe
  ],
  a: [
    === Exponentielle complexe
    #hypos($z in CC$)
    On définit l'exponentielle complexe de $z$ par la série absolument convergente $ e^z = summ(var: k, s: 0, e: +oo, z^k / (k!)) $

    #elem_preuve[
      *Preuve de la CVA:*:

      Fixons $z in CC^*$, $u_n = display(z^n / n!) => abs(u_n) = display(abs(z)^n / n!)$

      On a alors $ n^2 abs(u_n) = (n^2 abs(z)^n) / n! = (n abs(z)^n) / (n-1)! = underbrace((n abs(z)^2) / (n-1), limm(var: n, val: +oo) abs(z)^2) underbrace(abs(z)^(n-2) / (n-2)!, limm() 0) \ => n^2 abs(u_n) limm() 0 \
      => abs(u_n) = o(1 / n^2) $
      donc la série converge absolument (donc converge) par comparaison aux séries de Riemann
    ]
  ],
)

#custom-card(
  id: "2504091222",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    === Exponentielle complexe
    $forall z_1, z_2 in CC$, $ e^(z_1 + z_2) = "?" $
  ],
  a: [
    === Exponentielle complexe
    $forall z_1, z_2 in CC$, $ e^(z_1 + z_2) = e^(z_1) e^(z_2) $

    #elem_preuve[
      On a $u_n = display(z_1 / n!)$ et $v_n = display(z_2 / n!)$ deux TG de séries CVA, d'où on peut faire un produit de Cauchy et $ (summ(var: n, s: 0, e: +oo, u_n))(summ(v_n)) = summ(w_n) \
      "où" w_n = summ(var: k, e: n, u_k v_(n-k)) $
      Penchons nous sur $(w_n)$: $ w_n = summ((z_1)^k / k! (z_2)^(n-k) / (n-k)!) = 1 / n! summ(n! / ((n-k)!k!) z_1^k z_2^(n-k)) \ = 1 / n! (z_1 + z_2)^n "par binome de Newton" $

      #resultb[
        $
          summ(var: n, s: 0, e: +oo, w_n) = summ((z_1 + z_2)^n / n!) = e^display(z_1 + z_2)
        $
      ]
    ]
  ],
)

#custom-card(
  id: "2504091235",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    === Exponentielle complexe
    Que dire si:
    - On restreint l'exponentielle complexe à $RR$
    - On restreint l'exponentielle complexe aux imaginaires purs
  ],
  a: [
    === Exponentielle complexe
    ==== Restriction à $RR$
    On peut justifier (programme de 2ème année) que c'est la solution à $y' = y$ et $y(0) = 1$

    ==== Restriction aux imaginair purs
    Pour $z = i y in i RR$ $ e^(i y) = summ(var: n, s: 0, e: +oo, (i y)^n / n!) \ => overline(e^(i y)) = summ((-i y)^n / n!) = e^(-i y) $ donc $ abs(e^(i y))^2 = e^(i y) e^(-i y) = e^0 = 1 $
    #resultb[
      $ exp(i RR) subset UU $
    ]
  ],
)

#custom-card(
  id: "2504092207",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    $ ln(n!) ~_(n -> +oo) "?" $
  ],
  a: [
    $ ln(n!) ~_(n -> +oo) n ln (n) $
    On a $ ln(n!) = sum_(k=1)^n ln k $

    #elem_preuve[
      Par comparaison série intégrale, comme la fonction $ln$ est croissante: $ & inte(var: t, a: 1, b: n, ln(t)) <= summ(var: k, s: 1, e: n, ln k) <= inte(a: 2, b: n+1) \ &=> n ln n - n + 1 <= summ() <= (n+1) ln(n+1) - 2 ln 2 - n + 1
      \ &=> "théorème des gendarmes:" $
      #resultb($ summ() ~_(n->+oo) n ln n $)
    ]
  ],
)

#custom-card(
  id: "2504160843",
  target-deck: "M_SUP_C23_SERIES",
  q: [
    Règle de d'Alembert sur les séries
  ],
  a: [
    Soit $(u_n) in (RR^+)^NN$ qui ne s'annulle pas à partir d'un certain rang

    On suppose $dis(u_(n+1) / u_n) limm(var: n, val: +oo) l$
    alors:
    - si $l < 1, sum u_n$ converge absolument
    - si $l > 1, sum u_n$ diverge grossièrement
    - si $l = 1$, on ne peut pas conclure


    #elem_methode[
      La règle de d'Alembert est une règle qui permet de déterminer la nature de certaines séries, en particulier des séries dont le terme général fait apparaître *des puissances, des factorielles*

      Si on a des nombres complexes/des suites négatives, on peut prendre la valeur absolue
    ]

    #elem_preuve[
      #sens($1$, hypo: [Sq $l < 1$])[
        Soit $beta tq l < beta < 1$.

        $ u_(n+1) / u_n limm() l => exists n_0 in NN tq n>= n_0 => u_(n+1) / u_n <= beta $ donc pour $k in NN$, $ u_(n_0 + k) <= beta^k u_n_0 $ d'où pour $n >= n_0, 0<=u_n <= underbrace(u_n_0 beta^(n-n_0), (*))$\
        $(*)$ est une suite géométrique de paramètre $0 < beta < 1$, donc la série converge
      ]
      #sens($2$, hypo: [Sq $l>1$])[
        Soit $beta tq 1 < beta < l$.

        donc $ exists n_0 in NN tq n>=n_0 => u_(n+1) / u_n >= beta >= 1 $, donc $(u_n)$ est croissante à partir de $n_0$ donc $(u_n)$ ne tend pas vers $0$
      ]
      #sens($3$, hypo: [Sq $l = 1$])[
        Contre exemple, $ forall n in NN, u_n = 1; u_(n+1) / u_n limm() 1 $, $sum u_n$ diverge
      ]
    ]
  ],
)
