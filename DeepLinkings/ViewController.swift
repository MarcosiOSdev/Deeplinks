//
//  ViewController.swift
//  DeepLinkings
//
//  Created by Marcos Felipe Souza on 05/03/19.
//  Copyright © 2019 Marcos. All rights reserved.
//

import UIKit

enum ProfileType: String {
    case guest = "Guest" // default
    case host = "Host"
}


class ViewController: UIViewController {
    var currentProfile = ProfileType.guest {
        didSet {
            configureFor(profileType: currentProfile)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentProfile = .guest
    }
    
    func configureFor(profileType: ProfileType) {
        title = profileType.rawValue
        ShortcutParser.shared.registerShortcuts(for: profileType)
    }

    @IBAction func didPressSwitchProfile(_ sender: UIButton) {
        currentProfile = currentProfile == .guest ? .host : .guest
    }
    
}

