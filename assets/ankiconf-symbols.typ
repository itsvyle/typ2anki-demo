/*
  All the math symbols
*/
#let rg = math.op("rg")
#let Vect = math.op("Vect")
#let Im = math.op("Im")
#let Ker = math.op("Ker")
#let ch = math.op("ch")
#let sh = math.op("sh")
#let Id = math.op("Id")
#let smallo = $limits("o", inline: #true)$
#let bigo = $limits("O", inline: #true)$
#let MMM = $cal(M)$
#let BBB = $cal(B)$
#let CCC = $cal(C)$
#let DDD = $cal(D)$
#let FFF = $cal(F)$
#let RRR = $cal(R)$
#let PPP = $cal(P)$
#let OOO = $cal(O)$
#let PPP = $cal(P)$
#let VVV = $cal(V)$
#let arw(x) = math.accent(x, math.arrow)
#let grad = arw("grad")
#let GL = $"GL"$
#let und = math.underline
#let Tr = math.op("Tr")
#let tq = "tq"
#let Sq = "Sq"
#let hr = line(length: 100%)
#let Cl = "Cl"
#let engendre = x => {
  $angle.l #x angle.r$
}
#let dis = math.display
#let dett(..ar) = math.mat(delim: "|", ..ar)
#let pgcd = math.op("pgcd")
#let ppcm = math.op("ppcm")
#let vp = math.op($nu_p$)
#let com = math.op("com")
#let dotp(..a) = {
  if (a.pos().len() < 2) {
    a = (a.at(0),a.at(0))
  } else {
    a = a.pos()
  }
  $lr(angle.l #a.join($,$) angle.r)$
}


// Helpers
// Trois points :)
#let tp(..args) = { [#args.pos().join($,...,$)] }
#let tpp(letter, end: "n", start: "1") = { tp($attach(#letter,br: start)$, $attach(#letter,br: end)$) }

#let resultb(c) = align(center, (box(c, inset: 0.7em, stroke: rgb("#ee3050"))))
#let vert(b) = {
  rotate(b, 90deg, reflow: false)
}
#let mm(..ar) = {
  let a = ar.pos()
  if a.len() == 0 {
    $MMM_(n) (KK)$
  } else if (a.len() == 1 or a.at(1) == 0) {
    $MMM_(#a.at(0)) (KK)$
  } else {
    $MMM_(#a.at(0), #a.at(1)) (KK)$
  }
}
#let Mat(..ar) = {
  // Mat (BBB_f,x)
  // Mat (BBB_f,BBB_e,x)
  let a = ar.pos()
  if a.len() == 0 {
    $"Mat"$
  } else if (a.len() == 1) {
    $"Mat" #a.at(0)$
  } else if (a.len() == 2) {
    $"Mat"_(#a.at(0)) #a.at(1)$
  } else if (a.len() == 3) {
    $"Mat"_(#a.at(0),#a.at(1)) #a.at(2)$
  }
}
#let color_math(col, expr) = text(fill: col, weight: "bold", $bold(expr)$)
#let math_function(name, goes_from, goes_to, associates, associates_with,arw_size: 100pt) = {
  grid(
    columns: (auto, 4pt, auto, arw_size, auto),
    rows: (auto, auto),
    gutter: 3pt,
    row-gutter: 10pt,
    name, grid.cell(
      ":",
      align: center,
    ), goes_from, $stretch(#sym.arrow.r, size: #arw_size)$, goes_to,
    "", "", grid.cell(
      associates,
      align: center,
    ), $stretch(#sym.arrow.r.bar, size: #arw_size)$, grid.cell(
      associates_with,
      align: center,
    )
  )
}

// Available types: line, bullet
#let hypos(..args, t: "line") = {
  if t == "line" {
    [
      #if args.pos().len() == 1 { "Soit" } else { "Soient" }
      #args.pos().join(", ", last: " et "):
      #linebreak()
    ]
  } else if t == "bullet" {
    [
      #if args.pos().len() == 1 { "Soit:" } else { "Soient:" }
      #list(..args)
    ]
  } else {
    panic("Invalid type for hypos: " + t)
  }
}
