//
//  Message.swift
//  Messages
//
//  Created by Esther on 9/28/22.
//

import Foundation
/// A simple model class representing a message
class Message: Codable {
    /// The content of the message
    var text: String
    /// A boolean indicating if the message has been marked as read
    var isRead: Bool
    /// The date the message was created on
    var timeStamp: Date
    let id: UUID
    
    
    /// Initializes a new message with the give text, isRead, and timestamp
    /// - Parameters:
    ///   - text: The content of the message
    ///   - isRead: A boolean indicating if the message has been marked as read
    ///   - timeStamp: The date the message was created on
    
    init(text: String, isRead: Bool = false, timeStamp: Date = Date(), id:UUID = UUID()) {
        self.text = text
        self.isRead = isRead
        self.timeStamp = timeStamp
        self.id = id
    }

} // End of Class

extension Message: Equatable {
    static func == (lhs: Message, rhs: Message) ->
    Bool {
        return lhs.id == rhs.id
    }
}
