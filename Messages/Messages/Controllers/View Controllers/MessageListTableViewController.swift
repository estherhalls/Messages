//
//  MessageListTableViewController.swift
//  Messages
//
//  Created by Esther on 9/28/22.
//

import UIKit

class MessageListTableViewController: UITableViewController {

    let messageController = MessageController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageController.messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageTableViewCell else {return UITableViewCell()}
        let message = messageController.messages[indexPath.row]
        cell.updateViews(message: message)

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let message = messageController.messages[indexPath.row]
                    messageController.delete(message: message)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func presentNewMessageAlertController() {
        let alertController = UIAlertController(title: "New Message", message: "Enter the text for your message below:", preferredStyle: .alert)
        alertController.addTextField { messageTextField in
            messageTextField.placeholder = "Your message here"
        }
        
        let saveAction = UIAlertAction(title: "Save Message", style: .default) { _ in
            guard let messageTextField = alertController.textFields?.first,
            let messageText = messageTextField.text else {return}
            self.messageController.create(text: messageText)
            self.tableView.reloadData()
        }
        
        let dismissAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(dismissAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: Any) {
        presentNewMessageAlertController()
    }
    
} // End of Class
