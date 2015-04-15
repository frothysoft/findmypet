//
//  WelcomeViewController.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/27/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import Foundation

// TODO: Finish this
class WelcomeViewController: UIViewController {
  
  var currentLocationManager: CurrentLocationManager!
  
  init(coder aDecoder: NSCoder!) {
    let objectsFactory = (UIApplication.sharedApplication().delegate as AppDelegate).objectsFactory
    currentLocationManager = objectsFactory.currentLocationManager
    super.init(coder: aDecoder)
  }
  
  @IBAction func allowLocationTracking() {
    currentLocationManager.startUpdatingCurrentLocation()
//    performSegueWithIdentifier("ShowLostPetsSegue", sender: self)
  }
  
}