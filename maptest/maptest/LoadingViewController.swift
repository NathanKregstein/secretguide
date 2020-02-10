//
//  LoadingViewController.swift
//  maptest
//
//  Created by Nathan Kregstein on 2/2/20.
//  Copyright © 2020 Nathan Kregstein. All rights reserved.
//

import UIKit
import FirebaseCore
//
import FirebaseFirestore
class LoadingViewController: UIViewController {

    @IBOutlet weak var RoomNumberLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    var roomNumber = 0
    var db: Firestore!
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        RoomNumberLabel.text = "Room #" + String(roomNumber)
        // Do any additional setup after loading the view.
        listenDocument()
    }
    
    private func listenDocument(){
        db.collection("rooms").document("room" + String(roomNumber))
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(data)")
                if (data["player2In"]as? Bool ?? false == true){
                    self.startButton.isEnabled = true
                    print("enabled Button")
                }
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(self.roomNumber)
        let destVC : TutorialViewController = segue.destination as! TutorialViewController
        destVC.roomNumber = self.roomNumber
        
        
    }
    
}
