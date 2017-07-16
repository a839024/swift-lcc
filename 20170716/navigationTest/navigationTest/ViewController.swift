//
//  ViewController.swift
//  navigationTest
//
//  Created by LCC on 2017/7/16.
//  Copyright © 2017年 LCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


class FirstViewController: UIViewController {

    @IBAction func touchTwice(_ sender: UITapGestureRecognizer) {
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))

        label.text = "Touch Twice"
        self.view.addSubview(label)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

class swipeTest: UIViewController{

    @IBOutlet var labelText: UILabel!

    @IBAction func move(_ sender: UISwipeGestureRecognizer) {
        let c = sender.direction.rawValue
        if c == 1 {
            labelText.text = "right"
            labelText.frame.origin.x += 10
        }else if c == 2 {
            labelText.text = "left"
            labelText.frame.origin.x -= 10
        }else if c == 4 {
            labelText.text = "up"
            labelText.frame.origin.y += 10
        }else if c == 8 {
            labelText.text = "down"
            labelText.frame.origin.y -= 10
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
