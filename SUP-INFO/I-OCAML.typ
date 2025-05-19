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
  id: "2504011415",
  target-deck: "I_SUP_OCAML",
  q: [
    === Librairie standard:
    ```ml
    List.hd
    ```
  ],
  a: [
    #info_func_spec(
      "val hd : 'a list -> 'a",
      "Return the first element of the given list",
      raises: ([`Failure` if list is empty],),
    )
  ],
)

#custom-card(
  id: "2504011442",
  target-deck: "I_SUP_OCAML",
  q: [
    === Librairie standard:
    ```ml
    List.nth
    ```
  ],
  a: [
    #info_func_spec(
      "val nth : 'a list -> int -> 'a",
      [Return the `n`-th element of the given list. The first element (head of the list) is at position 0.],
      raises: (
        [`Failure` if the list is too short],
        [`Invalid_argument` if `n` is negative],
      ),
    )
    #elem_remarque[
      See also: `List.nth_opt`: retourne une option
    ]
  ],
)

#custom-card(
  id: "2504011443",
  target-deck: "I_SUP_OCAML",
  q: [
    === Librairie standard:
    ```ml
    List.rev
    ```
  ],
  a: [
    #info_func_spec("val rev : 'a list -> 'a list", "List reversal.")
  ],
)

#custom-card(
  id: "2504011445",
  target-deck: "I_SUP_OCAML",
  q: [
    === Librairie standard:
    ```ml
    Array.init / List.init
    ```
  ],
  a: [
    #info_func_spec(
      "val init : int -> (int -> 'a) -> 'a array",
      [`init n f` returns a fresh array of length `n`, with element number `i` initialized to the result of `f i`],
      raises: ([`Invalid_argument` if `n<0`],),
    )
  ],
)

#custom-card(
  id: "2504011454",
  target-deck: "I_SUP_OCAML",
  q: [
    === Librairie standard:
    ```ml
    List.concat
    ```
  ],
  a: [
    #info_func_spec(
      "val concat : 'a list list -> 'a list",
      "Concatenate a list of lists. The elements of the argument are all concatenated together (in the same order) to give the result. Not tail-recursive (length of the argument + length of the longest sub-list).",
    )
    #elem_remarque[
      See also: `List.flatten`: same thing
    ]
  ],
)

#custom-card(
  id: "2504011455",
  target-deck: "I_SUP_OCAML",
  q: [
    === Librairie standard:
    ```ml
    List.iter / Array.iter
    ```
  ],
  a: [
    #info_func_spec(
      "val iter : ('a -> unit) -> 'a list -> unit",
      [
        `iter f [a1; ...; an]` applies function `f` in turn to `[a1; ...; an]`.

        It is equivalent to `f a1; f a2; ...; f an`.
      ],
      example: ```ml let print_number n =
        print_endline (string_of_int n)

      let () =
        let numbers = [1; 2; 3; 4; 5] in
        List.iter print_number numbers
      ```,
    )
  ],
)

#custom-card(
  id: "2504011504",
  target-deck: "I_SUP_OCAML",
  q: [
    === Librairie standard:
    ```ml
    Array.iteri / List.iteri
    ```
  ],
  a: [
    #info_func_spec(
      "val iteri : (int -> 'a -> unit) -> 'a array -> unit",
      [Same as `Array.iter`, but the function is applied to the index of the element as first argument, and the element itself as second argument],
      example: ```ml
      let print_index_value i v =
        Printf.printf "Index %d: Value %d\n" i v

      let () =
        let numbers = [|10; 20; 30; 40; 50|] in
        Array.iteri print_index_value numbers
      ```,
    )
  ],
)

#custom-card(
  id: "2504011519",
  target-deck: "I_SUP_OCAML",
  q: [
    === Librairie standard:
    ```ml List.map / Array.map ```
  ],
  a: [
    #info_func_spec(
      "val map : ('a -> 'b) -> 'a list -> 'b list",
      [`map f [a1; ...; an]` applies function `f` to `a1, ..., an`, and builds the list `[f a1; ...; f an]` with the results returned by `f`],
      example: (
        ```ml
        let double x = x * 2

        let () =
          let numbers = [1; 2; 3; 4; 5] in
          let doubled_numbers = List.map double numbers in
          List.iter (Printf.printf "%d ") doubled_numbers;
          print_newline ()
        ```
      ),
    )

    #elem_remarque[
      See also:
      - `List.mapi / Array.mapi`: same, but the first argumen that's passed is the index.
      - `List.rev_map`: #[
          `rev_map f l` gives the same result as `List.rev (List.map f l)`, but is more efficient.

          *Doesn't exist on Array*
        ]
      - `List.filter_map`: #[
          ```ml
          val filter_map : ('a -> 'b option) -> 'a list -> 'b list
          ```
          `filter_map f l` applies `f` to every element of `l`, filters out the `None` elements and returns the list of the arguments of the `Some` elements
          *Doesn't exist on Array*
        ]
    ]
  ],
)


#custom-card(
  id: "2504011520",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    Array.map_inplace
    ```
  ],
  a: [
    #info_func_spec(
      "val map_inplace : ('a -> 'a) -> 'a array -> unit",
      [`map_inplace f a` applies function `f` to all elements of `a`, and updates their values in place.],
    )

    #elem_remarque[
      See also: `Array.mapi_inplace`
    ]
  ],
)

#custom-card(
  id: "2504011538",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    List.fold_left / Array.fold_left
    ```
  ],
  a: [
    #info_func_spec(
      "val fold_left : ('acc -> 'a -> 'acc) -> 'acc -> 'a list -> 'acc",
      [`fold_left f init [b1; ...; bn]` is `f (... (f (f init b1) b2) ...) bn`],
      example: (
        ```ml
        let () =
          let numbers = [1; 2; 3; 4; 5] in
          let sum = List.fold_left (fun acc x -> acc + x) 0 numbers in
        ```,
        ```ml
        let () =
          let numbers = [|1; 2; 3; 4; 5|] in
          (* product *)
          Array.fold_left (fun acc x -> acc * x) 1 numbers in
        ```,
      ),
    )
  ],
)

#custom-card(
  id: "2504011545",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    Array.fold_right / List.fold_right
    ```
  ],
  a: [
    #info_func_spec(
      "val fold_right : ('a -> 'acc -> 'acc) -> 'a array -> 'acc -> 'acc",
      [
        `Array.fold_right f a` init computes `f a.(0) (f a.(1) ( ... (f a.(n-1) init) ...))`ˢ, where `n` is the length of the array `a`
      ],
      example: (
        ```ml
        let subtract x acc = x - acc

        let () =
          let numbers = [|10; 20; 30|] in
          let result = Array.fold_right subtract numbers 0 in
          Printf.printf "Result: %d\n" result
        ```
      ),
    )

    #elem_remarque[
      *Attention à l'ordre dans la signature!*

      - Sur les listes, ça ne fait pas de TCO, c'est donc extremement lent, à ne *pas utiliser sur les listes*!
    ]
  ],
)

#custom-card(
  id: "2504011606",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    Fonctions sur deux listes et arrays:
    ```ml
    List.iter2 / Array.iter2
    List.map2 / Array.map2
    ```
  ],
  a: [
    == iter2
    #info_func_spec(
      "val iter2 : ('a -> 'b -> unit) -> 'a list -> 'b list -> unit",
      [`iter2 f a b` applies function `f` to all the elements of `a` and `b`],
      raises: (
        [`Invalid_argument` if the two lists are determined to have different lengths],
      ),
    )
    == map2
    #info_func_spec(
      "val map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list",
      [`map2 f [a1; ...; an] [b1; ...; bn]` is `[f a1 b1; ...; f an bn]`],
      raises: (
        [`Invalid_argument` if the two lists are determined to have different lengths],
      ),
    )
  ],
)

#custom-card(
  id: "2504011611",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    List.for_all / Array.for_all
    ```
  ],
  a: [
    #info_func_spec(
      "val for_all : ('a -> bool) -> 'a list -> bool",
      [`for_all f [a1; ...; an]` checks if all elements of the list satisfy the predicate `f`. That is, it returns `(f a1) && (f a2) && ... && (f an)` for a non-empty list and `true` if the list is empty],
    )

    #elem_remarque[
      See also
      - #[`Array.for_all2`:
          ```ml val for_all2 : ('a -> 'b -> bool) -> 'a array -> 'b array -> bool ```]
      - #[
          `Array.exists / List.exists`:
          ```ml val exists : ('a -> bool) -> 'a array -> bool``` \
          which checks if *at least one element* satisfies the predicate (stops when it finds one)
        ]
    ]
  ],
)

#custom-card(
  id: "2504011617",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    List.mem / Array.mem
    ```
  ],
  a: [
    #info_func_spec(
      "val mem : 'a -> 'a list -> bool",
      [`mem a set` is `true` if and only if `a` is structurally equal to an element of set (i.e. there is an `x` in set such that `compare a x = 0`)],
    )

    #elem_remarque[
      See also: `Array.memq / List.memq`: same, but uses physical equality instead of structural equality to compare array/list elements
    ]
  ],
)

#custom-card(
  id: "2504011620",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    List.find / Array.find
    List.find_opt / Array.find_opt
    List.find_index / Array.find_index
    ```
  ],
  a: [
    == find
    #info_func_spec(
      "val find : ('a -> bool) -> 'a list -> 'a",
      [`find f l` returns the first element of the list `l` that satisfies the predicate `f`],
      raises: (
        [`Not_found` if there is no value that satisfies `f` in the list `l`],
      ),
    )

    == find_opt
    #info_func_spec(
      "val find_opt : ('a -> bool) -> 'a list -> 'a option",
      [Same as `find`, but as an option],
    )

    == find_index
    #info_func_spec(
      "val find_index : ('a -> bool) -> 'a list -> int option",
      [Same as `find_opt`, but returns index instead.],
    )

    #elem_remarque[
      See also:
      - #[
          `List.find_map / Array.find_map`: \
          ```ml val find_map : ('a -> 'b option) -> 'a list -> 'b option```

          `find_map f l` applies `f` to the elements of `l` in order, and returns the first result of the form `Some v`, or `None` if none exist.

          `mapi` also exists, it passed the index as the first argument to `f`
        ]
    ]
  ],
)

#custom-card(
  id: "2504011628",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    List.filter
    ```
  ],
  a: [
    *Doesn't exist on Array*

    #info_func_spec(
      "val filter : ('a -> bool) -> 'a list -> 'a list",
      [`filter f l` returns all the elements of the list `l` that satisfy the predicate `f`. The order of the elements in the input list is preserved],
    )

    #elem_remarque[
      - `find_all` does the same thing
      - `filteri` also exists, it takes the index as a first parameter
    ]
  ],
)

#custom-card(
  id: "2504011633",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    List.equal
    ```
  ],
  a: [
    *Doesn't exist on Array*

    #info_func_spec(
      "val equal : ('a -> 'a -> bool) -> 'a list -> 'a list -> bool",
      [`equal eq [a1; ...; an] [b1; ..; bm]` holds when the two input lists have the same length, and for each pair of elements `ai`, `bi` at the same position we have `eq ai bi`

        `eq` can be called even if the two lists don't have the same length, if it's costly, you might want to check `List.compare_lengths` first
      ],
    )
  ],
)

#custom-card(
  id: "2504011635",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    List.sort
    List.stable_sort
    List.fast_sort
    List.sort_uniq
    List.merge
    ```
  ],
  a: [
    Generally, just passing the standard `compare` function is a good comparison function.


    == `List.sort`
    #info_func_spec(
      "val sort : ('a -> 'a -> int) -> 'a list -> 'a list",
      [
        - The current implementation uses Merge Sort. It runs in constant heap space and logarithmic stack space.
        - $O(n log n)$ time complexity

        _As of writing this in April 2025, the `sort` function is just `stable_sort`_
      ],
    )

    == `List.stable_sort`
    #info_func_spec(
      "val stable_sort : ('a -> 'a -> int) -> 'a list -> 'a list",
      [
        - sorting algorithm is guaranteed to be stable
        - The current implementation uses Merge Sort. It runs in constant heap space and logarithmic stack space.
        - $O(n log n)$ time complexity
      ],
    )

    == `List.fast_sort`
    #info_func_spec(
      "val fast_sort : ('a -> 'a -> int) -> 'a list -> 'a list",
      [
        Same as `List.sort` or `List.stable_sort`, whichever is faster on typical input.
      ],
    )

    == `List.sort_uniq`
    #info_func_spec("val sort_uniq : ('a -> 'a -> int) -> 'a list -> 'a list", [
      Same as `List.sort`, but also remove duplicates.
    ])

    == `List.merge`
    #info_func_spec(
      "val merge : ('a -> 'a -> int) -> 'a list -> 'a list -> 'a list",
      [
        Merge two lists: Assuming that `l1` and `l2` are sorted according to the comparison function `cmp`, merge cmp `l1` `l2` will return a sorted list containing all the elements of `l1` and `l2`.

        If several elements compare equal, the elements of `l1` will be before the elements of `l2`. Not tail-recursive (sum of the lengths of the arguments).
      ],
    )
  ],
)

#custom-card(
  id: "2504011647",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    Array.sort
    Array.stable_sort
    Array.fast_sort
    ```
  ],
  a: [
    *All the sorts are done in place*
    == `Array.sort`
    #info_func_spec(
      "val sort : ('a -> 'a -> int) -> 'a array -> unit",
      [
        - The current implementation uses Heap Sort. It runs in constant stack space and (at most) logarithmic stack space
        - $O(n log n)$ time complexity
      ],
    )

    == `Array.stable_sort`
    #info_func_spec(
      "val stable_sort : ('a -> 'a -> int) -> 'a array -> unit",
      [
        - sorting algorithm is guaranteed to be stable
        - $O(n log n)$ time complexity
        - The current implementation uses Merge Sort

        _It uses a temporary array of length `n/2`, where `n` is the length of the array. It is usually faster than the current implementation of `Array.sort`_
      ],
    )

    == `Array.fast_sort`
    #info_func_spec(
      "val fast_sort : ('a -> 'a -> int) -> 'a array -> unit",
      [
        Same as `Array.sort` or `Array.stable_sort`, whichever is faster on typical input.
      ],
    )
  ],
)

#custom-card(
  id: "2504011656",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    Array.length / List.length
    ```
  ],
  a: [
    #info_func_spec(
      "val length : 'a array -> int",
      [Return the length (number of elements) of the given array],
    )
  ],
)

#custom-card(
  id: "2504012125",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    Array.make
    Array.make_matrix
    ```
  ],
  a: [
    == Array.make
    #info_func_spec(
      "val make : int -> 'a -> 'a array",
      [
        - `make n x` returns a fresh array of length `n`, initialized with `x`
        - initially all items are physically equal: if `x` is mutable, then it will be shared with all the elements of the array, and modifying `x` through one of the array entries will modify all other entries at the same time
      ],
      raises: (
        [`Invalid_argument` if `n < 0` or `n > Sys.max_array_length`. If the value of `x` is a floating-point number, then the maximum size is only `Sys.max_array_length / 2`],
      ),
    )

    == Array.make_matrix
    #info_func_spec(
      "val make_matrix : int -> int -> 'a -> 'a array array",
      [
        - `make_matrix dimx dimy e` returns a two-dimensional array (an array of arrays) with first dimension `dimx` and second dimension `dimy`.
        - All the elements of this new matrix are initially physically equal to `e`.
        - The element `(x,y)` of a matrix `m` is accessed with the notation `m.(x).(y)`
      ],
      raises: (
        [`Invalid_argument` if `dimx` or `dimy` is negative or greater than `Sys.max_array_length`. If the value of `e` is a floating-point number, then the maximum size is only `Sys.max_array_length / 2`],
      ),
    )
  ],
)

#custom-card(
  id: "2504012130",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    Array.append
    Array.concat
    ```
  ],
  a: [
    == Array.append
    #info_func_spec(
      "val append : 'a array -> 'a array -> 'a array",
      [`append v1 v2` returns a fresh array containing the concatenation of the arrays `v1` and `v2`],
      raises: (
        [`Invalid_argument` if `length v1 + length v2` `> Sys.max_array_length`],
      ),
    )

    == Array.concat
    #info_func_spec(
      "val concat : 'a array list -> 'a array",
      [Same as `Array.append`, but concatenates a list of arrays],
    )
  ],
)

#custom-card(
  id: "2504012132",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    Array.copy
    ```
  ],
  a: [
    #info_func_spec(
      "val copy : 'a array -> 'a array",
      [`copy a` returns a copy of `a`, that is, a fresh array containing the same elements as `a`.],
    )

    #elem_remarque[
      Pour cloner une liste, faire `List.take n l` avec `n > length l`
    ]
  ],
)

#custom-card(
  id: "2504012134",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    Array.sub
    ```
  ],
  a: [
    #info_func_spec(
      "val sub : 'a array -> int -> int -> 'a array",
      [
        `sub a pos len` returns a fresh array of length `len`, containing the elements number `pos` to `pos + len - 1` of array `a`
      ],
      raises: (
        [`Invalid_argument` if `pos` and `len` do not designate a valid subarray of `a`; that is, if `pos < 0`, or `len < 0`, or `pos + len > length a`],
      ),
    )
  ],
)

#custom-card(
  id: "2504012136",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    Array.fill
    ```
  ],
  a: [
    #info_func_spec(
      "val fill : 'a array -> int -> int -> 'a -> unit",
      [`fill a pos len x` modifies the array `a` in place, storing `x` in elements number `pos` to `pos + len - 1`],
      raises: (
        [`Invalid_argument` if `pos` and `len` do not designate a valid subarray of `a`],
      ),
    )
  ],
)

#custom-card(
  id: "2504012139",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    Comment convertir une liste en array, ou inversement?
  ],
  a: [
    ```ml
    Array.to_list
    Array.of_list
    ```
  ],
)


#custom-card(
  id: "2505051206",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    String.empty
    String.init
    ```
  ],
  a: [
    #info_func_spec("val empty : string", [The empty string])
    #info_func_spec(
      "val init : int -> (int -> char) -> string",
      [Init a string of length `n` with index `i` holding the character `f i`],
    )
  ],
)

#custom-card(
  id: "2505051209",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    ^
    String.cat
    String.concat
    ```
  ],
  a: [
    #info_func_spec(
      "val cat : string -> string -> string",
      [Concatenates string 1 and string 2],
    )
    #info_func_spec(
      "val concat : string -> string list -> string",
      [
        `concat sep ss` concatenates the list of strings `ss` inserting `sep` between them
      ],
    )
  ],
)

#custom-card(
  id: "2505051211",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    String.starts_with
    String.ends_with
    ```
  ],
  a: [
    #info_func_spec(
      "val starts_with : prefix:string -> string -> bool",
      [
        Returns true if the string starts with the given prefix
      ],
      example: ```ml
      let s = "ehello world" in
      String.starts_with ~prefix:"hello" s
      ```,
    )

    #info_func_spec(
      "val ends_with : suffix:string -> string -> bool",
      [
        Returns true if the string ends with the given prefix
      ],
      example: ```ml
      String.ends_with ~suffix:"perdu" "J'ai perdu";;
      - : bool = true
      ```,
    )
  ],
)

#custom-card(
  id: "2505051213",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    String.split_on_char
    ```
  ],
  a: [
    #info_func_spec("val split_on_char : char -> string -> string list", [
      All possibly empty substrings of `s` delimited by the character `sep`

      - If there are no results, returns the singleton list `[""]`

      Two invariants
      - The list is not empty
      - concatenating the elements with `sep` returns the original string
      - no string in the result contains `sep`
    ])
  ],
)

#custom-card(
  id: "2505051220",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    String.trim
    ```
  ],
  a: [
    #info_func_spec(
      "val trim : string -> string",
      [
        `trim s` is `s` without leading and trailing whitespace. Whitespace characters are: `' '`, `'\x0C'` (form feed), `'\n'`, `'\r'`, and `'\t'`.
      ],
    )
  ],
)

#custom-card(
  id: "250505",
  target-deck: "I_SUP_OCAML",
  q: [
    = Librairie standard
    ```ml
    String.iter
    ```
  ],
  a: [
    #info_func_spec(
      "val iter : (char -> unit) -> string -> unit",
      [
        `iter f s` applies function `f` in turn to all the characters of `s`. It is equivalent to `f s.[0]; f s.[1]; ...; f s.[length s - 1]; ()`.
      ],
    )

    #elem_remarque[
      `String.iteri` also exists
    ]
  ],
)
