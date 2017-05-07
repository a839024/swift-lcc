//: Playground - noun: a place where people can play

import UIKit

//tuple
func tuplePrint(){
    let k = ("x", 2, 3.4)
    print("\(k.0), \(k.1), \(k.2)")
}


//tuple with switch case
func switchCaseWithTuple(){
    let i = (2, 3)
    switch i {
    case (0, 0):
        print("原點")
    case (_, 0):
        print("Y軸")
    case (0, _):
        print("X軸")
    case (1...5, 1...5):
        print("1~5中間")
    default:
        print("false")
    }
}


//while loop
func sum1to100(){
    var j: Int = 1
    var sum: Int = 0
    while j <= 100 {
        sum += j
        j += 1
    }
    print(sum)
}


//repeat {statement} while judgement
func sum1to100_2(){
    var total: Int = 0
    var num: Int = 1
    repeat{
        total += num
        num += 1
    }while num <= 100
    print(total)
}


//repeat while for even number between 1...100
func sum1to100_even(){
    var total: Int = 0
    var num = 2
    repeat{
        total += num
        num += 2
    }while num <= 100
    print(total)
}


//for loop
func forLoop1(){
    var total = 0
    for _ in 1...6{
        total += 1
    }
    print(total)
}


func forLoop2(){
    for i in "Swift".characters{
        print(i, terminator: "")
    }
}


func forLoop3(){
    let begin = 1, end = 5
    for i in begin...end{
        print(i)
    }
}

func forLoopWithStride(){
    for num in stride(from: 9, to: 1, by: -2){
        print(num)
    }
}


//random
func randInt(rand: UInt32, times: Int){
    var rnd: UInt32
    for _ in 1...times{
        //arc4random genrate 0...10000000000 integer
        rnd = arc4random_uniform(rand)
        print(rnd, terminator: ",")
    }
    print()
}


//double for loop
func forLoop4(){
    for i in 1...9{
        for j in 1...9{
            print("\(j)*\(i)=\(i*j)", terminator: ", ")
        }
        print()
    }
}


func forLoopWithpry(){
    for i in 1...9{
        for j in 1...i{
            print(j, terminator: "")
        }
        print()
    }
}


//absolute number
func numTest(num: Int){
    print(num > 0 ? num : -num)
}
numTest(num: -5)


//
func diceGame(){
    let dice1:UInt32 = arc4random_uniform(6) + 1
    let dice2:UInt32 = arc4random_uniform(6) + 1
    let dice3:UInt32 = arc4random_uniform(6) + 1
    let total = dice1 + dice2 + dice3
    print(total, terminator: "")
    print(total <= 10 ? "小" : "大")
}
diceGame()


//collections
var arr = [1, 2, 3]
var arr2: [Int] = [1, 2, 3]
var arr3: Array = [1, 2, 3]
var arr4: Array<Int> = [1, 2, 3]
func array1(){
    for i in 0..<arr.count{
        print(arr[i])
    }
}
func array2(){
    for i in arr2{
        print(i)
    }
}
func arrayIsEmpty(arr: [Int]){
    if arr.isEmpty{
        print("empty")
    }else{
        print("nonEmpty")
    }
}
func arrayMethodTest(arr: Array<Int>){
    var a = arr
    a.append(50)
    print(a)
    a.insert(30, at: 1)
    print(a)
    print(a.sorted(by: >))
}
func macdonald(food: Int, num: Int){
    var mac: Array<Int> = [90, 95, 100, 105, 100]
    print("點\(food)號餐點\(num)份")
    print("總共\(mac[food - 1] * num)元")
}
macdonald(food: 2, num: 3)

func nestArray(){
    var arr = [[1, 2, 3], [4, 5, 6]]
    for i in 0...2{
        for j in 0...1{
            print(arr[j][i])
        }
    }
}
nestArray()
















