// 换零钱方式的统计

function countChange(amount){
    return cc(amount, 5)
}
// 将总数为a的现金换成n种硬币的不同方式 = 
//      将现金数a换成除第一种之外的所有其他硬币的不同方式数目 
//  +   将现金a-d换成所有种类的硬币的不同方式数目（其中d为第一种硬币的币值） 
function cc(amount, kindOfCoins){
    // 基准情况
    if(amount == 0) return 1
    if(amount < 0 || kindOfCoins == 0) return 0
    else{
        return cc(amount, kindOfCoins - 1) + cc(amount - first(kindOfCoins), kindOfCoins)
    }
}
// 币的种类
function first(kindOfCoins){
    switch(kindOfCoins){
        case 1: return 1
        case 2: return 5
        case 3: return 10
        case 4: return 25
        case 5: return 50
    }
}
console.log(countChange(100))  // 292
console.log(countChange(1000))  // 801451
