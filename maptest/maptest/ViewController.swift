//
//  ViewController.swift
//  maptest
//
//  Created by Nathan Kregstein on 12/2/19.
//  Copyright © 2019 Nathan Kregstein. All rights reserved.
//

import UIKit
import GoogleMaps
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
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
//        locationManager.startUpdatingLocation()
        currentLocation = locationManager.location

        self.showMarker(position: myMapView.camera.target)
        
    
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        
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
        marker6.icon = partnerPoint
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
        
        marker24.position = CLLocationCoordinate2D(latitude: 40.005197, longitude: -105.263468)
        marker24.title = "Koelbel Building"
        marker24.snippet = "Home of the LEEDS School of Business."
        marker24.icon = potentialPlaces
        marker24.map = myMapView
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
      
        currentLocMarker.position = location.coordinate
    
        currentLocMarker.icon = UIImage(named: "Player")
        currentLocMarker.map = myMapView
        print(currentLocMarker.position)
        
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

}
extension ViewController: GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker:GMSMarker){
        
    }
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        
    }
}
extension ViewController: CLLocationManagerDelegate{
}


