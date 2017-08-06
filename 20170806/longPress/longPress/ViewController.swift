//
//  ViewController.swift
//  longPress
//
//  Created by LCC on 2017/8/6.
//  Copyright © 2017年 LCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {

        let allertController = UIAlertController(title: "exit", message: "確定離開嗎？", preferredStyle: .alert)

        let actionComfirm = UIAlertAction(title: "YES", style: .default, handler: nil)

        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        allertController.addAction(actionComfirm)
        allertController.addAction(actionCancel)

        self.present(allertController, animated: true, completion: nil)

    }


    @IBAction func edgePan(_ sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state == .ended {
            print("ended")
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

