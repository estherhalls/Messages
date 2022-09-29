//
//  MessagesReadViewController.swift
//  Messages
//
//  Created by Esther on 9/29/22.
//

import UIKit
// Declaring outside of class is a global property
let markAllAsReadNotificationName = NSNotification.Name("MarkAllAsRead")

class MessagesReadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func markAllAsReadButtonTapped(_ sender: UIButton) {
        // Create one to many relationship between button and all cell objects
        NotificationCenter.default.post(name: markAllAsReadNotificationName, object: nil)
    }
    
} // End of Class
