//
//  RecievedHintsViewController.swift
//  maptest
//
//  Created by Nathan Kregstein on 1/28/20.
//  Copyright © 2020 Nathan Kregstein. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class RecievedHintsViewController: UIViewController {
    @IBOutlet weak var HintsRecievedText: UILabel!
    var db: Firestore!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var roomNumber = 0
    var hintcounter = 0
    var mostRecentHint = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        roomNumber = appDelegate.roomNumber
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.HintsRecievedText.text = mostRecentHint
        listenDocument()
    }
    
    @IBAction func RequestHintButtonPressed(_ sender: Any) {
        
    }
    
    private func listenDocument(){
        print(roomNumber)
        if(appDelegate.player1 == true){
            //want to read in hints player2sent
            db.collection("rooms").document("room" + String(roomNumber)).collection("hints").document("player2Hints").addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(data)")
                self.HintsRecievedText.text = "Partner: " + (data["hint" + String(self.hintcounter)] as! String)
            }
        }
        else{
            //want to read in hints player1sent
            db.collection("rooms").document("room" + String(roomNumber)).collection("hints").document("player1Hints").addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(data)")
                self.HintsRecievedText.text = "Partner: " + (data["hint" + String(self.hintcounter)] as! String)
            }
        }
        mostRecentHint = self.HintsRecievedText.text!
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : ViewController = segue.destination as! ViewController
        destVC.currentHint = self.mostRecentHint
    }
}


