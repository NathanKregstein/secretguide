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
    var created = false
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var RoomNumberTextField: UITextField!
    
    
    @IBAction func CreateRoomButtonAction(_ sender: Any) {
        
//        print(db.collection("rooms").whereField("player1In", isEqualTo: false))
        var docID = "room9"
        created = true
        db.collection("rooms").whereField("player1In", isEqualTo: false).getDocuments() { (DocumentSnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in DocumentSnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let MyData = document.data()
                    self.roomNumber = MyData["room"] as? Int ?? 0
                    print(self.roomNumber)
//                    document.setValue(true, forKey: "player1In")
                    docID = document.documentID
                    self.appDelegate.roomNumber = Int(docID) ?? 0
                    print(document.data())
                    break
                    
                }
                
//                self.performSegue(withIdentifier: "CreatedRoomSegue", sender: self)
                
                print (docID)
                self.db.collection("rooms").document(docID).updateData( ["player1In": true
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
//                changeSeg()
                self.performSegue(withIdentifier: "CreatedRoomSegue", sender: self)
            }
        }
//        print (docID)
//        db.collection("rooms").document(docID).updateData( ["player1In": true
//        ]) { err in
//            if let err = err {
//                print("Error updating document: \(err)")
//            } else {
//                print("Document successfully updated")
//            }
//        }
//        changeSeg()
    }
    
    func changeSeg(){
        self.performSegue(withIdentifier: "CreatedRoomSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
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
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        joinRoom()
    }
    
    func joinRoom(){
        print("joinroomfunction")
        roomNumber = Int(RoomNumberTextField.text ?? "-1" ) ?? 0
//        let semaphore = DispatchSemaphore(value: 1)
        self.appDelegate.roomNumber = Int(roomNumber) ?? 0
        if (roomNumber >= 1){
            print("entered if")
            var player1 = false
            var player2 = false
           var currentRoom = db.collection("rooms").document("room"+String(roomNumber))
            print(currentRoom.documentID)
            
            
//            semaphore.wait()
            currentRoom.getDocument { (document, error) in
                if let document = document, document.exists {
                    let Mydata = document.data()
                    player1 = (Mydata!["player1In"] as? Bool ?? false)
                    player2 = (Mydata!["player2In"] as? Bool ?? false)
                    print(player1)
                    print(player2)
//                    print("Document data: \(dataDescription)")
                    if(player1 == false){
                        //alert room doesn't exist create a new one
                        print("room doesn't exist")
                        let alert = UIAlertController(title: "Room Doesn't Exist", message: nil, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alert, animated: true)
                    }
                    else if(player1 && !player2){
                        //join room
                        self.appDelegate.player1 = false
                        currentRoom.updateData( ["player2In": true
                        ]) { err in
                            if let err = err {
                                print("Error updating document: \(err)")
                            } else {
                                print("Document successfully updated")
                            }
                            self.performSegue(withIdentifier: "JoinedRoomSegue", sender: self)
                        }
                        
                    }
                    else if(player1 && player2){
                        //alert that room is full
                        
                        let alert = UIAlertController(title: "Room Is Full", message: nil, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alert, animated: true)
                    }
                    else{
                        print("ended in else")
                    }
                } else {
                    print("Document does not exist")
                }
//                semaphore.signal() // releasing the resource
            }
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(self.roomNumber)
        if(created){
            self.appDelegate.roomNumber = Int(roomNumber)
            let destVC : LoadingViewController = segue.destination as! LoadingViewController
            destVC.roomNumber = self.roomNumber
        }
        else{
            let destVC : TutorialViewController = segue.destination as! TutorialViewController
            destVC.roomNumber = self.roomNumber
        }
        
    }
    



}
