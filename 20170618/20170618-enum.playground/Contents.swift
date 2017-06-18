//: Playground - noun: a place where people can play

import UIKit

enum Animal: String{
//    case cat = "catcat", dog = "dogdog", elephant = "elephantelphant"
    case cat="cat"
    case dog = "dog"
    case rabbit = "rabbit"
}
var a: Animal = Animal.cat
switch a {
case .dog:
    print("dog")
case .cat:
    print(a.rawValue)
case .rabbit:
    print("elephant")
//use default or all enum elements
//default:
//    print("default")
}