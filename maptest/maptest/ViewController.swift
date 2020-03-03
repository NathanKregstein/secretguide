//
//  ViewController.swift
//  maptest
//
//  Created by Nathan Kregstein on 12/2/19.
//  Copyright © 2019 Nathan Kregstein. All rights reserved.
//

import UIKit
import GoogleMaps
import FirebaseCore
import FirebaseFirestore
//import FirebaseCore
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//import GooglePlaces

class ViewController: UIViewController {
    var roomNumber = 0
    @IBOutlet weak var myMapView: GMSMapView!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
//    var potentialPlaces = UIImage(named: "QuOutline")
    var potentialPlaces = UIImage(named: "quNewC5")
//    var partnerPoint = UIImage(named: "ExOutline")
    var partnerPoint = UIImage(named: "exNewC4")
    var recievedHintCounter = 0
    @IBOutlet weak var HintRecievedLabel: UILabel!
    
    @IBOutlet weak var mostRecentHintLabel: UIButton!
    @IBOutlet weak var hintToolbar: UIToolbar!
    let myCamera = GMSCameraPosition.camera(withLatitude: 40.007592, longitude: -105.268423, zoom: 15.0)
    
    let currentLocMarker = GMSMarker()
    let marker = GMSMarker()
    let marker2 = GMSMarker()
    let marker3 = GMSMarker()
    let marker4 = GMSMarker()
    let marker5 = GMSMarker()
    let marker6 = GMSMarker()
    let marker7 = GMSMarker()
    let marker8 = GMSMarker()
    let marker9 = GMSMarker()
    let marker10 = GMSMarker()
    let marker11 = GMSMarker()
    let marker12 = GMSMarker()
    let marker13 = GMSMarker()
    let marker14 = GMSMarker()
    let marker15 = GMSMarker()
    let marker16 = GMSMarker()
    let marker17 = GMSMarker()
    let marker18 = GMSMarker()
    let marker19 = GMSMarker()
    let marker20 = GMSMarker()
    let marker21 = GMSMarker()
    let marker22 = GMSMarker()
    let marker23 = GMSMarker()
    let marker24 = GMSMarker()
    let marker25 = GMSMarker()
    let marker26 = GMSMarker()
    let marker27 = GMSMarker()
    
    struct Goal {
        var location = CLLocationCoordinate2D(latitude: 40.009789, longitude: -105.272754)
        var title = "Macky Auditorium Concert Hall"
        var snippet = "Iconic Gothic-style auditorium hosting jazz & classical concerts, opera singers & guest speakers."
    }
    var teammateGoal = Goal()
    var myGoal = Goal()
    var currentHint = ""
    var db: Firestore!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMapView.delegate = self
        myMapView.isMyLocationEnabled = true
        myMapView.camera = myCamera
        print("camera assigned")
        
            // Set the map style by passing a valid JSON string.
            do {
                // Set the map style by passing the URL of the local file.
                if let styleURL = Bundle.main.url(forResource: "mapstyle", withExtension: "json") {
                    myMapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                } else {
                    NSLog("Unable to find style.json")
                }
            } catch {
                NSLog("One or more of the map styles failed to load. \(error)")
            }
//           hintToolbar setframe
//   print(myMapView)
        //       let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        //        mapView.init(frame: rect, camera: camera)
//        google_map = GMSMapView.map(withFrame: CGRect.zero, camera: myCamera)
//        google_map.camera = myCamera
//        myMapView.mapType =
        db = Firestore.firestore()
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
//        locationManager.startUpdatingLocation()
        currentLocation = locationManager.location

        self.showMarker(position: myMapView.camera.target)
        roomNumber = appDelegate.roomNumber
        randomTeammateGoal()
//        HintRecievedLabel.layer.borderColor = UIColor.darkGray.cgColor
//        HintRecievedLabel.layer.borderWidth = 3.0
//        HintRecievedLabel.textContainerInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
//
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("this is current hint in view" + currentHint)
//        if(appDelegate.player1 == true){
//            db.collection("rooms").document("room" + String(roomNumber)).getDocument { (document, error) in
//                if let document = document, document.exists {
//                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                    print("Document data: \(dataDescription)")
//                    self.appDelegate.player2HintCounter = document.data()!["player2HintCounter"] as? Int ?? 0
//                } else {
//                    print("Document does not exist")
//                }
//            }
//            db.collection("rooms").document("room" + String(roomNumber)).collection("hints").document("player2Hints").getDocument { (document, error) in
//                if let document = document, document.exists {
//                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                    print("Document data: \(dataDescription)")
//                    self.currentHint = document.data()!["hint" + String(self.appDelegate.player2HintCounter)] as? String ?? ""
//                } else {
//                    print("Document does not exist")
//                }
//                self.mostRecentHintLabel.setTitle("Current hint for you:" + self.currentHint, for: .normal)
//            }
//        }
//        else{
//            db.collection("rooms").document("room" + String(roomNumber)).getDocument { (document, error) in
//                if let document = document, document.exists {
//                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                    print("Document data: \(dataDescription)")
//                    self.appDelegate.player1HintCounter = document.data()!["player1HintCounter"] as? Int ?? 0
//                } else {
//                    print("Document does not exist")
//                }
//            }
//                db.collection("rooms").document("room" + String(roomNumber)).collection("hints").document("player1Hints").getDocument { (document, error) in
//                    if let document = document, document.exists {
//                        let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                        print("Document data: \(dataDescription)")
//                        self.currentHint = document.data()!["hint"+String(self.appDelegate.player1HintCounter)] as? String ?? ""
//                    } else {
//                        print("Document does not exist")
//                    }
//                    self.mostRecentHintLabel.setTitle("Current hint for you:" + self.currentHint, for: .normal)
//                }
//        }
        listenDocument()
        
    }

    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        
    }
    
    func randomTeammateGoal(){
        let i = Int.random(in: 0 ..< 25)
//        var tempMarkerName = ""
//        if(i == 0){
//            tempMarkerName = "marker"
//        }
//        else{
//            tempMarkerName = "marker" + String(i)
//        }
        
        
        marker.icon = potentialPlaces
        marker2.icon = potentialPlaces
        marker3.icon = potentialPlaces
        marker4.icon = potentialPlaces
        marker5.icon = potentialPlaces
        marker6.icon = potentialPlaces
        marker7.icon = potentialPlaces
        marker8.icon = potentialPlaces
        marker9.icon = potentialPlaces
        marker10.icon = potentialPlaces
        marker11.icon = potentialPlaces
        marker12.icon = potentialPlaces
        marker13.icon = potentialPlaces
        marker14.icon = potentialPlaces
        marker15.icon = potentialPlaces
        marker16.icon = potentialPlaces
        marker17.icon = potentialPlaces
        marker18.icon = potentialPlaces
        marker19.icon = potentialPlaces
        marker20.icon = potentialPlaces
        marker21.icon = potentialPlaces
        marker22.icon = potentialPlaces
        marker23.icon = potentialPlaces
        marker24.icon = potentialPlaces
        marker25.icon = potentialPlaces
        
      switch i {
        case 0:
            teammateGoal.location = marker.position
            teammateGoal.title = marker.title!
            teammateGoal.snippet = marker.snippet!
            marker.icon = partnerPoint
            break
        case 1:
            teammateGoal.location = marker2.position
            teammateGoal.title = marker2.title!
            teammateGoal.snippet = marker2.snippet!
            marker2.icon = partnerPoint
            break
        case 2:
            teammateGoal.location = marker3.position
            teammateGoal.title = marker3.title!
            teammateGoal.snippet = marker3.snippet!
            marker3.icon = partnerPoint
            break
        case 3:
            teammateGoal.location = marker4.position
            teammateGoal.title = marker4.title!
            teammateGoal.snippet = marker4.snippet!
            marker4.icon = partnerPoint
            break
        case 4:
            teammateGoal.location = marker5.position
            teammateGoal.title = marker5.title!
            teammateGoal.snippet = marker5.snippet!
            marker5.icon = partnerPoint
            break
        case 5:
            teammateGoal.location = marker6.position
            teammateGoal.title = marker6.title!
            teammateGoal.snippet = marker6.snippet!
            marker6.icon = partnerPoint
            break
        case 6:
            teammateGoal.location = marker7.position
            teammateGoal.title = marker7.title!
            teammateGoal.snippet = marker7.snippet!
            marker7.icon = partnerPoint
            break
        case 7:
            teammateGoal.location = marker8.position
            teammateGoal.title = marker8.title!
            teammateGoal.snippet = marker8.snippet!
            marker8.icon = partnerPoint
            break
        case 8:
            teammateGoal.location = marker9.position
            teammateGoal.title = marker9.title!
            teammateGoal.snippet = marker9.snippet!
            marker9.icon = partnerPoint
            break
        case 9:
            teammateGoal.location = marker10.position
            teammateGoal.title = marker10.title!
            teammateGoal.snippet = marker10.snippet!
            marker10.icon = partnerPoint
            break
        case 10:
            teammateGoal.location = marker11.position
            teammateGoal.title = marker11.title!
            teammateGoal.snippet = marker11.snippet!
            marker11.icon = partnerPoint
            break
        case 11:
            teammateGoal.location = marker12.position
            teammateGoal.title = marker12.title!
            teammateGoal.snippet = marker12.snippet!
            marker12.icon = partnerPoint
            break
        case 12:
            teammateGoal.location = marker13.position
            teammateGoal.title = marker13.title!
            teammateGoal.snippet = marker13.snippet!
            marker13.icon = partnerPoint
            break
        case 13:
            teammateGoal.location = marker14.position
            teammateGoal.title = marker14.title!
            teammateGoal.snippet = marker14.snippet!
            marker14.icon = partnerPoint
            break
        case 14:
            teammateGoal.location = marker15.position
            teammateGoal.title = marker15.title!
            teammateGoal.snippet = marker15.snippet!
            marker15.icon = partnerPoint
            break
        case 15:
            teammateGoal.location = marker16.position
            teammateGoal.title = marker16.title!
            teammateGoal.snippet = marker16.snippet!
            marker16.icon = partnerPoint
            break
        case 16:
            teammateGoal.location = marker17.position
            teammateGoal.title = marker17.title!
            teammateGoal.snippet = marker17.snippet!
            marker17.icon = partnerPoint
            break
        case 17:
            teammateGoal.location = marker18.position
            teammateGoal.title = marker18.title!
            teammateGoal.snippet = marker18.snippet!
            marker18.icon = partnerPoint
            break
        case 18:
            teammateGoal.location = marker19.position
            teammateGoal.title = marker19.title!
            teammateGoal.snippet = marker19.snippet!
            marker19.icon = partnerPoint
            break
        case 19:
            teammateGoal.location = marker20.position
            teammateGoal.title = marker20.title!
            teammateGoal.snippet = marker20.snippet!
            marker20.icon = partnerPoint
            break
        case 20:
            teammateGoal.location = marker21.position
            teammateGoal.title = marker21.title!
            teammateGoal.snippet = marker21.snippet!
            marker21.icon = partnerPoint
            break
        case 21:
            teammateGoal.location = marker22.position
            teammateGoal.title = marker22.title!
            teammateGoal.snippet = marker22.snippet!
            marker22.icon = partnerPoint
            break
        case 22:
            teammateGoal.location = marker23.position
            teammateGoal.title = marker23.title!
            teammateGoal.snippet = marker23.snippet!
            marker23.icon = partnerPoint
            break
        case 23:
            teammateGoal.location = marker24.position
            teammateGoal.title = marker24.title!
            teammateGoal.snippet = marker24.snippet!
            marker24.icon = partnerPoint
            break
        case 24:
            teammateGoal.location = marker25.position
            teammateGoal.title = marker25.title!
            teammateGoal.snippet = marker25.snippet!
            marker25.icon = partnerPoint
            break
//        case 25:
//            teammateGoal.location = marker26.position
//            teammateGoal.title = marker26.title!
//            teammateGoal.snippet = marker26.snippet!
//            marker26.icon = partnerPoint
//            break
//        case 26:
//            teammateGoal.location = marker27.position
//            teammateGoal.title = marker27.title!
//            teammateGoal.snippet = marker27.snippet!
//            marker27.icon = partnerPoint
//            break
        default:
            teammateGoal.location = marker.position
            teammateGoal.title = marker.title!
            teammateGoal.snippet = marker.snippet!
            marker.icon = partnerPoint
        }
        if(appDelegate.player1 == true){
//            db.collection("rooms").document("room" + String(roomNumber)).getDocument { (document, error) in
//                if let document = document, document.exists {
//                    let data = document.data()
//                    if((data!["player2GoalReached"] as? Bool ?? false) == true){
//                        let alert = UIAlertController(title: "You Successfully guided your Teammate!", message: nil, preferredStyle: .alert)
//                        alert.addAction(UIAlertAction(title: "YAY, start next goal!", style: .default, handler: { action in self.randomTeammateGoal()}))
//                        self.present(alert, animated: true)
//                    }
//                } else {
//                    print("Document does not exist")
//                }
//            }

            db.collection("rooms").document("room" + String(roomNumber)).updateData(["player2GoalPositionLatitude": self.teammateGoal.location.latitude]){ err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
            db.collection("rooms").document("room" + String(roomNumber)).updateData(["player2GoalPositionLongitude": self.teammateGoal.location.longitude]){ err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
            db.collection("rooms").document("room" + String(roomNumber)).updateData(["player2GoalName": self.teammateGoal.title]){ err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
            db.collection("rooms").document("room" + String(self.roomNumber)).updateData(["player1GoalReached": false]){ err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        }
        else{
            db.collection("rooms").document("room" + String(roomNumber)).updateData(["player1GoalPositionLatitude": self.teammateGoal.location.latitude]){ err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
            db.collection("rooms").document("room" + String(roomNumber)).updateData(["player1GoalPositionLongitude": self.teammateGoal.location.longitude]){ err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
            db.collection("rooms").document("room" + String(roomNumber)).updateData(["player1GoalName": self.teammateGoal.title]){ err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
            db.collection("rooms").document("room" + String(self.roomNumber)).updateData(["player2GoalReached": false]){ err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        }

    }
    
        // Creates a marker in the center of the map.
    func showMarker(position: CLLocationCoordinate2D){
//            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: 40.007707, longitude: -105.269707)
            marker.title = "Atlas"
            marker.snippet = "ATLAS is an interdisciplinary institute for radical creativity and invention."
            marker.map = myMapView
            marker.icon = potentialPlaces
        
//            let marker2 = GMSMarker()
            marker2.position = CLLocationCoordinate2D(latitude: 40.0083332, longitude: -105.2669129)
            marker2.title = "Folsom Field"
            marker2.snippet = "CU Boulder's football stadium."
            marker2.icon = potentialPlaces
            marker2.map = myMapView
//            let marker3 = GMSMarker()
        
            marker3.position = CLLocationCoordinate2D(latitude: 40.0036315, longitude: -105.2635825)
            marker3.title = "Fiske Planitarium"
            marker3.snippet = "65-foot diameter dome planetarium."
            marker3.icon = potentialPlaces
            marker3.map = myMapView
        
//            let marker4 = GMSMarker()
            marker4.position = CLLocationCoordinate2D(latitude: 40.006411, longitude: -105.266642)
            marker4.title = "Farrand Field"
            marker4.snippet = "Farrand Field is the centerpiece of the CU campus. It features a performance stage and recreational open space. It is well-known for it's beautiful views of the Flatirons."
            marker4.icon = potentialPlaces
            marker4.map = myMapView
        
//            let marker5 = GMSMarker()
            marker5.position = CLLocationCoordinate2D(latitude: 40.009214, longitude: -105.273351)
            marker5.title = "Old Main"
            marker5.snippet = "Built in 1876, Old Main is CU's first campus building, and is home to the arts and sciences offices as well as the CU Heritage Center on the third floor."
            marker5.icon = potentialPlaces
            marker5.map = myMapView
        
//        let marker6 = GMSMarker()
        marker6.position = CLLocationCoordinate2D(latitude: 40.009789, longitude: -105.272754)
        marker6.title = "Macky Auditorium Concert Hall"
        marker6.snippet = "Iconic Gothic-style auditorium hosting jazz & classical concerts, opera singers & guest speakers."
        marker6.icon = potentialPlaces
        marker6.map = myMapView
        
//        let marker7 = GMSMarker()
        marker7.position = CLLocationCoordinate2D(latitude: 40.0044295, longitude: -105.2650032)
        marker7.title = "C4C"
        marker7.snippet = "Center for Community contains a wide range of services for students but is predominately known for its Dining Services."
        marker7.icon = potentialPlaces
        marker7.map = myMapView
        
//        let marker8 = GMSMarker()
        marker8.position = CLLocationCoordinate2D(latitude: 40.003470, longitude: -105.264116)
        marker8.title = "Colorado Scale Model of the Solar System Start"
        marker8.snippet = "The Colorado Scale Model Solar System shows both planetary sizes and distances in our solar system at 1 ten-billionth actual size."
        marker8.icon = potentialPlaces
        marker8.map = myMapView
        
//        let marker9 = GMSMarker()
        marker9.position = CLLocationCoordinate2D(latitude: 40.007346, longitude: -105.269728)
        marker9.title = "Colorado University Art Museum"
        marker9.snippet = "Small on-campus art museum with thought-provoking exhibitions, gallery talks, lectures & workshops."
        marker9.icon = potentialPlaces
        marker9.map = myMapView
        
//        let marker10 = GMSMarker()
        marker10.position = CLLocationCoordinate2D(latitude: 40.007475, longitude: -105.271646)
        marker10.title = "Dalton Trumbo Fountain Court"
        marker10.snippet = "The fountain is a popular gathering place for student groups to enjoy lunch on a sunny day."
        marker10.icon = potentialPlaces
        marker10.map = myMapView
        
//        let marker11 = GMSMarker()
        marker11.position = CLLocationCoordinate2D(latitude: 40.007238, longitude: -105.263433)
        marker11.title = "Engineering Center"
        marker11.snippet = "The center comprises 660,000 square feet of classrooms, computing facilities, faculty offices, and research laboratories."
        marker11.icon = potentialPlaces
        marker11.map = myMapView
        
//        let marker12 = GMSMarker()
        marker12.position = CLLocationCoordinate2D(latitude: 40.006951, longitude: -105.272703)
        marker12.title = "Natural History Museum"
        marker12.snippet = "Featuring five exhibition galleries to explore natural and human history through engaging and interactive displays."
        marker12.icon = potentialPlaces
        marker12.map = myMapView
        
//        let marker13 = GMSMarker()
        marker13.position = CLLocationCoordinate2D(latitude: 40.008664, longitude: -105.270314)
        marker13.title = "Norlin Library"
        marker13.snippet = "The largest library on the CU-Boulder campus."
        marker13.icon = potentialPlaces
        marker13.map = myMapView
        
//        let marker14 = GMSMarker()
        marker14.position = CLLocationCoordinate2D(latitude: 40.010196, longitude: -105.270195)
        marker14.title = "Buff Outdoor Pool"
        marker14.snippet = "CU's outdoor pool shaped like a buffalo."
        marker14.icon = potentialPlaces
        marker14.map = myMapView
        
//        let marker15 = GMSMarker()
        marker15.position = CLLocationCoordinate2D(latitude: 40.009933, longitude: -105.269168)
        marker15.title = "Rec Center"
        marker15.snippet = "CU's on campus gym including basketball, track, rockclimbing and more."
        marker15.icon = potentialPlaces
        marker15.map = myMapView
        
//        let marker16 = GMSMarker()
        marker16.position = CLLocationCoordinate2D(latitude: 40.0084707, longitude: -105.2677409)
        marker16.title = "Statue Monarch Of The Plains"
        marker16.snippet = "Rubbing the horns of the buffalo statue in front of Folsom Field is considered lucky."
        marker16.icon = potentialPlaces
        marker16.map = myMapView
        
//        let marker17 = GMSMarker()
//        marker17.position = CLLocationCoordinate2D(latitude: 40.011484, longitude: -105.275504)
//        marker17.title = "The Media Archaeology Lab"
//        marker17.snippet = "Place for cross-disciplinary experimental research and teaching using still functioning media from the past."
//        marker17.icon = potentialPlaces
//        marker17.map = myMapView
        
                marker17.position = CLLocationCoordinate2D(latitude: 40.002839, longitude: -105.262681)
                marker17.title = "Kittredge Pond"
                marker17.snippet = "Center piece of Kitrredge on-campus housing. Many fish and ducks can be seen here."
                marker17.icon = potentialPlaces
                marker17.map = myMapView
        
//        let marker18 = GMSMarker()
        marker18.position = CLLocationCoordinate2D(latitude: 40.006768, longitude: -105.271469)
        marker18.title = "UMC"
        marker18.snippet = "University Memorial Center contains multiple dining options, CU's campus store, and the only bowling alley in Boulder."
        marker18.icon = potentialPlaces
        marker18.map = myMapView
        
//        let marker19 = GMSMarker()
        marker19.position = CLLocationCoordinate2D(latitude: 40.008180, longitude: -105.273557)
        marker19.title = "University of Colorado Boulder Department of Theatre & Dance"
        marker19.snippet = "The Department of Theatre & Dance is a community of students, scholars, artists and artisans who regard the collaborative and creative process as the core of education."
        marker19.icon = potentialPlaces
        marker19.map = myMapView
        
//        let marker20 = GMSMarker()
        marker20.position = CLLocationCoordinate2D(latitude: 40.009668, longitude: -105.274313)
        marker20.title = "Varsity Lake"
        marker20.snippet = "Varsity Lake is the result of a dam being built at the end of a ravine in 1888, when the lake was formed. "
        marker20.icon = potentialPlaces
        marker20.map = myMapView
        
//        let marker21 = GMSMarker()
        marker21.position = CLLocationCoordinate2D(latitude: 40.005360, longitude: -105.268720)
        marker21.title = "Wardenburg Health Center"
        marker21.snippet = "CU Boulder's building for primary health services."
        marker21.icon = potentialPlaces
        marker21.map = myMapView
        
//        let marker22 = GMSMarker()
        marker22.position = CLLocationCoordinate2D(latitude: 40.006810, longitude: -105.264986)
        marker22.title = "Engineering Quad"
        marker22.snippet = "Hangout spot for engineering freshman, sorrounded by on-campus housing."
        marker22.icon = potentialPlaces
        marker22.map = myMapView
        
        marker23.position = CLLocationCoordinate2D(latitude: 40.005245, longitude: -105.261314)
        marker23.title = "CU Events Center"
        marker23.snippet = "CU Events Center is an 11,064-seat multi-purpose arena, it is home to the Colorado Buffaloes men's and women's basketball teams."
        marker23.icon = potentialPlaces
        marker23.map = myMapView
        
        marker24.position = CLLocationCoordinate2D(latitude: 40.007152, longitude: -105.272774)
        marker24.title = "Mary Rippon Outdoor Theatre"
        marker24.snippet = "The Colorado Shakespeare Festival performs at this historic university outdoor amphitheater."
        marker24.icon = potentialPlaces
        marker24.map = myMapView
        
        marker25.position = CLLocationCoordinate2D(latitude: 40.005197, longitude: -105.263468)
        marker25.title = "Koelbel Building"
        marker25.snippet = "Home of the LEEDS School of Business."
        marker25.icon = potentialPlaces
        marker25.map = myMapView
//        let currentLocMarker = GMSMarker()
//            currentLocMarker.position = currentLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 40.008, longitude: -105.27)
//        let Thisposition = CLLoca
//        if((Thisposition) != nil){
//            currentLocMarker.position = Thisposition!
//        }
//            currentLocMarker.icon = UIImage(named: "Player")
//            currentLocMarker.map = myMapView
//
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
//        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
//                                              longitude: location.coordinate.longitude,
//                                              zoom: 15.0)
        
//        if mapView.isHidden {
//            mapView.isHidden = false
//            mapView.camera = camera
//        } else {
//            myMapView.animate(to: camera)
//        let goalLocation: CLLocation
//        goalLocation.setValue(myGoal.location, forKey: "location")
        let goalLocation = CLLocation(latitude: myGoal.location.latitude, longitude: myGoal.location.longitude)
        currentLocMarker.position = location.coordinate
        print("current location:" , currentLocation)
        print("goal location:" , goalLocation)
        currentLocMarker.icon = UIImage(named: "Player")
        currentLocMarker.map = myMapView
        print(currentLocMarker.position)
        var distance =  location.distance(from: goalLocation)
//            location.distance(from: myGoal.location)
        print("distance:")
        print(distance)
        if(distance <= 35){
            print("within distance")
            let alert = UIAlertController(title: "You Made It!", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yay", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            if(self.appDelegate.player1 == true){
                db.collection("rooms").document("room" + String(roomNumber)).updateData(["player1GoalReached": true]){ err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            print("Document successfully updated")
                        }
                    }
            }
            else{
                db.collection("rooms").document("room" + String(roomNumber)).updateData(["player2GoalReached": true]){ err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
            }
        }
        
//        }
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            myMapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
    
    private func listenDocument(){
        print(roomNumber)
        if(appDelegate.player1 == true){
            //want to read in hints player2sent
            db.collection("rooms").document("room" + String(roomNumber)).addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(data)")
                self.recievedHintCounter = (data["player2HintCounter"]) as? Int ?? 0
                self.myGoal.location.latitude = (data["player1GoalPositionLatitude"]) as? Double ?? 0
                self.myGoal.location.longitude = (data["player1GoalPositionLongitude"]) as? Double ?? 0
                if((data["player2GoalReached"] as? Bool ?? false) == true){
                    self.db.collection("rooms").document("room" + String(self.roomNumber)).updateData(["player2GoalReached": false])
                    let alert = UIAlertController(title: "You Successfully guided your Teammate!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "YAY, start next goal!", style: .default, handler: { action in self.randomTeammateGoal()}))
                    self.present(alert, animated: true)
                }
            }
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
                self.HintRecievedLabel.text = (data["hint" + String(self.recievedHintCounter)] as? String ?? "")
            }
            
        }
        else{
            //want to read in hints player1sent
            db.collection("rooms").document("room" + String(roomNumber)).addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(data)")
                self.recievedHintCounter = (data["player1HintCounter"]) as? Int ?? 0
                self.myGoal.location.latitude = (data["player2GoalPositionLatitude"]) as? Double ?? 0
                self.myGoal.location.longitude = (data["player2GoalPositionLongitude"]) as? Double ?? 0
                if((data["player1GoalReached"] as? Bool ?? false) == true){
                    self.db.collection("rooms").document("room" + String(self.roomNumber)).updateData(["player1GoalReached": false])
                    let alert = UIAlertController(title: "You Successfully guided your Teammate!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "YAY, start next goal!", style: .default, handler: { action in self.randomTeammateGoal()}))
                    self.present(alert, animated: true)
                }
            }
            
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
                self.HintRecievedLabel.text = (data["hint" + String(self.recievedHintCounter)] as? String ?? "")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendHints" {
            let destVC : SendingHintsViewController = segue.destination as! SendingHintsViewController
            destVC.roomNumber = self.roomNumber
            destVC.teammateGoalName = teammateGoal.title
            destVC.teammateGoalSnippet = teammateGoal.snippet
        }
    }
    


}
extension ViewController: GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker:GMSMarker){
        
    }
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        
    }
}
extension ViewController: CLLocationManagerDelegate{
    
}


