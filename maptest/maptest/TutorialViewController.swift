//
//  TutorialViewController.swift
//  maptest
//
//  Created by Nathan Kregstein on 1/30/20.
//  Copyright © 2020 Nathan Kregstein. All rights reserved.
//

import UIKit
//import GoogleMaps

class TutorialViewController: UIViewController {
    var roomNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(self.restorationIdentifier ==  "lastPageTutorial"){
            let destVC : ViewController = segue.destination as! ViewController
//            destVC.roomNumber = self.roomNumber
        }
    }

}
