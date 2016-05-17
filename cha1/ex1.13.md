## 证明 ##
证明$Fib(n)$是最接近$\phi^n/\sqrt{5}$的整数，其中$\phi = (1+\sqrt{5})/2$，用数学归纳法和斐波那契的定义，证明$Fib(n) = (\phi^n - \gamma^n)/\sqrt{5}$

证：$Fib(n) = {\phi^n - \gamma^n\over\sqrt{5}}$

由数学归纳法

设 $Fib(n) = {\phi^n - \gamma^n\over\sqrt{5}}$

由$Fib(0) = 0$ 且$Fib(1) = 1$

则 
$Fib(0)={\phi^0-\gamma^0\over\sqrt{5}} = 0$
$Fib(1)={\phi^1-\gamma^1\over\sqrt{5}} = 1$
$\gamma={1-\sqrt{5}\over2}$

则

$Fib(n+1) = {\phi^{n+1}-\gamma^{n+1}\over\sqrt{5}}={\phi^{n}\phi-\gamma^{n}\gamma\over\sqrt{5}} ={\phi^{n}{1+\sqrt{5}\over2}-\gamma^{n}{1-\sqrt{5}\over2}\over\sqrt{5}}={\phi^n-\gamma^n\over2\sqrt{5}}+{\sqrt{5}(\phi^n+\gamma^n)\over2\sqrt{5}}={1\over2}Fib(n)+{\phi^n+\gamma^n\over2}$

$Fib(n+2) = {\phi^{n+2}-\gamma^{n+2}\over\sqrt{5}}={\phi^{n}\phi^2-\gamma^{n}\gamma^2\over\sqrt{5}} ={\phi^{n}({1+\sqrt{5}\over2})^2-\gamma^{n}({1-\sqrt{5}\over2})^2\over\sqrt{5}}={3(\phi^n-\gamma^n)\over2\sqrt{5}}+{\sqrt{5}(\phi^n+\gamma^n)\over2\sqrt{5}}={3\over2}Fib(n)+{\phi^n+\gamma^n\over2}$

得
$Fib(n+2)=Fib(n-1)+Fib(n)$

由上证明
$Fib(n) = {\phi^n - \gamma^n\over\sqrt{5}}$

又因
$|\gamma|=|{1-\sqrt{5}\over2}|<1$
${1\over\sqrt{5}}<{1\over2}$

故$|Fib(n)-{\phi^n\over\sqrt{5}}|=|-{\gamma^n\over\sqrt{5}}|<{1\over2}$

得证：$Fib(n)$是最接近$\phi^n/\sqrt{5}$的整数