//
//  ViewController.swift
//  dataStore
//
//  Created by LCC on 2017/8/13.
//  Copyright © 2017年 LCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let userData = UserDefaults()
    @IBOutlet var textName: UITextField!

    @IBAction func comfirm(_ sender: UIButton) {
        userData.set(textName.text!, forKey: "name")
        print(userData.synchronize())
        alertButton(wTitle: "寫入資料", wMessage: "姓名資料已寫入", btnTitle: "完成")
    }

    @IBAction func clearData(_ sender: UIButton) {
        userData.removeObject(forKey: "name")
        textName.text = ""
        alertButton(wTitle: "清除資料", wMessage: "姓名資料已清除", btnTitle: "完成")
    }


    func alertButton(wTitle: String, wMessage: String, btnTitle: String) {
        let alertController = UIAlertController(title: wTitle, message: wMessage, preferredStyle: .alert)
        let sureBtn = UIAlertAction(title: btnTitle, style: .default, handler: nil)
        alertController.addAction(sureBtn)
        self.present(alertController, animated: true, completion: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        let name = userData.object(forKey: "name")  as! String
        if name == "" {
            alertButton(wTitle: "輸入姓名", wMessage: "您尚未建立任何資料,請輸入姓名!", btnTitle: "確定")
        }else{
            let msg = name + "\n歡迎再次使用本程式"
            alertButton(wTitle: "歡迎", wMessage: msg, btnTitle: "確定")
            textName.text = name
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

