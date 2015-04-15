//
//  LocationManager.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/27/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

class LocationManager: CLLocationManager, CLLocationManagerDelegate, CurrentLocationManager {
  
  init() {
    super.init()
    delegate = self;
    desiredAccuracy = kCLLocationAccuracyBest;
    distanceFilter = kCLLocationAccuracyNearestTenMeters;
  }
  
  func startUpdatingCurrentLocation() {
    startUpdatingLocation()
  }
  
  func currentLocation() -> CLLocation! {
    return location
  }
  
  func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
    println(error)
  }
  
}
