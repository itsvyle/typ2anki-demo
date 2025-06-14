#import "@preview/typ2anki:0.1.0": *
#import "/assets/ankiconf-symbols.typ": *
#import "/assets/ankiconf-memo.typ": *
#import "/assets/ankiconf-cetz.typ": *

#let typ2anki_compile = sys.inputs.at("typ2anki_compile", default: "0") == "1"
#let max_element_width = eval(sys.inputs.at(
  "max_card_width",
  default: "330pt",
));
#let _apply_max_width(e) = {
  layout(size => {
    let (width,) = measure(e)
    if width > max_element_width {
      width = max_element_width
    } else {
      width = auto
    }
    block(width: width, e)
  })
}

#let conf(
  doc,
) = {
  // format code block
  set raw(
    syntaxes: "assets/custom-OCaml.sublime-syntax",
    theme: "assets/code-theme.tmTheme",
  )

  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  show raw.where(block: true): it => block(
    fill: rgb(240, 240, 240),
    inset: 10pt,
    radius: 5pt,
    width: auto,
    text(fill: black, it),
  )
  doc
}

// Un sens de preuve, par exemple $==>$, ou $1==>2$
#let sens(h, hypo: none, title_stroke: 0.75pt, body) = {
  box(rect(strong(h), inset: 3pt, stroke: title_stroke))
  box(
    if hypo != none {
      " "
      if type(hypo) == str {
        emph(hypo)
      } else {
        math.italic(hypo)
      }
    },
    inset: (y: 3pt, x: 1pt),
  )
  linebreak()
  box(inset: (left: 5pt), body)
  linebreak()
}

#let numbered_eq(content) = math.equation(
  block: true,
  numbering: "(1)",
  supplement: [Éq.],
  content,
)

#let _format_eq_number(c) = {
  $italic((#c))$
}

#let mentioneq(name) = context [
  #let l = label(name)
  #let q = query(l).at(0)
  #if q.has("numbering") and q.numbering != none {
    let c = counter(math.equation).at(l).at(0)
    _format_eq_number(c)
    $:$
  }
  #q
]
#let mentioneqnumber(name) = context [
  #let l = label(name)
  #let q = query(l).at(0)
  #if q.has("numbering") and q.numbering != none {
    let c = counter(math.equation).at(l).at(0)
    _format_eq_number(c)
  }
]

// checks that there aren't duplicate ids
#let all_ids = state("all_ids", ())
#let new_id(id) = {
  if typ2anki_compile { return }
  reset_math_memo()
  state("all_ids").update(old => {
    old.push(id)
    old
  })
  context {
    let co = all_ids
      .final()
      .filter(id => id != "")
      .fold(0, (acc, key) => {
        if (key == id) {
          acc += 1
        }
        acc
      })
    if co > 1 {
      text(fill: red, weight: 600, size: 20pt, "Duplicate id: " + id)
    } else {
      none
    }
  }
}

#let _colored_block(stroke, fill, header, body) = {
  return _apply_max_width(block(
    clip: true,
    stroke: stroke, // Pink outline
    inset: 6pt, // Inner padding
    radius: 4pt, // Slightly rounded corners
    fill: fill, // Light pink background for contrast
    [
      #header \
      #body
    ],
  ))
}
// TODO: add a max width at 800px, possibly by using https://typst.app/docs/reference/layout/layout/
#let elem_preuve(p) = {
  _colored_block(rgb("#ff66b2"), rgb("#fef5fb"), [_Éléments de preuve_:], p)
}

#let elem_methode(p) = {
  _colored_block(rgb("#80e27e"), rgb("#f0fff4"), [_Éléments de méthode_:], p)
}

#let elem_exemple(p) = {
  _colored_block(rgb("#ff9800"), rgb("#fff3e0"), [_Exemple_:], p)
}

#let elem_remarque(p) = {
  _colored_block(rgb("#d32f2f"), rgb("#ffebee"), [_Remarque_:], p)
}

#let elem_reformulation(p) = {
  _colored_block(rgb("#7b1fa2"), rgb("#f3e5f5"), [_Reformulation_:], p)
}





