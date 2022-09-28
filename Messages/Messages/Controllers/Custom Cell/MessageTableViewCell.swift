//
//  MessageTableViewCell.swift
//  Messages
//
//  Created by Esther on 9/28/22.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    // MARK: - Outlets
    
    @IBOutlet weak var messageTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var messageReadButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
    }
    // MARK: - Actions
    
    @IBAction func messageReadButtonTapped(_ sender: Any) {
    }
    

}
