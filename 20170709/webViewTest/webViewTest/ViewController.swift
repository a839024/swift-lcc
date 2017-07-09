import UIKit

class ViewController: UIViewController {

    @IBOutlet var myWebView: UIWebView!
    @IBOutlet var textURL: UITextField!

    @IBAction func goAnother(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func goWebsite(_ sender: UIButton) {
        myWebView.loadRequest(URLRequest(url: URL(string: textURL.text!)!))
    }


    @IBAction func stop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }


    @IBAction func refresh(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }


    @IBAction func goBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }


    @IBAction func goForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.loadRequest(URLRequest(url: URL(string: "https://www.google.com")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

