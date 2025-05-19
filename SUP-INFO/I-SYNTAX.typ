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
  card(id: id, q: q, a: _apply_max_width(a), container: true, show-labels: true)
  pagebreak()
}

#custom-card(
  id: "2504011527",
  target-deck: "I_SUP_SYNTAX",
  q: [
    === Ocaml
    Comment initialiser une liste?
  ],
  a: [
    ```ml
    let l = [0 ; 1 ; 2]
    ```
  ],
)
#custom-card(
  id: "2504011528",
  target-deck: "I_SUP_SYNTAX",
  q: [
    === Ocaml
    Comment initialiser une array?
  ],
  a: [
    ```ml
    let l = [|0 ; 1 ; 2|]
    ```
  ],
)

#custom-card(
  id: "2504011548",
  target-deck: "I_SUP_SYNTAX",
  q: [
    === Ocaml
    Comment concaténer deux chaines de caractères?
  ],
  a: [
    Opérateur `^`.
  ],
)

#custom-card(
  id: "2504011658",
  target-deck: "I_SUP_SYNTAX",
  q: [
    === Ocaml
    physical equality vs structural equality
  ],
  a: [
    - physical equality: \ #[
        Compare with `==` \
        $->$ it compares the addresses of the given values \
        $->$ you really shouldn't write code that uses physical equality (`==`) on immutable values
      ]
  ],
)

#custom-card(
  id: "2504012141",
  target-deck: "I_SUP_SYNTAX",
  q: [
    === Ocaml
    Comment utiliser des variables mutables? Comment ça marche dans des structs?

    Qu'est l'aliasing?
  ],
  a: [
    == Initialisation
    Utilisation de `ref`
    ```ml
    let mut_bool = ref false in
    let mut_list = ref [] in
    ```

    == Affectation
    Utilisation de `:=`
    ```ml
    let x = ref 3. ;;
    x := (!x)**3. ;;
    ```

    == Déréférencement
    Utilisation de `!` *avant*

    == Aliasing
    Si `x` est une référence et que l’on écrit `let y=x`, on fait « pointer » `y` vers la même case mémoire que `x` (on parle d’égalité physique). Cela signife que toute modifcation ultérieure du contenu de `x` afectera `y`, et inversement.

    == Dans un enregistrement
    On peut mettre dans un type des champs mutables. \
    On les edit alors grace à `<-`
    ```ml
    type compteur =
      { debut : int
      ; fin : int
      ; mutable courant : int
      }
    let c = {debut = 1; fin = 5; courant = 1};;
    c.courant <- 4;;
    ```
  ],
)

#custom-card(
  id: "2504012148",
  target-deck: "I_SUP_SYNTAX",
  q: [
    === Ocaml
    Boucle for
  ],
  a: [
    OCaml propose deux variantes de la boucle for, selon que l’indice croît ou décroît:
    ```ml
    for compteur = start to finish do
      expression
    done
    for compteur = start downto finish do
      expression
    done
    ```

    #elem_remarque[
      - Les bornes sont incluses
      - compteur est considéré comme une variable de type int locale à la boucle et ne peut *pas être modifé* « à la main » dans le corps de la boucle.
      - Dans d'autres langages on peut utiliser `for` pour itérer des structures de données: en ocaml, on préfèrera utiliser `List.iter`, `Array.iter`
    ]
  ],
)

#custom-card(
  id: "2504012150",
  target-deck: "I_SUP_SYNTAX",
  q: [
    === Ocaml
    Boucle while
  ],
  a: [
    ```ml
    while condition do
      expression
    done;
    ```
  ],
)

#custom-card(
  id: "2504012152",
  target-deck: "I_SUP_SYNTAX",
  q: [
    === Ocaml
    Utilisation d'exceptions
  ],
  a: [
    Les exceptions peuvent etre utilisées pour sortir d'une boucle par exemple. Elles peuvent contenir des données.

    La syntaxe du `try` `with` est à bien connaitre, et l'initialisation d'une exception aussi.
    ```ml
    exception Found of int
    let find_first_even lst =
      try
        List.iter (fun x ->
              if x mod 2 = 0 then raise (Found x)) lst;
        None  (* If no even number is found *)
      with
      | Found x -> Some x
    ```
  ],
)

#custom-card(
  id: "250401",
  target-deck: "I_SUP_SYNTAX",
  q: [

  ],
  a: [

  ],
)

#custom-card(
  id: "250401",
  target-deck: "I_SUP_SYNTAX",
  q: [

  ],
  a: [

  ],
)

#custom-card(
  id: "250401",
  target-deck: "I_SUP_SYNTAX",
  q: [

  ],
  a: [

  ],
)

