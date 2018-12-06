((define (eval exp env)
  (cond ((self-evaluation? exp) exp)
  )))