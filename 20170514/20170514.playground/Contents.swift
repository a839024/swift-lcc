//: Playground - noun: a place where people can play

import UIKit

//Dictionary
func dict1(){
    var dic1 = ["a":"b"]
    var dic2:[String:String]
    var dic3:Dictionary<String,String>
    var dic4 = Dictionary<String,String>()
    dic4["location"] = "Taiwan"
    dic4["zone"] = "GMT+8"
    print(dic4.updateValue("edward", forKey:"name") ?? "nil") // can set a default value
    let old = dic4.updateValue("French", forKey:"location") //return the dict before update
    print(old!)
    print(dic4)
    print(dic4.removeValue(forKey: "name") ?? "") //equle dic4["name"] = nil
    for (key,value) in dic4{
        print("\(key): \(value)")
    }
}
dict1()

func array1(){
    var i = [10, 20, 30]
    var j = i //array will make a new copy instead of a reference
    i[0] = 50
    for x in 0..<i.count{
        print(i[x], terminator: ",")
    }
    print()
    for x in 0..<j.count{
        print(j[x], terminator: ",")
    }
    print()
}
array1()

func dict2(){
    var scores = ["mary": 87, "john": 60, "jerry": 20]
    let newScores = scores //dictionary will be a reference
    scores.updateValue(10, forKey: "john")
    print(scores)
    print(newScores)
}
dict2()

//function
func function1(symbol:Character, num:Int) -> (Void){
    for i in 1...num{
        print(symbol, terminator: "")
    }
    print()
}
function1(symbol: "*",num: 5)

func function2(num:Int...){
    for i in num{
        print(i)
    }
}

function2(num: 1, 2, 3)

func function3(num: Int...) -> (sun: Int, avg: Int){
    var sum = 0
    var avg = 0
    for i in num{
        sum += i
    }

    avg = sum / num.count

    return (sum, avg)
}

print(function3(num: 10,50,40,60))

func function4(from: Int, to: Int) -> (avg: Double, sum: Int){
    var total = 0
    for i in from...to{
        total += i
    }
    return (Double(total)/2.0, total)
}

var result = function4(from: 2, to: 4)
print("\(result.avg): \(result.sum)")

var score:(Int, Int) -> (Double, Int) = function4
var score2:(Int, Int) -> (Double, Int) = function4(from:to:)
var score3 = function4
var score4 = function4(from:to:)
print(score(5,6))

func sum(num1: Int, num2: Int) -> Double{
    return Double(num1 + num2)/2
}

//passing function argument
func avg(end: (Int, Int) -> Double, a: Int, b: Int){
    print("(\(a) + \(b))/2 = \(end(a,b))")
}

avg(end: sum(num1:num2:), a: 5, b: 6)
avg(end: sum, a: 5, b: 6)

let i = 100//global variable

func num(){
    let i = 200 //local variable
    print("i = \(i)")
}

num()
print("i = \(i)")


















