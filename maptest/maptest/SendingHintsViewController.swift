//
//  SendingHintsViewController.swift
//  maptest
//
//  Created by Nathan Kregstein on 1/28/20.
//  Copyright © 2020 Nathan Kregstein. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class SendingHintsViewController: UIViewController {
    var db: Firestore!
    var hintToSend = ""
    var teammateGoalName = ""
    var teammateGoalSnippet = ""
    var roomNumber = 0
    var hintCounter = 0
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let emojiRanges = [
        0x1F601...0x1F64F,
        0x2702...0x27B0,
        0x1F680...0x1F6C0,
        0x1F170...0x1F251
    ]

    let letters = NSCharacterSet.letters
    
    @IBOutlet weak var sentHintsText: UILabel!
    
    @IBOutlet weak var sentHintTextField: UITextField!
    
    @IBOutlet weak var teammatesGoalLabel: UILabel!
    @IBAction func sendHintAction(_ sender: Any) {
        
        dismissKeyboard()
        sendingHint()
        
    }
    
    func sendingHint(){
//        dismissKeyboard()
        hintToSend = sentHintTextField.text ?? ""
        if(hintToSend.rangeOfCharacter(from: letters) != nil){
            //alert hint needs to be emoji
            print("hint contains a letter")
            let alert = UIAlertController(title: "Send Only Emoji's", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else if(hintToSend == ""){
            print("hint is blank")
        }
        else{
            if(appDelegate.player1 == false){
                db.collection("rooms").document("room" + String(roomNumber)).updateData(["player2HintCounter": appDelegate.player2HintCounter]){ err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
                if(hintCounter == 0){
                    db.collection("rooms").document("room" + String(roomNumber)).collection("hints").document("player2Hints").setData([ "hint" + String(hintCounter): hintToSend])
                    print("case1")
                    hintCounter = hintCounter + 1
                }
                else{
                    db.collection("rooms").document("room" + String(roomNumber)).collection("hints").document("player2Hints").updateData([ "hint" + String(hintCounter): hintToSend])
                    print("case2")
                    hintCounter = hintCounter + 1
                }
                appDelegate.player2HintCounter = hintCounter
            }
            else{
                db.collection("rooms").document("room" + String(roomNumber)).updateData(["player1HintCounter": appDelegate.player1HintCounter]){ err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
                if(hintCounter == 0){
                    db.collection("rooms").document("room" + String(roomNumber)).collection("hints").document("player1Hints").setData([ "hint" + String(hintCounter): hintToSend])
                    print("case3")
                    hintCounter = hintCounter + 1
                }
                else{
                    db.collection("rooms").document("room" + String(roomNumber)).collection("hints").document("player1Hints").updateData([ "hint" + String(hintCounter): hintToSend])
                    print("case4")
                    hintCounter = hintCounter + 1
                }
                appDelegate.player1HintCounter = hintCounter
            }
            sentHintsText.text = sentHintsText.text ?? "You: " +  hintToSend + "\n"
            print( "this is the sent hint: " + hintToSend)
//            hintCounter = hintCounter + 1
            
        }
        
        sentHintTextField.text = nil
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        sentHintTextField.delegate = self
        db = Firestore.firestore()
        roomNumber = appDelegate.roomNumber
        print("sending hints room number" + String(roomNumber))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
//        teammatesGoalLabel.sizeToFit()
        teammatesGoalLabel.text = "Teammate Goal: " +  teammateGoalName + "\n" + teammateGoalSnippet
        teammatesGoalLabel.sizeToFit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("this is hint to send" + hintToSend)
        sentHintsText.text = "You: "  +  hintToSend
        if (appDelegate.player1){
            hintCounter = appDelegate.player1HintCounter
        }
        else{
            hintCounter = appDelegate.player2HintCounter
        }
        
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
        print("shown Keyboard")
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue)
            != nil {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
        print("hidden Keyboard")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        sendingHint()
//        print(hintToSend)
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
