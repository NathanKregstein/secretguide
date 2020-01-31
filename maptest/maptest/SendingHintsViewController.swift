//
//  SendingHintsViewController.swift
//  maptest
//
//  Created by Nathan Kregstein on 1/28/20.
//  Copyright © 2020 Nathan Kregstein. All rights reserved.
//

import UIKit

class SendingHintsViewController: UIViewController,UITextFieldDelegate {
    var hintToSend = ""
    
    @IBOutlet weak var hintTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        hintTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        let tap: UITapGestureRecognizer =
            UITapGestureRecognizer(target: self, action:
                #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue)
            != nil {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        hintToSend = hintTextField.text!
        print(hintToSend)
    }


}

//class EmojiTextField: UITextField {
//
//    // required for iOS 13
//    override var textInputContextIdentifier: String {""} // return non-nil to show the Emoji keyboard ¯\_(ツ)_/¯
//
//    override var textInputMode: UITextInputMode? {
//        for mode in UITextInputMode.activeInputModes {
//            if mode.primaryLanguage == "emoji" {
//                return mode
//            }
//        }
//        return nil
//    }
//}
