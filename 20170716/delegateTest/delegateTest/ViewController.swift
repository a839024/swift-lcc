import UIKit

class ViewController: UIViewController {

    @IBOutlet var text1: UITextField!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SecondViewController
        vc.data = self.text1.text
        vc.delegate = self
        //vc.controller = self
    }

    func myfunc(text: String) {
        self.text1.text = text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

