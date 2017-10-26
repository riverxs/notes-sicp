/*用scheme学习这一章一段时间后，我发现用熟悉的JavaScript可以
很简单的表达一下其中的思想, 而不会丢掉任何有用的信息

毕竟Javascript继承的就是Scheme的血脉啊

*/
/*
第三章 模块化、对象和状态

在大型开发软件中我们碰到的最大的最棘手的问题是什么? 软件开发的首要使命是什么? 
<<Code Complete>>对此问题的答案是控制复杂度， 事实也的确如此。
前面介绍的各种抽象手段在解决复杂问题上起了很大作用，但是这还不够。

我们还需要一些组织程序的原则，他们能指导我们系统化的完成整体系统的设计和构建。
其中一个策略就是模块化，一种强有力的分治策略，将系统划分为一些有内聚力的部分，
然后这些划分出来的部分分别独立开发和维护，以此提高开发效率。
*/

/*有趣的事，马上我们会发现有两个特色鲜明的组织策略对控制复杂度都有帮助，而
他们看待系统结构的"世界观"却截然不同。

其一：基于被模拟系统的结构去设计程序的结构，也就是现实世界有一个对象，
我们就在计算机中构造一个计算对象来表示它。这种方式就是现在主流OOP的做法，
对一些问题是一种很好实用的抽象及组织手段，但是使用这种方式去组织程序会受到我们对于
被模拟系统的支配，此种策略将注意力集中在计算对象上，将一个大型系统看成许许多多的
对象，他们的行为可能(大多数情况下)会伴随系统的演进而变化，系统变化的状态全都封装在
各个对象中，随着对象之间交互的增加和时间的推移，这种方式控制复杂度会变得捉襟见肘


其二: 基于数据流的观点看待系统，我们的观察重点在于流过系统的数据。现在前端
React/Redux体现的就是此种思路。将状态视为数据流这个时间线上的一个节点，以此缓解分散在各处
的状态增加的复杂程度。流方式还特别能用于松解我们在我们的模型中对时间的模拟与
计算机求值过程中的各种事件发生的顺序。


*/

// 赋值和局部状态

/*常规的世界观中我们将周遭的事物视为对象，他们拥有随着时间变化的状态
，一个对象有状态，就是说他的行为受到他的历史的影响
*/

// 为什么需要赋值?

/*

如果，我们将系统视作许许多多的对象组成，而对象自包含状态
随着时间的变化，状态会变化，而状态需要一个计算符号刻画
这个符号代表对象的状态，此时就自然而然的引出赋值运算，使得
可以去更改这个符号关联的值，也即是对象的状态。

*/

