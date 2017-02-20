//
//  ViewController.swift
//  MapTimeLine
//
//  Created by Sierra 4 on 13/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    
    let locationManager = CLLocationManager()
    @IBOutlet weak var viewMapShow: GMSMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMapShow.delegate = self as? GMSMapViewDelegate
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 1.285, longitude: 103.848, zoom: 12)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.view = mapView
        mapView.isMyLocationEnabled = true
        let mapInsets = UIEdgeInsets(top: 100.0, left: 0.0, bottom: 0.0, right: 300.0)
        mapView.padding = mapInsets
    }
    func mapView(_ mapView: GMSMapView, didTapPOIWithPlaceID placeID: String,
                 name: String, location: CLLocationCoordinate2D) {
        print("You tapped \(name): \(placeID), \(location.latitude)/\(location.longitude)")
    }
}

