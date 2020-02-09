//
//  StartingViewController.swift
//  maptest
//
//  Created by Nathan Kregstein on 2/2/20.
//  Copyright © 2020 Nathan Kregstein. All rights reserved.
//

import UIKit
import FirebaseCore
//
import FirebaseFirestore
//import FirebaseFirestoreSwift



class StartingViewController: UIViewController, UITextFieldDelegate {

    var db: Firestore!
    var ref: DocumentReference? = nil
    var roomNumber = -1
    @IBOutlet weak var RoomNumberTextField: UITextField!
    
    
    @IBAction func CreateRoomButtonAction(_ sender: Any) {
        db.collection("rooms").whereField("player1In", isEqualTo: false).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let MyData = document.data()
                    self.roomNumber = MyData["room"] as? Int ?? 0
                    print(self.roomNumber)
                    
                    print(document.data())
                    break
                    
                }
                self.performSegue(withIdentifier: "CreatedRoomSegue", sender: self)
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
       
//    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        RoomNumberTextField.delegate = self
        
        let tap: UITapGestureRecognizer =
            UITapGestureRecognizer(target: self, action:
                #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
        // [START setup]
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        

        
//        db.collection("rooms").getDocuments() { (docSnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in docSnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                    let MyData = document.data()
//                    if (MyData["player1In"]as? Bool == false ){
//                        self.roomNumber = MyData["room"] as? Int ?? 0
////                        document.data().updateValue(true, forKey: "Player1In")
//
//                        break
//                    }
//                }
//            }
//        }
        
//        ref = db.collection("rooms").addDocument(data: [
//            "room": roomNumber,
//            "player1In": false,
//            "player2In": false
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(self.ref!.documentID)")
//            }
//        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }
//    }
    
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue)
//            != nil {
//            if self.view.frame.origin.y != 0 {
//                self.view.frame.origin.y = 0
//            }
//        }
//    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(self.roomNumber)
        let destVC : LoadingViewController = segue.destination as! LoadingViewController
        destVC.roomNumber = self.roomNumber
    }
    



}
