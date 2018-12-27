; 不同意
; 访问balance和withdraw、deposit过程可以并行执行, 而balance只是读操作（原子化操作），任何时候读balance都能读到当时的正确余额
; 串行化balance读取不会产生任何不同的执行结果