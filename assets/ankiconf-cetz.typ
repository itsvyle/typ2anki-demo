#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1"
#import cetz: canvas, draw, vector
= CetZ stuff

#let figcan(body, caption: none) = {
  figure(caption: caption, canvas(body))
}

#let point(
  pos,
  value: [],
  anchor: "south-east",
  color: black,
  padding: 5pt,
  name: none,
) = {
  import draw: circle, content
  circle(pos, radius: 1.5pt, stroke: color, fill: color, name: name)
  content(pos, value, anchor: anchor, padding: padding)
}

#let math_plot_tick_format(v) = {
  let vp = calc.abs(v / calc.pi)
  let sign = if v / calc.pi > 0 { $$ } else { $-$ }
  let fr = calc.fract(vp)
  if fr == 0 {
    $ #sign #vp pi $
  } else if calc.fract(1 / fr) == 0 {
    $ #sign #{ vp * 1 / fr } / #{ 1 / fr } pi $
  } else {
    calc.round(v, digits: 2)
  }
}

#let math_plot(
  x,
  y: none,
  mode: "lin",
  x-tick: none,
  x-ticks: (),
  y-tick: none,
  y-ticks: (),
  x-label: none,
  y-label: none,
  color: blue,
  size: (6, 6),
  x-grid: none,
  y-grid: none,
  samples: 200,
  format-func: none,
  legend-coordinates: auto,
  legend-anchor: auto,
  ..fs,
) = {
  import cetz-plot: plot
  import draw: content
  let (x-min, x-max) = x

  let (y-min, y-max) = if y == none {
    (auto, auto)
  } else {
    y
  }

  let style = if color == auto { (:) } else {
    (stroke: color)
  }

  // let (y-min, y-max) = y
  let fs = fs.pos()

  let x-tick = if x-tick == auto {
    (x-max - x-min) / 5
  } else {
    x-tick
  }

  if format-func == none {
    format-func = math_plot_tick_format
  }

  let labels = ()
  let plot-name = "plot"

  figcan({
    plot.plot(
      axis-style: "school-book",
      size: size,
      mode: mode,
      legend: legend-coordinates,
      legend-anchor: legend-anchor,
      x-min: x-min,
      x-max: x-max,
      y-min: y-min,
      y-max: y-max,
      x-tick-step: x-tick,
      y-tick-step: y-tick,
      x-ticks: x-ticks,
      y-ticks: y-ticks,
      x-label: x-label,
      y-label: y-label,
      x-format: format-func,
      y-format: format-func,
      x-grid: x-grid,
      y-grid: y-grid,
      name: plot-name,
      {
        for f in fs {
          if type(f) == array {
            let domain = f.at(0)
            if domain == none { domain = (x-min, x-max) }
            let fun = f.at(1)
            let label = if f.len() == 3 {
              f.at(2)
            } else { none }
            plot.add(
              style: style,
              domain: domain,
              samples: samples,
              label: label,
              fun,
            )
          } else if type(f) == dictionary {
            if "vert" in f {
              plot.add-vline(
                ..f.vert,
                min: f.at("min", default: auto),
                max: f.at("max", default: auto),
                style: style,
              )
            } else if "horz" in f {
              plot.add-hline(
                ..f.horz,
                min: f.at("min", default: auto),
                max: f.at("max", default: auto),
                style: style,
              )
            } else if "stroke" in f {
              style.stroke = f.stroke
            } else if "mark" in f {
              // put a marker on the point, and draw horizontal and vertical dahses to it
              plot.add(
                (f.mark,),
                mark: f.at("mark-char", default: "o"),
                mark-size: f.at("mark-size", default: 5pt),
                mark-style: f.at("mark-style", default: none),
              )
              let markx = f.mark.at(0)
              let marky = f.mark.at(1)
              if (
                f.at("dashes", default: false)
                  and not (markx == 0 and marky == 0)
              ) {
                let dashes-style = f.at("dashes-style", default: (
                  stroke: (
                    paint: gray,
                    thickness: 2pt,
                    dash: "densely-dotted",
                  ),
                ))
                let left = if markx < 0 { markx } else { 0 }
                let right = if markx < 0 { 0 } else { markx }
                let bottom = if marky < 0 { marky } else { 0 }
                let top = if marky < 0 { 0 } else { marky }
                plot.add-hline(
                  marky,
                  min: left,
                  max: right,
                  style: dashes-style,
                )
                plot.add-vline(
                  markx,
                  min: bottom,
                  max: top,
                  style: dashes-style,
                )
              }
              if f.at("label", default: false) {
                labels.push((
                  (markx, marky),
                  $(#markx,marky)$,
                ))
              }
            }
          } else {
            plot.add(style: style, domain: (x-min, x-max), samples: samples, f)
          }
        }
      },
    )
  })
}


#let double_arrow(p1, p2, ..params) = {
  import draw: line
  line(p1, p2, mark: (start: "straight", end: "straight"), ..params)
}

#let arrow(p1, p2, tip: none, pad: 0.3, ..params) = {
  import draw: content, line
  line(p1, p2, mark: (end: "straight"), ..params)
  content(
    (
      (a, b) => cetz.vector.add(b, cetz.vector.scale(
        cetz.vector.norm(cetz.vector.sub(b, a)),
        pad,
      )),
      p1,
      p2,
    ),
    tip,
  )
}

/// Draws a line going through the two points
/// The line stops at the edges of the box, degined by the top-left and the bot-right corner
/// If the line is outside the box or grazes, this may not compile
#let line_through(a, b, box: (none, none), name: none, ..style) = {
  import draw: *

  group(name: name, {
    get-ctx(ctx => {
      let (cetz, a, b) = cetz.coordinate.resolve(ctx, a, b)

      let (ax, ay, _) = a
      let (bx, by, _) = b

      let dy = by - ay
      let dx = bx - ax

      let sx = (ax - 10 * dx, ay - 10 * dy)
      let sy = (bx + 10 * dx, by + 10 * dy)

      let (boxa, boxb) = box
      intersections("i", {
        hide({
          line(sx, sy)
          rect(boxa, boxb)
        })
      })

      line("i.0", "i.1", name: "__tmpLine", ..style)
      copy-anchors("__tmpLine")
    })
  })
}

#let info_func_spec(
  signature,
  description,
  extra-behavior: none,
  raises: none,
  example: none,
) = {
  [
    === Signature
    #raw(signature, block: true, lang: "ml")
    === Description
    #description
    #if type(raises) == array and raises.len() != 0 {
      [
        === Raises
        #list(..raises)
      ]
    }
    #if example != none {
      if type(example) == array {
        [=== Examples]
        let m = example.len()
        for (i, e) in example.enumerate() {
          e
          if i != m - 1 { line(length: 100%) }
        }
      } else {
        [=== Example]
        example
      }
    }
  ]
}

#let gridpat = tiling(size: (10pt, 10pt))[
  #place(line(start: (0%, 0%), end: (100%, 100%)))
  #place(line(start: (0%, 100%), end: (100%, 0%)))
]
