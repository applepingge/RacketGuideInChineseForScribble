;01.scrbl
;1 Racket语言欢迎你
#lang scribble/doc
@(require scribble/manual scribble/eval scribble/bnf "guide-utils.rkt"
          (only-in scribble/core link-element)
          (for-label racket/enter))

@;(define piece-eval (make-base-eval))

@title[#:tag "intro"]{Racket语言欢迎你!}

依赖于你如何看待它，Racket语言是：

@itemize[
         
 @item{@defterm{一种编程语言}——一种Lisp语言的方言，继承于Scheme；}
  
 @item{@defterm{一系列编程语言}——如Racket或者其它等等；}
 
 @item{@defterm{一系列工具集}——用于一系列编程语言的。}
 
 ]

当不会出现混乱的地方，我们就用简单的@defterm{Racket}。

Racket的主要工具是包括：

@itemize[
         
 @tool["racket"]{核心编译器、解释器和运行时系统；}
  
 @tool["DrRacket"]{编程环境；}
 
 @tool["raco"]{一个用于执行Racket命令以安装软件包、建立库等等的命令行工具。}

 ]

　　最有可能的是，你想使用DrRacket探索Racket语言，尤其是在开始阶段。如果您愿意，您还可以使用命令行@exec{racket}解释器和您喜欢的文本编辑器,也可以参见《@secref["other-editors"]》部分内容。本指南的其余部分介绍了与语言无关的编辑器的选择。

如果你使用DrRacket，就需要选择适当的语言，因为DrRacket可以容纳许多不同的变种如Racket，以及其他语言。如果你以前从未使用DrRacket，启动它，在DrRacket顶上的文本区域输入这一行：

@racketmod[racket]

然后单击@onscreen{运行}（Run）按钮的上方的文本区。DrRacket就明白你的意思在Racket执行正常变体的工作（相对于较小的@racketmodname[racket/base]或许多其他的可能性）。

如果你使用DrRacket之前已经使用了其它以@hash-lang[]开始，那么DrRacket会记得你上次使用的语言，而不是从@hash-lang[]推断的语言。在这种情况下，使用@menuitem["Language" "Choose Language..."]（语言|选择语言……）菜单项去改变。在出现的对话框中，选择第一项，它告诉DrRacket使用通过@hash-lang[]申明在源程序中的语言。仍然要把把@hash-lang[]放在文本区域的顶部的。

@; ----------------------------------------------------------------------
@;1.1 与Racket语言交互
@include-section["01.01.scrbl"]

@;1.2 定义和交互
@include-section["01.02.scrbl"]

@;1.3 创建可执行文件
@include-section["01.03.scrbl"]

@;1.4 给有LISP/Scheme经验的读者的一个说明
@include-section["01.04.scrbl"]