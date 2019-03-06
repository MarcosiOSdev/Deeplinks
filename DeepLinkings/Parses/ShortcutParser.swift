//
//  ShortcutParser.swift
//  DeepLinkings
//
//  Created by Marcos Felipe Souza on 05/03/19.
//  Copyright © 2019 Marcos. All rights reserved.
//

import UIKit


enum ShortcutKey: String {
    case newListing = "com.mfelipesp.newListing"
    case activity = "com.mfelipesp.activity"
    case messages = "com.mfelipesp.messages"
}

class ShortcutParser {
    static let shared = ShortcutParser()
    private init() { }
    
    
    func registerShortcuts(for profileType: ProfileType) {
        let activityIcon = UIApplicationShortcutIcon(templateImageName: "Alert Icon")
        let activityShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.activity.rawValue, localizedTitle: "Recent Activity", localizedSubtitle: nil, icon: activityIcon, userInfo: nil)
        
        let messageIcon = UIApplicationShortcutIcon(templateImageName: "Messenger Icon")
        let messageShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.messages.rawValue, localizedTitle: "Messages", localizedSubtitle: nil, icon: messageIcon, userInfo: nil)
        
        
        var shortcutItems: [UIApplicationShortcutItem] = [activityShortcutItem, messageShortcutItem]
       
        switch profileType {
            case .host:
                let newListingIcon = UIApplicationShortcutIcon(templateImageName: "New Listing Icon")
                let newListingShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.newListing.rawValue, localizedTitle: "New Listing", localizedSubtitle: nil, icon: newListingIcon, userInfo: nil)
                shortcutItems.append(newListingShortcutItem)
            case .guest:
                break
        }
        
        UIApplication.shared.shortcutItems = shortcutItems
    }
    
    func handleShortcut(_ shortcut: UIApplicationShortcutItem) -> DeeplinkType? {        
        switch shortcut.type {
            case ShortcutKey.activity.rawValue:
                return .activity
            case ShortcutKey.messages.rawValue:
                return .messages(.root)
            case ShortcutKey.newListing.rawValue:
                return .newListing
            default:
                return nil
        }
    }
    
}
