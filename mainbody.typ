#import "utils.typ": *


#let mainbody(doc) = {
	// 标题设置
	show heading: set heading(numbering: "1.1")
	show heading.where(level: 1): set heading(numbering: "第一章")

	set page(
		header:  header-fun(numberformat: "1"),
		footer: []
	)

  show math.equation: set text(font: ("New Computer Modern Math", "SimHei"))
	set math.equation(numbering: it=>{
    set text(font: ("Times New Roman","SimSun"))
		"式(" + context str(counter(heading).get().first() )+ "-" + str(it) +")"
	})

	set figure(numbering: it=>{
		context str(counter(heading).get().first()) + "." + str(it)
	})

	counter(page).update(1)
	doc
	pagebreak()
}