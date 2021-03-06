;07.03.09.scrbl
;7.3.9 固定但静态未知数量的参数
#lang scribble/doc
@(require scribble/manual
          scribble/eval
          "utils.rkt"
          (for-label framework/framework
                     racket/contract
                     racket/gui))

@title[#:tag "no-domain"]{固定但静态未知数量的参数}

想象一下你自己为一个函数写了一个合约，这个函数接受了另一个函数和一个字列表，最终数值前者应用于后者。如果给定的函数的数量匹配给定列表的长度，你的程序就有困难。

考虑这个@racket[n-step]函数：

@racketblock[
(code:comment "(number ... -> (union #f number?)) (listof number) -> void")
(define (n-step proc inits)
  (let ([inc (apply proc inits)])
    (when inc
      (n-step proc (map (λ (x) (+ x inc)) inits)))))
]

@racket[n-step]参数是@racket[proc]，一个@racket[proc]函数的结果要么是数字要么是假，或者一个列表。然后应用@racket[proc]到@racket[inits]列表中。只要@racket[proc]返回一个数值，@racket[n-step]对待数值为每个在其数字@racket[inits]和递归的增量值。当@racket[proc]返回@racket[false]时，循环停止。

这里有两个应用：

@racketblock[
(code:comment "nat -> nat") 
(define (f x)
  (printf "~s\n" x)
  (if (= x 0) #f -1))
(n-step f '(2))

(code:comment "nat nat -> nat") 
(define (g x y)
  (define z (+ x y))
  (printf "~s\n" (list x y z))
  (if (= z 0) #f -1))
  
(n-step g '(1 1))
]

一个@racket[n-step]的合约必须指定@racket[proc]的两方面行为：其数量必须在@racket[inits]里包括元素的数量，它必须返回一个数值或@racket[#f]。后者是容易的，前者是困难的。乍一看，这似乎表明合约分配@italic{variable-arity}给了@racket[proc]：

@racketblock[
(->* () 
     #:rest (listof any/c)
     (or/c number? false/c))
]

然而，这个合约说函数必须接受@emph{任意（any）}数量的参数，而不是@emph{特定（specific）}的但@emph{不确定（undetermined）}的数值。因此，应用@racket[n-step]到@racket[(lambda (x) x)] and @racket[(list 1)]违约，因为给定的函数只接受一个参数。

正确的合约采用@racket[unconstrained-domain->]组合，其仅指定函数的范围，而不是它的域。可以将本合约的数量测试指定正确的合约结合@racket[n-step]：

@racketblock[
(provide
 (contract-out
  [n-step
   (->i ([proc (inits)
          (and/c (unconstrained-domain-> 
                  (or/c false/c number?))
                 (λ (f) (procedure-arity-includes? 
                         f 
                         (length inits))))]
         [inits (listof number?)])
        ()
        any)]))
]