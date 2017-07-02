//
//  ViewController.swift
//  tableviewTest
//
//  Created by LCC on 2017/7/2.
//  Copyright © 2017年 LCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{


    var balls: NSMutableArray = ["baseball", "tennis"]
    var check: NSMutableArray = [false, false]
    var canMove:Bool = false

    @IBOutlet var labelBalls: UILabel!
    @IBOutlet var textBall: UITextField!
    @IBOutlet var myTableView: UITableView!


    @IBAction func addBall(_ sender: UIButton) {
        if textBall.text == "" {
            return
        }

        balls.add(textBall.text!)
        check.add(false)
        myTableView.reloadData()

        sports.append((title: textBall.text!, isChoose: true))
        myTableView2.reloadData()
        textBall.text! = ""
    }


    @IBAction func switchBall(_ sender: UISwitch) {
        if sender.isOn {
            myTableView.setEditing(true, animated: true)
            myTableView2.setEditing(true, animated: true)
        }else{
            myTableView.setEditing(false, animated: true)
            myTableView2.setEditing(false, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }


    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if tableView == myTableView2 {
            let tempSport = sports[sourceIndexPath.row]
            sports.remove(at: sourceIndexPath.row)
            sports.insert(tempSport, at: destinationIndexPath.row)
        }else if tableView == myTableView{
            let tempBall = balls[sourceIndexPath.row]
            let tempCheck = check[sourceIndexPath.row]
            balls.removeObject(at: sourceIndexPath.row)
            balls.insert(tempBall, at: destinationIndexPath.row)
            check.removeObject(at: sourceIndexPath.row)
            check.insert(tempCheck, at: destinationIndexPath.row)
            showFavorite()
        }
    }

    //delete cell
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if tableView == myTableView2 {
            return
        }
        balls.removeObject(at: indexPath.row)
        check.removeObject(at: indexPath.row)
        myTableView.deleteRows(at: [indexPath], with: .fade)
    }


    //select cell and show favorite ball
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if tableView == myTableView2 {
            return
        }

        let cell: UITableViewCell = (tableView.cellForRow(at: indexPath))!
        if check[indexPath.row] as! Bool {
            cell.accessoryType = UITableViewCellAccessoryType.none
            check[indexPath.row] = false
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
            check[indexPath.row] = true
        }
        showFavorite()
    }

    func showFavorite(){
        labelBalls.text = "最喜歡的球類："
        for index in 0..<balls.count {
            if check[index] as! Bool {
                labelBalls.text! += balls[index] as! String
            }
        }
    }


    //show ball
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myTableView2 {
            return sports.count
        }
        return balls.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == myTableView2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
            cell.labelSport.text = sports[indexPath.row].title
            cell.switchChoice.isOn = sports[indexPath.row].isChoose
            return cell
        }
//        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = balls[indexPath.row] as? String
        return cell
    }


    @IBOutlet var myTableView2: UITableView!
    var sports: [(title:String, isChoose: Bool)] = [("baseball", true), ("basketball", true), ("football", true)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

