//  ViewController.swift
//  CLLocationManager
//  Created by Jerry Tan on 16/07/2019.
//  Copyright © 2019 Starknet Technologies®. All rights reserved.


import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    //Declare a variable object that use to start and stop the delivery of location-related events to the app
    var locationManager: CLLocationManager?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set locationManager equals to CLLocationManager( )
        locationManager = CLLocationManager()
        
        //Requests permission to use location services while the app is in the foreground
        locationManager?.requestWhenInUseAuthorization()
        
        //Set locationManager delegate
        locationManager?.delegate = self
        
        //Set the accuracy of the location data
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        //Set the type of user activity associated with the location updates
        locationManager?.activityType = .fitness
        //Starts the generation of updates that report the user’s current location
        locationManager?.startUpdatingLocation()
        
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
        
        //The mode used to track the user location
        map.userTrackingMode = .followWithHeading
        
        
        }
    
    
    
    
    
    
    
    
    //Tells the delegate that new location data is available.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("-------------------------------------")
        print(locations[0].coordinate.latitude)
        print(locations[0].coordinate.longitude)
    }
    
    
    
    
    
    
    //Notifies the view controller that its view was removed from a view hierarchy
    override func viewDidDisappear(_ animated: Bool) {
        //Stops the generation of location updates.
        locationManager?.stopUpdatingLocation()
    }
    
    
    
    
    @IBOutlet weak var map: MKMapView!
}

