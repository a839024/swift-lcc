import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!

    var b: NSMutableArray = ["籃球", "足球", "棒球"]
    @IBOutlet var textBall: UITextField!
    @IBOutlet var textValue: UITextField!

    @IBAction func addBall(_ sender: UIButton) {
        if textBall.text == "" || textValue.text == ""{
            return
        }

        balls.append(["name":textBall.text!, "value":textValue.text!, "imgName":"other.png"])
        arrCheck.append(false)
        tableView.reloadData()
        textBall.text = ""
        textValue.text = ""
    }

    @IBOutlet var labelChoice: UILabel!

    //Dictionary的陣列，才可以按順序排序
    var balls:Array<Dictionary<String,String>> = [
        ["name":"籃球","value":"600","imgName":"basketball.png"],
        ["name":"足球","value":"500","imgName":"football.png"],
        ["name":"棒球","value":"200","imgName":"baseball.png"],
        ["name":"其他","value":"250","imgName":"other.png"]]

    //CheckMark的初始狀態
    var arrCheck:Array<Bool>=[false,false,false,false]

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:UITableViewCell=tableView.cellForRow(at: indexPath)! as UITableViewCell
        if arrCheck[indexPath.row] {
            arrCheck[indexPath.row] = false
            cell.accessoryType=UITableViewCellAccessoryType.none
        }else{
            arrCheck[indexPath.row] = true
            cell.accessoryType=UITableViewCellAccessoryType.checkmark
        }
        //將點選後的狀態指定回arrCheck
        ShowChoice()
    }

    func ShowChoice(){
        labelChoice.text="選取項目:"
        for i in 0..<balls.count{
            if arrCheck[i]{
                var ball:Dictionary<String,String> = balls[i]
                labelChoice.text=labelChoice.text!+ball["name"]!
            }
        }
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //表格上有１個區段
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return balls.count //告訴App這個區段的儲存格個數＝list.count
        return balls.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMsg:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cellMsg.textLabel?.text = b[indexPath.row] as? String
        cellMsg.textLabel?.text = balls[indexPath.row]["name"]
        cellMsg.detailTextLabel?.text = balls[indexPath.row]["value"]
        cellMsg.imageView?.image=UIImage(named: balls[indexPath.row]["imgName"]!)
        return cellMsg
    }

    /*
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        balls.remove(at: indexPath.row)
        arrCheck.remove(at: indexPath.row)
        //tableView.reloadData()
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "刪除"
    }*/

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = balls[sourceIndexPath.row]
        balls.remove(at: sourceIndexPath.row)
        balls.insert(temp, at: destinationIndexPath.row - 1)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


