# 西安电子科技大学本科毕业设计论文模板

```

#import "template.typ": *
#show: xdudoc.with(
	fonts: (
        en-main-font: "Times New Roman",
		en-heading-font: "Times New Roman",
		ch-main-font: "SimSun",
		ch-heading-font: "SimHei",
    ), // 这里配置字体
	fontsize : 12pt, //正文字体大小
	factor: 1.5, //正文字体行间距
)



#let info = (
	title : "某雷达脉压模块与实测数据的分析软件设计",  // 论文标题 显示在页眉
	covertitle : "某雷达脉压模块与实测数据的\n分析软件设计", //论文标题 显示在封面 使用\n断行
	school: "电子工程学院",
	major: "电子信息工程",
	name : "郑XX",
	class :  [2101010],
	tutor : "陈XX",
	number : "21009100000"
)

```

在utils文件中提供了几个有用的工具：

- `fake-par` 假段落 用于占位 解决typst在某些地方不能自动缩进的bug
- `hei` 黑体
- `kai` 楷体
