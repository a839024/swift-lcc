import UIKit

func classTest(){

    class Point{
        var width: Int = 0
        var height: Int = 0
    }

    var point = Point()
    print(point.height)

    point.width = 20
    print(point.width)
    
    var pp = point
    print(pp.width)

}

func classTest2(){
    class CircleTest{
        var x = 2
        var y = 3
        var redius = 10

        func getArea() -> Int {
            return x * y
        }

        func setArea(x: Int, y: Int){
            self.x = x
            self.y = y
        }
    }

    var circle = CircleTest()
    circle.setArea(x: 6, y: 2)
    print(circle.getArea())
}


func structTest(){
    struct Point_struct{
        var width: Int = 0
        var height: Int = 0
    }

    var p = Point_struct()
    print(p.height)
    var p2 = p
    p.height = 10
    print(p2.height)
}


func bmiTest(){
    class BMI{
        var weight: Float = 0
        var height: Float = 0

        init(weight: Float, height: Float) {
            self.weight = weight
            self.height = height
        }

        func setWeight(weight: Float){
            self.weight = weight
        }

        func setHeight(height: Float){
            self.height = height
        }

        func getBmi() -> Float {
            return weight / ((height/100) * (height/100))
        }
    }

    var b = BMI(weight: 90, height: 177)
    print(b.getBmi())
}

bmiTest()