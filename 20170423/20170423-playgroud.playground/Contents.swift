//: Playground - noun: a place where people can play

import UIKit

//轉型
print(Int(Int8.min) - 1)

//var 變數名稱: 型態 = 值
var Allen_LCC: String = "name"
var str = String()
print(str.isEmpty)
//terminator 定義結尾
print("LCC", terminator:".\n")

//在字串中放置變數 \(variable)
var year = 2017
var moon = 4
var week = "Sunday"
print("今年是\(year - 1911)年")
print("Hello \\LCC\\\n我是\t\"xxx\"")
print("\(year) \(moon) \(week.uppercased())")

//字串相加
var hello = "hello "
var world = "world"
print(hello + world)

//nil
var num: Int!
print(num)

//divide
var num1: Double = 10
var num2: Double = 3
print(num1 / num2)
print(num1.truncatingRemainder(dividingBy: num2))

//function
//func 名字 (值: 型態) -> 回傳值型態{}
func timeTest(sec: Int! = 200) -> [Int]{
    //array
    var time = [Int]()
    time.append(sec/3600)
    time.append(sec % 3600 / 60)
    time.append(sec % 60)
    //key-value pair
    var timepair = [String: Int]()
    timepair.updateValue(sec/3600, forKey: "hour")
    timepair.updateValue(sec % 3600 / 60, forKey: "minute")
    timepair.updateValue(sec % 60, forKey: "second")
    print(timepair["hour"]!)
    //normal
    var hour = sec/3600
    var minute = sec % 3600 / 60
    var second = sec % 60
    print("時：\(hour) 分：\(minute) 秒：\(second)")
    return time
}

var times = timeTest(sec: 23455)
print(times[0], times[1], times[2])

//logic
var str1 = "hello"
var str2 = "hello"
print(str1 == str2)
print(90>100)
print(Bool(1))

//if 判斷 {statement1} else if 判斷 {statement2} else {statement3}
func yearcount(year: Int){
    if year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)  {
        print("\(year)是閏年")
    }else{
        print("\(year)是平年")
    }
}
yearcount(year: 2017)

func scoreLevel(score: Int){
    if score > 100 || score < 0{
        print("error")
    }else if score >= 90{
        print("A class: \(score)")
    }else if score >= 80{
        print("B class: \(score)")
    }else if score >= 70{
        print("C class: \(score)")
    }else if score >= 60{
        print("D class: \(score)")
    }else{
        print("F: \(score)")
    }
}

scoreLevel(score: 75)
scoreLevel(score: 100)

//switch case
//switch 運算式 {
// case 值:       **不需要break
// default:
//}

func scoreLevel2(score: Int){
    switch score / 10 {
    case 9:
        print("A class: \(score)")
    case 8:
        print("B class: \(score)")
    case 7:
        print("C class: \(score)")
    case 6:
        print("D class: \(score)")
    case 10:
        print("A class: 100")
    default:
        print("error")
    }
}


//func scoreLevel2(score: Int){
//    switch score {
//    case 90...100:
//        print("A class: \(score)")
//    case 80...89:
//        print("B class: \(score)")
//    case 70...79:
//        print("C class: \(score)")
//    case 60...69:
//        print("D class: \(score)")
//    case 0...59:
//        print("F")
//    default:
//        print("error")
//    }
//}

scoreLevel2(score: 95)

//for-in
var total = 0
for i in 1...100{
    total += i
}
print(total)

//homework
func bmiCalc(weight: Double, height: Double){
    var bmi = weight/((height/100)*(height/100))
    if bmi < 18{
        print("過輕： \(bmi)")
    }else if bmi > 24{
        print("過重： \(bmi)")
    }else{
        print("正常： \(bmi)")
    }
}

bmiCalc(weight: 80, height: 159)