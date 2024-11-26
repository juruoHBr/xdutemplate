#import "utils.typ": *


#let after-matter(doc) = {
	set page(
		header: header-fun(numberformat: "1"),
		footer: []
	)
	doc
	pagebreak()
}


#let appendix(doc) = {

	set figure(numbering: it=>{
		context numbering("A",counter(heading).get().first()) + str(it)
	})

	set math.equation(numbering: it=>{
		set text(font: ("Times New Roman","SimSun"))
		"式(" + context numbering("A",counter(heading).get().first() )+ "-" + str(it) +")"
	})

	show heading.where(level: 1): set heading(numbering: "附录A")

	counter(heading).update(0)

	doc
}
