//: Playground - noun: a place where people can play

import UIKit

class Father{
    var age: Int
    var name: String = "Johnson"{
        willSet{
            print("willSet")
        }
        didSet{
            print("didSet")
        }
    }

    var nickName:String = "cat"{
        willSet{
            print("father willSet")
        }
        didSet{
            print("father didSet")
        }
    }
    static var height: Int = 170

    //final variable cannot be overrided
    final var clothes: String = "Adidas"

    // can not assign class variable
    init() {
        self.age = 10
        print("father's init")
    }

    func sleep(){
        print("normal function")
    }

    class func foo(){
        print("class function foo")
    }


    //can not override static function
    static func bar(){
        print("static function bar")
    }
}

class Son: Father{
    var age2:Int

    //variable with a setter must also have a getter
    override var name: String{
        get{
            return "John"
        }
        set{
            self.name = newValue
        }
    }

    override var nickName: String{
        willSet{
            print("son willSet")
        }
        didSet{
            print("son didSet")
        }
    }

    override class func foo(){
        print("bar")
    }

    func func1() {
        print("func1")
    }

    func func1(name: String){
        print("func1 with parm")
    }

    init(test:String){
        self.age2 = 10
        super.init()
    }

    init(test2:Int){
        self.age2 = 10
        super.init()
    }

    override init(){
        print("son override father's init")
        //init self's variable before super's variable
        self.age2 = 10
        super.init()
        self.age = 50
    }

    convenience init(age2: Int) {
        self.init()
    }
}


class Shape{
    var x: Double = 20
    var y: Double = 50
    //get-only variable

    var centerX:Double{
        get{
            return (x + y) / 2
        }
    }

    init(x: Double){
        print("father init")
        self.x = x
    }

    convenience init(){
        print("father convenience")
        self.init(x: 30)
    }
}

class Squar: Shape{
    override var centerX: Double{
        get{
            return (x + y) / 4
        }
        set{
            x = newValue / 2
            y = (newValue + x) / 2
        }
    }

    override init(x: Double) {
        super.init(x: 5)
    }
}

var sq = Squar()
print(sq.x)