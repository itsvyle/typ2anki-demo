/*
  All the memoization logic for maths
*/
#let latest_sum_variable = state("latest_sum_variable", none)
#let latest_sum_start = state("latest_sum_start", none)
#let latest_sum_end = state("latest_sum_end", none)
#let latest_sum_content = state("latest_sum_content", none)
#let summ(
  ..content,
  var: "",
  s: "",
  e: "",
) = {
  context [
    #{
      let _var = var
      let _s = s
      let _e = e
      let _content = if content.pos().len() > 0 {
        content.at(0)
      } else {
        none
      }

      if var != "" {
        latest_sum_variable.update(var)
      } else {
        _var = latest_sum_variable.get()
      }

      if s != "" {
        latest_sum_start.update(s)
      } else {
        _s = latest_sum_start.get()
      }

      if e != "" {
        latest_sum_end.update(e)
      } else {
        _e = latest_sum_end.get()
      }

      if _content != none {
        latest_sum_content.update(_content)
      } else {
        _content = latest_sum_content.get()
      }

      if _content == "" { return }

      let sub = if _s == none and _var == none {
        $$
      } else if _var == none {
        $#_s$
      } else if _s == none {
        $#_var$
      } else {
        $#_var = #_s$
      }


      if _var == none { _var = $$ }
      if _s == none { _s = $$ }
      if _e == none { _e = $$ }

      $sum_#sub^#_e #_content$
    }
  ]
}

#let latest_product_variable = state("latest_product_variable", none)
#let latest_product_start = state("latest_product_start", none)
#let latest_product_end = state("latest_product_end", none)
#let latest_product_content = state("latest_product_content", none)
#let prodd(
  ..content,
  var: "",
  s: "",
  e: "",
) = {
  context [
    #{
      let _var = var
      let _s = s
      let _e = e
      let _content = if content.pos().len() > 0 {
        content.at(0)
      } else {
        none
      }

      if var != "" {
        latest_product_variable.update(var)
      } else {
        _var = latest_product_variable.get()
      }

      if s != "" {
        latest_product_start.update(s)
      } else {
        _s = latest_product_start.get()
      }

      if e != "" {
        latest_product_end.update(e)
      } else {
        _e = latest_product_end.get()
      }

      if _content != none {
        latest_product_content.update(_content)
      } else {
        _content = latest_product_content.get()
      }

      if _content == "" { return }

      let sub = if _s == none and _var == none {
        $$
      } else if _var == none {
        $#_s$
      } else if _s == none {
        $#_var$
      } else {
        $#_var = #_s$
      }


      if _var == none { _var = $$ }
      if _s == none { _s = $$ }
      if _e == none { _e = $$ }

      $product_#sub^#_e #_content$
    }
  ]
}

#let latest_lim_var = state("latest_lim_var", none)
#let latest_lim_value = state("latest_lim_value", none)
#let limm(var: "", val: "", silent: false) = {
  context [
    #{
      let _var = var
      let _val = val

      if var != "" {
        latest_lim_var.update(var)
      } else {
        _var = latest_lim_var.get()
      }

      if val != "" {
        latest_lim_value.update(val)
      } else {
        _val = latest_lim_value.get()
      }

      if (silent) { return }

      let sym = $stretch(limits(->))$

      if _var == none and _val == none {
        $#sym$
      } else if _var == none {
        $#sym _(#_var)$
      } else if _val == none {
        $#sym _(#_val)$
      } else {
        $#sym _(#_var -> #_val)$
      }
    }
  ]
}

#let latest_integral_var = state("latest_integral_var", none)
#let latest_integral_a = state("latest_integral_a", none)
#let latest_integral_b = state("latest_integral_b", none)
#let latest_integral_content = state("latest_integral_content", none)
#let inte(..content, var: "", a: "", b: "") = {
  context [
    #{
      let _var = var
      let _a = a
      let _b = b
      let _content = if content.pos().len() > 0 {
        content.at(0)
      } else {
        none
      }

      if var != "" {
        latest_integral_var.update(var)
      } else {
        _var = latest_integral_var.get()
      }

      if a != "" {
        latest_integral_a.update(a)
      } else {
        _a = latest_integral_a.get()
      }

      if b != "" {
        latest_integral_b.update(b)
      } else {
        _b = latest_integral_b.get()
      }

      if _content != none {
        latest_integral_content.update(_content)
      } else {
        _content = latest_integral_content.get()
      }

      if _content == "" { return }

      if _b == none { _b = $$ }
      if _a == none { _a = $$ }
      _var = if _var == none { $$ } else { $dif #_var$ }

      $integral_#_a^#_b #_content #_var$
    }
  ]
}

// Should be called on every card
// as in production, each card only has its own context
#let reset_math_memo() = {
  context [
    #{
      latest_sum_variable.update(none)
      latest_sum_start.update(none)
      latest_sum_end.update(none)
      latest_sum_content.update(none)

      latest_product_variable.update(none)
      latest_product_start.update(none)
      latest_product_end.update(none)
      latest_product_content.update(none)

      latest_lim_var.update(none)
      latest_lim_value.update(none)

      latest_integral_var.update(none)
      latest_integral_a.update(none)
      latest_integral_b.update(none)
      latest_integral_content.update(none)
    }
  ]
}
