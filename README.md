# Typst to Anki demo

This is my personal configuration for writing Anki cards in Typst, alongside with examples of cards - the cards are compiled with a width of 330pt, as I want to be able to use them on my phone

I will NOT accept any issues or PRs, as this is merely a demonstration of how I use typ2anki at the given moment - I will NOT maintain this repository to keep it up to date with the latest changes in typ2anki.

At the moment, this relies on my fork of typ2anki, found [here](https://github.com/itsvyle/typ2anki/tree/add-cli)



# My internal documentation (in the original repo, for friends who type cards with me)

## Noms des fichiers/des decks

Exemple de nom `M-C18-ev-dim.typ`

- `M`: la matiere
  - `M` pour Maths
  - `I` pour info
  - `P` pour physique
- `Cxx`: le chapitre
- puis un nom plus descriptif
- mots séparés par des tirets

Pour ce fichier, l'id du deck sera `M_SUP_C18_EV_DIM`

- important de rajouter `SUP`, l'annee
- mots séparés par des underscore

## Format d'un fichier

L'extension du fichier doit être en `.typ`

Chaque fichier commence avec l'entête suivant:

```typst
#import "ankiconf.typ": *
#show: doc => conf(doc)

#let custom-card(
  id: "",
  q: "",
  a: "",
  ..args
) = {
  new_id(id)
  // Can add custom code here for preview only
  card(
    id: id,
    q: q,
    a: a,
    container: true,
    show-labels: true
  )
  reset_math_memo()
}
```

On ne peut pas abreger le nom "custom-card", celui ci ne peut pas changer

Tout le code dans custom card n'est utilisé que pour le preview, donc ne pas mettre grand chose dedans.

_Si on veut utiliser des fonctions custom, il faut les definir dans `ankiconf.typ`, sinon elles ne seront pas disponibles à la compilation, aucune variable globale dans le fichier ne pourra etre présente et accédée lors de la compilation_

## Format d'une carte

```typst
#custom-card(
  id: "2502151731",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [],
  a: []
)
```

- `id`: Une id unique, souvent la date de l'entréé de la fiche. Cette id doit etre unique et sert à pouvoir updater les cartes
- `target-deck`: l'id du deck dans lequel cette carte va
- `q`: La question/le devant de la fiche
- `a`: La réponse/l'arrière de la fiche

## Fonctions custom de formattage à utiliser

Des fonctions typst à utiliser pour avoir un formattage constant, et faciliter la vie

### `#hypos`

Hypothèses, une par argument; necessaire pour peut etre faire par le futur un changement de format

_Exemple_:

```typst
#custom-card(
  id: "2502151807",
  target-deck: "M_SUP_C18_EV_DIM",
  q: [
    #hypos(
      [$E$ $KK$ev],
      [$cal(G)$ famille génératrice de $E$],
      [$chi$ famille qqconque de vecteurs de $E$]
    )
  Il y a équivalence entre:
],
  a: [
    + $chi$ famille génératrice
    + $forall x in cal(G), x in "Vect"(chi)$
  ]
)
```

### `#elem_preuve`:

Pour mettre les éléments de preuve dans un encadré rose

_Exemple_:

```typst
#elem_preuve([
  YAP YAP YAP YAP
])
```

### `#elem_methode`:

Pour mettre les éléments de méthode/remarques dans un encadré vert

_Exemple_:

```typst
#elem_methode([
  YAP YAP YAP YAP
])
```

## Fonctions raccourcis

### `#tpp(letter, end: "n")

Génère un "letter_1, ..., letter_n"

_Exemple_

```typst
#tpp("x")
// génère: x_1, ..., x_n
```

```typst
#tpp($lambda$, end: "k")
// génère: $lambda$_1, ..., $lambda$_k
```

## Uploading to anki/compiling

Suivre la documentation sur https://github.com/sgomezsal/typ2anki

Compiler sur linux si possible

Pour télécharger les fichiers depuis typst.app, cliquer sur la petite flèche à coté de l'icone de download en haut à droite; unzipper; faire attention à ce qu'il n'y ait pas d'espace dans le nouveau nom du dossier, et surtout _pas de parenthèses dans le nom_!

Ouvrir anki (avec ankiconnect installé), puis run `typ2anki` dans le dossier

Personellement j'ai utilisé `uv` pour installer globalement l'application.

1. Installer uv: `curl -LsSf https://astral.sh/uv/install.sh | sh`
2. Installer typ2anki - temporairement depuis mon fork: `uv tool install --force git+https://github.com/itsvyle/typ2anki.git@add-cli`
