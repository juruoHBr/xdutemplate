#import "utils.typ":*

#let abstract(
	ch-abstract,
	en-abstract,
	ch-keywords:[],
	en-keywords:[]
) = {
	heading(level: 1, outlined: false)[摘要]
	ch-abstract

	h(-2em) 
	text(font: ("Times New Roman","SimHei"))[关键词：#ch-keywords ]

	heading(level: 1, outlined: false)[Abstract]
	en-abstract
	strong[Keywords: #en-keywords]
}


#let thesis-contents() ={
	outline(indent: auto)
}

#let front-matter(doc) = {
	//页面设置
	set page(
		header:  header-fun(numberformat:  "i"),
		footer: []
	)
	doc
	pagebreak()

}