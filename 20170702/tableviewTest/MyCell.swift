//
//  MyCell.swift
//  tableviewTest
//
//  Created by LCC on 2017/7/2.
//  Copyright © 2017年 LCC. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet var labelSport: UILabel!
    @IBOutlet var switchChoice: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    

}
