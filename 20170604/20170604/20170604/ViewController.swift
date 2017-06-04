import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgShow: UIImageView!

    @IBOutlet var btn01: UIButton!
    @IBOutlet var btn02: UIButton!
    @IBOutlet var btn03: UIButton!
    @IBOutlet var btn04: UIButton!
    @IBOutlet var btn05: UIButton!
    @IBOutlet var btn06: UIButton!
    let imgs:Array = ["img01.jpg", "img02.jpg", "img03.jpg", "img04.jpg", "img05.jpg", "img06.jpg"]
    var imageName:String = "img01.jpg"
    var imageArray: Array<UIImage> = []


    //let imgs: [String: UIButton] = ["img01.jpg": btn01, "img01.jpg": btn02, "img01.jpg": btn03, "img01.jpg": btn04, "img01.jpg": btn05, "img01.jpg": btn06]


    //Change image when click the button of 1~6
    @IBAction func changeImg(_ sender: UIButton) {


        switch sender.currentTitle! {
        case "1":
            imgShow.image = imageArray[0]
            imageName = imgs[0]
        case "2":
            imgShow.image = imageArray[1]
            imageName = imgs[1]
        case "3":
            imgShow.image = imageArray[2]
            imageName = imgs[2]
        case "4":
            imgShow.image = imageArray[3]
            imageName = imgs[3]
        case "5":
            imgShow.image = imageArray[4]
            imageName = imgs[4]
        case "6":
            imgShow.image = imageArray[5]
            imageName = imgs[5]
        default:
            imgShow.image = imageArray[0]
            imageName = imgs[0]
        }
//        if sender ===  btn02{
//            imgShow.image = UIImage(named: "img02.jpg")
//        }
    }

    @IBAction func clickNext(_ sender: UIButton) {
        if imgShow.isAnimating{
            return
        }

        let count = imgs.index(of: imageName)

        //if click next and img is the last one
        if count == imgs.count - 1 {
            imgShow.image = imageArray[0]
            imageName = imgs[0]
        //normal case will show next image
        }else{
            imgShow.image = imageArray[count! + 1]
            imageName = imgs[count! + 1]
        }

    }


    @IBAction func clickPrev(_ sender: UIButton) {
        if imgShow.isAnimating{
            return
        }

        let count = imgs.index(of: imageName)

        //if click prev and image is the first one
        if count == 0 {
            imgShow.image = imageArray[imgs.count - 1]
            imageName = imgs[imgs.count - 1]
        //normal case will show prev image
        }else{
            imgShow.image = imageArray[count! - 1]
            imageName = imgs[count! - 1]
        }
    }


    @IBAction func startClick(_ sender: UIButton) {
        imgShow.startAnimating()
    }



    @IBAction func stopClick(_ sender: UIButton) {
        imgShow.stopAnimating()
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        imgShow.image = UIImage(named: imageName)

        for i in 0...imgs.count - 1 {
            imageArray.append(UIImage(named: imgs[i])!)
        }

        imgShow.animationImages = imageArray
        imgShow.animationDuration = 12
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

