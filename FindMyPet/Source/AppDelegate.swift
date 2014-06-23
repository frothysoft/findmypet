//
//  AppDelegate.swift
//  FindMyPet
//
//  Created by Josh Berlin on 6/19/14.
//  Copyright (c) 2014 Frothy Software. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
  var window: UIWindow?
  let objectsFactory: ObjectsFactory

  init() {
    objectsFactory = PetsObjectFactory()
    super.init()
  }
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
    Parse.setApplicationId("QwJyq5HKCWS9nPJCSGxhhp5dxJGTK8L8di4UKkfS", clientKey: "EQdFHWLZxq2bFpY3bdhmPkjJ1kchhqMFgWRmQROa")
    return true
  }
}

