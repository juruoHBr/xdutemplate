#import "template.typ": *


#show: xdudoc.with(
  fonts: (:),
  fontsize: 12pt,
  factor: 1.5,
)



#let info = (
  title: "某雷达脉压模块与实测数据的分析软件设计",
)



#front-matter[
  #abstract(
    ch-keywords: [Typst ~~~ xdutemplate ~~~~ 西电本科论文模板],
    en-keywords: [Typst ~~~ xdutemplate ],
  )[

    这里是中文摘要。 本模板是基于typst12.0实现的西安电子科技大学本科生论文模板。由于封面可能不统一，并且学校直接提供word封面且不经常修改，因此本模板不再提供封面。建议完成内容后使用pdf合并提交最终版。

  ][
    This is English abstract


  ]

  #thesis-contents()
]

//


#mainbody[
  = 这里是第一章 <CH1>

  这里是第一章这里是第一章这里是第一章这里是第一章 这里是第一章这里是第一章这里是第一章这里是第一章这里是第一章这里是第一章这里是第一章这里是第一章这里是第一章这里是第一章这里是第一章这里是第一章这里是第一章这里是第一章这里是第一章这里是第一章。



  == 这是第一小节 <CHH1>
  === 这是第一小小节
  这里有一个公式：
  $
    f=1
  $<cc>

  @cc 是一个很好的公式。

  这里有个图和一个表

  #figure(
    rect(width: 5cm, height: 5cm),
    caption: [ddd],
  )

  #figure(
    table([1],[2]),
    caption: [dd],
  )<dd>

  @dd 是一个很好的表

  这里还有一个图

  #figure(
    rect(width: 5cm, height: 5cm),
    caption: [ddd],
  )

  = 这里是第二章

  这里是第二章这里是第二章这里是第二章这里是第二章这里是第二章这里是第二章这里是第二章这里是第二章这里是第二章



  == 这里是第二章第一小节


  === 第一小小节


  测试测测试 测试测测试 测试测测试 测试测测试 测试测测试 测试测测试 测试测测试 测试测测试 测试测测试 测试测测试 测试测测试 测试测测试 测试测测试 测试测测试 测试测测试 测试测测试


  #figure(
    rect(width: 5cm, height: 5cm),
    caption: [ddd宋体],
  )
  sdfs
  #figure(
    table([1],[2]),
    caption: [dd],
  )

  $
    f=1
  $<eq>

  @eq

  = 第三章

  这里有两个引用文献：

  文献1 @李斌2012极化码原理及应用

  文献2 @2001The

]

#after-matter[
  #bibliography("ref.bib")

  = 致谢
  谢谢大家
  #appendix[


    = ddd



    #figure(
      rect(width: 5cm, height: 5cm),
      caption: [测试],
    )
    $
      f + g
    $<eqq>

    可以看到，附录的表和@eqq 的编号都没有问题。


  ]


]





