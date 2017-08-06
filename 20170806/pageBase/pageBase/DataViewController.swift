//
//  DataViewController.swift
//  pageBase
//
//  Created by LCC on 2017/8/6.
//  Copyright © 2017年 LCC. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""

    @IBOutlet var labelAuthor: UILabel!
    @IBOutlet var labelPoem: UILabel!



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let obj: AnyObject = dataObject as AnyObject{
            let content: String = obj.description
            let result = content.components(separatedBy: "|")
            dataLabel.text = result[0]
            labelAuthor.text = result[1]
            labelPoem.text = result[2].replacingOccurrences(of: "。", with: "。\n")
            print(labelPoem.text)

        }
    }

}

