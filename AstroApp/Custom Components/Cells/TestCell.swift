//
//  TestCell.swift
//  AstroApp
//
//  Created by Alexandru Vladut on 21/05/2018.
//  Copyright © 2018 Alexandru Vladut. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config (testName:String?){
        lblName.text = testName
    }

}
