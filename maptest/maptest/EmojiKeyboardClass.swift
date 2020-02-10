//
//  EmojiKeyboardClass.swift
//  maptest
//
//  Created by Nathan Kregstein on 1/30/20.
//  Copyright © 2020 Nathan Kregstein. All rights reserved.
//

import UIKit

class EmojiKeyboard: UIButton, UIKeyInput {
    
    var hasText: Bool = true
    override var textInputContextIdentifier: String? { return "" }
    func insertText(_ text: String) { print("\(text)") }
    
    func deleteBackward() {}
    
    
    override var canBecomeFirstResponder: Bool { return true }
    
    override var canResignFirstResponder: Bool { return true }
    
//    var returnKeyType: UIReturnKeyType = UIReturnKeyType(rawValue: 7)!
    
    
    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                return mode
            }
        }
        return nil
    }
}
