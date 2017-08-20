import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var fileManager = FileManager()
    var textFileList: Array<String> = []
    var path = NSHomeDirectory() + "/Documents"

    @IBOutlet var tableViewFile: UITableView!
    @IBOutlet var textFileName: UITextField!
    @IBOutlet var textFileContent: UITextView!

    @IBAction func saveFile(_ sender: UIButton) {
        if textFileName.text! == "" || textFileContent.text! == ""{
            alertCreater(title: "Data Checking", message: "File name or content should not be empty", btnTitle: "Ok")
        }else{
            do {
                try textFileContent.text!.write(toFile: path + "/" + textFileName.text!, atomically: true, encoding: String.Encoding.utf8)
            } catch {
                alertCreater(title: "Fail", message: "File create fail", btnTitle: "Ok")
                return
            }
            alertCreater(title: "Success", message: "File create success", btnTitle: "Ok")

            if textFileList.index(of: textFileName.text!) == nil {
                textFileList.append(textFileName.text!)
                tableViewFile.reloadData()
            }
            emptyInput()
        }
    }

    @IBAction func removeFile(_ sender: UIButton) {
        if textFileName.text! == "" {
            alertCreater(title: "Data Checking", message: "File name cannot be empty", btnTitle: "Ok")
        }else{
            do {
                try fileManager.removeItem(atPath: path + "/" + textFileName.text!)
            } catch {
                alertCreater(title: "Fail", message: "File remove fail", btnTitle: "Ok")
                return
            }
            alertCreater(title: "Success", message: "File remove success", btnTitle: "Ok")
            textFileList.remove(at: textFileList.index(of: textFileName.text!)!)
            tableViewFile.reloadData()
            emptyInput()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            textFileList = try fileManager.contentsOfDirectory(atPath: path)
            tableViewFile.reloadData()

        } catch {
            print("Directory Not Exist")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func alertCreater(title: String, message: String, btnTitle: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let sureAction = UIAlertAction(title: btnTitle, style: .default, handler: nil)
        controller.addAction(sureAction)
        self.present(controller, animated: true, completion: nil)
    }

    func emptyInput() {
        textFileName.text! = ""
        textFileContent.text! = ""
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textFileList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text! = textFileList[indexPath.row]
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do {
            let content = try NSString(contentsOfFile: path + "/" + textFileList[indexPath.row], encoding: String.Encoding.utf8.rawValue)
            textFileContent.text! = content as String
            textFileName.text! = textFileList[indexPath.row]
        } catch {
            print("Read File Error")
            return
        }

    }
}

