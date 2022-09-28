//
//  MessageTableViewCell.swift
//  Messages
//
//  Created by Esther on 9/28/22.
//

import UIKit
/// A custom table view cell used for rendering the contents of a Message instance
class MessageTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    /// A label for the contents of the message
    @IBOutlet weak var messageTextLabel: UILabel!
    /// A lable for the date of the message
    @IBOutlet weak var dateTextLabel: UILabel!
    /// A button which can be used to indicate and change if the message is marked as read
    @IBOutlet weak var messageReadButton: UIButton!
    
    // MARK: - Properties
  
    /// A date formatter used to conver the messages date into a coherent string
    var dateFormatter = DateFormatter.short()
    // MARK: - Methods
    
    /// Updates the table view cells views for the given messages content
    func updateViews (message: Message) {
        messageTextLabel.text = message.text
        dateTextLabel.text = dateFormatter.string(from: message.timeStamp)
        let readMessageImageName = message.isRead ? "checkmark.circle" : "circle"
        /// - Parameter message: The message to display in the cell
        let readMessageImage = UIImage(systemName: readMessageImageName)
        messageReadButton.setImage(readMessageImage, for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func messageReadButtonTapped(_ sender: Any) {
    }
    
    
} // End of Class





