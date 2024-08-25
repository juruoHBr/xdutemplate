
#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "utils.typ": *

// ---------------------------全局变量-------------------------
#let headings = state("headings",())
#let frontmattercnt = counter("frontmattercnt")
#let mainpagecnt = counter("mainpagecnt")

// ----------------------------辅助函数-------------------------
#let get-fonts(fonts) = {
	let font-dict = (
		en-main-font: "Times New Roman",
		en-heading-font: "Times New Roman",
		ch-main-font: "SimSun",
		ch-heading-font: "SimHei",
	) + fonts
	let title-font = (font-dict.en-heading-font, font-dict.ch-heading-font)
	let main-font = (font-dict.en-main-font,font-dict.ch-main-font)
	return (title-font,main-font)
}

// 获取header的文本
#let getheaderinfo(loc,title) = {
	if(calc.odd(loc.page())){
		let headings_array = headings.final(loc)
		let headertext =none
		for page_heading in headings_array{
			if int(loc.page()) < page_heading.at(0){
				return headertext
			}
			headertext =  page_heading
		}
		return headings_array.last()
	}
	else {
		return (0,-1,title)
	}
}

// 排版header
#let header-fun(numberformat: "1",cnt: counter(page),title:[]) = {
	let headercontext = {
		locate(loc=>{
			h(1fr)
			let headerinfo = getheaderinfo(loc,title)
			if(headerinfo.at(1)==-1){
				headerinfo.at(2)
			}
			else {
				let header-format = headerinfo.at(1)
				if header-format != none{
					numbering(header-format,..headerinfo.at(3)) + " "
				}
				headerinfo.at(2) 
			}
			h(1fr)
		})
	}  
	block(width: 100%, height: 100%, stroke: (bottom:1pt), inset: 0.5em)[
		#headercontext
		#locate(loc => 
			if(calc.odd( loc.page() )){
				place(right+bottom)[#cnt.display(numberformat)]
			}
			else {
				place(left + bottom)[#cnt.display(numberformat)]
			}
		)
		
	]
}



// ----------------------------文档函数-------------------------
#let abstract(
	ch-abstract,
	en-abstract
) = {
	heading(level: 1, outlined: false)[摘要]
	ch-abstract
	heading(level: 1, outlined: false)[Abstract]
	en-abstract
}

#let cover(
	info: none
) = [

	#set par(first-line-indent: 0em)
	#set table(stroke: (x, _) => if x == 1 { (bottom: 0.8pt) })
	#set page(margin: (top: 2.54cm, bottom: 2.54cm) )
	#set align(center)

	#{
		set text(size: 12pt)
		place(top+right,dx: -1.5cm)[
			#table(
				columns: (3em,7em),
				align: bottom + center,
				column-gutter: 0.5em,
				[*班~~级*], [*#info.class*],
				[*学~~号*], [*#info.number*],
			)
		]
	}


	#v(2.5cm)
	#image("figures/校名.jpg", width: 7.73cm, height: 1.27cm, fit: "stretch")
	#v(0.9cm)
	#text(font: "SimHei", size: 42pt, tracking: 5pt)[本科毕业设计论文]
	#v(1.2cm)
	#image("figures/校徽.png",width: 4.39cm, height: 4.18cm, fit: "stretch")
	#v(1cm)

	#{
		set text(size: 15pt)
		let titles = info.covertitle.split("\n")
		move(dx : -15pt,
			table(
				columns: (5em,15em),
				align: bottom,
				row-gutter: 1.8em,
				column-gutter: 1em,
				[*题~~~~~~~~目*], hei[#titles.at(0)],
				[],hei[#titles.at(1)],
				[*学~~~~~~~~院*], [#info.school],
				[*专~~~~~~~~业*], [#info.major],
				[*学生姓名*], [#info.name],
				[*导师姓名*], [#info.tutor],
			)
		)
	}

		
	
]

#let thesis-contents() ={
	pagebreak()
	outline(indent: auto)
}

#let front-matter(doc,title: []) = {
	//页面设置
	set page(
		header: frontmattercnt.update(it=>it+1)+ header-fun(numberformat:  "i",cnt: frontmattercnt,title:title),
		footer: []
	)
	doc
}

#let mainbody(title:[],doc) = {
	// 标题设置
	show heading: set heading(numbering: "1.1")
	show heading.where(level: 1): set heading(numbering: "第一章")

	set page(
		header: mainpagecnt.update(it=> it+1)+header-fun(numberformat: "1",cnt: mainpagecnt, title: title),
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
}

#let after-matter(title:[],doc) = {
	set page(
		header: mainpagecnt.update(it=> it+1)+header-fun(numberformat:  "1",cnt: mainpagecnt, title: title),
		footer: []
	)
	doc
}


#let appendix(doc) = {

	set figure(numbering: it=>{
		context numbering("A",counter(heading).get().first()) + str(it)
	})

	set math.equation(numbering: it=>{
		"式(" + context numbering("A",counter(heading).get().first() )+ "-" + str(it) +")"
	})

	show heading.where(level: 1): set heading(numbering: "附录A")

	counter(heading).update(0)

	doc
}



//----------------------------论文模板--------------------

#let xdudoc(
	fonts: (:),
	fontsize : 12pt,
	factor: 1.5,
	doc
) = {
	//全局设置
	show strong: show-cn-fakebold

	set text(lang: "zh", region: "cn")
	set pagebreak(to: "odd", weak: true)
	let (title-font,main-font) = get-fonts(fonts)
	set text(
		font: main-font, 
		size: fontsize,
		lang: "zh",
	) 
	set par(
		leading: 15.6pt * factor - 0.7em,
		first-line-indent: 2em, 
		justify: true,
	)
	set page(margin: (top:3cm, bottom: 2cm, inside: 3cm, outside: 2cm))

	set block(above:  15.6pt * factor - 0.7em, below: 15.6pt * factor - 0.7em)

	//章节标题设置
	show heading: set text(font: title-font)
	show heading: it =>{it + fake-par}
	show heading.where(level:1) : it => {
		pagebreak() 
		set text(size: 16pt)
		align(center)[#it]
		locate(loc=>{
		 	let pagenum = int(loc.page())
			headings.update( 
				headings => headings + ( (pagenum,it.numbering,it.body,counter(heading).at((loc) )), ) 
			)
		})
		counter(figure.where(kind: table)).update(0)
		counter(figure.where(kind: image)).update(0)
		counter(math.equation).update(0)
	}
	show heading.where(level: 2) : set text(size: 14pt)	

	set math.equation(supplement: none)
	
	show figure.where(kind: table): set figure.caption(position: top)
	show figure.caption : set text(size: 10pt)

	doc

}