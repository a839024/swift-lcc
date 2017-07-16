//
//  SecondViewController.swift
//  delegateTest
//
//  Created by LCC on 2017/7/16.
//  Copyright © 2017年 LCC. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var data:String?
    var delegate: myDelegate

    @IBOutlet var text2: UITextField!


    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
