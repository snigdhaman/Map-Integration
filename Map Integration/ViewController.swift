//
//  ViewController.swift
//  Map Integration
//
//  Created by Chatterjee, Snigdhaman on 01/01/16.
//  Copyright © 2016 Chatterjee, Snigdhaman. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        /*let latitude : CLLocationDegrees = 12.9667
        let longitude : CLLocationDegrees = 77.5667
        let latDelta : CLLocationDegrees = 0.1
        let longDelta : CLLocationDegrees = 0.1
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Bangalore"
        annotation.subtitle = "I work here"
        
        map.addAnnotation(annotation) */
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "action:")
        
        longPress.minimumPressDuration = 2
        
        map.addGestureRecognizer(longPress)
        
    }
    
    func action(gestureRecogniser: UIGestureRecognizer) {
        
        let touchPoint = gestureRecogniser.locationInView(self.map)
        
        let newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = "Yo"
        annotation.subtitle = "Go there"
        
        map.addAnnotation(annotation)
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        let currentUserLocation : CLLocation = locations[0]
        
        let latitude = currentUserLocation.coordinate.latitude
        let longitude = currentUserLocation.coordinate.longitude
        let latDelta : CLLocationDegrees = 0.001
        let longDelta : CLLocationDegrees = 0.001
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

