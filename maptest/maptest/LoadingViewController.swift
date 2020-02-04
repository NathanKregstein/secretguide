//
//  LoadingViewController.swift
//  maptest
//
//  Created by Nathan Kregstein on 2/2/20.
//  Copyright © 2020 Nathan Kregstein. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var RoomNumberLabel: UILabel!
    var roomNumber = Int.random(in: 1..<100 )
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RoomNumberLabel.text = "Room #" + String(roomNumber)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
