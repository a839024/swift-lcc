import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textTime: UILabel!
    @IBOutlet var textName: UILabel!
    @IBOutlet var textContext: UITextView!


    func configureView() {
        if let detail = detailItem {
            print(detail["name"]!)
            if let label1 = textName {
                label1.text = detail["name"]
            }
            if let label2 = textTime {
                label2.text = detail["time"]
            }
            if let label3 = textContext {
                label3.text = detail["context"]
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    var detailItem: Dictionary<String, String>? {
        didSet {
            configureView()
        }
    }
}

