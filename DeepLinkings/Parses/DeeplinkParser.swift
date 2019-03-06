//
//  DeeplinkParser.swift
//  DeepLinkings
//
//  Created by Marcos Felipe Souza on 06/03/19.
//  Copyright © 2019 Marcos. All rights reserved.
//

import UIKit

class DeeplinkParser {
    static let shared = DeeplinkParser()
    private init() { }
    
    
    func parseDeepLink(_ url: URL) -> DeeplinkType? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true), let host = components.host else {
            return nil
        }
        var pathComponents = components.path.components(separatedBy: "/")
        // the first component is empty
        pathComponents.removeFirst()
        switch host {
        case "messages":
            if let messageId = pathComponents.first {
                return DeeplinkType.messages(.details(id: messageId))
            }
        case "request":
            if let requestId = pathComponents.first {
                return DeeplinkType.request(id: requestId)
            }
        default:
            break
        }
        return nil
    }
}
