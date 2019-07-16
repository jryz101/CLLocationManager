//  ViewController.swift
//  CLLocationManager
//  Created by Jerry Tan on 16/07/2019.
//  Copyright © 2019 Starknet Technologies®. All rights reserved.


import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    //Declare a variable object that use to start and stop the delivery of location-related events to the app
    var locationManager: CLLocationManager?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set locationManager equals to CLLocationManager( )
        locationManager = CLLocationManager()
        
        //Requests permission to use location services while the app is in the foreground
        locationManager?.requestWhenInUseAuthorization()
        
        //The geographical coordinate information
        if let coordinate = locationManager?.location?.coordinate {
            
            //A latitude or longitude value specified in degrees
            let xScale:CLLocationDegrees = 0.01
            let yScale:CLLocationDegrees = 0.01
            
            //The width and height of a map region.
            let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            
            //A rectangular geographic region centered around a specific latitude and longitude
            let region = MKCoordinateRegion(center: coordinate, span: span)
            
            //Changes the currently visible region and optionally animates the change.
            map.setRegion(region, animated: true)
            
        }
        
    }
    
    
    @IBOutlet weak var map: MKMapView!
}

