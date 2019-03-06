//
//  NotificationParser.swift
//  DeepLinkings
//
//  Created by Marcos Felipe Souza on 06/03/19.
//  Copyright © 2019 Marcos. All rights reserved.
//

import UIKit

class NotificationParser {
    static let shared = NotificationParser()
    private init() { }
    func handleNotification(_ userInfo: [AnyHashable : Any]) -> DeeplinkType? {
        
        if let data = userInfo["data"] as? [String: Any] {
            if let messageId = data["messageId"] as? String {
                return DeeplinkType.messages(.details(id: messageId))
            }
        }
        return nil
    }
}
