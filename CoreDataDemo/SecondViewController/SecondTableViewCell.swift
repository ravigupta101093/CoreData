//
//  SecondTableViewCell.swift
//  CoreDataDemo
//
//  Created by Ravi kumar gupta on 14/03/21.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    // MARK:- OUTLETS
    
    
    @IBOutlet weak var label1: UILabel!
   @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
