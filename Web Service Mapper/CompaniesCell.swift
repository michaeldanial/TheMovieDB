//
//  CompaniesCell.swift
//  Scroll View
//
//  Created by Michael.Magdy on 10/29/18.
//  Copyright © 2018 Michael.Magdy. All rights reserved.
//

import UIKit

class CompaniesCell: UITableViewCell {

  
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var companyIV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
