import UIKit

class SecondViewController: UIViewController {

    var data: String?
    var delegate: ViewController? = nil

    //var controller: ViewController? = nil

    @IBOutlet var text2: UITextField!

    @IBAction func goBack(_ sender: UIButton) {
        delegate?.myfunc(text: self.text2.text!)

        //controller?.text1.text = text2.text
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.text2.text = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
