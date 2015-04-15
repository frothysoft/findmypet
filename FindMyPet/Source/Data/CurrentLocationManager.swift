//
//  CurrentLocationManager.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/25/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

protocol CurrentLocationManager {
  
  func startUpdatingCurrentLocation()
  func currentLocation() -> CLLocation!
  
}
