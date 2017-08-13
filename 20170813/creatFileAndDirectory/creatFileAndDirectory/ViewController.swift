//
//  ViewController.swift
//  creatFileAndDirectory
//
//  Created by LCC on 2017/8/13.
//  Copyright © 2017年 LCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var fm = FileManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSHomeDirectory() + "/Documents"
        print(path)

//        fm.createFile(atPath: path + "/test.txt", contents: nil, attributes: nil)
//
//        do{
//            try fm.createDirectory(atPath: path + "/0813", withIntermediateDirectories: true, attributes: nil)
//        }catch {
//
//        }

//        print(fm.fileExists(atPath: path))

//        do{
//            let contentString = try NSString(contentsOfFile: path + "/test.txt", encoding: String.Encoding.utf8.rawValue)
//            print(contentString)
//        }catch {
//
//        }

        do {
            try "s".write(toFile: path + "/test.txt", atomically: true, encoding: String.Encoding.utf8)
        } catch {}
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

