import UIKit

class ViewController: UIViewController {


    @IBOutlet var labelResult: UILabel!
    @IBOutlet var labelWelcome: UILabel!

    @IBAction func triggerAlert(_ sender: UIButton) {
        //two style: alert or actionSheet
        let alertController: UIAlertController = UIAlertController(title: "Confirm Window", message: "Exit?", preferredStyle: .alert)

        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
            self.labelResult.text = "Cancel"
            print(action.title!)
            print(alertController.textFields![0].text!)
        })

        let defaultAction: UIAlertAction = UIAlertAction(title: "default", style: .default, handler: nil)

        let destructiveAction: UIAlertAction = UIAlertAction(title: "Destructive", style: .destructive, handler: nil)

        alertController.addAction(cancelAction)
        alertController.addAction(defaultAction)
        alertController.addAction(destructiveAction)
        /*alertController.addTextField(configurationHandler: {
         textField in
         textField.placeholder = "placeHolder"
         textField.isSecureTextEntry = false
         })
         alertController.addTextField(configurationHandler: {
         $0.placeholder = "$0"
         $0.isSecureTextEntry = true
         })*/
        alertController.addTextField(configurationHandler: {
            (textField: UITextField) -> Void in
            textField.placeholder = "placeHolder"
        })

        present(alertController, animated: true, completion: {
            print("completion")
        })

    }

    @IBAction func login(_ sender: UIButton) {

        let regex = try! NSRegularExpression(pattern: "^\\w+@\\w+\\.\\w+", options: [])

        let alertController: UIAlertController = UIAlertController(title: "Login", message: "Enter email and password", preferredStyle: .alert)
        let comfirmAction: UIAlertAction = UIAlertAction(title: "Login", style: .default, handler: {
            action in
            let email = alertController.textFields![0].text!
            if regex.numberOfMatches(in: email, options: [], range: NSRange(location: 0, length: email.characters.count)) != 0{
                self.labelWelcome.text = "Welcome: \(email)"
            }
        })
        let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addTextField(configurationHandler: {
            textField in
            textField.placeholder = "Your Email"

            NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange, object: textField, queue: OperationQueue.main) { (notification) in
                comfirmAction.isEnabled = textField.text!.characters.count > 0
            }
        })
        alertController.addTextField(configurationHandler: {
            $0.placeholder = "Your Password"
            $0.isSecureTextEntry = true
        })
        alertController.addAction(comfirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: {
            action in
            print("complete")
        })
    }




    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

