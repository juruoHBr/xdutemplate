
#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "utils.typ": *
#import "frontmatter.typ": *
#import "mainbody.typ": *
#import "aftermatter.typ": *
#import "config.typ": *

#let xdudoc(
	fonts: (:),
	fontsize : 12pt,
	factor: 1.5,
	config: config-dict,
	doc
) = {
	//全局设置
	show strong: show-cn-fakebold

	set text(lang: "zh", region: "cn")
	set pagebreak(to: "odd", weak: true)
	// let (title-font,main-font) = get-fonts(fonts)
	set text(
		font: (config.en-main-font,config.ch-main-font), 
		size: fontsize,
		lang: "zh",
	) 
	set par(
		leading: 15pt, // 行间距
		spacing: 15pt, // 段落间距
		first-line-indent: 2em, 
		justify: true,
	)
	set page(
		margin: (top:3cm, bottom: 2cm, inside: 3cm, outside: 2cm),
		header-ascent: 1cm-config.header-fontsize, //页眉和正文之间的间距
	)

	// set block(above:  15.6pt * factor - 0.7em, below: 15.6pt * factor - 0.7em)

	//章节标题设置
	

	// show heading: set text(font: (config.ch-heading-font,config))
	show heading: set block(above:24pt,below: 20pt) //标题上下间距
	show heading: it =>{it + fake-par}
	show heading.where(level:1) : it => {
		pagebreak() 
		set text(
			size: config.heading-fontsize.at(0),
			font: (config.en-heading-font.at(0),config.ch-heading-font.at(0))
		)
		align(center)[#it]
		context{
		 	let pagenum = int(here().page())
			let headincounter = counter(heading).at( here() )
			headings.update( 
				headings => headings + ( 
					(
						pagenum:pagenum,
						heading: it,
						heading-counter: headincounter
					), 
				) 
			)
		}
		counter(figure.where(kind: table)).update(0)
		counter(figure.where(kind: image)).update(0)
		counter(math.equation).update(0)
	}
	show heading.where(level: 2) : it => {
		set text(
			size: config.heading-fontsize.at(1),
			font: (config.en-heading-font.at(1),config.ch-heading-font.at(1))
		)		
		align(center)[#it]	
	}

	set math.equation(supplement: none)
	
	show figure.where(kind: table): set figure.caption(position: top)
	show figure.caption : set text(size: config.caption-fontsize)

	doc
	pagebreak()
}