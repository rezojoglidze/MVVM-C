//
//  TextsScreenTableViewCell.swift
//  MVVM-C Project
//
//  Created by Rezo Joglidze on 02.03.22.
//

import UIKit

class TextsScreenTableViewCell: UITableViewCell {

    @IBOutlet private weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill(_ text: String) {
        self.title.text = text
    }
    
}
