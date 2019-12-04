//
//  ViewController.swift
//  maptest
//
//  Created by Nathan Kregstein on 12/2/19.
//  Copyright © 2019 Nathan Kregstein. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    @IBOutlet weak var myMapView: GMSMapView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myCamera = GMSCameraPosition.camera(withLatitude: 40.0098, longitude: -105.27, zoom: 15.0)
        myMapView.camera = myCamera
   print(myMapView)
        //       let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        //        mapView.init(frame: rect, camera: camera)
//        google_map = GMSMapView.map(withFrame: CGRect.zero, camera: myCamera)
//        google_map.camera = myCamera
//        myMapView.mapType =
        self.showMarker(position: myMapView.camera.target)
        
        // Do any additional setup after loading the view.
    }


        // Creates a marker in the center of the map.
    func showMarker(position: CLLocationCoordinate2D){
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: 40.0077215, longitude: -105.271474)
            marker.title = "Atlas"
            marker.snippet = "TAM"
            marker.map = myMapView
            let marker2 = GMSMarker()
            marker2.position = CLLocationCoordinate2D(latitude: 40.0094761, longitude: -105.2669)
            marker2.title = "Folsom Field"
            marker2.snippet = "CU Boulder's football stadium"
            marker2.icon = UIImage(named: "markericon1")
            marker2.map = myMapView
        }

}
extension ViewController: GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker:GMSMarker){
        
    }
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        
    }
}
