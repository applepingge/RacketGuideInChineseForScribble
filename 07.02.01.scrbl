;07.02.01.scrbl
;7.2.1 ->类型
#lang scribble/doc
@(require scribble/manual
          scribble/eval
          scribble/core
          racket/list
          scribble/racket
          "guide-utils.rkt"
          "utils.rkt"
          (for-label racket/contract))

@title[#:tag "styles-of->"]{ @racket[->]类型}

如果你已经习惯了数学函数，你可以选择一个合约箭头出现在函数的域和范围内，而不是在开头。如果你已经读过《如何设计程序》（@|HtDP|），你已经见过这个很多次了。事实上，你可能在其他人的代码中见过这样的合约：

@racketblock[
(provide (contract-out
          [deposit (number? . -> . any)]))
]

如果Racket的S表达式包含中间有一个符号的两个点，读取器重新安排S表达式并安置符号到前面，如《列表和Racket的语法》（@secref["lists-and-syntax"]）叙述的那样。因此，

@racketblock[
(number? . -> . any)
]

只是以下内容的另一种写作方式

@racketblock[
(-> number? any)
]