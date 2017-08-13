//
//  ViewController.swift
//  readFile
//
//  Created by LCC on 2017/8/13.
//  Copyright © 2017年 LCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var image: UIImageView!
    @IBOutlet var textViewContent: UITextView!
    @IBOutlet var stepperBook: UIStepper!
    @IBOutlet var labelNum: UILabel!
    @IBOutlet var labelTitle: UILabel!

    var arrayTitle: Array<String> = []
    var arrayImg: Array<String> = []
    var arrayContent: Array<String> = []

    func getContentTxt(name: String) -> String {
        let path: String = Bundle.main.path(forResource: name, ofType: "txt")!
        let booksData = NSData(contentsOfFile: path)
        let dataString = String(data: booksData! as Data, encoding: String.Encoding.utf8)
        return dataString!
    }

    @IBAction func stepperChange(_ sender: UIStepper) {
        let num = Int(sender.value) - 1
        labelTitle.text = arrayTitle[num]
        textViewContent.text = arrayContent[num]
        labelNum.text = arrayImg[num]
        image.image = UIImage(named: arrayImg[num])

    }


    override func viewDidLoad() {
        super.viewDidLoad()

        let booksString = getContentTxt(name: "books")
        arrayTitle = booksString.components(separatedBy: "\n")
        labelTitle.text = arrayTitle[0]

        let contentString = getContentTxt(name: "content")
        arrayContent = contentString.components(separatedBy: "\n")
        textViewContent.text = arrayContent[0]
        textViewContent.isEditable = false

        let imgString = getContentTxt(name: "img")
        arrayImg = imgString.components(separatedBy: "\n")
        labelNum.text = arrayImg[0]
        image.image = UIImage(named: arrayImg[0])

        stepperBook.maximumValue = Double(arrayTitle.count)
        stepperBook.minimumValue = 1
        stepperBook.value = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

