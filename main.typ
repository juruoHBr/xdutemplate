#import "template.typ": *
#show: xdudoc.with(
	fonts: (:),
	fontsize : 12pt,
	factor: 1.5,
)



#let info = (
	title : "某雷达脉压模块与实测数据的分析软件设计",
	covertitle : "某雷达脉压模块与实测数据的\n分析软件设计",
	school: "电子工程学院",
	major: "电子信息工程",
	name : "郑XX",
	class :  [2101010],
	tutor : "陈XX",
	number : "21009100000"
)


#cover(info: info)

#front-matter(title: info.title)[
	#abstract[
		本文结合某阵列雷达开展两方面的研究工作：一是对该雷达实测数据，利用MATLAB图形用户界面（GUI）开发实测数据的分析软件包，实现对实测数据的脱机处理。该软件能实现脉冲压缩、MTI、非相干积累、恒虚警检测等处理，同时具有良好的人机界面，使用灵活方便。二是利用“魂芯”数字信号处理器（BWDSP100）的Demo开发板设计脉冲压缩和链路口的DSP程序，并与其他DSP（TS201）比较，分析DSP处理程序的实时性。另外，设计开发板上的FPGA（EP2C35）的控制逻辑和时序，实现从链路口到FPGA再到串行D/A变换器之间的数据传输，从而通过示波器就可以直观观察脉压处理的结果。

		#h(-2em) *关键词* 脉冲压缩  图形用户界面（GUI）  数字信号处理器  DSP程序 脱机分析软件

	][
		The paper based on array radar to carry out two aspects of research: The first part of the work is to develop the measured data analysis software package with the help of MATLAB graphical user interface (GUI) and do off-line processing. The software is able to achieve pulse compression, MTI, non-coherent accumulation, CFAR, and also has good man-machine interface, using flexible and convenient. The second part of the work is to design the DSP pulse compression and link port transmission program. With the help of  "Brain Ware digital signal processor (BWDSP100)” on the Demo development Board, we finished the work successfully. The processing time of BWDSP100 is estimated and compared with other DSP (TS201) to do the DSP computation time analysis. In addition, we design the control logic and timing of the FPGA (EP2C35) on the Demo development Board. The data is exported to FPGA through the link port and transferred to the serial D/A converter, thus the results of pulse compression can be directly observed on the oscilloscope.

		#h(-2em) *keywords*  PC (Pulse Compression)   GUI (Graphical User Interface) DSP Program Off-line Analysis Software

	]

	#thesis-contents()
]

// 
#mainbody(title: info.title)[
	= 这是第一章

	#lorem(1000)

	#strong[]

	$
	f=1
	$

	== 这是第一小节
	=== 这是第一小小节
	$
	f=1
	$<cc>
	dddsdfasdf
	@cc

	#figure(
		rect(width: 5cm, height: 5cm),
		caption: [ddd]
	)
	sdfs
		#figure(
			table([1],[2]), 
			caption: [dd]
	)<dd>

	@dd

	= 测试
	

	测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试

	#kai[#text(20pt)[楷体]]

	测试测试

	$
	g=1
	$

	== 测试

	测试测测试

		#figure(
		rect(width: 5cm, height: 5cm),
		caption: [ddd]
	)
		sdfs
		#figure(
			table([1],[2]), 
			caption: [dd]
	)

	= 第三章
第三章

]

#after-matter()[
	#bibliography("ref.bib")

	= 致谢
	测试 

	#appendix[

		
= ddd



#figure(
		rect(width: 5cm, height: 5cm),
		caption: [测试]
	)
$
f + g
$

	]
]




