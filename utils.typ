#let fake-par = style(styles => {
  let b = par[#box()]
  let t = measure(b + b, styles);
  b
  v(-t.height)
})

#let hei(body)  = text(font: "SimHei", body)
#let kai(body)  = text(font: "Simkai", body)

