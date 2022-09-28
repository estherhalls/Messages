//
//  MessageController.swift
//  Messages
//
//  Created by Esther on 9/28/22.
//

import Foundation
/// A simple model controller to control the creation, reading and persistence of Message instances
class MessageController {
    
    /// A shared instance of the message controller
    static let sharedInstance = MessageController()
    
    /// Capture the Initialization of this class and load the messages
    init() {
        loadMessages()
    }
    /// The array of messages and source of truth for the app
    private (set) var messages: [Message] = []
    /// The URL that messages are persist to on disk
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else {return nil}
        let url = documentsDirectory.appendingPathComponent("messages.json")
        return url
    }
    
    /// Creates a new message, adds it to our array of messages (source of truth) and persists the message to the local disk
    /// - Parameter text: The content of the message
    func create(text: String = "New Message") {
        let message = Message(text: text)
        messages.append(message)
        saveMessages()
    }
    
    func delete(message: Message) {
        guard let index = messages.firstIndex(of: message) else { return }
        messages.remove(at: index)
        saveMessages()
    }
    
    /// Toggles the isRead property of a Message then saves the changes
    func toggleRead(message: Message){
    /// - Parameter message: The message object that we will toggle the isRead property of
        message.isRead.toggle()
        saveMessages()
    }
    
    /// Persists the message controllers array of messages to disk
    func saveMessages() {
        
        
        // 1. Get the address to save a file to
        guard let url = fileURL else {return}
        do {
            // 2. Convert the swift class into JSON data
            let data = try JSONEncoder().encode(messages)
            // 3. Save the data to the URL from step 1
            try data.write(to: url)
        } catch let error {
            print(error)
        }
    } // End of Save Persistance
    
    /// Loads  messages that are persist to the local disk updates the model controllers messages property
    func loadMessages() {
        
        // 1. Get the address to save a file to
        guard let url = fileURL else {return}
        do {
            // 2. Load the raw data from the url
            let data = try Data(contentsOf: url)
            // 3. Convert the raw data into our Swift class
            let messages = try JSONDecoder().decode([Message].self, from: data)
            self.messages = messages
        } catch let error {
            print(error)
        }
    } // End of Load Persistant
    
    
} // End of Class
