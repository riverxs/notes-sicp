; the interpreter will print 'quote' strings with this expression

(car ''abracadabra) ; quote

; please explain this result?

(quote a) can replace 'a

(''abracadabra) == ('(quote abracadabra))

; so

(car ''abracadabra) == (car '(quote abracadabra)); will print quote ,the 'quote' is a symbol!!


